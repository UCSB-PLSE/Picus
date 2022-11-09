#lang racket
(require csv-reading graph
  (prefix-in r1cs: "../picus/r1cs/r1cs-grammar.rkt")
  (prefix-in solver: "../picus/solver.rkt")
  (prefix-in cg: "../picus/algorithms/constraint-graph.rkt")
)

(define arg-solver "z3")

(define solve (solver:solve arg-solver))
(define parse-r1cs (solver:parse-r1cs arg-solver))
(define expand-r1cs (solver:expand-r1cs arg-solver))
(define normalize-r1cs (solver:normalize-r1cs arg-solver))
(define optimize-r1cs-p0 (solver:optimize-r1cs-p0 arg-solver))
(define optimize-r1cs-p1 (solver:optimize-r1cs-p1 arg-solver))
(define interpret-r1cs (solver:interpret-r1cs arg-solver))

(define path-r1cs "../benchmarks/circomlib-cff5ab6/BitElementMulAny@escalarmulany.r1cs")
(define path-sym (string-replace path-r1cs ".r1cs" ".sym"))
(define r0 (r1cs:read-r1cs path-r1cs))
(define-values (xlist options defs cnsts) (parse-r1cs r0 null))

; ==== first apply optimization phase 0 ====
(define p0cnsts (optimize-r1cs-p0 cnsts))

; ==== then expand the constraints ====
(define expcnsts (expand-r1cs p0cnsts))

; ==== then normalize the constraints ====
(define nrmcnsts (normalize-r1cs expcnsts))

; ==== then apply optimization phase 1 ====
(define p1cnsts (optimize-r1cs-p1 nrmcnsts #t)) ; include p defs

; (define cg0 (cg:compute-constraint-graph r0 p1cnsts path-sym))
(define cg0 (cg:compute-constraint-graph r0 cnsts path-sym))
; (define g0 (cg:cgraph-g cg0))
; (remove-vertex! g0 0)

; (printf "~a\n" (graphviz g0))
; (define e2c0 (cg:cgraph-e2c cg0))

; (define sg0 (cg:get-scoped-subgraph cg0 (set "main" "doubler") (set)))
; (define sg1 (cg:get-scoped-subgraph cg0 (set "main" "doubler") (set 0 1 2 3 4 5 6 7 8 9)))

;(define sg0 (cg:get-scoped-subgraph cg0 (set "main" "doubler") (set 0 1 2 3 4 5 6 7 8 9) #:touching? #t))

(define sg0 (cg:get-scoped-subgraph cg0 (set "main" "adder") (set 8)))

(printf "~a\n" (graphviz (cg:cgraph-g sg0)))