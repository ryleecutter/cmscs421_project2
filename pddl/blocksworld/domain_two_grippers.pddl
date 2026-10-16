
(define (domain blocks-two-grippers)
  (:requirements :strips :typing)
  (:types
    block gripper
  )

  (:predicates
    (on ?x - block ?y - block)
    (ontable ?x - block)
    (clear ?x - block)

    (free ?g - gripper)
    (holding ?g - gripper ?x - block)

  )

  (:action pickup
    :parameters (?g - gripper ?b - block)
    :precondition (and (free ?g) (clear ?b) (ontable ?b))
    :effect (and
      (holding ?g ?b)
      (not (free ?g))
      (not (clear ?b))
      (not (ontable ?b))
    )
  )
  (:action putdown
    :parameters (?g - gripper ?b - block)
    :precondition (holding ?g ?b)
    :effect (and
      (ontable ?b)
      (not (holding ?g ?b))
      (clear ?b)
      (free ?g)
    )
  )
  (:action stack
    :parameters (?g - gripper ?b - block ?b1 - block)
    :precondition (and (clear ?b1) (holding ?g ?b))
    :effect (and
      (not (clear ?b1))
      (not (holding ?g ?b))
      (free ?g)
      (on ?b ?b1)
      (clear ?b)
    )
  )
  (:action unstack
    :parameters (?g - gripper ?b - block ?b1 - block)
    :precondition (and (on ?b ?b1) (free ?g) (clear ?b))
    :effect (and
      (not (on ?b ?b1))
      (not (free ?g))
      (holding ?g ?b)
      (clear ?b1)
      (not (clear ?b))
    )
  )

)