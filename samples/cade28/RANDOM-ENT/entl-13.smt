(set-logic QF_SLID_LC)
;; size field
(declare-fun sz () (Field Int Int))
(declare-fun st () (Field Int Int))

;; heap chunk
(define-fun hck ((?x Int) (?y Int)) Space
	(tospace
		(exists ((?f Int))
		(and
			(or
				(and (>= (- ?y ?x) 4) (= ?f 0))
				(and (>= (- ?y ?x) 4) (= ?f 1))
			)
			(tobool	(ssep
					(pto ?x (ref sz (- ?y ?x)))
					(pto (+ ?x 1) (ref st ?f))
					(blk (+ ?x 2) ?y)
				)
			)
		)
		)
	)
)
;; heap list
(define-fun hls ((?x Int) (?y Int)) Space
	(tospace (or
		(and (= ?x ?y) (tobool emp))
		(exists ((?w Int))
			(tobool	(ssep
					(hck ?x ?w)
					(hls ?w ?y)
					)
		))
	))
)



;; declare variables
(declare-fun t1 () Int)
(declare-fun u1 () Int)
(declare-fun t2 () Int)
(declare-fun x1 () Int)
(declare-fun x2 () Int)
(declare-fun y1 () Int)
(declare-fun y2 () Int)
(declare-fun z1 () Int)
(declare-fun z2 () Int)
(declare-fun z3 () Int)


(assert
	(and
		(= (+ t1 1) t2)
		(= (+ t2 1) x1)
		(= x2 z1)
		(= z2 y1)
		(< z1 (+ t1 u1))
		(< (+ t1 u1) z2)
		(= z3 (+ t1 u1))
		(tobool
			(ssep
				(pto t1 (ref sz u1))
				(pto t2 (ref st 1))
				(blk x1 x2)
				(hls z1 z2)
				(hck y1 y2)
			)
		)
	)
)

(assert
	(not
		(and
			(< t1 y2)
			(tobool
				(ssep
					(hls t1 z3)
					(blk z3 y2)
				)
			)
		)
	)
)

(check-sat)
;;17.99s unsat:the entl is true
