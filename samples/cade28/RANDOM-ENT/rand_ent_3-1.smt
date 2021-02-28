(set-logic QF_SLID_LC)
;; size field
(declare-fun sz () (Field Int Int))

;; heap chunk
(define-fun hck ((?x Int) (?y Int)) Space
	(tospace
		(and
			(>= (- ?y ?x) 2)
			(tobool	(ssep
					(pto ?x (ref sz (- ?y ?x)))
					(blk (+ ?x 1) ?y)
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

;; variables
(declare-fun hst () Int)
(declare-fun hen () Int)
(declare-fun x0 () Int)
(declare-fun y0 () Int)
(declare-fun x1 () Int)
(declare-fun y1 () Int)
(declare-fun x2 () Int)
(declare-fun y2 () Int)
(declare-fun x3 () Int)
(declare-fun y3 () Int)
(declare-fun z0_0 () Int)
(declare-fun sz0_0 () Int)
(declare-fun u0_0 () Int)
(declare-fun v0_0 () Int)
(declare-fun z0_1 () Int)
(declare-fun sz0_1 () Int)
(declare-fun u0_1 () Int)
(declare-fun v0_1 () Int)
(declare-fun z1_0 () Int)
(declare-fun sz1_0 () Int)
(declare-fun u1_0 () Int)
(declare-fun v1_0 () Int)
(declare-fun z1_1 () Int)
(declare-fun sz1_1 () Int)
(declare-fun u1_1 () Int)
(declare-fun v1_1 () Int)
(declare-fun z2_0 () Int)
(declare-fun sz2_0 () Int)
(declare-fun u2_0 () Int)
(declare-fun v2_0 () Int)
(declare-fun z2_1 () Int)
(declare-fun sz2_1 () Int)
(declare-fun u2_1 () Int)
(declare-fun v2_1 () Int)

(assert
	(and
	(= x0 hst)
	(= y3 hen)
	(< x0 y3)
	(= y0 z0_0)
	(= y1 z1_0)
	(= y2 z2_0)
	(= v1_1 x2)
	(= v2_1 x3)
	(= (+ z0_0 sz0_0) x1)
	(= (+ z0_0 1) z0_1)
	(= (+ z1_0 sz1_0) x2)
	(= (+ z1_0 1) u1_1)
	(= v1_0 u1_1)
	(= v1_1 x2)
	(= (+ z2_0 sz2_0) x3)
	(= (+ z2_0 1) z2_1)
	(tobool (ssep
		(hls x0 y0)
		(pto z0_0 (ref sz sz0_0))
		(pto z0_1 (ref sz sz0_1))
		(hls x1 y1)
		(pto z1_0 (ref sz sz1_0))
		(blk u1_1 v1_1)
		(hls x2 y2)
		(pto z2_0 (ref sz sz2_0))
		(pto z2_1 (ref sz sz2_1))
		(hls x3 y3)
		)
	)
))
(assert (not
	(tobool (ssep
		(hls x0 y1)
		(hls y1 y3)
	)	)
))
;; end of problem
(check-sat)
;; 0.08s sat : the entl is false
