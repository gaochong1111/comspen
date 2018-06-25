(set-logic QF_SLID_LC)

(declare-sort RefSll_t 0)

(declare-fun next() (Field RefSll_t RefSll_t))

(define-fun ls ((in RefSll_t) (out RefSll_t)) Space (tospace
    (or (and  (= in out) (tobool emp) )
        (exists ((u RefSll_t))
            (and (tobool (ssep (pto in (ref next u)) (ls u out ) )) )
)  ) ) )

;; variables
(declare-fun x0() RefSll_t)
(declare-fun x1() RefSll_t)
(declare-fun x2() RefSll_t)
(declare-fun x3() RefSll_t)
(declare-fun x4() RefSll_t)
(declare-fun x5() RefSll_t)
(declare-fun x6() RefSll_t)
(declare-fun x7() RefSll_t)
(declare-fun x8() RefSll_t)
(declare-fun x9() RefSll_t)
(declare-fun x10() RefSll_t)
(declare-fun x11() RefSll_t)
(declare-fun x12() RefSll_t)
(declare-fun x13() RefSll_t)
(declare-fun x14() RefSll_t)
(declare-fun x15() RefSll_t)
(declare-fun x16() RefSll_t)
(declare-fun x17() RefSll_t)
(declare-fun x18() RefSll_t)
(declare-fun x19() RefSll_t)

(assert 
		(and 

		(tobool (ssep 
			(ls x3 x1 )
			(ls x13 x14 )
			(pto x15 (ref next x3 ))
			(pto x6 (ref next x13 ))
			(pto x8 (ref next x15 ))
			(ls x9 x13 )
			(pto x7 (ref next x11 ))
			(pto x2 (ref next x7 ))
			(pto x10 (ref next x14 ))
			(ls x11 x3 )
			(pto x12 (ref next x9 ))
			(ls x4 x6 )
			(pto x1 (ref next x12 ))
			(pto x14 (ref next x11 ))
			(ls x5 x11 )
		)

		)

) )

(assert (not 
		(tobool (ssep 
			(ls x10 x14 )
			(ls x9 x13 )
			(ls x2 x7 )
			(ls x7 x11 )
			(ls x8 x15 )
			(ls x15 x3 )
			(ls x5 x11 )
			(ls x4 x9 )
		)

) ))

(check-sat)
;   sat