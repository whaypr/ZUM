(define (problem level-1)
    (:domain factoryBallsForever)
    (:requirements :strips :negative-preconditions)

  	(:init
  	    (dummy)
  	)

    (:goal (and
            (not (maskOn))
            (not (beltOn))
            
            (t21Red)
            (t13Blue)
        )
    )
)