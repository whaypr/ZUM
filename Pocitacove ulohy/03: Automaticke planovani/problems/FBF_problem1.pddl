; +---------------+
; | | |B| | | | | |
; +---------------+
; |R| | | | | | | |
; +---------------+
; | | | | | | | | |
; +---------------+
; | | | | | | | | |
; +---------------+

(define (problem level-1)
    (:domain factoryBallsForever)
    (:requirements :strips :negative-preconditions)

  	(:init
  	    (dummy)
  	)

    (:goal (and
            (not (maskOn))
            (not (eyesOn))
            (not (beltOn))
            (not (hatOn))
            
            (t21Red)
            (t13Blue)
        )
    )
)