#lang rosette
(require rosette/solver/smt/boolector)
(define use-boolector #f) ; use boolector or not?
(when (and use-boolector (boolector-available?))
  ; (current-solver (boolector #:logic 'QF_BV))
  (current-solver (boolector))
)
(printf "# using solver: ~a\n" (current-solver))
(output-smt #t)

(require "./picus/tokamak.rkt")
(require "./picus/utils.rkt")
(require "./picus/config.rkt")
(require "./picus/r1cs.rkt")
(require "./picus/r1cs-interpreter.rkt")

(define r0 (read-r1cs "./examples/test0.r1cs"))
;(define r0 (read-r1cs "./examples/test2.r1cs"))
;(define r0 (read-r1cs "./examples/bigmod_5_2.r1cs"))
;(define r0 (read-r1cs "./examples/bigmod_10_2.r1cs"))
;(define r0 (read-r1cs "./examples/bigmod_86_3.r1cs"))
;(define r0 (read-r1cs "./examples/bigmult_86_3.r1cs"))

; restrict reasoning precision, not applicable on bv
; (current-bitwidth 4) ; hmm...

(define nwires (get-nwires r0))
(printf "# number of wires: ~a\n" nwires)
(printf "# number of constraints: ~a\n" (get-mconstraints r0))
(printf "# field size (how many bytes): ~a\n" (get-field-size r0))
; (printf "# number of constraints: ~a\n" (length (get-constraints r0)))

(printf "# interpreting original r1cs...\n")
(define-values (xlist sconstraints) (interpret-r1cs r0 null)) ; interpret the constraint system
(define input-list (r1cs-inputs r0))
(define output-list (r1cs-outputs r0))

; uniqueness: for all given inputs, the valuations of all outputs should be unique
; that is, inputs are shared
(define (next-symbolic-integer-alternative)
  (define-symbolic* y config:bvtyp)
  y
)
; fix inputs, create alternative outputs
(define xlist0 (for/list ([i (range nwires)])
  (if (contains? input-list i) (list-ref xlist i) (next-symbolic-integer-alternative))))
; then interpret again
(printf "# interpreting alternative r1cs...\n")
(define-values (_ sconstraints0) (interpret-r1cs r0 xlist0))

; existence of different valuation of outputs
(define dconstraints (for/list ([id output-list]) (not (bveq (list-ref xlist id) (list-ref xlist0 id)))))

; final query
(printf "# solving uniqueness...\n")
(define uniqueness-query (&& (apply && sconstraints) (apply && sconstraints0) (apply && dconstraints)))

; solve
(error-print-width 1000000)
(solve (assert uniqueness-query))