(set-logic QF_NIA)
(declare-const p Int)
(assert (= p 21888242871839275222246405745257275088548364400416034343698204186575808495617))
(declare-const ps1 Int)
(assert (= ps1 21888242871839275222246405745257275088548364400416034343698204186575808495616))
(declare-const ps2 Int)
(assert (= ps2 21888242871839275222246405745257275088548364400416034343698204186575808495615))
(declare-const ps3 Int)
(assert (= ps3 21888242871839275222246405745257275088548364400416034343698204186575808495614))
(declare-const ps4 Int)
(assert (= ps4 21888242871839275222246405745257275088548364400416034343698204186575808495613))
(declare-const ps5 Int)
(assert (= ps5 21888242871839275222246405745257275088548364400416034343698204186575808495612))
; ================================
; ======== original block ========
; ================================
; ======== declaration constraints ========
(declare-const x0 Int)
(declare-const x1 Int)
(declare-const x2 Int)
(declare-const x3 Int)
(declare-const x4 Int)
(declare-const x5 Int)
(declare-const x6 Int)
(declare-const x7 Int)
(declare-const x8 Int)
(declare-const x9 Int)
(declare-const x10 Int)
; ======== range constraints ========
(assert (and (<= 0 1) (< 1 p)))
(assert (and (<= 0 x1) (< x1 p)))
(assert (and (<= 0 x2) (< x2 p)))
(assert (and (<= 0 x3) (< x3 p)))
(assert (and (<= 0 x4) (< x4 p)))
(assert (and (<= 0 x5) (< x5 p)))
(assert (and (<= 0 x6) (< x6 p)))
(assert (and (<= 0 x7) (< x7 p)))
(assert (and (<= 0 x8) (< x8 p)))
(assert (and (<= 0 x9) (< x9 p)))
(assert (and (<= 0 x10) (< x10 p)))
(assert (= (mod (* ps1 (* x3 x6)) p) (mod (* ps1 x7) p)))
(assert (= (mod (* ps1 (* x4 x5)) p) (mod (* ps1 x8) p)))
(assert (= (mod (+ (* 168700 (* x3 x5)) (+ (* 168700 (* x3 x6)) (+ (* ps1 (* x4 x5)) (* ps1 (* x4 x6))))) p) (mod (* ps1 x9) p)))
(assert (= (mod (* ps1 (* x7 x8)) p) (mod (* ps1 x10) p)))
(assert (= (mod (+ x1 (* 168696 (* x10 x1))) p) (mod (+ x7 x8) p)))
(assert (= (mod (+ x2 (* 21888242871839275222246405745257275088548364400416034343698204186575808326921 (* x10 x2))) p) (mod (+ (* 168700 x7) (+ (* ps1 x8) x9)) p)))
(assert (= 1 1))
; ===================================
; ======== alternative block ========
; ===================================
; ======== declaration constraints ========
; x0: already defined
(declare-const y1 Int)
(declare-const y2 Int)
; x3: already defined
; x4: already defined
; x5: already defined
; x6: already defined
(declare-const y7 Int)
(declare-const y8 Int)
(declare-const y9 Int)
(declare-const y10 Int)
; ======== range constraints ========
; x0: already defined
(assert (and (<= 0 y1) (< y1 p)))
(assert (and (<= 0 y2) (< y2 p)))
; x3: already defined
; x4: already defined
; x5: already defined
; x6: already defined
(assert (and (<= 0 y7) (< y7 p)))
(assert (and (<= 0 y8) (< y8 p)))
(assert (and (<= 0 y9) (< y9 p)))
(assert (and (<= 0 y10) (< y10 p)))
(assert (= (mod (* ps1 (* x3 x6)) p) (mod (* ps1 y7) p)))
(assert (= (mod (* ps1 (* x4 x5)) p) (mod (* ps1 y8) p)))
(assert (= (mod (+ (* 168700 (* x3 x5)) (+ (* 168700 (* x3 x6)) (+ (* ps1 (* x4 x5)) (* ps1 (* x4 x6))))) p) (mod (* ps1 y9) p)))
(assert (= (mod (* ps1 (* y7 y8)) p) (mod (* ps1 y10) p)))
(assert (= (mod (+ y1 (* 168696 (* y10 y1))) p) (mod (+ y7 y8) p)))
(assert (= (mod (+ y2 (* 21888242871839275222246405745257275088548364400416034343698204186575808326921 (* y10 y2))) p) (mod (+ (* 168700 y7) (+ (* ps1 y8) y9)) p)))
(assert (= 1 1))
; =============================
; ======== known block ========
; =============================
(assert (= 1 1))
(assert (= x3 x3))
(assert (= x4 x4))
(assert (= x5 x5))
(assert (= x6 x6))
(assert (= x7 y7))
(assert (= x8 y8))
(assert (= x9 y9))
(assert (= x10 y10))
; ======== preconditions ========
(assert (! (= x10 1)))
(assert (! (= x10 -1)))
(assert (! (= y10 1)))
(assert (! (= y10 -1)))
; =============================
; ======== query block ========
; =============================
(assert (not (= x2 y2)))
(check-sat)
(get-model)