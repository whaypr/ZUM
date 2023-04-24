; +---------------+
; |R|R|R|R|R|R|R|R|
; +---------------+
; |G|G|G|G|G|G|G|G|
; +---------------+
; |B|B|B|B|B|B|B|B|
; +---------------+
; |Y|Y|Y|Y|Y|Y|Y|Y|
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

            (t11Red) (t12Red) (t13Red) (t14Red) (t15Red) (t16Red) (t17Red) (t18Red)
            (t21Green) (t22Green) (t23Green) (t24Green) (t25Green) (t26Green) (t27Green) (t28Green)
            (t31Blue) (t32Blue) (t33Blue) (t34Blue) (t35Blue) (t36Blue) (t37Blue) (t38Blue)
            (t41Yellow) (t42Yellow) (t43Yellow) (t44Yellow) (t45Yellow) (t46Yellow) (t47Yellow) (t48Yellow)
        )
    )
)