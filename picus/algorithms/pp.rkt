#lang rosette
; this implements the propagation & preserving algorithm with base lemma
(require
    (prefix-in tokamak: "../tokamak.rkt")
    (prefix-in utils: "../utils.rkt")
    (prefix-in config: "../config.rkt")
    (prefix-in r1cs: "../r1cs/r1cs-grammar.rkt")
    (prefix-in selector: "./selectors.rkt")
)
(provide (rename-out
    [get-cdmap get-cdmap]
    [get-rcdmap get-rcdmap]
    [pp-propagate pp-propagate]
    [apply-pp apply-pp]
))

; ======== module global variables ======== ;

; problem pack, needs to be set and initialized by apply- function
(define :r0 null)
(define :nwires null)
(define :mconstraints null)
(define :input-set null)
(define :output-set null)
(define :target-set null)

(define :xlist null)
(define :opts null)
(define :defs null)
(define :cnsts null) ; standard form
(define :p0cnsts null) ; standard form optimized by phase 0 optimization
(define :expcnsts null) ; expanded form
(define :nrmcnsts null) ; normalized form
(define :p1cnsts null) ; normalized form optimized by phase 1 optimization

(define :alt-xlist null)
(define :alt-defs null)
(define :alt-cnsts null)
(define :alt-p0cnsts null)
(define :alt-expcnsts null)
(define :alt-nrmcnsts null)
(define :alt-p1cnsts null)

(define :arg-nthreads null)
(define :arg-prop null)
(define :arg-timeout null)
(define :arg-smt null)

(define :unique-set null)
(define :precondition null)

(define :solve null)
(define :state-smt-path null)
(define :interpret-r1cs null)

(define :parse-r1cs null)
(define :optimize-r1cs-p0 null)
(define :expand-r1cs null)
(define :normalize-r1cs null)
(define :optimize-r1cs-p1 null)

; problem intermediate results
(define :partial-cmds null)

; use pp-counter-select
(define pp-select selector:pp-counter-select)

