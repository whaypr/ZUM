; +---------------+
; |Y|G|G|G|G|G|G|Y|
; +---------------+
; |Y|G|B|Y|Y|B|G|Y|
; +---------------+
; |R|R|R|R|R|R|R|R|
; +---------------+
; |R|R|R|R|R|R|R|R|
; +---------------+

(define (problem level-3)
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

            (t11Yellow) (t12Green) (t13Green) (t14Green) (t15Green) (t16Green) (t17Green) (t18Yellow)
            (t21Yellow) (t22Green) (t23Blue) (t24Yellow) (t25Yellow) (t26Blue) (t27Green) (t28Yellow)
            (t31Red) (t32Red) (t33Red) (t34Red) (t35Red) (t36Red) (t37Red) (t38Red)
            (t41Red) (t42Red) (t43Red) (t44Red) (t45Red) (t46Red) (t47Red) (t48Red)
        )
    )
)