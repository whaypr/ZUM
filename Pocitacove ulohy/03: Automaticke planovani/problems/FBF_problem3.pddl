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

    (:objects
        red green blue yellow - color
    )

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

            (t11Color red) (t12Color red) (t13Color red) (t14Color red)
            (t15Color red) (t16Color red) (t17Color red) (t18Color red)

            (t21Color green) (t22Color green) (t23Color green) (t24Color green)
            (t25Color green) (t26COlor green) (t27Color green) (t28Color green)

            (t31Color blue) (t32Color blue) (t33Color blue) (t34Color blue)
            (t35Color blue) (t36COlor blue) (t37Color blue) (t38Color blue)

            (t41Color yellow) (t42Color yellow) (t43Color yellow) (t44Color yellow)
            (t45Color yellow) (t46COlor yellow) (t47Color yellow) (t48Color yellow)
        )
    )
)