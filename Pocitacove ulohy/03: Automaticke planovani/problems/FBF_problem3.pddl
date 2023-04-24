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
    (:requirements :strips)

  	(:init
  	    (= (t11CoverCounter) 0)
        (= (t12CoverCounter) 0)
        (= (t13CoverCounter) 0)
        (= (t14CoverCounter) 0)
        (= (t15CoverCounter) 0)
        (= (t16CoverCounter) 0)
        (= (t17CoverCounter) 0)
        (= (t18CoverCounter) 0)
        (= (t21CoverCounter) 0)
        (= (t22CoverCounter) 0)
        (= (t23CoverCounter) 0)
        (= (t24CoverCounter) 0)
        (= (t25CoverCounter) 0)
        (= (t26CoverCounter) 0)
        (= (t27CoverCounter) 0)
        (= (t28CoverCounter) 0)
        (= (t31CoverCounter) 0)
        (= (t32CoverCounter) 0)
        (= (t33CoverCounter) 0)
        (= (t34CoverCounter) 0)
        (= (t35CoverCounter) 0)
        (= (t36CoverCounter) 0)
        (= (t37CoverCounter) 0)
        (= (t38CoverCounter) 0)
        (= (t41CoverCounter) 0)
        (= (t42CoverCounter) 0)
        (= (t43CoverCounter) 0)
        (= (t44CoverCounter) 0)
        (= (t45CoverCounter) 0)
        (= (t46CoverCounter) 0)
        (= (t47CoverCounter) 0)
        (= (t48CoverCounter) 0)
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