
(define (problem blocks-sussman-3-two-grippers)
  (:domain blocks-two-grippers)
  (:objects
    a b c - block
    left right - gripper
  )

  (:init
    (free left)
    (free right)
    (on c a)
    (clear c)
    (clear b)
    (ontable a)
    (ontable b)

  )

  (:goal
    (and
      (on a b)
      (on b c)
    )
  )
)