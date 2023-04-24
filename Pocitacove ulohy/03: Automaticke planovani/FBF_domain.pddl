(define (domain factoryBallsForever)
    (:requirements :strips :negative-preconditions :typing :conditional-effects :equality :fluents)

    (:predicates
        (maskOn)
        (eyesOn)
        (beltOn)
        (hatOn)

        (t11Red)
        (t12Red)
        (t13Red)
        (t14Red)
        (t15Red)
        (t16Red)
        (t17Red)
        (t18Red)
        (t21Red)
        (t22Red)
        (t23Red)
        (t24Red)
        (t25Red)
        (t26Red)
        (t27Red)
        (t28Red)
        (t31Red)
        (t32Red)
        (t33Red)
        (t34Red)
        (t35Red)
        (t36Red)
        (t37Red)
        (t38Red)
        (t41Red)
        (t42Red)
        (t43Red)
        (t44Red)
        (t45Red)
        (t46Red)
        (t47Red)
        (t48Red)

        (t11Green)
        (t12Green)
        (t13Green)
        (t14Green)
        (t15Green)
        (t16Green)
        (t17Green)
        (t18Green)
        (t21Green)
        (t22Green)
        (t23Green)
        (t24Green)
        (t25Green)
        (t26Green)
        (t27Green)
        (t28Green)
        (t31Green)
        (t32Green)
        (t33Green)
        (t34Green)
        (t35Green)
        (t36Green)
        (t37Green)
        (t38Green)
        (t41Green)
        (t42Green)
        (t43Green)
        (t44Green)
        (t45Green)
        (t46Green)
        (t47Green)
        (t48Green)

        (t11Blue)
        (t12Blue)
        (t13Blue)
        (t14Blue)
        (t15Blue)
        (t16Blue)
        (t17Blue)
        (t18Blue)
        (t21Blue)
        (t22Blue)
        (t23Blue)
        (t24Blue)
        (t25Blue)
        (t26Blue)
        (t27Blue)
        (t28Blue)
        (t31Blue)
        (t32Blue)
        (t33Blue)
        (t34Blue)
        (t35Blue)
        (t36Blue)
        (t37Blue)
        (t38Blue)
        (t41Blue)
        (t42Blue)
        (t43Blue)
        (t44Blue)
        (t45Blue)
        (t46Blue)
        (t47Blue)
        (t48Blue)

        (t11Yellow)
        (t12Yellow)
        (t13Yellow)
        (t14Yellow)
        (t15Yellow)
        (t16Yellow)
        (t17Yellow)
        (t18Yellow)
        (t21Yellow)
        (t22Yellow)
        (t23Yellow)
        (t24Yellow)
        (t25Yellow)
        (t26Yellow)
        (t27Yellow)
        (t28Yellow)
        (t31Yellow)
        (t32Yellow)
        (t33Yellow)
        (t34Yellow)
        (t35Yellow)
        (t36Yellow)
        (t37Yellow)
        (t38Yellow)
        (t41Yellow)
        (t42Yellow)
        (t43Yellow)
        (t44Yellow)
        (t45Yellow)
        (t46Yellow)
        (t47Yellow)
        (t48Yellow)
    )

    (:functions
        (t11CoverCounter)
        (t12CoverCounter)
        (t13CoverCounter)
        (t14CoverCounter)
        (t15CoverCounter)
        (t16CoverCounter)
        (t17CoverCounter)
        (t18CoverCounter)
        (t21CoverCounter)
        (t22CoverCounter)
        (t23CoverCounter)
        (t24CoverCounter)
        (t25CoverCounter)
        (t26CoverCounter)
        (t27CoverCounter)
        (t28CoverCounter)
        (t31CoverCounter)
        (t32CoverCounter)
        (t33CoverCounter)
        (t34CoverCounter)
        (t35CoverCounter)
        (t36CoverCounter)
        (t37CoverCounter)
        (t38CoverCounter)
        (t41CoverCounter)
        (t42CoverCounter)
        (t43CoverCounter)
        (t44CoverCounter)
        (t45CoverCounter)
        (t46CoverCounter)
        (t47CoverCounter)
        (t48CoverCounter)
    )

    (:action putOnMask
        :parameters ()
        :precondition (and
            (not (maskOn))
            (not (beltOn))
            (not (hatOn))
        )
        :effect (and
            (maskOn)
            (increase (t11CoverCounter) 1)
            (increase (t18CoverCounter) 1)
            (increase (t21CoverCounter) 1)
            (increase (t24CoverCounter) 1)
            (increase (t25CoverCounter) 1)
            (increase (t28CoverCounter) 1)
            (increase (t31CoverCounter) 1)
            (increase (t32CoverCounter) 1)
            (increase (t37CoverCounter) 1)
            (increase (t38CoverCounter) 1)
        )
    )

    (:action putOffMask
        :parameters ()
        :precondition (and
            (maskOn)
        )
        :effect (and
            (not (maskOn))
            (decrease (t11CoverCounter) 1)
            (decrease (t18CoverCounter) 1)
            (decrease (t21CoverCounter) 1)
            (decrease (t24CoverCounter) 1)
            (decrease (t25CoverCounter) 1)
            (decrease (t28CoverCounter) 1)
            (decrease (t31CoverCounter) 1)
            (decrease (t32CoverCounter) 1)
            (decrease (t37CoverCounter) 1)
            (decrease (t38CoverCounter) 1)
        )
    )

    (:action putOnEyes
        :parameters ()
        :precondition (and
            (not (eyesOn))
            (not (maskOn))
            (not (beltOn))
            (not (hatOn))
        )
        :effect (and
            (eyesOn)
            (increase (t23CoverCounter) 1)
            (increase (t26CoverCounter) 1)
            (increase (t33CoverCounter) 1)
            (increase (t36CoverCounter) 1)
        )
    )

    (:action putOffEyes
        :parameters ()
        :precondition (and
            (eyesOn)
        )
        :effect (and
            (not (eyesOn))
            (decrease (t23CoverCounter) 1)
            (decrease (t26CoverCounter) 1)
            (decrease (t33CoverCounter) 1)
            (decrease (t36CoverCounter) 1)
        )
    )

    (:action putOnBelt
        :parameters ()
        :precondition (and
            (not (beltOn))
            (not (hatOn))
        )
        :effect (and
            (beltOn)
            (increase (t21CoverCounter) 1)
            (increase (t22CoverCounter) 1)
            (increase (t23CoverCounter) 1)
            (increase (t24CoverCounter) 1)
            (increase (t25CoverCounter) 1)
            (increase (t26CoverCounter) 1)
            (increase (t27CoverCounter) 1)
            (increase (t28CoverCounter) 1)
            (increase (t31CoverCounter) 1)
            (increase (t32CoverCounter) 1)
            (increase (t33CoverCounter) 1)
            (increase (t34CoverCounter) 1)
            (increase (t35CoverCounter) 1)
            (increase (t36CoverCounter) 1)
            (increase (t37CoverCounter) 1)
            (increase (t38CoverCounter) 1)
        )
    )

    (:action putOffBelt
        :parameters ()
        :precondition (and
            (beltOn)
        )
        :effect (and
            (not (beltOn))
            (decrease (t21CoverCounter) 1)
            (decrease (t22CoverCounter) 1)
            (decrease (t23CoverCounter) 1)
            (decrease (t24CoverCounter) 1)
            (decrease (t25CoverCounter) 1)
            (decrease (t26CoverCounter) 1)
            (decrease (t27CoverCounter) 1)
            (decrease (t28CoverCounter) 1)
            (decrease (t31CoverCounter) 1)
            (decrease (t32CoverCounter) 1)
            (decrease (t33CoverCounter) 1)
            (decrease (t34CoverCounter) 1)
            (decrease (t35CoverCounter) 1)
            (decrease (t36CoverCounter) 1)
            (decrease (t37CoverCounter) 1)
            (decrease (t38CoverCounter) 1)
        )
    )

    (:action putOnHat
        :parameters ()
        :precondition (and
            (not (hatOn))
        )
        :effect (and
            (hatOn)
            (increase (t11CoverCounter) 1)
            (increase (t12CoverCounter) 1)
            (increase (t13CoverCounter) 1)
            (increase (t14CoverCounter) 1)
            (increase (t15CoverCounter) 1)
            (increase (t16CoverCounter) 1)
            (increase (t17CoverCounter) 1)
            (increase (t18CoverCounter) 1)
            (increase (t21CoverCounter) 1)
            (increase (t22CoverCounter) 1)
            (increase (t23CoverCounter) 1)
            (increase (t24CoverCounter) 1)
            (increase (t25CoverCounter) 1)
            (increase (t26CoverCounter) 1)
            (increase (t27CoverCounter) 1)
            (increase (t28CoverCounter) 1)
        )
    )

    (:action putOffHat
        :parameters ()
        :precondition (and
            (hatOn)
        )
        :effect (and
            (not (hatOn))
            (decrease (t11CoverCounter) 1)
            (decrease (t12CoverCounter) 1)
            (decrease (t13CoverCounter) 1)
            (decrease (t14CoverCounter) 1)
            (decrease (t15CoverCounter) 1)
            (decrease (t16CoverCounter) 1)
            (decrease (t17CoverCounter) 1)
            (decrease (t18CoverCounter) 1)
            (decrease (t21CoverCounter) 1)
            (decrease (t22CoverCounter) 1)
            (decrease (t23CoverCounter) 1)
            (decrease (t24CoverCounter) 1)
            (decrease (t25CoverCounter) 1)
            (decrease (t26CoverCounter) 1)
            (decrease (t27CoverCounter) 1)
            (decrease (t28CoverCounter) 1)
        )
    )

    (:action applyRed
        :parameters ()
        :precondition (and)
        :effect (and
            (when
                (= (t11CoverCounter) 0)
                (and
                    (t11Red)
                    (not (t11Green)) (not (t11Blue)) (not (t11Yellow))
                ))
            (when
                (= (t12CoverCounter) 0)
                (and
                    (t12Red)
                    (not (t12Green)) (not (t12Blue)) (not (t12Yellow))
                ))
            (when
                (= (t13CoverCounter) 0)
                (and
                    (t13Red)
                    (not (t13Green)) (not (t13Blue)) (not (t13Yellow))
                ))
            (when
                (= (t14CoverCounter) 0)
                (and
                    (t14Red)
                    (not (t14Green)) (not (t14Blue)) (not (t14Yellow))
                ))
            (when
                (= (t15CoverCounter) 0)
                (and
                    (t15Red)
                    (not (t15Green)) (not (t15Blue)) (not (t15Yellow))
                ))
            (when
                (= (t16CoverCounter) 0)
                (and
                    (t16Red)
                    (not (t16Green)) (not (t16Blue)) (not (t16Yellow))
                ))
            (when
                (= (t17CoverCounter) 0)
                (and
                    (t17Red)
                    (not (t17Green)) (not (t17Blue)) (not (t17Yellow))
                ))
            (when
                (= (t18CoverCounter) 0)
                (and
                    (t18Red)
                    (not (t18Green)) (not (t18Blue)) (not (t18Yellow))
                ))
            (when
                (= (t21CoverCounter) 0)
                (and
                    (t21Red)
                    (not (t21Green)) (not (t21Blue)) (not (t21Yellow))
                ))
            (when
                (= (t22CoverCounter) 0)
                (and
                    (t22Red)
                    (not (t22Green)) (not (t22Blue)) (not (t22Yellow))
                ))
            (when
                (= (t23CoverCounter) 0)
                (and
                    (t23Red)
                    (not (t23Green)) (not (t23Blue)) (not (t23Yellow))
                ))
            (when
                (= (t24CoverCounter) 0)
                (and
                    (t24Red)
                    (not (t24Green)) (not (t24Blue)) (not (t24Yellow))
                ))
            (when
                (= (t25CoverCounter) 0)
                (and
                    (t25Red)
                    (not (t25Green)) (not (t25Blue)) (not (t25Yellow))
                ))
            (when
                (= (t26CoverCounter) 0)
                (and
                    (t26Red)
                    (not (t26Green)) (not (t26Blue)) (not (t26Yellow))
                ))
            (when
                (= (t27CoverCounter) 0)
                (and
                    (t27Red)
                    (not (t27Green)) (not (t27Blue)) (not (t27Yellow))
                ))
            (when
                (= (t28CoverCounter) 0)
                (and
                    (t28Red)
                    (not (t28Green)) (not (t28Blue)) (not (t28Yellow))
                ))
            (when
                (= (t31CoverCounter) 0)
                (and
                    (t31Red)
                    (not (t31Green)) (not (t31Blue)) (not (t31Yellow))
                ))
            (when
                (= (t32CoverCounter) 0)
                (and
                    (t32Red)
                    (not (t32Green)) (not (t32Blue)) (not (t32Yellow))
                ))
            (when
                (= (t33CoverCounter) 0)
                (and
                    (t33Red)
                    (not (t33Green)) (not (t33Blue)) (not (t33Yellow))
                ))
            (when
                (= (t34CoverCounter) 0)
                (and
                    (t34Red)
                    (not (t34Green)) (not (t34Blue)) (not (t34Yellow))
                ))
            (when
                (= (t35CoverCounter) 0)
                (and
                    (t35Red)
                    (not (t35Green)) (not (t35Blue)) (not (t35Yellow))
                ))
            (when
                (= (t36CoverCounter) 0)
                (and
                    (t36Red)
                    (not (t36Green)) (not (t36Blue)) (not (t36Yellow))
                ))
            (when
                (= (t37CoverCounter) 0)
                (and
                    (t37Red)
                    (not (t37Green)) (not (t37Blue)) (not (t37Yellow))
                ))
            (when
                (= (t38CoverCounter) 0)
                (and
                    (t38Red)
                    (not (t38Green)) (not (t38Blue)) (not (t38Yellow))
                ))
            (t41Red) (not (t41Blue)) (not (t41Green)) (not (t41Yellow))
            (t42Red) (not (t42Blue)) (not (t42Green)) (not (t42Yellow))
            (t43Red) (not (t43Blue)) (not (t43Green)) (not (t43Yellow))
            (t44Red) (not (t44Blue)) (not (t44Green)) (not (t44Yellow))
            (t45Red) (not (t45Blue)) (not (t45Green)) (not (t45Yellow))
            (t46Red) (not (t46Blue)) (not (t46Green)) (not (t46Yellow))
            (t47Red) (not (t47Blue)) (not (t47Green)) (not (t47Yellow))
            (t48Red) (not (t48Blue)) (not (t48Green)) (not (t48Yellow))
        )
    )

    (:action applyGreen
        :parameters ()
        :precondition (and)
        :effect (and
            (when
                (= (t11CoverCounter) 0)
                (and
                    (t11Green)
                    (not (t11Red)) (not (t11Blue)) (not (t11Yellow))
                ))
            (when
                (= (t12CoverCounter) 0)
                (and
                    (t12Green)
                    (not (t12Red)) (not (t12Blue)) (not (t12Yellow))
                ))
            (when
                (= (t13CoverCounter) 0)
                (and
                    (t13Green)
                    (not (t13Red)) (not (t13Blue)) (not (t13Yellow))
                ))
            (when
                (= (t14CoverCounter) 0)
                (and
                    (t14Green)
                    (not (t14Green)) (not (t14Blue)) (not (t14Yellow))
                ))
            (when
                (= (t15CoverCounter) 0)
                (and
                    (t15Green)
                    (not (t15Red)) (not (t15Blue)) (not (t15Yellow))
                ))
            (when
                (= (t16CoverCounter) 0)
                (and
                    (t16Green)
                    (not (t16Red)) (not (t16Blue)) (not (t16Yellow))
                ))
            (when
                (= (t17CoverCounter) 0)
                (and
                    (t17Green)
                    (not (t17Red)) (not (t17Blue)) (not (t17Yellow))
                ))
            (when
                (= (t18CoverCounter) 0)
                (and
                    (t18Green)
                    (not (t18Red)) (not (t18Blue)) (not (t18Yellow))
                ))
            (when
                (= (t21CoverCounter) 0)
                (and
                    (t21Green)
                    (not (t21Red)) (not (t21Blue)) (not (t21Yellow))
                ))
            (when
                (= (t22CoverCounter) 0)
                (and
                    (t22Green)
                    (not (t22Red)) (not (t22Blue)) (not (t22Yellow))
                ))
            (when
                (= (t23CoverCounter) 0)
                (and
                    (t23Green)
                    (not (t23Red)) (not (t23Blue)) (not (t23Yellow))
                ))
            (when
                (= (t24CoverCounter) 0)
                (and
                    (t24Green)
                    (not (t24Red)) (not (t24Blue)) (not (t24Yellow))
                ))
            (when
                (= (t25CoverCounter) 0)
                (and
                    (t25Green)
                    (not (t25Red)) (not (t25Blue)) (not (t25Yellow))
                ))
            (when
                (= (t26CoverCounter) 0)
                (and
                    (t26Green)
                    (not (t26Red)) (not (t26Blue)) (not (t26Yellow))
                ))
            (when
                (= (t27CoverCounter) 0)
                (and
                    (t27Green)
                    (not (t27Red)) (not (t27Blue)) (not (t27Yellow))
                ))
            (when
                (= (t28CoverCounter) 0)
                (and
                    (t28Green)
                    (not (t28Red)) (not (t28Blue)) (not (t28Yellow))
                ))
            (when
                (= (t31CoverCounter) 0)
                (and
                    (t31Green)
                    (not (t31Red)) (not (t31Blue)) (not (t31Yellow))
                ))
            (when
                (= (t32CoverCounter) 0)
                (and
                    (t32Green)
                    (not (t32Red)) (not (t32Blue)) (not (t32Yellow))
                ))
            (when
                (= (t33CoverCounter) 0)
                (and
                    (t33Green)
                    (not (t33Red)) (not (t33Blue)) (not (t33Yellow))
                ))
            (when
                (= (t34CoverCounter) 0)
                (and
                    (t34Green)
                    (not (t34Red)) (not (t34Blue)) (not (t34Yellow))
                ))
            (when
                (= (t35CoverCounter) 0)
                (and
                    (t35Green)
                    (not (t35Red)) (not (t35Blue)) (not (t35Yellow))
                ))
            (when
                (= (t36CoverCounter) 0)
                (and
                    (t36Green)
                    (not (t36Red)) (not (t36Blue)) (not (t36Yellow))
                ))
            (when
                (= (t37CoverCounter) 0)
                (and
                    (t37Green)
                    (not (t37Red)) (not (t37Blue)) (not (t37Yellow))
                ))
            (when
                (= (t38CoverCounter) 0)
                (and
                    (t38Green)
                    (not (t38Red)) (not (t38Blue)) (not (t38Yellow))
                ))
            (t41Green) (not (t41Red)) (not (t41Blue)) (not (t41Yellow))
            (t42Green) (not (t42Red)) (not (t42Blue)) (not (t42Yellow))
            (t43Green) (not (t43Red)) (not (t43Blue)) (not (t43Yellow))
            (t44Green) (not (t44Red)) (not (t44Blue)) (not (t44Yellow))
            (t45Green) (not (t45Red)) (not (t45Blue)) (not (t45Yellow))
            (t46Green) (not (t46Red)) (not (t46Blue)) (not (t46Yellow))
            (t47Green) (not (t47Red)) (not (t47Blue)) (not (t47Yellow))
            (t48Green) (not (t48Red)) (not (t48Blue)) (not (t48Yellow))
        )
    )

    (:action applyBlue
        :parameters ()
        :precondition (and)
        :effect (and
            (when
                (= (t11CoverCounter) 0)
                (and (t11Blue) (not (t11Red)) (not (t11Green)) (not (t11Yellow))
                ))
            (when
                (= (t12CoverCounter) 0)
                (and
                    (t12Blue)
                    (not (t12Red)) (not (t12Green)) (not (t12Yellow))
                ))
            (when
                (= (t13CoverCounter) 0)
                (and
                    (t13Blue)
                    (not (t13Red)) (not (t13Green)) (not (t13Yellow))
                ))
            (when
                (= (t14CoverCounter) 0)
                (and
                    (t14Blue)
                    (not (t14Blue)) (not (t14Green)) (not (t14Yellow))
                ))
            (when
                (= (t15CoverCounter) 0)
                (and
                    (t15Blue)
                    (not (t15Red)) (not (t15Green)) (not (t15Yellow))
                ))
            (when
                (= (t16CoverCounter) 0)
                (and
                    (t16Blue)
                    (not (t16Red)) (not (t16Green)) (not (t16Yellow))
                ))
            (when
                (= (t17CoverCounter) 0)
                (and
                    (t17Blue)
                    (not (t17Red)) (not (t17Green)) (not (t17Yellow))
                ))
            (when
                (= (t18CoverCounter) 0)
                (and
                    (t18Blue)
                    (not (t18Red)) (not (t18Green)) (not (t18Yellow))
                ))
            (when
                (= (t21CoverCounter) 0)
                (and
                    (t21Blue)
                    (not (t21Red)) (not (t21Green)) (not (t21Yellow))
                ))
            (when
                (= (t21CoverCounter) 0)
                (and
                    (t22Blue)
                    (not (t22Red)) (not (t22Green)) (not (t22Yellow))
                ))
            (when
                (= (t23CoverCounter) 0)
                (and
                    (t23Blue)
                    (not (t23Red)) (not (t23Green)) (not (t23Yellow))
                ))
            (when
                (= (t24CoverCounter) 0)
                (and
                    (t24Blue)
                    (not (t24Red)) (not (t24Green)) (not (t24Yellow))
                ))
            (when
                (= (t25CoverCounter) 0)
                (and
                    (t25Blue)
                    (not (t25Red)) (not (t25Green)) (not (t25Yellow))
                ))
            (when
                (= (t26CoverCounter) 0)
                (and
                    (t26Blue)
                    (not (t26Red)) (not (t26Green)) (not (t26Yellow))
                ))
            (when
                (= (t27CoverCounter) 0)
                (and
                    (t27Blue)
                    (not (t27Red)) (not (t27Green)) (not (t27Yellow))
                ))
            (when
                (= (t28CoverCounter) 0)
                (and
                    (t28Blue)
                    (not (t28Red)) (not (t28Green)) (not (t28Yellow))
                ))
            (when
                (= (t31CoverCounter) 0)
                (and
                    (t31Blue)
                    (not (t31Red)) (not (t31Green)) (not (t31Yellow))
                ))
            (when
                (= (t32CoverCounter) 0)
                (and
                    (t32Blue)
                    (not (t32Red)) (not (t32Green)) (not (t32Yellow))
                ))
            (when
                (= (t33CoverCounter) 0)
                (and
                    (t33Blue)
                    (not (t33Red)) (not (t33Green)) (not (t33Yellow))
                ))
            (when
                (= (t34CoverCounter) 0)
                (and
                    (t34Blue)
                    (not (t34Red)) (not (t34Green)) (not (t34Yellow))
                ))
            (when
                (= (t35CoverCounter) 0)
                (and
                    (t35Blue)
                    (not (t35Red)) (not (t35Green)) (not (t35Yellow))
                ))
            (when
                (= (t36CoverCounter) 0)
                (and
                    (t36Blue)
                    (not (t36Red)) (not (t36Green)) (not (t36Yellow))
                ))
            (when
                (= (t37CoverCounter) 0)
                (and
                    (t37Blue)
                    (not (t37Red)) (not (t37Green)) (not (t37Yellow))
                ))
            (when
                (= (t38CoverCounter) 0)
                (and
                    (t38Blue)
                    (not (t38Red)) (not (t38Green)) (not (t38Yellow))
                ))
            (t41Blue) (not (t41Red)) (not (t41Green)) (not (t41Yellow))
            (t42Blue) (not (t42Red)) (not (t42Green)) (not (t42Yellow))
            (t43Blue) (not (t43Red)) (not (t43Green)) (not (t43Yellow))
            (t44Blue) (not (t44Red)) (not (t44Green)) (not (t44Yellow))
            (t45Blue) (not (t45Red)) (not (t45Green)) (not (t45Yellow))
            (t46Blue) (not (t46Red)) (not (t46Green)) (not (t46Yellow))
            (t47Blue) (not (t47Red)) (not (t47Green)) (not (t47Yellow))
            (t48Blue) (not (t48Red)) (not (t48Green)) (not (t48Yellow))
        )
    )

    (:action applyYellow
        :parameters ()
        :precondition (and)
        :effect (and
            (when
                (= (t11CoverCounter) 0)
                (and
                    (t11Yellow)
                    (not (t11Blue)) (not (t11Red)) (not (t11Green))
                ))
            (when
                (= (t12CoverCounter) 0)
                (and
                    (t12Yellow)
                    (not (t12Blue)) (not (t12Red)) (not (t12Green))
                ))
            (when
                (= (t13CoverCounter) 0)
                (and
                    (t13Yellow)
                    (not (t13Blue)) (not (t13Red)) (not (t13Green))
                ))
            (when
                (= (t14CoverCounter) 0)
                (and
                    (t14Yellow)
                    (not (t14Blue)) (not (t14Blue)) (not (t14Green))
                ))
            (when
                (= (t15CoverCounter) 0)
                (and
                    (t15Yellow)
                    (not (t15Blue)) (not (t15Red)) (not (t15Green))
                ))
            (when
                (= (t16CoverCounter) 0)
                (and
                    (t16Yellow)
                    (not (t16Blue)) (not (t16Red)) (not (t16Green))
                ))
            (when
                (= (t17CoverCounter) 0)
                (and
                    (t17Yellow)
                    (not (t17Blue)) (not (t17Red)) (not (t17Green))
                ))
            (when
                (= (t18CoverCounter) 0)
                (and
                    (t18Yellow)
                    (not (t18Blue)) (not (t18Red)) (not (t18Green))
                ))
            (when
                (= (t21CoverCounter) 0)
                (and
                    (t21Yellow)
                    (not (t21Blue)) (not (t21Red)) (not (t21Green))
                ))
            (when
                (= (t22CoverCounter) 0)
                (and
                    (t22Yellow)
                    (not (t22Blue)) (not (t22Red)) (not (t22Green))
                ))
            (when
                (= (t23CoverCounter) 0)
                (and
                    (t23Yellow)
                    (not (t23Blue)) (not (t23Red)) (not (t23Green))
                ))
            (when
                (= (t24CoverCounter) 0)
                (and
                    (t24Yellow)
                    (not (t24Blue)) (not (t24Red)) (not (t24Green))
                ))
            (when
                (= (t25CoverCounter) 0)
                (and
                    (t25Yellow)
                    (not (t25Blue)) (not (t25Red)) (not (t25Green))
                ))
            (when
                (= (t26CoverCounter) 0)
                (and
                    (t26Yellow)
                    (not (t26Blue)) (not (t26Red)) (not (t26Green))
                ))
            (when
                (= (t27CoverCounter) 0)
                (and
                    (t27Yellow)
                    (not (t27Blue)) (not (t27Red)) (not (t27Green))
                ))
            (when
                (= (t28CoverCounter) 0)
                (and
                    (t28Yellow)
                    (not (t28Blue)) (not (t28Red)) (not (t28Green))
                ))
            (when
                (= (t31CoverCounter) 0)
                (and
                    (t31Yellow)
                    (not (t31Blue)) (not (t31Red)) (not (t31Green))
                ))
            (when
                (= (t32CoverCounter) 0)
                (and
                    (t32Yellow)
                    (not (t32Blue)) (not (t32Red)) (not (t32Green))
                ))
            (when
                (= (t33CoverCounter) 0)
                (and
                    (t33Yellow)
                    (not (t33Blue)) (not (t33Red)) (not (t33Green))
                ))
            (when
                (= (t34CoverCounter) 0)
                (and
                    (t34Yellow)
                    (not (t34Blue)) (not (t34Red)) (not (t34Green))
                ))
            (when
                (= (t35CoverCounter) 0)
                (and
                    (t35Yellow)
                    (not (t35Blue)) (not (t35Red)) (not (t35Green))
                ))
            (when
                (= (t36CoverCounter) 0)
                (and
                    (t36Yellow)
                    (not (t36Blue)) (not (t36Red)) (not (t36Green))
                ))
            (when
                (= (t37CoverCounter) 0)
                (and
                    (t37Yellow)
                    (not (t37Blue)) (not (t37Red)) (not (t37Green))
                ))
            (when
                (= (t38CoverCounter) 0)
                (and
                    (t38Yellow)
                    (not (t38Blue)) (not (t38Red)) (not (t38Green))
                ))
            (t41Yellow) (not (t41Red)) (not (t41Green)) (not (t41Blue))
            (t42Yellow) (not (t42Red)) (not (t42Green)) (not (t42Blue))
            (t43Yellow) (not (t43Red)) (not (t43Green)) (not (t43Blue))
            (t44Yellow) (not (t44Red)) (not (t44Green)) (not (t44Blue))
            (t45Yellow) (not (t45Red)) (not (t45Green)) (not (t45Blue))
            (t46Yellow) (not (t46Red)) (not (t46Green)) (not (t46Blue))
            (t47Yellow) (not (t47Red)) (not (t47Green)) (not (t47Blue))
            (t48Yellow) (not (t48Red)) (not (t48Green)) (not (t48Blue))
        )
    )
)