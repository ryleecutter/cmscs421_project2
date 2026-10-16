

(define (domain elevator-split-service)
  (:requirements :strips :typing)
  (:types
    elevator passenger floor
  )

  (:predicates
    (lift-at ?e - elevator ?f - floor)
    (passenger-at ?p - passenger ?f - floor)
    (boarded ?p - passenger ?e - elevator)
    (link ?e - elevator ?from - floor ?to - floor)

  )

  (:action move
    :parameters (?cf - floor ?nf - floor ?e - elevator ?p - passenger)
    :precondition (and
      (lift-at ?e ?cf)
      (link ?e ?cf ?nf)
      (boarded ?p ?e)
    )
    :effect (and
      (not (lift-at ?e ?cf))
      (lift-at ?e ?nf)
    )
  )
  (:action board
    :parameters (?f - floor ?e - elevator ?p - passenger)
    :precondition (and
      (lift-at ?e ?f)
      (passenger-at ?p ?f)
    )
    :effect (and
      (not (passenger-at ?p ?f))
      (boarded ?p ?e)
    )
  )
  (:action leave
    :parameters (?f - floor ?e - elevator ?p - passenger)
    :precondition (and
      (lift-at ?e ?f)
      (boarded ?p ?e)
    )
    :effect (and
      (not (boarded ?p ?e))
      (passenger-at ?p ?f)
    )
  )

)