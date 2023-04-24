; +---------------+
; | | | |G|G| | | |
; +---------------+
; | | | |B|B| | | |
; +---------------+
; | | |R|R|R|R| | |
; +---------------+
; | | | |G|G| | | |
; +---------------+

(define (problem level-2)
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
            
            (t14Green)
            (t15Green)
            (t24Blue)
            (t25Blue)
            (t33Red)
            (t34Red)
            (t35Red)
            (t36Red)
            (t44Green)
            (t45Green)
        )
    )
)