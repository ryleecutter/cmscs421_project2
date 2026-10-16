
(define (problem blocks-sussman-6)
  (:domain blocks)
  (:objects
    a b c d e f - block
  )

  (:init
    (on c a)
    (ontable a)
    (ontable b)
    (ontable d)
    (ontable e)
    (ontable f)
    (clear b)
    (clear c)
    (clear d)
    (clear e)
    (clear f)
    (handempty)
  )

  (:goal
    (and
      (on a b)
      (on b c)
      (on c d)
      (on d e)
      (on e f))
  )
)