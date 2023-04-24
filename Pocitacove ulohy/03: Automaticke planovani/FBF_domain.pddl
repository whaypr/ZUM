(define (domain factoryBallsForever)
    (:requirements :strips :negative-preconditions :typing :conditional-effects :equality :fluents)

    (:types
        color
    )

    (:predicates
        (maskOn)
        (eyesOn)
        (beltOn)
        (hatOn)

        (t11Color ?c - color)
        (t12Color ?c - color)
        (t13Color ?c - color)
        (t14Color ?c - color)
        (t15Color ?c - color)
        (t16Color ?c - color)
        (t17Color ?c - color)
        (t18Color ?c - color)
        (t21Color ?c - color)
        (t22Color ?c - color)
        (t23Color ?c - color)
        (t24Color ?c - color)
        (t25Color ?c - color)
        (t26Color ?c - color)
        (t27Color ?c - color)
        (t28Color ?c - color)
        (t31Color ?c - color)
        (t32Color ?c - color)
        (t33Color ?c - color)
        (t34Color ?c - color)
        (t35Color ?c - color)
        (t36Color ?c - color)
        (t37Color ?c - color)
        (t38Color ?c - color)
        (t41Color ?c - color)
        (t42Color ?c - color)
        (t43Color ?c - color)
        (t44Color ?c - color)
        (t45Color ?c - color)
        (t46Color ?c - color)
        (t47Color ?c - color)
        (t48Color ?c - color)
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

    (:action applyColor
        :parameters (?c - color)
        :precondition (and)
        :effect (and
            (when
                (= (t11CoverCounter) 0)
                (forall
                    (?cFOR - color)
                    (and
                        (not (t11Color ?cFOR))
                        (when (= ?c ?cFOR) (t11Color ?c)))))
            (when
                (= (t12CoverCounter) 0)
                (forall
                    (?cFOR - color)
                    (and
                        (not (t12Color ?cFOR))
                        (when (= ?c ?cFOR) (t12Color ?c)))))
            (when
                (= (t13CoverCounter) 0)
                (forall
                    (?cFOR - color)
                    (and
                        (not (t13Color ?cFOR))
                        (when (= ?c ?cFOR) (t13Color ?c)))))
            (when
                (= (t14CoverCounter) 0)
                (forall
                    (?cFOR - color)
                    (and
                        (not (t14Color ?cFOR))
                        (when (= ?c ?cFOR) (t14Color ?c)))))
            (when
                (= (t15CoverCounter) 0)
                (forall
                    (?cFOR - color)
                    (and
                        (not (t15Color ?cFOR))
                        (when (= ?c ?cFOR) (t15Color ?c)))))
            (when
                (= (t16CoverCounter) 0)
                (forall
                    (?cFOR - color)
                    (and
                        (not (t16Color ?cFOR))
                        (when (= ?c ?cFOR) (t16Color ?c)))))
            (when
                (= (t17CoverCounter) 0)
                (forall
                    (?cFOR - color)
                    (and
                        (not (t17Color ?cFOR))
                        (when (= ?c ?cFOR) (t17Color ?c)))))
            (when
                (= (t18CoverCounter) 0)
                (forall
                    (?cFOR - color)
                    (and
                        (not (t18Color ?cFOR))
                        (when (= ?c ?cFOR) (t18Color ?c)))))
            (when
                (= (t21CoverCounter) 0)
                (forall
                    (?cFOR - color)
                    (and
                        (not (t21Color ?cFOR))
                        (when (= ?c ?cFOR) (t21Color ?c)))))
            (when
                (= (t22CoverCounter) 0)
                (forall
                    (?cFOR - color)
                    (and
                        (not (t22Color ?cFOR))
                        (when (= ?c ?cFOR) (t22Color ?c)))))
            (when
                (= (t23CoverCounter) 0)
                (forall
                    (?cFOR - color)
                    (and
                        (not (t23Color ?cFOR))
                        (when (= ?c ?cFOR) (t23Color ?c)))))
            (when
                (= (t24CoverCounter) 0)
                (forall
                    (?cFOR - color)
                    (and
                        (not (t24Color ?cFOR))
                        (when (= ?c ?cFOR) (t24Color ?c)))))
            (when
                (= (t25CoverCounter) 0)
                (forall
                    (?cFOR - color)
                    (and
                        (not (t25Color ?cFOR))
                        (when (= ?c ?cFOR) (t25Color ?c)))))
            (when
                (= (t26CoverCounter) 0)
                (forall
                    (?cFOR - color)
                    (and
                        (not (t26Color ?cFOR))
                        (when (= ?c ?cFOR) (t26Color ?c)))))
            (when
                (= (t27CoverCounter) 0)
                (forall
                    (?cFOR - color)
                    (and
                        (not (t27Color ?cFOR))
                        (when (= ?c ?cFOR) (t27Color ?c)))))
            (when
                (= (t28CoverCounter) 0)
                (forall
                    (?cFOR - color)
                    (and
                        (not (t28Color ?cFOR))
                        (when (= ?c ?cFOR) (t28Color ?c)))))
            (when
                (= (t31CoverCounter) 0)
                (forall
                    (?cFOR - color)
                    (and
                        (not (t31Color ?cFOR))
                        (when (= ?c ?cFOR) (t31Color ?c)))))
            (when
                (= (t32CoverCounter) 0)
                (forall
                    (?cFOR - color)
                    (and
                        (not (t32Color ?cFOR))
                        (when (= ?c ?cFOR) (t32Color ?c)))))
            (when
                (= (t33CoverCounter) 0)
                (forall
                    (?cFOR - color)
                    (and
                        (not (t33Color ?cFOR))
                        (when (= ?c ?cFOR) (t33Color ?c)))))
            (when
                (= (t34CoverCounter) 0)
                (forall
                    (?cFOR - color)
                    (and
                        (not (t34Color ?cFOR))
                        (when (= ?c ?cFOR) (t34Color ?c)))))
            (when
                (= (t35CoverCounter) 0)
                (forall
                    (?cFOR - color)
                    (and
                        (not (t35Color ?cFOR))
                        (when (= ?c ?cFOR) (t35Color ?c)))))
            (when
                (= (t36CoverCounter) 0)
                (forall
                    (?cFOR - color)
                    (and
                        (not (t36Color ?cFOR))
                        (when (= ?c ?cFOR) (t36Color ?c)))))
            (when
                (= (t37CoverCounter) 0)
                (forall
                    (?cFOR - color)
                    (and
                        (not (t37Color ?cFOR))
                        (when (= ?c ?cFOR) (t37Color ?c)))))
            (when
                (= (t38CoverCounter) 0)
                (forall
                    (?cFOR - color)
                    (and
                        (not (t38Color ?cFOR))
                        (when (= ?c ?cFOR) (t38Color ?c)))))
            (forall
                (?cFOR - color)
                (and
                    (not (t41Color ?cFOR))
                    (not (t42Color ?cFOR))
                    (not (t43Color ?cFOR))
                    (not (t44Color ?cFOR))
                    (not (t45Color ?cFOR))
                    (not (t46Color ?cFOR))
                    (not (t47Color ?cFOR))
                    (not (t48Color ?cFOR))
                    (when
                        (= ?c ?cFOR)
                        (and
                            (t41Color ?c)
                            (t42Color ?c)
                            (t43Color ?c)
                            (t44Color ?c)
                            (t45Color ?c)
                            (t46Color ?c)
                            (t47Color ?c)
                            (t48Color ?c))))
            )
        )
    )
)