; get constraint dependency map
; input is the *normalized main constraint part* of r1cs ast
;   - main constraints is the `cnsts part (r1cs:rcmds) from parse-r1cs
; returns a map of:
;   - key: index of a variable
;   - val: list of sets of variables
; meaning: if a key wants to be determined as unique,
;          one of the sets from val should be completely determined
; construction rules (++terms):
;   - only non-non-linear (YES, no typo here) variable can be determined (put to key)
;     because for x*y=k, x can't be guaranteed to be unique,
;     even if knowing y and k (due to field mul)
(define (get-cdmap arg-cnsts [arg-indexonly #f])
    (define res (make-hash))
    ; for every single constraint
    (for ([p (r1cs:rcmds-vs arg-cnsts)])
        (define all-vars (r1cs:get-assert-variables p arg-indexonly))
        (define nonlinear-vars (r1cs:get-assert-variables/nonlinear p arg-indexonly))
        ; (note) you can't use linears directly, because one var could be both linear and non-linear
        ;        in this case, it's still non-linear in the current constraint
        (define deducible-vars (set-subtract all-vars nonlinear-vars))
        (for ([key deducible-vars])
            (when (! (hash-has-key? res key)) (hash-set! res key (list )))
            (hash-set! res key (cons (set-subtract all-vars (list->set (list key))) (hash-ref res key)))
        )
    )
    res
)

; get a reversed cdmap
;   - arg-indexonly: whether to extract the indices instead of keeping the full variable name
; example output:
;   #<set: x10> => #<set: x4>
;   #<set: x6 x14 x12 x11> => #<set: x13>
;   #<set: x5 x14 x12> => #<set: x11>
;   #<set: x5 x14 x11> => #<set: x12>
;   #<set: x2> => #<set: x6>
;   #<set: x8> => #<set: x4>
;   #<set: x1> => #<set: x5>
;   #<set: x9> => #<set: x3>
;   #<set: x7> => #<set: x3>
(define (get-rcdmap arg-cnsts [arg-indexonly #f])
    (define res (get-cdmap arg-cnsts arg-indexonly))
    (define new-res (make-hash))
    (for ([key (hash-keys res)])
        (define vals (hash-ref res key))
        (for ([val vals])
            (when (! (hash-has-key? new-res val)) (hash-set! new-res val (list )))
            (hash-set! new-res val (cons key (hash-ref new-res val)))
        )
    )
    ; make immutable
    (for ([key (hash-keys new-res)])
        (hash-set! new-res key (list->set (hash-ref new-res key)))
    )
    new-res
)

; recursive
(define (pp-propagate rcdmap ks us)
    (printf "  # propagation: ")
    (define new-ks (list->set (set->list ks))) ; (fixme) do this to copy into a mutable set, required by set-* operations
    (define new-us (list->set (set->list us))) ; (fixme) same as above
    (define rec? #f) ; whether propagate should be called again
    (for* ([key (hash-keys rcdmap)])
        (when (set-empty? (set-subtract key ks))
            ; all ks are in key, propagate
            (set! new-ks (set-union new-ks (hash-ref rcdmap key)))
            (set! new-us (set-subtract new-us (hash-ref rcdmap key)))
        )
    )
    (let ([s0 (set-subtract new-ks ks)])
        (if (set-empty? s0)
            (printf "none.\n")
            (printf "~a added.\n" s0)
        )
    )
    (if (= (set-count ks) (set-count new-ks))
        ; no updates, return now
        (values new-ks new-us)
        ; has updates, call again
        (pp-propagate rcdmap new-ks new-us)
    )
)

; main solving procedure
; returns:
;   - (cons 'verified info): the given query is verified
;   - (cons 'sat info): the given query has a counter-example (not verified)
;   - (cons 'skip info): the given query times out (small step)
(define (pp-solve ks us sids)

    ; (printf "  # checking: ~a.\n" (string-join
    ;     (for/list ([sid sids]) (format "(~a ~a)" (list-ref :xlist sid) (list-ref :alt-xlist sid)))
    ;     ", "
    ; ))
    (printf "  # checking: ~a.\n" (string-join (for/list ([sid sids]) (format "~a" sid)) ", "))

    (define batch-final-strs (for/list ([sid sids])

        ; assemble commands
        (define known-cmds (r1cs:rcmds (for/list ([j ks])
            (r1cs:rassert (r1cs:req (r1cs:rvar (list-ref :xlist j)) (r1cs:rvar (list-ref :alt-xlist j))))
        )))
        (define final-cmds (r1cs:rcmds-append
            :partial-cmds
            (r1cs:rcmds (list
                (r1cs:rcmt "=============================")
                (r1cs:rcmt "======== known block ========")
                (r1cs:rcmt "=============================")
            ))
            known-cmds
            (r1cs:rcmds (list
                (r1cs:rcmt "=============================")
                (r1cs:rcmt "======== query block ========")
                (r1cs:rcmt "=============================")
            ))
            (r1cs:rcmds (list
                (r1cs:rassert (r1cs:rneq (r1cs:rvar (list-ref :xlist sid)) (r1cs:rvar (list-ref :alt-xlist sid))))
                (r1cs:rsolve )
            ))
        ))
        ; perform optimization
        (define final-str (string-join (:interpret-r1cs
            (r1cs:rcmds-append :opts final-cmds))
            "\n"
        ))
        ; return
        final-str

    ))

    (define batch-res (:solve batch-final-strs :arg-timeout #:nthreads :arg-nthreads))

    ; (define batch-results (for/list ([sid sids][res batch-res])
    (define batch-results (for/list ([i (range (length sids))])
        (define sid (list-ref sids i))
        (define res (list-ref batch-res i))

        (define s0 (list-ref :xlist sid))
        (define s1 (list-ref :alt-xlist sid))

        (define solved? (cond
            [(equal? 'unsat (car res))
                (printf "    - (~a, ~a): verified.\n" s0 s1)
                ; verified, safe
                'verified
            ]
            [(equal? 'sat (car res))
                ; (important) here if the current signal is not a target, it's ok to see a sat
                (if (set-member? :target-set sid)
                    ; the current signal is a target, now there's a counter-example, unsafe
                    ; in pp, this counter-example is valid
                    (begin (printf "    - (~a, ~a): sat.\n" s0 s1) 'sat)
                    ; not a target, fine, just skip
                    (begin (printf "    - (~a, ~a): sat but not a target.\n" s0 s1) 'skip)
                )
            ]
            [else
                (printf "    - (~a, ~a): skip.\n" s0 s1)
                ; possibly timeout in small step, result is unknown
                'skip
            ]
        ))
        (when :arg-smt
            (printf "    - (~a, ~a): ~a\n" s0 s1 (list-ref (:state-smt-path) i)))
        ; return
        (cons solved? (cdr res))
    ))

    ; return
    batch-results
)

; select and solve
; returns:
;   - (values 'normal ks us info)
;   - (values 'break ks us info)
;   (note) since it's called recursively, at some level it could have new different ks with 'break
;          in that case you still break since a counter-example is already found
; uspool is usually initialized as us
(define (pp-select-and-solve rcdmap ks us uspool)
    (if (set-empty? uspool)
        ; can't solve any more signal in this iteration
        (values 'normal ks us null)
        ; else, set not empty, move forward
        (begin
            (define sids (for/list ([i (range :arg-nthreads)])
                (define sid (pp-select rcdmap uspool))
                (selector:signal-weights-dec! sid 1000) ; decrease weight
                sid
            ))
            (define batch-sres (pp-solve ks us sids))

            (define batch-solved? (for/list ([sres batch-sres]) (car sres)))
            (define batch-info (for/list ([sres batch-sres]) (cdr sres)))
            ; summarize
            (let ([sat-ind (index-of batch-solved? 'sat)])
                (if sat-ind
                    ; found a counter-example here, forced stop, nothing more to solve
                    ; return the same ks & us to indicate the caller to stop
                    (values 'break ks us (list-ref batch-info sat-ind))
                    ; else proceed
                    (begin
                        (define new-ks (list->set (set->list ks)))
                        (define new-us (list->set (set->list us)))
                        (define new-uspool (list->set (set->list uspool)))
                        (define nret #f) ; should return normal or not
                        (for ([solved? batch-solved?][info batch-info][sid sids])
                            (cond
                                [(equal? 'verified solved?)
                                    (set! new-ks (set-add new-ks sid))
                                    (set! new-us (set-remove new-us sid))
                                    ; as long as one signal is verified in a batch, it's good enough to return
                                    (set! nret #t)
                                ]
                                ; do nothing since it processed before
                                [(equal? 'sat solved?) (void)]
                                [(equal? 'skip solved?)
                                    (set! new-uspool (set-remove new-uspool sid))
                                ]
                                [else (tokamak:error "unsupported solved? value, got: ~a." solved?)]
                            )
                        )
                        (if nret
                            ; at least one signal is verified
                            (values 'normal new-ks new-us null)
                            ; no signal is verified, continue
                            (pp-select-and-solve rcdmap new-ks new-us new-uspool)
                        )
                    )
                )
            )
        )
    )
)

; perform one iteration of pp algorithm
;   - ks: known set
;   - us: unknown set
; returns:
;   - ('safe ks us info)
;   - ('unsafe ks us info)
;   - ('unknown ks us info)
(define (pp-iteration rcdmap ks us)

    ; first, propagate
    (define-values (new-ks new-us) (if :arg-prop
        ; do propagation
        (pp-propagate rcdmap ks us)
        ; don't do propagation
        (values ks us)
    ))
    (cond
        [(set-empty? (set-intersect :target-set new-us))
            ; no target signal is unknown, no need to solve any more, return
            (values 'safe new-ks new-us null)
        ]
        [else
            ; still there's unknown target signal, continue
            ; then select and solve
            (define-values (s0 xnew-ks xnew-us info) (pp-select-and-solve rcdmap new-ks new-us new-us))
            (cond
                ; normal means there's no counter-example
                [(equal? 'normal s0)
                    (cond
                        [(set-empty? (set-intersect :target-set xnew-us))
                            ; no target signal is unknown, return
                            (values 'safe xnew-ks xnew-us null)
                        ]
                        [(equal? xnew-us new-us)
                            ; can't reduce any unknown any more, return
                            (values 'unknown xnew-ks xnew-us info)
                        ]
                        [else
                            ; continue the iteration
                            (pp-iteration rcdmap xnew-ks xnew-us)
                        ]
                    )
                ]
                ; 'break means there's counter-example
                [(equal? 'break s0) (values 'unsafe xnew-ks xnew-us info)]
                [else (tokamak:error "unsupported s0 value, got: ~a." s0)]
            )
        ]
    )
)

; verifies signals in target-set
; returns (same as pp-iteration):
;   - (values 'safe ks us info)
;   - (values 'unsafe ks us info)
;   - (values 'unknown ks us info)
(define (apply-pp
    r0 nwires mconstraints
    input-set output-set target-set
    xlist opts defs cnsts
    alt-xlist alt-defs alt-cnsts
    unique-set precondition
    arg-nthreads arg-prop arg-timeout arg-smt
    solve state-smt-path interpret-r1cs
    parse-r1cs optimize-r1cs-p0 expand-r1cs normalize-r1cs optimize-r1cs-p1
    )

    ; first load in all global variables
    (set! :r0 r0)
    (set! :nwires nwires)
    (set! :mconstraints mconstraints)
    (set! :input-set input-set)
    (set! :output-set output-set)
    (set! :target-set target-set)

    (set! :xlist xlist)
    (set! :opts opts)
    (set! :defs defs)
    (set! :cnsts cnsts)

    (set! :alt-xlist alt-xlist)
    (set! :alt-defs alt-defs)
    (set! :alt-cnsts alt-cnsts)

    (set! :arg-nthreads arg-nthreads)
    (set! :arg-prop arg-prop)
    (set! :arg-timeout arg-timeout)
    (set! :arg-smt arg-smt)

    (set! :unique-set unique-set)
    (set! :precondition precondition)

    (set! :solve solve)
    (set! :state-smt-path state-smt-path)
    (set! :interpret-r1cs interpret-r1cs)

    (set! :parse-r1cs parse-r1cs)
    (set! :optimize-r1cs-p0 optimize-r1cs-p0)
    (set! :expand-r1cs expand-r1cs)
    (set! :normalize-r1cs normalize-r1cs)
    (set! :optimize-r1cs-p1 optimize-r1cs-p1)


    ; keep track of index of xlist (not alt-xlist since that's incomplete)
    (define known-set (list->set (filter
        (lambda (x) (! (null? x)))
        (for/list ([i (range :nwires)])
            (if (utils:contains? :alt-xlist (list-ref :xlist i))
                i
                null
            )
        )
    )))
    (define unknown-set (list->set (filter
        (lambda (x) (! (null? x)))
        (for/list ([i (range :nwires)])
            (if (utils:contains? :alt-xlist (list-ref :xlist i))
                null
                i
            )
        )
    )))
    (printf "# initial known-set ~a\n" known-set)
    (printf "# initial unknown-set ~a\n" unknown-set)
    
    ; (precondition related) incorporate unique-set if unique-set is not an empty set
    (set! known-set (set-union known-set unique-set))
    (set! unknown-set (set-subtract unknown-set unique-set))
    (printf "# refined known-set: ~a\n" known-set)
    (printf "# refined unknown-set: ~a\n" unknown-set)

    ; ==== branch out: skip optimization phase 0 and apply expand & normalize ====
    (define tmp-nrmcnsts (:normalize-r1cs (:expand-r1cs :cnsts)))
    ; generate rcdmap requires no optimization to exclude ror and rand
    ; rcdmap requires normalized constraints to get best results
    (define rcdmap (get-rcdmap tmp-nrmcnsts #t))
    ; (for ([key (hash-keys rcdmap)]) (printf "~a => ~a\n" key (hash-ref rcdmap key)))

    ; ==== first apply optimization phase 0 ====
    (set! :p0cnsts (:optimize-r1cs-p0 :cnsts))
    (set! :alt-p0cnsts (:optimize-r1cs-p0 :alt-cnsts))

    ; ==== then expand the constraints ====
    (set! :expcnsts (:expand-r1cs :p0cnsts))
    (set! :alt-expcnsts (:expand-r1cs :alt-p0cnsts))

    ; ==== then normalize the constraints ====
    (set! :nrmcnsts (:normalize-r1cs :expcnsts))
    (set! :alt-nrmcnsts (:normalize-r1cs :alt-expcnsts))

    ; initialization of state: weights are all set to 0
    (selector:signal-weights-reset!)
    (for ([key (range :nwires)]) (selector:signal-weights-set! key 0))

    ; ==== then apply optimization phase 1 ====
    (set! :p1cnsts (:optimize-r1cs-p1 :nrmcnsts #t)) ; include p defs
    (set! :alt-p1cnsts (:optimize-r1cs-p1 :alt-nrmcnsts #f)) ; no p defs since this is alt-

    ; prepare partial cmds for better reuse through out the algorithm
    (set! :partial-cmds (r1cs:rcmds-append
        (r1cs:rcmds (list
            (r1cs:rcmt "================================")
            (r1cs:rcmt "======== original block ========")
            (r1cs:rcmt "================================")
        ))
        :defs
        :p1cnsts
        (r1cs:rcmds (list
            (r1cs:rcmt "===================================")
            (r1cs:rcmt "======== alternative block ========")
            (r1cs:rcmt "===================================")
        ))
        :alt-defs
        :alt-p1cnsts
        (r1cs:rcmds (list
            (r1cs:rcmt "====================================")
            (r1cs:rcmt "======== precondition block ========")
            (r1cs:rcmt "====================================")
        ))
        (if (null? :precondition)
            ; no precondition
            (r1cs:rcmds (list (r1cs:rcmt "(no precondition or skipped by user)")))
            ; assemble precondition
            (r1cs:rcmds (flatten (for/list ([v :precondition])
                (cons
                    (r1cs:rcmt (format "precondition tag: ~a" (car v)))
                    (cdr v)
                )
            )))
        )
    ))

    ; invoke the algorithm iteration
    (define-values (ret0 rks rus info) (pp-iteration rcdmap known-set unknown-set))

    ; return
    (values ret0 rks rus info)
)