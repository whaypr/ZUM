; +---------------+
; |Y|G|G|G|G|G|G|Y|
; +---------------+
; |Y|G|B|Y|Y|B|G|Y|
; +---------------+
; |R|R|R|R|R|R|R|R|
; +---------------+
; |R|R|R|R|R|R|R|R|
; +---------------+

(define (problem level-4)
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

            (t11Color yellow) (t12Color green) (t13Color green) (t14Color green)
            (t15Color green) (t16Color green) (t17Color green) (t18Color yellow)
            
            (t21Color yellow) (t22Color green) (t23Color blue) (t24Color yellow)
            (t25Color yellow) (t26Color blue) (t27Color green) (t28Color yellow)
            
            (t31Color red) (t32Color red) (t33Color red) (t34Color red)
            (t35Color red) (t36Color red) (t37Color red) (t38Color red)
            
            (t41Color red) (t42Color red) (t43Color red) (t44Color red)
            (t45Color red) (t46Color red) (t47Color red) (t48Color red)
        )
    )
)