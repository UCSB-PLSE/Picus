(set-logic QF_FF)
(set-info :smt-lib-version 2.6)
(set-info :category "crafted")
(define-sort F () (_ FiniteField 21888242871839275222246405745257275088548364400416034343698204186575808495617))
; ================================
; ======== original block ========
; ================================
; ======== declaration constraints ========
(declare-const x0 F)
(declare-const x1 F)
(declare-const x2 F)
(declare-const x3 F)
(declare-const x4 F)
(declare-const x5 F)
(declare-const x6 F)
(declare-const x7 F)
(declare-const x8 F)
(declare-const x9 F)
(declare-const x10 F)
(declare-const x11 F)
(declare-const x12 F)
(declare-const x13 F)
(declare-const x14 F)
(declare-const x15 F)
(declare-const x16 F)
(declare-const x17 F)
(declare-const x18 F)
(declare-const x19 F)
(declare-const x20 F)
(declare-const x21 F)
(declare-const x22 F)
(declare-const x23 F)
(declare-const x24 F)
(declare-const x25 F)
(declare-const x26 F)
(declare-const x27 F)
(declare-const x28 F)
(declare-const x29 F)
(declare-const x30 F)
(declare-const x31 F)
(declare-const x32 F)
(declare-const x33 F)
(declare-const x34 F)
(declare-const x35 F)
(declare-const x36 F)
(declare-const x37 F)
(declare-const x38 F)
(declare-const x39 F)
(declare-const x40 F)
(declare-const x41 F)
(declare-const x42 F)
(declare-const x43 F)
(declare-const x44 F)
(declare-const x45 F)
(declare-const x46 F)
(declare-const x47 F)
(declare-const x48 F)
(declare-const x49 F)
(declare-const x50 F)
(declare-const x51 F)
(declare-const x52 F)
(declare-const x53 F)
(declare-const x54 F)
(declare-const x55 F)
(declare-const x56 F)
(declare-const x57 F)
(declare-const x58 F)
(declare-const x59 F)
(declare-const x60 F)
(declare-const x61 F)
(declare-const x62 F)
(declare-const x63 F)
(declare-const x64 F)
(declare-const x65 F)
(declare-const x66 F)
(declare-const x67 F)
(declare-const x68 F)
(declare-const x69 F)
(declare-const x70 F)
(declare-const x71 F)
(declare-const x72 F)
(declare-const x73 F)
(declare-const x74 F)
(declare-const x75 F)
(declare-const x76 F)
(declare-const x77 F)
(declare-const x78 F)
(declare-const x79 F)
(declare-const x80 F)
(declare-const x81 F)
(declare-const x82 F)
(declare-const x83 F)
(declare-const x84 F)
(declare-const x85 F)
(declare-const x86 F)
(declare-const x87 F)
(declare-const x88 F)
(declare-const x89 F)
(declare-const x90 F)
(declare-const x91 F)
(declare-const x92 F)
(declare-const x93 F)
(declare-const x94 F)
(declare-const x95 F)
(declare-const x96 F)
; ======== p definitions ========
(declare-const p F)
(assert (= p #f21888242871839275222246405745257275088548364400416034343698204186575808495617m21888242871839275222246405745257275088548364400416034343698204186575808495617))
(declare-const ps1 F)
(assert (= ps1 #f21888242871839275222246405745257275088548364400416034343698204186575808495616m21888242871839275222246405745257275088548364400416034343698204186575808495617))
(declare-const ps2 F)
(assert (= ps2 #f21888242871839275222246405745257275088548364400416034343698204186575808495615m21888242871839275222246405745257275088548364400416034343698204186575808495617))
(declare-const ps3 F)
(assert (= ps3 #f21888242871839275222246405745257275088548364400416034343698204186575808495614m21888242871839275222246405745257275088548364400416034343698204186575808495617))
(declare-const ps4 F)
(assert (= ps4 #f21888242871839275222246405745257275088548364400416034343698204186575808495613m21888242871839275222246405745257275088548364400416034343698204186575808495617))
(declare-const ps5 F)
(assert (= ps5 #f21888242871839275222246405745257275088548364400416034343698204186575808495612m21888242871839275222246405745257275088548364400416034343698204186575808495617))
(declare-const zero F)
(assert (= zero #f0m21888242871839275222246405745257275088548364400416034343698204186575808495617))
(declare-const one F)
(assert (= one #f1m21888242871839275222246405745257275088548364400416034343698204186575808495617))
; ======== main constraints ========

; ; main
; (assert (= (ff.mul #f2m21888242871839275222246405745257275088548364400416034343698204186575808495617 (ff.mul x60 x8)) (ff.add (ff.mul ps1 x2) x60)))

; ; adr3
; (assert (= (ff.add (ff.mul ps1 (ff.mul x13 x17)) (ff.mul x15 x17)) (ff.add (ff.mul ps1 x14) x16)))
; (assert (= (ff.mul ps1 (ff.mul x17 x17)) (ff.add #f21888242871839275222246405745257275088548364400416034343698204186575808326919m21888242871839275222246405745257275088548364400416034343698204186575808495617 (ff.add (ff.mul ps1 x11) (ff.add (ff.mul ps1 x13) (ff.mul ps1 x15))))))
; (assert (= (ff.add (ff.mul x11 x17) (ff.mul ps1 (ff.mul x13 x17))) (ff.add (ff.mul ps1 x12) (ff.mul ps1 x14))))
; ; adr3 -> mux
; (assert (= zero (ff.add x11 (ff.mul ps1 x63))))
; (assert (= zero (ff.add x12 (ff.mul ps1 x71))))
; ; adr3 -> adr4
; (assert (= zero (ff.add x11 (ff.mul ps1 x22))))
; (assert (= zero (ff.add x12 (ff.mul ps1 x23))))
; ; main -> adr3
; (assert (= zero (ff.add x9 (ff.mul ps1 x13))))
; (assert (= zero (ff.add x10 (ff.mul ps1 x14))))

; ; adr4
; (assert (= (ff.add (ff.mul ps1 (ff.mul x20 x24)) (ff.mul x22 x24)) (ff.add (ff.mul ps1 x21) x23)))
; (assert (= (ff.mul ps1 (ff.mul x24 x24)) (ff.add #f21888242871839275222246405745257275088548364400416034343698204186575808326919m21888242871839275222246405745257275088548364400416034343698204186575808495617 (ff.add (ff.mul ps1 x18) (ff.add (ff.mul ps1 x20) (ff.mul ps1 x22))))))
; (assert (= (ff.add (ff.mul x18 x24) (ff.mul ps1 (ff.mul x20 x24))) (ff.add (ff.mul ps1 x19) (ff.mul ps1 x21))))
; ; adr4 -> mux
; (assert (= zero (ff.add x18 (ff.mul ps1 x64))))
; (assert (= zero (ff.add x19 (ff.mul ps1 x72))))
; ; adr4 -> adr5
; (assert (= zero (ff.add x18 (ff.mul ps1 x29))))
; (assert (= zero (ff.add x19 (ff.mul ps1 x30))))
; ; main -> adr4
; (assert (= zero (ff.add x9 (ff.mul ps1 x20))))
; (assert (= zero (ff.add x10 (ff.mul ps1 x21))))

; ; adr5
; (assert (= (ff.add (ff.mul ps1 (ff.mul x27 x31)) (ff.mul x29 x31)) (ff.add (ff.mul ps1 x28) x30)))
; (assert (= (ff.mul ps1 (ff.mul x31 x31)) (ff.add #f21888242871839275222246405745257275088548364400416034343698204186575808326919m21888242871839275222246405745257275088548364400416034343698204186575808495617 (ff.add (ff.mul ps1 x25) (ff.add (ff.mul ps1 x27) (ff.mul ps1 x29))))))
; (assert (= (ff.add (ff.mul x25 x31) (ff.mul ps1 (ff.mul x27 x31))) (ff.add (ff.mul ps1 x26) (ff.mul ps1 x28))))
; ; adr5 -> mux
; (assert (= zero (ff.add x25 (ff.mul ps1 x65))))
; (assert (= zero (ff.add x26 (ff.mul ps1 x73))))
; ; adr5 -> adr6
; (assert (= zero (ff.add x25 (ff.mul ps1 x36))))
; (assert (= zero (ff.add x26 (ff.mul ps1 x37))))
; ; main -> adr5
; (assert (= zero (ff.add x9 (ff.mul ps1 x27))))
; (assert (= zero (ff.add x10 (ff.mul ps1 x28))))

; ; adr6
; (assert (= (ff.add (ff.mul ps1 (ff.mul x34 x38)) (ff.mul x36 x38)) (ff.add (ff.mul ps1 x35) x37)))
; (assert (= (ff.mul ps1 (ff.mul x38 x38)) (ff.add #f21888242871839275222246405745257275088548364400416034343698204186575808326919m21888242871839275222246405745257275088548364400416034343698204186575808495617 (ff.add (ff.mul ps1 x32) (ff.add (ff.mul ps1 x34) (ff.mul ps1 x36))))))
; (assert (= (ff.add (ff.mul x32 x38) (ff.mul ps1 (ff.mul x34 x38))) (ff.add (ff.mul ps1 x33) (ff.mul ps1 x35))))
; ; adr6 -> mux
; (assert (= zero (ff.add x32 (ff.mul ps1 x66))))
; (assert (= zero (ff.add x33 (ff.mul ps1 x74))))
; ; adr6 -> adr7
; (assert (= zero (ff.add x32 (ff.mul ps1 x43))))
; (assert (= zero (ff.add x33 (ff.mul ps1 x44))))
; ; main -> adr6
; (assert (= zero (ff.add x9 (ff.mul ps1 x34))))
; (assert (= zero (ff.add x10 (ff.mul ps1 x35))))

; ; adr7
; (assert (= (ff.add (ff.mul ps1 (ff.mul x41 x45)) (ff.mul x43 x45)) (ff.add (ff.mul ps1 x42) x44)))
; (assert (= (ff.mul ps1 (ff.mul x45 x45)) (ff.add #f21888242871839275222246405745257275088548364400416034343698204186575808326919m21888242871839275222246405745257275088548364400416034343698204186575808495617 (ff.add (ff.mul ps1 x39) (ff.add (ff.mul ps1 x41) (ff.mul ps1 x43))))))
; (assert (= (ff.add (ff.mul x39 x45) (ff.mul ps1 (ff.mul x41 x45))) (ff.add (ff.mul ps1 x40) (ff.mul ps1 x42))))
; ; adr7 -> mux
; (assert (= zero (ff.add x39 (ff.mul ps1 x67))))
; (assert (= zero (ff.add x40 (ff.mul ps1 x75))))
; ; adr7 -> adr8
; (assert (= zero (ff.add x39 (ff.mul ps1 x50))))
; (assert (= zero (ff.add x40 (ff.mul ps1 x51))))
; ; main -> adr7
; (assert (= zero (ff.add x9 (ff.mul ps1 x41))))
; (assert (= zero (ff.add x10 (ff.mul ps1 x42))))

; ; adr8
; (assert (= (ff.add (ff.mul ps1 (ff.mul x48 x52)) (ff.mul x50 x52)) (ff.add (ff.mul ps1 x49) x51)))
; (assert (= (ff.mul ps1 (ff.mul x52 x52)) (ff.add #f21888242871839275222246405745257275088548364400416034343698204186575808326919m21888242871839275222246405745257275088548364400416034343698204186575808495617 (ff.add (ff.mul ps1 x46) (ff.add (ff.mul ps1 x48) (ff.mul ps1 x50))))))
; (assert (= (ff.add (ff.mul x46 x52) (ff.mul ps1 (ff.mul x48 x52))) (ff.add (ff.mul ps1 x47) (ff.mul ps1 x49))))
; ; adr8 -> mux
; (assert (= zero (ff.add x46 (ff.mul ps1 x68))))
; (assert (= zero (ff.add x47 (ff.mul ps1 x76))))
; ; adr8 -> main
; (assert (= zero (ff.add (ff.mul ps1 x3) x46)))
; (assert (= zero (ff.add (ff.mul ps1 x4) x47)))
; ; main -> adr8
; (assert (= zero (ff.add x9 (ff.mul ps1 x48))))
; (assert (= zero (ff.add x10 (ff.mul ps1 x49))))

; dbl2
(assert (= (ff.mul ps1 (ff.mul x55 x55)) (ff.mul ps1 x58)))
(assert (= (ff.mul #f2m21888242871839275222246405745257275088548364400416034343698204186575808495617 (ff.mul x56 x57)) (ff.add one (ff.add (ff.mul #f337396m21888242871839275222246405745257275088548364400416034343698204186575808495617 x55) (ff.mul #f3m21888242871839275222246405745257275088548364400416034343698204186575808495617 x58)))))
(assert (= (ff.mul ps1 (ff.mul x57 x57)) (ff.add #f21888242871839275222246405745257275088548364400416034343698204186575808326919m21888242871839275222246405745257275088548364400416034343698204186575808495617 (ff.add (ff.mul ps1 x53) (ff.mul ps2 x55)))))
(assert (= (ff.add (ff.mul x53 x57) (ff.mul ps1 (ff.mul x55 x57))) (ff.add (ff.mul ps1 x54) (ff.mul ps1 x56))))
; ; dbl2 -> mux
; (assert (= zero (ff.add x53 (ff.mul ps1 x62))))
; (assert (= zero (ff.add x54 (ff.mul ps1 x70))))
; ; dbl2 -> adr3
; (assert (= zero (ff.add (ff.mul ps1 x15) x53)))
; (assert (= zero (ff.add (ff.mul ps1 x16) x54)))
; main -> dbl2
(assert (= zero (ff.add x9 (ff.mul ps1 x55))))
(assert (= zero (ff.add x10 (ff.mul ps1 x56))))

; ; mux
; (assert (= (ff.mul ps1 (ff.mul x78 x77)) (ff.mul ps1 x96)))
; (assert (= (ff.add (ff.mul x61 x96) (ff.add (ff.mul ps1 (ff.mul x62 x96)) (ff.add (ff.mul ps1 (ff.mul x63 x96)) (ff.add (ff.mul x64 x96) (ff.add (ff.mul ps1 (ff.mul x65 x96)) (ff.add (ff.mul x66 x96) (ff.add (ff.mul x67 x96) (ff.mul ps1 (ff.mul x68 x96))))))))) (ff.mul ps1 x80)))
; (assert (= (ff.add (ff.mul ps1 (ff.mul x61 x78)) (ff.add (ff.mul x63 x78) (ff.add (ff.mul x65 x78) (ff.mul ps1 (ff.mul x67 x78))))) (ff.mul ps1 x82)))
; (assert (= (ff.add (ff.mul ps1 (ff.mul x61 x77)) (ff.add (ff.mul x62 x77) (ff.add (ff.mul x65 x77) (ff.mul ps1 (ff.mul x66 x77))))) (ff.mul ps1 x84)))
; (assert (= zero (ff.add (ff.mul ps1 x61) (ff.add x65 (ff.mul ps1 x86)))))
; (assert (= (ff.add (ff.mul ps1 (ff.mul x61 x96)) (ff.add (ff.mul x62 x96) (ff.add (ff.mul x63 x96) (ff.mul ps1 (ff.mul x64 x96))))) (ff.mul ps1 x88)))
; (assert (= (ff.add (ff.mul x61 x78) (ff.mul ps1 (ff.mul x63 x78))) (ff.mul ps1 x90)))
; (assert (= (ff.add (ff.mul x61 x77) (ff.mul ps1 (ff.mul x62 x77))) (ff.mul ps1 x92)))
; (assert (= zero (ff.add x61 (ff.mul ps1 x94))))
; (assert (= (ff.add (ff.mul ps1 (ff.mul x80 x79)) (ff.add (ff.mul ps1 (ff.mul x82 x79)) (ff.add (ff.mul ps1 (ff.mul x84 x79)) (ff.mul ps1 (ff.mul x86 x79))))) (ff.add (ff.mul ps1 x59) (ff.add x88 (ff.add x90 (ff.add x92 x94))))))
; (assert (= (ff.add (ff.mul x69 x96) (ff.add (ff.mul ps1 (ff.mul x70 x96)) (ff.add (ff.mul ps1 (ff.mul x71 x96)) (ff.add (ff.mul x72 x96) (ff.add (ff.mul ps1 (ff.mul x73 x96)) (ff.add (ff.mul x74 x96) (ff.add (ff.mul x75 x96) (ff.mul ps1 (ff.mul x76 x96))))))))) (ff.mul ps1 x81)))
; (assert (= (ff.add (ff.mul ps1 (ff.mul x69 x78)) (ff.add (ff.mul x71 x78) (ff.add (ff.mul x73 x78) (ff.mul ps1 (ff.mul x75 x78))))) (ff.mul ps1 x83)))
; (assert (= (ff.add (ff.mul ps1 (ff.mul x69 x77)) (ff.add (ff.mul x70 x77) (ff.add (ff.mul x73 x77) (ff.mul ps1 (ff.mul x74 x77))))) (ff.mul ps1 x85)))
; (assert (= zero (ff.add (ff.mul ps1 x69) (ff.add x73 (ff.mul ps1 x87)))))
; (assert (= (ff.add (ff.mul ps1 (ff.mul x69 x96)) (ff.add (ff.mul x70 x96) (ff.add (ff.mul x71 x96) (ff.mul ps1 (ff.mul x72 x96))))) (ff.mul ps1 x89)))
; (assert (= (ff.add (ff.mul x69 x78) (ff.mul ps1 (ff.mul x71 x78))) (ff.mul ps1 x91)))
; (assert (= (ff.add (ff.mul x69 x77) (ff.mul ps1 (ff.mul x70 x77))) (ff.mul ps1 x93)))
; (assert (= zero (ff.add x69 (ff.mul ps1 x95))))
; (assert (= (ff.add (ff.mul ps1 (ff.mul x81 x79)) (ff.add (ff.mul ps1 (ff.mul x83 x79)) (ff.add (ff.mul ps1 (ff.mul x85 x79)) (ff.mul ps1 (ff.mul x87 x79))))) (ff.add (ff.mul ps1 x60) (ff.add x89 (ff.add x91 (ff.add x93 x95))))))
; ; mux -> main
; (assert (= zero (ff.add (ff.mul ps1 x1) x59)))
; ; main -> mux
; (assert (= zero (ff.add x5 (ff.mul ps1 x77))))
; (assert (= zero (ff.add x6 (ff.mul ps1 x78))))
; (assert (= zero (ff.add x7 (ff.mul ps1 x79))))
; (assert (= zero (ff.add x9 (ff.mul ps1 x61))))
; (assert (= zero (ff.add x10 (ff.mul ps1 x69))))

; ===================================
; ======== alternative block ========
; ===================================
; ======== declaration constraints ========
; x0: already defined
(declare-const y1 F)
(declare-const y2 F)
(declare-const y3 F)
(declare-const y4 F)
; x5: already defined
; x6: already defined
; x7: already defined
; x8: already defined
; x9: already defined
; x10: already defined
(declare-const y11 F)
(declare-const y12 F)
(declare-const y13 F)
(declare-const y14 F)
(declare-const y15 F)
(declare-const y16 F)
(declare-const y17 F)
(declare-const y18 F)
(declare-const y19 F)
(declare-const y20 F)
(declare-const y21 F)
(declare-const y22 F)
(declare-const y23 F)
(declare-const y24 F)
(declare-const y25 F)
(declare-const y26 F)
(declare-const y27 F)
(declare-const y28 F)
(declare-const y29 F)
(declare-const y30 F)
(declare-const y31 F)
(declare-const y32 F)
(declare-const y33 F)
(declare-const y34 F)
(declare-const y35 F)
(declare-const y36 F)
(declare-const y37 F)
(declare-const y38 F)
(declare-const y39 F)
(declare-const y40 F)
(declare-const y41 F)
(declare-const y42 F)
(declare-const y43 F)
(declare-const y44 F)
(declare-const y45 F)
(declare-const y46 F)
(declare-const y47 F)
(declare-const y48 F)
(declare-const y49 F)
(declare-const y50 F)
(declare-const y51 F)
(declare-const y52 F)
(declare-const y53 F)
(declare-const y54 F)
(declare-const y55 F)
(declare-const y56 F)
(declare-const y57 F)
(declare-const y58 F)
(declare-const y59 F)
(declare-const y60 F)
(declare-const y61 F)
(declare-const y62 F)
(declare-const y63 F)
(declare-const y64 F)
(declare-const y65 F)
(declare-const y66 F)
(declare-const y67 F)
(declare-const y68 F)
(declare-const y69 F)
(declare-const y70 F)
(declare-const y71 F)
(declare-const y72 F)
(declare-const y73 F)
(declare-const y74 F)
(declare-const y75 F)
(declare-const y76 F)
(declare-const y77 F)
(declare-const y78 F)
(declare-const y79 F)
(declare-const y80 F)
(declare-const y81 F)
(declare-const y82 F)
(declare-const y83 F)
(declare-const y84 F)
(declare-const y85 F)
(declare-const y86 F)
(declare-const y87 F)
(declare-const y88 F)
(declare-const y89 F)
(declare-const y90 F)
(declare-const y91 F)
(declare-const y92 F)
(declare-const y93 F)
(declare-const y94 F)
(declare-const y95 F)
(declare-const y96 F)
; ======== p definitions: alt skip ========
; ======== main constraints ========

; ; main
; (assert (= (ff.mul #f2m21888242871839275222246405745257275088548364400416034343698204186575808495617 (ff.mul y60 x8)) (ff.add (ff.mul ps1 y2) y60)))

; ; adr3
; (assert (= (ff.add (ff.mul ps1 (ff.mul y13 y17)) (ff.mul y15 y17)) (ff.add (ff.mul ps1 y14) y16)))
; (assert (= (ff.mul ps1 (ff.mul y17 y17)) (ff.add #f21888242871839275222246405745257275088548364400416034343698204186575808326919m21888242871839275222246405745257275088548364400416034343698204186575808495617 (ff.add (ff.mul ps1 y11) (ff.add (ff.mul ps1 y13) (ff.mul ps1 y15))))))
; (assert (= (ff.add (ff.mul y11 y17) (ff.mul ps1 (ff.mul y13 y17))) (ff.add (ff.mul ps1 y12) (ff.mul ps1 y14))))
; ; adr3 -> mux
; (assert (= zero (ff.add y11 (ff.mul ps1 y63))))
; (assert (= zero (ff.add y12 (ff.mul ps1 y71))))
; ; adr3 -> adr4
; (assert (= zero (ff.add y11 (ff.mul ps1 y22))))
; (assert (= zero (ff.add y12 (ff.mul ps1 y23))))
; ; main -> adr3
; (assert (= zero (ff.add x9 (ff.mul ps1 y13))))
; (assert (= zero (ff.add x10 (ff.mul ps1 y14))))

; ; adr4
; (assert (= (ff.add (ff.mul ps1 (ff.mul y20 y24)) (ff.mul y22 y24)) (ff.add (ff.mul ps1 y21) y23)))
; (assert (= (ff.mul ps1 (ff.mul y24 y24)) (ff.add #f21888242871839275222246405745257275088548364400416034343698204186575808326919m21888242871839275222246405745257275088548364400416034343698204186575808495617 (ff.add (ff.mul ps1 y18) (ff.add (ff.mul ps1 y20) (ff.mul ps1 y22))))))
; (assert (= (ff.add (ff.mul y18 y24) (ff.mul ps1 (ff.mul y20 y24))) (ff.add (ff.mul ps1 y19) (ff.mul ps1 y21))))
; ; adr4 -> mux
; (assert (= zero (ff.add y18 (ff.mul ps1 y64))))
; (assert (= zero (ff.add y19 (ff.mul ps1 y72))))
; ; adr4 -> adr5
; (assert (= zero (ff.add y18 (ff.mul ps1 y29))))
; (assert (= zero (ff.add y19 (ff.mul ps1 y30))))
; ; main -> adr4
; (assert (= zero (ff.add x9 (ff.mul ps1 y20))))
; (assert (= zero (ff.add x10 (ff.mul ps1 y21))))

; ; adr5
; (assert (= (ff.add (ff.mul ps1 (ff.mul y27 y31)) (ff.mul y29 y31)) (ff.add (ff.mul ps1 y28) y30)))
; (assert (= (ff.mul ps1 (ff.mul y31 y31)) (ff.add #f21888242871839275222246405745257275088548364400416034343698204186575808326919m21888242871839275222246405745257275088548364400416034343698204186575808495617 (ff.add (ff.mul ps1 y25) (ff.add (ff.mul ps1 y27) (ff.mul ps1 y29))))))
; (assert (= (ff.add (ff.mul y25 y31) (ff.mul ps1 (ff.mul y27 y31))) (ff.add (ff.mul ps1 y26) (ff.mul ps1 y28))))
; ; adr5 -> mux
; (assert (= zero (ff.add y25 (ff.mul ps1 y65))))
; (assert (= zero (ff.add y26 (ff.mul ps1 y73))))
; ; adr5 -> adr6
; (assert (= zero (ff.add y25 (ff.mul ps1 y36))))
; (assert (= zero (ff.add y26 (ff.mul ps1 y37))))
; ; main -> adr5
; (assert (= zero (ff.add x9 (ff.mul ps1 y27))))
; (assert (= zero (ff.add x10 (ff.mul ps1 y28))))

; ; adr6
; (assert (= (ff.add (ff.mul ps1 (ff.mul y34 y38)) (ff.mul y36 y38)) (ff.add (ff.mul ps1 y35) y37)))
; (assert (= (ff.mul ps1 (ff.mul y38 y38)) (ff.add #f21888242871839275222246405745257275088548364400416034343698204186575808326919m21888242871839275222246405745257275088548364400416034343698204186575808495617 (ff.add (ff.mul ps1 y32) (ff.add (ff.mul ps1 y34) (ff.mul ps1 y36))))))
; (assert (= (ff.add (ff.mul y32 y38) (ff.mul ps1 (ff.mul y34 y38))) (ff.add (ff.mul ps1 y33) (ff.mul ps1 y35))))
; ; adr6 -> mux
; (assert (= zero (ff.add y32 (ff.mul ps1 y66))))
; (assert (= zero (ff.add y33 (ff.mul ps1 y74))))
; ; adr6 -> adr7
; (assert (= zero (ff.add y32 (ff.mul ps1 y43))))
; (assert (= zero (ff.add y33 (ff.mul ps1 y44))))
; ; main -> adr6
; (assert (= zero (ff.add x9 (ff.mul ps1 y34))))
; (assert (= zero (ff.add x10 (ff.mul ps1 y35))))

; ; adr7
; (assert (= (ff.add (ff.mul ps1 (ff.mul y41 y45)) (ff.mul y43 y45)) (ff.add (ff.mul ps1 y42) y44)))
; (assert (= (ff.mul ps1 (ff.mul y45 y45)) (ff.add #f21888242871839275222246405745257275088548364400416034343698204186575808326919m21888242871839275222246405745257275088548364400416034343698204186575808495617 (ff.add (ff.mul ps1 y39) (ff.add (ff.mul ps1 y41) (ff.mul ps1 y43))))))
; (assert (= (ff.add (ff.mul y39 y45) (ff.mul ps1 (ff.mul y41 y45))) (ff.add (ff.mul ps1 y40) (ff.mul ps1 y42))))
; ; adr7 -> mux
; (assert (= zero (ff.add y39 (ff.mul ps1 y67))))
; (assert (= zero (ff.add y40 (ff.mul ps1 y75))))
; ; adr7 -> adr8
; (assert (= zero (ff.add y39 (ff.mul ps1 y50))))
; (assert (= zero (ff.add y40 (ff.mul ps1 y51))))
; ; main -> adr7
; (assert (= zero (ff.add x9 (ff.mul ps1 y41))))
; (assert (= zero (ff.add x10 (ff.mul ps1 y42))))

; ; adr8
; (assert (= (ff.add (ff.mul ps1 (ff.mul y48 y52)) (ff.mul y50 y52)) (ff.add (ff.mul ps1 y49) y51)))
; (assert (= (ff.mul ps1 (ff.mul y52 y52)) (ff.add #f21888242871839275222246405745257275088548364400416034343698204186575808326919m21888242871839275222246405745257275088548364400416034343698204186575808495617 (ff.add (ff.mul ps1 y46) (ff.add (ff.mul ps1 y48) (ff.mul ps1 y50))))))
; (assert (= (ff.add (ff.mul y46 y52) (ff.mul ps1 (ff.mul y48 y52))) (ff.add (ff.mul ps1 y47) (ff.mul ps1 y49))))
; ; adr8 -> mux
; (assert (= zero (ff.add y46 (ff.mul ps1 y68))))
; (assert (= zero (ff.add y47 (ff.mul ps1 y76))))
; ; adr8 -> main
; (assert (= zero (ff.add (ff.mul ps1 y3) y46)))
; (assert (= zero (ff.add (ff.mul ps1 y4) y47)))
; ; main -> adr8
; (assert (= zero (ff.add x9 (ff.mul ps1 y48))))
; (assert (= zero (ff.add x10 (ff.mul ps1 y49))))

; dbl2
(assert (= (ff.mul ps1 (ff.mul y55 y55)) (ff.mul ps1 y58)))
(assert (= (ff.mul #f2m21888242871839275222246405745257275088548364400416034343698204186575808495617 (ff.mul y56 y57)) (ff.add one (ff.add (ff.mul #f337396m21888242871839275222246405745257275088548364400416034343698204186575808495617 y55) (ff.mul #f3m21888242871839275222246405745257275088548364400416034343698204186575808495617 y58)))))
(assert (= (ff.mul ps1 (ff.mul y57 y57)) (ff.add #f21888242871839275222246405745257275088548364400416034343698204186575808326919m21888242871839275222246405745257275088548364400416034343698204186575808495617 (ff.add (ff.mul ps1 y53) (ff.mul ps2 y55)))))
(assert (= (ff.add (ff.mul y53 y57) (ff.mul ps1 (ff.mul y55 y57))) (ff.add (ff.mul ps1 y54) (ff.mul ps1 y56))))
; ; dbl2 -> mux
; (assert (= zero (ff.add y53 (ff.mul ps1 y62))))
; (assert (= zero (ff.add y54 (ff.mul ps1 y70))))
; ; dbl2 -> adr3
; (assert (= zero (ff.add (ff.mul ps1 y15) y53)))
; (assert (= zero (ff.add (ff.mul ps1 y16) y54)))
; main -> dbl2
(assert (= zero (ff.add x9 (ff.mul ps1 y55))))
(assert (= zero (ff.add x10 (ff.mul ps1 y56))))

; ; mux
; (assert (= (ff.mul ps1 (ff.mul y78 y77)) (ff.mul ps1 y96)))
; (assert (= (ff.add (ff.mul y61 y96) (ff.add (ff.mul ps1 (ff.mul y62 y96)) (ff.add (ff.mul ps1 (ff.mul y63 y96)) (ff.add (ff.mul y64 y96) (ff.add (ff.mul ps1 (ff.mul y65 y96)) (ff.add (ff.mul y66 y96) (ff.add (ff.mul y67 y96) (ff.mul ps1 (ff.mul y68 y96))))))))) (ff.mul ps1 y80)))
; (assert (= (ff.add (ff.mul ps1 (ff.mul y61 y78)) (ff.add (ff.mul y63 y78) (ff.add (ff.mul y65 y78) (ff.mul ps1 (ff.mul y67 y78))))) (ff.mul ps1 y82)))
; (assert (= (ff.add (ff.mul ps1 (ff.mul y61 y77)) (ff.add (ff.mul y62 y77) (ff.add (ff.mul y65 y77) (ff.mul ps1 (ff.mul y66 y77))))) (ff.mul ps1 y84)))
; (assert (= zero (ff.add (ff.mul ps1 y61) (ff.add y65 (ff.mul ps1 y86)))))
; (assert (= (ff.add (ff.mul ps1 (ff.mul y61 y96)) (ff.add (ff.mul y62 y96) (ff.add (ff.mul y63 y96) (ff.mul ps1 (ff.mul y64 y96))))) (ff.mul ps1 y88)))
; (assert (= (ff.add (ff.mul y61 y78) (ff.mul ps1 (ff.mul y63 y78))) (ff.mul ps1 y90)))
; (assert (= (ff.add (ff.mul y61 y77) (ff.mul ps1 (ff.mul y62 y77))) (ff.mul ps1 y92)))
; (assert (= zero (ff.add y61 (ff.mul ps1 y94))))
; (assert (= (ff.add (ff.mul ps1 (ff.mul y80 y79)) (ff.add (ff.mul ps1 (ff.mul y82 y79)) (ff.add (ff.mul ps1 (ff.mul y84 y79)) (ff.mul ps1 (ff.mul y86 y79))))) (ff.add (ff.mul ps1 y59) (ff.add y88 (ff.add y90 (ff.add y92 y94))))))
; (assert (= (ff.add (ff.mul y69 y96) (ff.add (ff.mul ps1 (ff.mul y70 y96)) (ff.add (ff.mul ps1 (ff.mul y71 y96)) (ff.add (ff.mul y72 y96) (ff.add (ff.mul ps1 (ff.mul y73 y96)) (ff.add (ff.mul y74 y96) (ff.add (ff.mul y75 y96) (ff.mul ps1 (ff.mul y76 y96))))))))) (ff.mul ps1 y81)))
; (assert (= (ff.add (ff.mul ps1 (ff.mul y69 y78)) (ff.add (ff.mul y71 y78) (ff.add (ff.mul y73 y78) (ff.mul ps1 (ff.mul y75 y78))))) (ff.mul ps1 y83)))
; (assert (= (ff.add (ff.mul ps1 (ff.mul y69 y77)) (ff.add (ff.mul y70 y77) (ff.add (ff.mul y73 y77) (ff.mul ps1 (ff.mul y74 y77))))) (ff.mul ps1 y85)))
; (assert (= zero (ff.add (ff.mul ps1 y69) (ff.add y73 (ff.mul ps1 y87)))))
; (assert (= (ff.add (ff.mul ps1 (ff.mul y69 y96)) (ff.add (ff.mul y70 y96) (ff.add (ff.mul y71 y96) (ff.mul ps1 (ff.mul y72 y96))))) (ff.mul ps1 y89)))
; (assert (= (ff.add (ff.mul y69 y78) (ff.mul ps1 (ff.mul y71 y78))) (ff.mul ps1 y91)))
; (assert (= (ff.add (ff.mul y69 y77) (ff.mul ps1 (ff.mul y70 y77))) (ff.mul ps1 y93)))
; (assert (= zero (ff.add y69 (ff.mul ps1 y95))))
; (assert (= (ff.add (ff.mul ps1 (ff.mul y81 y79)) (ff.add (ff.mul ps1 (ff.mul y83 y79)) (ff.add (ff.mul ps1 (ff.mul y85 y79)) (ff.mul ps1 (ff.mul y87 y79))))) (ff.add (ff.mul ps1 y60) (ff.add y89 (ff.add y91 (ff.add y93 y95))))))
; ; mux -> main
; (assert (= zero (ff.add (ff.mul ps1 y1) y59)))
; ; main -> mux
; (assert (= zero (ff.add x5 (ff.mul ps1 y77))))
; (assert (= zero (ff.add x6 (ff.mul ps1 y78))))
; (assert (= zero (ff.add x7 (ff.mul ps1 y79))))
; (assert (= zero (ff.add x9 (ff.mul ps1 y61))))
; (assert (= zero (ff.add x10 (ff.mul ps1 y69))))

; ====================================
; ======== precondition block ========
; ====================================
; (no precondition or skipped by user)
; =============================
; ======== known block ========
; =============================
(assert (= x49 y49))
(assert (= x34 y34))
(assert (= x35 y35))
(assert (= x20 y20))
(assert (= x6 x6))
(assert (= x27 y27))
(assert (= x28 y28))
(assert (= x0 x0))
(assert (= x48 y48))
(assert (= x96 y96))
(assert (= x5 x5))
(assert (= x21 y21))
(assert (= x69 y69))
(assert (= x7 x7))
(assert (= x55 y55))
(assert (= x8 x8))
(assert (= x56 y56))
(assert (= x9 x9))
(assert (= x41 y41))
(assert (= x10 x10))
(assert (= x42 y42))
(assert (= x58 y58))
(assert (= x13 y13))
(assert (= x61 y61))
(assert (= x77 y77))
(assert (= x14 y14))
(assert (= x78 y78))
(assert (= x94 y94))
(assert (= x79 y79))
(assert (= x95 y95))
; =============================
; ======== query block ========
; =============================

; hints
; (assert (= x9 #f0m21888242871839275222246405745257275088548364400416034343698204186575808495617))
; (assert (= x10 #f0m21888242871839275222246405745257275088548364400416034343698204186575808495617))
; (assert (= x11 #f21888242871839275222246405745257275088548364400416034343698204186575808326919m21888242871839275222246405745257275088548364400416034343698204186575808495617))
; (assert (= x12 #f0m21888242871839275222246405745257275088548364400416034343698204186575808495617))
; (assert (= x13 #f0m21888242871839275222246405745257275088548364400416034343698204186575808495617))
; (assert (= x14 #f0m21888242871839275222246405745257275088548364400416034343698204186575808495617))
; (assert (= x15 #f0m21888242871839275222246405745257275088548364400416034343698204186575808495617))
; (assert (= x16 #f0m21888242871839275222246405745257275088548364400416034343698204186575808495617))
; (assert (= x17 #f0m21888242871839275222246405745257275088548364400416034343698204186575808495617))
; (assert (= y11 #f21888242871839275222246405745257275088548364400416034343698204186575808326920m21888242871839275222246405745257275088548364400416034343698204186575808495617))
; (assert (= y12 #f168697m21888242871839275222246405745257275088548364400416034343698204186575808495617))
; (assert (= y13 #f0m21888242871839275222246405745257275088548364400416034343698204186575808495617))
; (assert (= y14 #f0m21888242871839275222246405745257275088548364400416034343698204186575808495617))
; (assert (= y15 #f0m21888242871839275222246405745257275088548364400416034343698204186575808495617))
; (assert (= y16 #f0m21888242871839275222246405745257275088548364400416034343698204186575808495617))
; (assert (= y17 #f1m21888242871839275222246405745257275088548364400416034343698204186575808495617))

(assert (= x9 #f10944121435919637611123202872628637544274182200208017171849102093287904163460m21888242871839275222246405745257275088548364400416034343698204186575808495617))
(assert (= x10 #f1m21888242871839275222246405745257275088548364400416034343698204186575808495617))
(assert (= x11 #f0m21888242871839275222246405745257275088548364400416034343698204186575808495617))
(assert (= x12 #f10944121435919637611123202872628637544274182200208017171849102093287904163459m21888242871839275222246405745257275088548364400416034343698204186575808495617))
(assert (= x13 #f10944121435919637611123202872628637544274182200208017171849102093287904163460m21888242871839275222246405745257275088548364400416034343698204186575808495617))
(assert (= x14 #f1m21888242871839275222246405745257275088548364400416034343698204186575808495617))
(assert (= x15 #f10944121435919637611123202872628637544274182200208017171849102093287904163460m21888242871839275222246405745257275088548364400416034343698204186575808495617))
(assert (= x16 #f1m21888242871839275222246405745257275088548364400416034343698204186575808495617))
(assert (= x17 #f1m21888242871839275222246405745257275088548364400416034343698204186575808495617))
(assert (= y11 #f21888242871839275222246405745257275088548364400416034343698204186575808495616m21888242871839275222246405745257275088548364400416034343698204186575808495617))
(assert (= y12 #f21888242871839275222246405745257275088548364400416034343698204186575808495616m21888242871839275222246405745257275088548364400416034343698204186575808495617))
(assert (= y13 #f10944121435919637611123202872628637544274182200208017171849102093287904163460m21888242871839275222246405745257275088548364400416034343698204186575808495617))
(assert (= y14 #f1m21888242871839275222246405745257275088548364400416034343698204186575808495617))
(assert (= y15 #f10944121435919637611123202872628637544274182200208017171849102093287904163460m21888242871839275222246405745257275088548364400416034343698204186575808495617))
(assert (= y16 #f1m21888242871839275222246405745257275088548364400416034343698204186575808495617))
(assert (= y17 #f0m21888242871839275222246405745257275088548364400416034343698204186575808495617))

; query
; (assert (not (= x53 y53))) ; good after block 1
(assert (not (= x54 y54)))

; cheat
; (assert (= x9 x53))
; (assert (= x9 y53))

; solution

; block 1
; (assert (and
;   (not (= x9 #f19227208690775748531865437331126676461733156385287048589618245965417551240156m21888242871839275222246405745257275088548364400416034343698204186575808495617))
;   (not (= x10 #f0m21888242871839275222246405745257275088548364400416034343698204186575808495617))
;   (not (= x53 #f5322068362127053380761936828261197253630416030257971508159916442316514342224m21888242871839275222246405745257275088548364400416034343698204186575808495617))
;   (not (= x54 #f0m21888242871839275222246405745257275088548364400416034343698204186575808495617))
;   (not (= x55 #f19227208690775748531865437331126676461733156385287048589618245965417551240156m21888242871839275222246405745257275088548364400416034343698204186575808495617))
;   (not (= x56 #f0m21888242871839275222246405745257275088548364400416034343698204186575808495617))
;   (not (= x57 #f0m21888242871839275222246405745257275088548364400416034343698204186575808495617))
;   (not (= x58 #f18039640916646237372880335511686420348069741665070947478680356439334569097561m21888242871839275222246405745257275088548364400416034343698204186575808495617))
;   (not (= y53 #f0m21888242871839275222246405745257275088548364400416034343698204186575808495617))
;   (not (= y54 #f11395287471962378606215025428882238971762841540906324053591198862844560648166m21888242871839275222246405745257275088548364400416034343698204186575808495617))
;   (not (= y55 #f19227208690775748531865437331126676461733156385287048589618245965417551240156m21888242871839275222246405745257275088548364400416034343698204186575808495617))
;   (not (= y56 #f0m21888242871839275222246405745257275088548364400416034343698204186575808495617))
;   (not (= y57 #f1919201053887612038854394017032965582736186453021883147377541836331787784350m21888242871839275222246405745257275088548364400416034343698204186575808495617))
;   (not (= y58 #f18039640916646237372880335511686420348069741665070947478680356439334569097561m21888242871839275222246405745257275088548364400416034343698204186575808495617))
; ))



(check-sat)
(get-model)