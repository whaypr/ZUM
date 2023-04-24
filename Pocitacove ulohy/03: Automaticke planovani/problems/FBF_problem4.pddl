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

            (t11Yellow) (t12Green) (t13Green) (t14Green) (t15Green) (t16Green) (t17Green) (t18Yellow)
            (t21Yellow) (t22Green) (t23Blue) (t24Yellow) (t25Yellow) (t26Blue) (t27Green) (t28Yellow)
            (t31Red) (t32Red) (t33Red) (t34Red) (t35Red) (t36Red) (t37Red) (t38Red)
            (t41Red) (t42Red) (t43Red) (t44Red) (t45Red) (t46Red) (t47Red) (t48Red)
        )
    )
)