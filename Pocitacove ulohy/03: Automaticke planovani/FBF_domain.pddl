(define (domain factoryBallsForever)
    (:requirements :strips :negative-preconditions :typing :conditional-effects :equality)
    
    (:predicates
        (maskOn)
        (eyesOn)
        (beltOn)
        (hatOn)

        (t11Covered)
        (t12Covered)
        (t13Covered)
        (t14Covered)
        (t15Covered)
        (t16Covered)
        (t17Covered)
        (t18Covered)
        (t21Covered)
        (t22Covered)
        (t23Covered)
        (t24Covered)
        (t25Covered)
        (t26Covered)
        (t27Covered)
        (t28Covered)
        (t31Covered)
        (t32Covered)
        (t33Covered)
        (t34Covered)
        (t35Covered)
        (t36Covered)
        (t37Covered)
        (t38Covered)
        (t41Covered)
        (t42Covered)
        (t43Covered)
        (t44Covered)
        (t45Covered)
        (t46Covered)
        (t47Covered)
        (t48Covered)

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

            (t11Covered) (t18Covered)
            (t21Covered) (t24Covered) (t25Covered) (t28Covered)
            (t31Covered) (t32Covered) (t37Covered) (t38Covered)
        )
    )

    (:action putOffMask
        :parameters ()
        :precondition (and
            (maskOn)
        )
        :effect (and
            (not (maskOn))

            (when
                (and (not (hatOn)))
                (not (t11Covered)))
            (when
                (and (not (hatOn)))
                (not (t18Covered)))
            (when
                (and (not (hatOn)) (not (beltOn)))
                (not (t21Covered)))
            (when
                (and (not (hatOn)) (not (hatOn)))
                (not (t24Covered)))
            (when
                (and (not (hatOn)) (not (hatOn)))
                (not (t25Covered)))
            (when
                (and (not (hatOn)) (not (hatOn)))
                (not (t28Covered)))
            (when
                (and (not (beltOn)))
                (not (t31Covered)))
            (when
                (and (not (beltOn)))
                (not (t32Covered)))
            (when
                (and (not (beltOn)))
                (not (t37Covered)))
            (when
                (and (not (beltOn)))
                (not (t38Covered)))
        )
    )

    (:action putOnBelt
        :parameters ()
        :precondition (and
            (not (hatOn))
        )
        :effect (and
            (beltOn)

            (t21Covered) (t22Covered) (t23Covered) (t24Covered) (t25Covered) (t26Covered) (t27Covered) (t28Covered)
            (t31Covered) (t32Covered) (t33Covered) (t34Covered) (t35Covered) (t36Covered) (t37Covered) (t38Covered)
        )
    )

    (:action putOffBelt
        :parameters ()
        :precondition (and
            (beltOn)
        )
        :effect (and
            (not (beltOn))

            (when
                (and (not (hatOn)) (not (maskOn)))
                (not (t21Covered)))
            (when
                (and (not (hatOn)))
                (not (t22Covered)))
            (when
                (and (not (hatOn)) (not (eyesOn)))
                (not (t23Covered)))
            (when
                (and (not (hatOn)) (not (maskOn)))
                (not (t24Covered)))
            (when
                (and (not (hatOn)) (not (maskOn)))
                (not (t25Covered)))
            (when
                (and (not (hatOn)) (not (eyesOn)))
                (not (t26Covered)))
            (when
                (and (not (hatOn)))
                (not (t27Covered)))
            (when
                (and (not (hatOn)) (not (maskOn)))
                (not (t28Covered)))
            (when
                (and (not (maskOn)))
                (not (t31Covered)))
            (when
                (and (not (maskOn)))
                (not (t32Covered)))
            (when
                (and (not (eyesOn)))
                (not (t33Covered)))
            (not (t34Covered))
            (not (t35Covered))
            (when
                (and (not (eyesOn)))
                (not (t36Covered)))
            (when
                (and (not (maskOn)))
                (not (t37Covered)))
            (when
                (and (not (maskOn)))
                (not (t38Covered)))
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
                ))
            (when
                (and (not (hatOn)))
                (and
                    (t12Red)
                    (not (t12Green))
                    (not (t12BLue))
                ))
            (when
                (and (not (hatOn)))
                (and
                    (t13Red)
                    (not (t13Green))
                    (not (t13BLue))
                ))
            (when
                (and (not (hatOn)))
                (and
                    (t14Red)
                    (not (t14Green))
                    (not (t14BLue))
                ))
            (when
                (and (not (hatOn)))
                (and
                    (t15Red)
                    (not (t15Green))
                    (not (t15BLue))
                ))
            (when
                (and (not (hatOn)))
                (and
                    (t16Red)
                    (not (t16Green))
                    (not (t16BLue))
                ))
            (when
                (and (not (hatOn)))
                (and
                    (t17Red)
                    (not (t17Green))
                    (not (t17BLue))
                ))
            (when
                (and (not (maskOn)) (not (hatOn)))
                (and
                    (t18Red)
                    (not (t18Green))
                    (not (t18BLue))
                ))
            (when
                (and (not (beltOn)) (not (hatOn)) (not (maskOn)))
                (and
                    (t21Red)
                    (not (t21Green))
                    (not (t21BLue))
                ))
            (when
                (and (not (beltOn)) (not (hatOn)))
                (and
                    (t22Red)
                    (not (t22Green))
                    (not (t22BLue))
                ))
            (when
                (and (not (beltOn)) (not (hatOn)) (not (eyesOn)))
                (and
                    (t23Red)
                    (not (t23Green))
                    (not (t23BLue))
                ))
            (when
                (and (not (beltOn)) (not (hatOn)) (not (maskOn)))
                (and
                    (t24Red)
                    (not (t24Green))
                    (not (t24BLue))
                ))
            (when
                (and (not (beltOn)) (not (hatOn)) (not (maskOn)))
                (and
                    (t25Red)
                    (not (t25Green))
                    (not (t25BLue))
                ))
            (when
                (and (not (beltOn)) (not (hatOn)) (not (eyesOn)))
                (and
                    (t26Red)
                    (not (t26Green))
                    (not (t26BLue))
                ))
            (when
                (and (not (beltOn)) (not (hatOn)))
                (and
                    (t27Red)
                    (not (t27Green))
                    (not (t27BLue))
                ))
            (when
                (and (not (beltOn)) (not (hatOn)) (not (maskOn)))
                (and
                    (t28Red)
                    (not (t28Green))
                    (not (t28BLue))
                ))
            (when
                (and (not (beltOn)) (not (maskOn)))
                (and
                    (t31Red)
                    (not (t31Green))
                    (not (t31BLue))
                ))
            (when
                (and (not (beltOn)) (not (maskOn)))
                (and
                    (t32Red)
                    (not (t32Green))
                    (not (t32BLue))
                ))
            (when
                (and (not (beltOn)) (not (eyesOn)))
                (and
                    (t33Red)
                    (not (t33Green))
                    (not (t33BLue))
                ))
            (when
                (and (not (beltOn)))
                (and
                    (t34Red)
                    (not (t34Green))
                    (not (t34BLue))
                ))
            (when
                (and (not (beltOn)))
                (and
                    (t35Red)
                    (not (t35Green))
                    (not (t35BLue))
                ))
            (when
                (and (not (beltOn)) (not (eyesOn)))
                (and
                    (t36Red)
                    (not (t36Green))
                    (not (t36BLue))
                ))
            (when
                (and (not (beltOn)) (not (maskOn)))
                (and
                    (t37Red)
                    (not (t37Green))
                    (not (t37BLue))
                ))
            (when
                (and (not (beltOn)) (not (maskOn)))
                (and
                    (t38Red)
                    (not (t38Green))
                    (not (t38BLue))
                ))
            (t41Red) (not (t41Blue)) (not (t41Green))
            (t42Red) (not (t42Blue)) (not (t42Green))
            (t43Red) (not (t43Blue)) (not (t43Green))
            (t44Red) (not (t44Blue)) (not (t44Green))
            (t45Red) (not (t45Blue)) (not (t45Green))
            (t46Red) (not (t46Blue)) (not (t46Green))
            (t47Red) (not (t47Blue)) (not (t47Green))
            (t48Red) (not (t48Blue)) (not (t48Green))
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
                ))
            (when
                (and (not (hatOn)))
                (and
                    (t12Green)
                    (not (t12Red))
                    (not (t12BLue))
                ))
            (when
                (and (not (hatOn)))
                (and
                    (t13Green)
                    (not (t13Red))
                    (not (t13BLue))
                ))
            (when
                (and (not (hatOn)))
                (and
                    (t14Green)
                    (not (t14Green))
                    (not (t14BLue))
                ))
            (when
                (and (not (hatOn)))
                (and
                    (t15Green)
                    (not (t15Red))
                    (not (t15BLue))
                ))
            (when
                (and (not (hatOn)))
                (and
                    (t16Green)
                    (not (t16Red))
                    (not (t16BLue))
                ))
            (when
                (and (not (hatOn)))
                (and
                    (t17Green)
                    (not (t17Red))
                    (not (t17BLue))
                ))
            (when
                (and (not (maskOn)) (not (hatOn)))
                (and
                    (t18Green)
                    (not (t18Red))
                    (not (t18BLue))
                ))
            (when
                (and (not (beltOn)) (not (hatOn)) (not (maskOn)))
                (and
                    (t21Green)
                    (not (t21Red))
                    (not (t21BLue))
                ))
            (when
                (and (not (beltOn)) (not (hatOn)))
                (and
                    (t22Green)
                    (not (t22Red))
                    (not (t22BLue))
                ))
            (when
                (and (not (beltOn)) (not (hatOn)) (not (eyesOn)))
                (and
                    (t23Green)
                    (not (t23Red))
                    (not (t23BLue))
                ))
            (when
                (and (not (beltOn)) (not (hatOn)) (not (maskOn)))
                (and
                    (t24Green)
                    (not (t24Red))
                    (not (t24BLue))
                ))
            (when
                (and (not (beltOn)) (not (hatOn)) (not (maskOn)))
                (and
                    (t25Green)
                    (not (t25Red))
                    (not (t25BLue))
                ))
            (when
                (and (not (beltOn)) (not (hatOn)) (not (eyesOn)))
                (and
                    (t26Green)
                    (not (t26Red))
                    (not (t26BLue))
                ))
            (when
                (and (not (beltOn)) (not (hatOn)))
                (and
                    (t27Green)
                    (not (t27Red))
                    (not (t27BLue))
                ))
            (when
                (and (not (beltOn)) (not (hatOn)) (not (maskOn)))
                (and
                    (t28Green)
                    (not (t28Red))
                    (not (t28BLue))
                ))
            (when
                (and (not (beltOn)) (not (maskOn)))
                (and
                    (t31Green)
                    (not (t31Red))
                    (not (t31BLue))
                ))
            (when
                (and (not (beltOn)) (not (maskOn)))
                (and
                    (t32Green)
                    (not (t32Red))
                    (not (t32BLue))
                ))
            (when
                (and (not (beltOn)) (not (eyesOn)))
                (and
                    (t33Green)
                    (not (t33Red))
                    (not (t33BLue))
                ))
            (when
                (and (not (beltOn)))
                (and
                    (t34Green)
                    (not (t34Red))
                    (not (t34BLue))
                ))
            (when
                (and (not (beltOn)))
                (and
                    (t35Green)
                    (not (t35Red))
                    (not (t35BLue))
                ))
            (when
                (and (not (beltOn)) (not (eyesOn)))
                (and
                    (t36Green)
                    (not (t36Red))
                    (not (t36BLue))
                ))
            (when
                (and (not (beltOn)) (not (maskOn)))
                (and
                    (t37Green)
                    (not (t37Red))
                    (not (t37BLue))
                ))
            (when
                (and (not (beltOn)) (not (maskOn)))
                (and
                    (t38Green)
                    (not (t38Red))
                    (not (t38BLue))
                ))
            (t41Green) (not (t41Red)) (not (t41Blue))
            (t42Green) (not (t42Red)) (not (t42Blue))
            (t43Green) (not (t43Red)) (not (t43Blue))
            (t44Green) (not (t44Red)) (not (t44Blue))
            (t45Green) (not (t45Red)) (not (t45Blue))
            (t46Green) (not (t46Red)) (not (t46Blue))
            (t47Green) (not (t47Red)) (not (t47Blue))
            (t48Green) (not (t48Red)) (not (t48Blue))
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
                ))
            (when
                (and (not (hatOn)))
                (and
                    (t12Blue)
                    (not (t12Red))
                    (not (t12Green))
                ))
            (when
                (and (not (hatOn)))
                (and
                    (t13Blue)
                    (not (t13Red))
                    (not (t13Green))
                ))
            (when
                (and (not (hatOn)))
                (and
                    (t14Blue)
                    (not (t14Blue))
                    (not (t14Green))
                ))
            (when
                (and (not (hatOn)))
                (and
                    (t15Blue)
                    (not (t15Red))
                    (not (t15Green))
                ))
            (when
                (and (not (hatOn)))
                (and
                    (t16Blue)
                    (not (t16Red))
                    (not (t16Green))
                ))
            (when
                (and (not (hatOn)))
                (and
                    (t17Blue)
                    (not (t17Red))
                    (not (t17Green))
                ))
            (when
                (and (not (maskOn)) (not (hatOn)))
                (and
                    (t18Blue)
                    (not (t18Red))
                    (not (t18Green))
                ))
            (when
                (and (not (beltOn)) (not (hatOn)) (not (maskOn)))
                (and
                    (t21Blue)
                    (not (t21Red))
                    (not (t21Green))
                ))
            (when
                (and (not (beltOn)) (not (hatOn)))
                (and
                    (t22Blue)
                    (not (t22Red))
                    (not (t22Green))
                ))
            (when
                (and (not (beltOn)) (not (hatOn)) (not (eyesOn)))
                (and
                    (t23Blue)
                    (not (t23Red))
                    (not (t23Green))
                ))
            (when
                (and (not (beltOn)) (not (hatOn)) (not (maskOn)))
                (and
                    (t24Blue)
                    (not (t24Red))
                    (not (t24Green))
                ))
            (when
                (and (not (beltOn)) (not (hatOn)) (not (maskOn)))
                (and
                    (t25Blue)
                    (not (t25Red))
                    (not (t25Green))
                ))
            (when
                (and (not (beltOn)) (not (hatOn)) (not (eyesOn)))
                (and
                    (t26Blue)
                    (not (t26Red))
                    (not (t26Green))
                ))
            (when
                (and (not (beltOn)) (not (hatOn)))
                (and
                    (t27Blue)
                    (not (t27Red))
                    (not (t27Green))
                ))
            (when
                (and (not (beltOn)) (not (hatOn)) (not (maskOn)))
                (and
                    (t28Blue)
                    (not (t28Red))
                    (not (t28Green))
                ))
            (when
                (and (not (beltOn)) (not (maskOn)))
                (and
                    (t31Blue)
                    (not (t31Red))
                    (not (t31Green))
                ))
            (when
                (and (not (beltOn)) (not (maskOn)))
                (and
                    (t32Blue)
                    (not (t32Red))
                    (not (t32Green))
                ))
            (when
                (and (not (beltOn)) (not (eyesOn)))
                (and
                    (t33Blue)
                    (not (t33Red))
                    (not (t33Green))
                ))
            (when
                (and (not (beltOn)))
                (and
                    (t34Blue)
                    (not (t34Red))
                    (not (t34Green))
                ))
            (when
                (and (not (beltOn)))
                (and
                    (t35Blue)
                    (not (t35Red))
                    (not (t35Green))
                ))
            (when
                (and (not (beltOn)) (not (eyesOn)))
                (and
                    (t36Blue)
                    (not (t36Red))
                    (not (t36Green))
                ))
            (when
                (and (not (beltOn)) (not (maskOn)))
                (and
                    (t37Blue)
                    (not (t37Red))
                    (not (t37Green))
                ))
            (when
                (and (not (beltOn)) (not (maskOn)))
                (and
                    (t38Blue)
                    (not (t38Red))
                    (not (t38Green))
                ))
            (t41Blue) (not (t41Red)) (not (t41Green))
            (t42Blue) (not (t42Red)) (not (t42Green))
            (t43Blue) (not (t43Red)) (not (t43Green))
            (t44Blue) (not (t44Red)) (not (t44Green))
            (t45Blue) (not (t45Red)) (not (t45Green))
            (t46Blue) (not (t46Red)) (not (t46Green))
            (t47Blue) (not (t47Red)) (not (t47Green))
            (t48Blue) (not (t48Red)) (not (t48Green))
        )
    )
)