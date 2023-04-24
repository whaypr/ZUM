(define (domain factoryBallsForever)
    (:requirements :strips :negative-preconditions :typing :conditional-effects :equality)
    
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

        (dummy)
    )

    (:action putOnMask
        :parameters ()
        :precondition (and
            (not (beltOn))
            (not (hatOn))
        )
        :effect (and
            (maskOn)
        )
    )

    (:action putOffMask
        :parameters ()
        :precondition (and
            (maskOn)
        )
        :effect (and
            (not (maskOn))
        )
    )

    (:action putOnEyes
        :parameters ()
        :precondition (and
            (not (maskOn))
            (not (beltOn))
            (not (hatOn))
        )
        :effect (and
            (eyesOn)
        )
    )

    (:action putOffEyes
        :parameters ()
        :precondition (and
            (eyesOn)
        )
        :effect (and
            (not (eyesOn))
        )
    )

    (:action putOnBelt
        :parameters ()
        :precondition (and
            (not (hatOn))
        )
        :effect (and
            (beltOn)
        )
    )

    (:action putOffBelt
        :parameters ()
        :precondition (and
            (beltOn)
        )
        :effect (and
            (not (beltOn))
        )
    )

    (:action putOnHat
        :parameters ()
        :precondition (and)
        :effect (and
            (hatOn)
        )
    )

    (:action putOffHat
        :parameters ()
        :precondition (and
            (hatOn)
        )
        :effect (and
            (not (hatOn))
        )
    )

    (:action applyRed
        :parameters ()
        :precondition (and)
        :effect (and
            (when
                (and (not (maskOn)) (not (hatOn)))
                (and
                    (t11Red)
                    (not (t11Green))
                    (not (t11BLue))
                    (not (t11Yellow))
                ))
            (when
                (and (not (hatOn)))
                (and
                    (t12Red)
                    (not (t12Green))
                    (not (t12BLue))
                    (not (t12Yellow))
                ))
            (when
                (and (not (hatOn)))
                (and
                    (t13Red)
                    (not (t13Green))
                    (not (t13BLue))
                    (not (t13Yellow))
                ))
            (when
                (and (not (hatOn)))
                (and
                    (t14Red)
                    (not (t14Green))
                    (not (t14BLue))
                    (not (t14Yellow))
                ))
            (when
                (and (not (hatOn)))
                (and
                    (t15Red)
                    (not (t15Green))
                    (not (t15BLue))
                    (not (t15Yellow))
                ))
            (when
                (and (not (hatOn)))
                (and
                    (t16Red)
                    (not (t16Green))
                    (not (t16BLue))
                    (not (t16Yellow))
                ))
            (when
                (and (not (hatOn)))
                (and
                    (t17Red)
                    (not (t17Green))
                    (not (t17BLue))
                    (not (t17Yellow))
                ))
            (when
                (and (not (maskOn)) (not (hatOn)))
                (and
                    (t18Red)
                    (not (t18Green))
                    (not (t18BLue))
                    (not (t18Yellow))
                ))
            (when
                (and (not (beltOn)) (not (hatOn)) (not (maskOn)))
                (and
                    (t21Red)
                    (not (t21Green))
                    (not (t21BLue))
                    (not (t21Yellow))
                ))
            (when
                (and (not (beltOn)) (not (hatOn)))
                (and
                    (t22Red)
                    (not (t22Green))
                    (not (t22BLue))
                    (not (t22Yellow))
                ))
            (when
                (and (not (beltOn)) (not (hatOn)) (not (eyesOn)))
                (and
                    (t23Red)
                    (not (t23Green))
                    (not (t23BLue))
                    (not (t23Yellow))
                ))
            (when
                (and (not (beltOn)) (not (hatOn)) (not (maskOn)))
                (and
                    (t24Red)
                    (not (t24Green))
                    (not (t24BLue))
                    (not (t24Yellow))
                ))
            (when
                (and (not (beltOn)) (not (hatOn)) (not (maskOn)))
                (and
                    (t25Red)
                    (not (t25Green))
                    (not (t25BLue))
                    (not (t25Yellow))
                ))
            (when
                (and (not (beltOn)) (not (hatOn)) (not (eyesOn)))
                (and
                    (t26Red)
                    (not (t26Green))
                    (not (t26BLue))
                    (not (t26Yellow))
                ))
            (when
                (and (not (beltOn)) (not (hatOn)))
                (and
                    (t27Red)
                    (not (t27Green))
                    (not (t27BLue))
                    (not (t27Yellow))
                ))
            (when
                (and (not (beltOn)) (not (hatOn)) (not (maskOn)))
                (and
                    (t28Red)
                    (not (t28Green))
                    (not (t28BLue))
                    (not (t28Yellow))
                ))
            (when
                (and (not (beltOn)) (not (maskOn)))
                (and
                    (t31Red)
                    (not (t31Green))
                    (not (t31BLue))
                    (not (t31Yellow))
                ))
            (when
                (and (not (beltOn)) (not (maskOn)))
                (and
                    (t32Red)
                    (not (t32Green))
                    (not (t32BLue))
                    (not (t32Yellow))
                ))
            (when
                (and (not (beltOn)) (not (eyesOn)))
                (and
                    (t33Red)
                    (not (t33Green))
                    (not (t33BLue))
                    (not (t33Yellow))
                ))
            (when
                (and (not (beltOn)))
                (and
                    (t34Red)
                    (not (t34Green))
                    (not (t34BLue))
                    (not (t34Yellow))
                ))
            (when
                (and (not (beltOn)))
                (and
                    (t35Red)
                    (not (t35Green))
                    (not (t35BLue))
                    (not (t35Yellow))
                ))
            (when
                (and (not (beltOn)) (not (eyesOn)))
                (and
                    (t36Red)
                    (not (t36Green))
                    (not (t36BLue))
                    (not (t36Yellow))
                ))
            (when
                (and (not (beltOn)) (not (maskOn)))
                (and
                    (t37Red)
                    (not (t37Green))
                    (not (t37BLue))
                    (not (t37Yellow))
                ))
            (when
                (and (not (beltOn)) (not (maskOn)))
                (and
                    (t38Red)
                    (not (t38Green))
                    (not (t38BLue))
                    (not (t38Yellow))
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
                (and (not (maskOn)) (not (hatOn)))
                (and
                    (t11Green)
                    (not (t11Red))
                    (not (t11BLue))
                    (not (t11Yellow))
                ))
            (when
                (and (not (hatOn)))
                (and
                    (t12Green)
                    (not (t12Red))
                    (not (t12BLue))
                    (not (t12Yellow))
                ))
            (when
                (and (not (hatOn)))
                (and
                    (t13Green)
                    (not (t13Red))
                    (not (t13BLue))
                    (not (t13Yellow))
                ))
            (when
                (and (not (hatOn)))
                (and
                    (t14Green)
                    (not (t14Green))
                    (not (t14BLue))
                    (not (t14Yellow))
                ))
            (when
                (and (not (hatOn)))
                (and
                    (t15Green)
                    (not (t15Red))
                    (not (t15BLue))
                    (not (t15Yellow))
                ))
            (when
                (and (not (hatOn)))
                (and
                    (t16Green)
                    (not (t16Red))
                    (not (t16BLue))
                    (not (t16Yellow))
                ))
            (when
                (and (not (hatOn)))
                (and
                    (t17Green)
                    (not (t17Red))
                    (not (t17BLue))
                    (not (t17Yellow))
                ))
            (when
                (and (not (maskOn)) (not (hatOn)))
                (and
                    (t18Green)
                    (not (t18Red))
                    (not (t18BLue))
                    (not (t18Yellow))
                ))
            (when
                (and (not (beltOn)) (not (hatOn)) (not (maskOn)))
                (and
                    (t21Green)
                    (not (t21Red))
                    (not (t21BLue))
                    (not (t21Yellow))
                ))
            (when
                (and (not (beltOn)) (not (hatOn)))
                (and
                    (t22Green)
                    (not (t22Red))
                    (not (t22BLue))
                    (not (t22Yellow))
                ))
            (when
                (and (not (beltOn)) (not (hatOn)) (not (eyesOn)))
                (and
                    (t23Green)
                    (not (t23Red))
                    (not (t23BLue))
                    (not (t23Yellow))
                ))
            (when
                (and (not (beltOn)) (not (hatOn)) (not (maskOn)))
                (and
                    (t24Green)
                    (not (t24Red))
                    (not (t24BLue))
                    (not (t24Yellow))
                ))
            (when
                (and (not (beltOn)) (not (hatOn)) (not (maskOn)))
                (and
                    (t25Green)
                    (not (t25Red))
                    (not (t25BLue))
                    (not (t25Yellow))
                ))
            (when
                (and (not (beltOn)) (not (hatOn)) (not (eyesOn)))
                (and
                    (t26Green)
                    (not (t26Red))
                    (not (t26BLue))
                    (not (t26Yellow))
                ))
            (when
                (and (not (beltOn)) (not (hatOn)))
                (and
                    (t27Green)
                    (not (t27Red))
                    (not (t27BLue))
                    (not (t27Yellow))
                ))
            (when
                (and (not (beltOn)) (not (hatOn)) (not (maskOn)))
                (and
                    (t28Green)
                    (not (t28Red))
                    (not (t28BLue))
                    (not (t28Yellow))
                ))
            (when
                (and (not (beltOn)) (not (maskOn)))
                (and
                    (t31Green)
                    (not (t31Red))
                    (not (t31BLue))
                    (not (t31Yellow))
                ))
            (when
                (and (not (beltOn)) (not (maskOn)))
                (and
                    (t32Green)
                    (not (t32Red))
                    (not (t32BLue))
                    (not (t32Yellow))
                ))
            (when
                (and (not (beltOn)) (not (eyesOn)))
                (and
                    (t33Green)
                    (not (t33Red))
                    (not (t33BLue))
                    (not (t33Yellow))
                ))
            (when
                (and (not (beltOn)))
                (and
                    (t34Green)
                    (not (t34Red))
                    (not (t34BLue))
                    (not (t34Yellow))
                ))
            (when
                (and (not (beltOn)))
                (and
                    (t35Green)
                    (not (t35Red))
                    (not (t35BLue))
                    (not (t35Yellow))
                ))
            (when
                (and (not (beltOn)) (not (eyesOn)))
                (and
                    (t36Green)
                    (not (t36Red))
                    (not (t36BLue))
                    (not (t36Yellow))
                ))
            (when
                (and (not (beltOn)) (not (maskOn)))
                (and
                    (t37Green)
                    (not (t37Red))
                    (not (t37BLue))
                    (not (t37Yellow))
                ))
            (when
                (and (not (beltOn)) (not (maskOn)))
                (and
                    (t38Green)
                    (not (t38Red))
                    (not (t38BLue))
                    (not (t38Yellow))
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
                (and (not (maskOn)) (not (hatOn)))
                (and
                    (t11Blue)
                    (not (t11Red))
                    (not (t11Green))
                    (not (t11Yellow))
                ))
            (when
                (and (not (hatOn)))
                (and
                    (t12Blue)
                    (not (t12Red))
                    (not (t12Green))
                    (not (t12Yellow))
                ))
            (when
                (and (not (hatOn)))
                (and
                    (t13Blue)
                    (not (t13Red))
                    (not (t13Green))
                    (not (t13Yellow))
                ))
            (when
                (and (not (hatOn)))
                (and
                    (t14Blue)
                    (not (t14Blue))
                    (not (t14Green))
                    (not (t14Yellow))
                ))
            (when
                (and (not (hatOn)))
                (and
                    (t15Blue)
                    (not (t15Red))
                    (not (t15Green))
                    (not (t15Yellow))
                ))
            (when
                (and (not (hatOn)))
                (and
                    (t16Blue)
                    (not (t16Red))
                    (not (t16Green))
                    (not (t16Yellow))
                ))
            (when
                (and (not (hatOn)))
                (and
                    (t17Blue)
                    (not (t17Red))
                    (not (t17Green))
                    (not (t17Yellow))
                ))
            (when
                (and (not (maskOn)) (not (hatOn)))
                (and
                    (t18Blue)
                    (not (t18Red))
                    (not (t18Green))
                    (not (t18Yellow))
                ))
            (when
                (and (not (beltOn)) (not (hatOn)) (not (maskOn)))
                (and
                    (t21Blue)
                    (not (t21Red))
                    (not (t21Green))
                    (not (t21Yellow))
                ))
            (when
                (and (not (beltOn)) (not (hatOn)))
                (and
                    (t22Blue)
                    (not (t22Red))
                    (not (t22Green))
                    (not (t22Yellow))
                ))
            (when
                (and (not (beltOn)) (not (hatOn)) (not (eyesOn)))
                (and
                    (t23Blue)
                    (not (t23Red))
                    (not (t23Green))
                    (not (t23Yellow))
                ))
            (when
                (and (not (beltOn)) (not (hatOn)) (not (maskOn)))
                (and
                    (t24Blue)
                    (not (t24Red))
                    (not (t24Green))
                    (not (t24Yellow))
                ))
            (when
                (and (not (beltOn)) (not (hatOn)) (not (maskOn)))
                (and
                    (t25Blue)
                    (not (t25Red))
                    (not (t25Green))
                    (not (t25Yellow))
                ))
            (when
                (and (not (beltOn)) (not (hatOn)) (not (eyesOn)))
                (and
                    (t26Blue)
                    (not (t26Red))
                    (not (t26Green))
                    (not (t26Yellow))
                ))
            (when
                (and (not (beltOn)) (not (hatOn)))
                (and
                    (t27Blue)
                    (not (t27Red))
                    (not (t27Green))
                    (not (t27Yellow))
                ))
            (when
                (and (not (beltOn)) (not (hatOn)) (not (maskOn)))
                (and
                    (t28Blue)
                    (not (t28Red))
                    (not (t28Green))
                    (not (t28Yellow))
                ))
            (when
                (and (not (beltOn)) (not (maskOn)))
                (and
                    (t31Blue)
                    (not (t31Red))
                    (not (t31Green))
                    (not (t31Yellow))
                ))
            (when
                (and (not (beltOn)) (not (maskOn)))
                (and
                    (t32Blue)
                    (not (t32Red))
                    (not (t32Green))
                    (not (t32Yellow))
                ))
            (when
                (and (not (beltOn)) (not (eyesOn)))
                (and
                    (t33Blue)
                    (not (t33Red))
                    (not (t33Green))
                    (not (t33Yellow))
                ))
            (when
                (and (not (beltOn)))
                (and
                    (t34Blue)
                    (not (t34Red))
                    (not (t34Green))
                    (not (t34Yellow))
                ))
            (when
                (and (not (beltOn)))
                (and
                    (t35Blue)
                    (not (t35Red))
                    (not (t35Green))
                    (not (t35Yellow))
                ))
            (when
                (and (not (beltOn)) (not (eyesOn)))
                (and
                    (t36Blue)
                    (not (t36Red))
                    (not (t36Green))
                    (not (t36Yellow))
                ))
            (when
                (and (not (beltOn)) (not (maskOn)))
                (and
                    (t37Blue)
                    (not (t37Red))
                    (not (t37Green))
                    (not (t37Yellow))
                ))
            (when
                (and (not (beltOn)) (not (maskOn)))
                (and
                    (t38Blue)
                    (not (t38Red))
                    (not (t38Green))
                    (not (t38Yellow))
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
                (and (not (maskOn)) (not (hatOn)))
                (and
                    (t11Yellow)
                    (not (t11Blue))
                    (not (t11Red))
                    (not (t11Green))
                ))
            (when
                (and (not (hatOn)))
                (and
                    (t12Yellow)
                    (not (t12Blue))
                    (not (t12Red))
                    (not (t12Green))
                ))
            (when
                (and (not (hatOn)))
                (and
                    (t13Yellow)
                    (not (t13Blue))
                    (not (t13Red))
                    (not (t13Green))
                ))
            (when
                (and (not (hatOn)))
                (and
                    (t14Yellow)
                    (not (t14Blue))
                    (not (t14Blue))
                    (not (t14Green))
                ))
            (when
                (and (not (hatOn)))
                (and
                    (t15Yellow)
                    (not (t15Blue))
                    (not (t15Red))
                    (not (t15Green))
                ))
            (when
                (and (not (hatOn)))
                (and
                    (t16Yellow)
                    (not (t16Blue))
                    (not (t16Red))
                    (not (t16Green))
                ))
            (when
                (and (not (hatOn)))
                (and
                    (t17Yellow)
                    (not (t17Blue))
                    (not (t17Red))
                    (not (t17Green))
                ))
            (when
                (and (not (maskOn)) (not (hatOn)))
                (and
                    (t18Yellow)
                    (not (t18Blue))
                    (not (t18Red))
                    (not (t18Green))
                ))
            (when
                (and (not (beltOn)) (not (hatOn)) (not (maskOn)))
                (and
                    (t21Yellow)
                    (not (t21Blue))
                    (not (t21Red))
                    (not (t21Green))
                ))
            (when
                (and (not (beltOn)) (not (hatOn)))
                (and
                    (t22Yellow)
                    (not (t22Blue))
                    (not (t22Red))
                    (not (t22Green))
                ))
            (when
                (and (not (beltOn)) (not (hatOn)) (not (eyesOn)))
                (and
                    (t23Yellow)
                    (not (t23Blue))
                    (not (t23Red))
                    (not (t23Green))
                ))
            (when
                (and (not (beltOn)) (not (hatOn)) (not (maskOn)))
                (and
                    (t24Yellow)
                    (not (t24Blue))
                    (not (t24Red))
                    (not (t24Green))
                ))
            (when
                (and (not (beltOn)) (not (hatOn)) (not (maskOn)))
                (and
                    (t25Yellow)
                    (not (t25Blue))
                    (not (t25Red))
                    (not (t25Green))
                ))
            (when
                (and (not (beltOn)) (not (hatOn)) (not (eyesOn)))
                (and
                    (t26Yellow)
                    (not (t26Blue))
                    (not (t26Red))
                    (not (t26Green))
                ))
            (when
                (and (not (beltOn)) (not (hatOn)))
                (and
                    (t27Yellow)
                    (not (t27Blue))
                    (not (t27Red))
                    (not (t27Green))
                ))
            (when
                (and (not (beltOn)) (not (hatOn)) (not (maskOn)))
                (and
                    (t28Yellow)
                    (not (t28Blue))
                    (not (t28Red))
                    (not (t28Green))
                ))
            (when
                (and (not (beltOn)) (not (maskOn)))
                (and
                    (t31Yellow)
                    (not (t31Blue))
                    (not (t31Red))
                    (not (t31Green))
                ))
            (when
                (and (not (beltOn)) (not (maskOn)))
                (and
                    (t32Yellow)
                    (not (t32Blue))
                    (not (t32Red))
                    (not (t32Green))
                ))
            (when
                (and (not (beltOn)) (not (eyesOn)))
                (and
                    (t33Yellow)
                    (not (t33Blue))
                    (not (t33Red))
                    (not (t33Green))
                ))
            (when
                (and (not (beltOn)))
                (and
                    (t34Yellow)
                    (not (t34Blue))
                    (not (t34Red))
                    (not (t34Green))
                ))
            (when
                (and (not (beltOn)))
                (and
                    (t35Yellow)
                    (not (t35Blue))
                    (not (t35Red))
                    (not (t35Green))
                ))
            (when
                (and (not (beltOn)) (not (eyesOn)))
                (and
                    (t36Yellow)
                    (not (t36Blue))
                    (not (t36Red))
                    (not (t36Green))
                ))
            (when
                (and (not (beltOn)) (not (maskOn)))
                (and
                    (t37Yellow)
                    (not (t37Blue))
                    (not (t37Red))
                    (not (t37Green))
                ))
            (when
                (and (not (beltOn)) (not (maskOn)))
                (and
                    (t38Yellow)
                    (not (t38Blue))
                    (not (t38Red))
                    (not (t38Green))
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