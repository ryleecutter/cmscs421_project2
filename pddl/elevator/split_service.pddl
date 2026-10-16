
(define (problem elevator-split-service-problem)
  (:domain elevator-split-service)
  (:objects
    even odd - elevator
    p1 p2 - passenger
    f0 f1 f2 f3 f4 f5 f6 - floor
  )

  (:init
    (passenger-at p1 f2)
    (passenger-at p2 f5)
    (lift-at even f2)
    (lift-at odd f5)
    (link even f0 f2)
    (link even f2 f0)
    (link even f4 f2)
    (link even f2 f4)
    (link even f4 f6)
    (link even f6 f4)
    (link odd f0 f1)
    (link odd f1 f0)
    (link odd f3 f1)
    (link odd f1 f3)
    (link odd f3 f5)
    (link odd f5 f3)

  )

  (:goal
    (and
      (passenger-at p1 f3)
      (passenger-at p2 f4)
    )
  )
)