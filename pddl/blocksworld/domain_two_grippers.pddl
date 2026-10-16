; TODO-STUDENT: UNFINISHED
; Extend standard Blocks World to exactly two explicit grippers.
; Required predicates:
;   (free ?g - gripper)
;   (holding ?g - gripper ?x - block)
; Keep on / ontable / clear.
; Implement pickup, putdown, stack, and unstack with a ?g - gripper parameter.
; Delete the TODO-STUDENT line only when the file is complete.

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

    ;couldnt i just do 1 free? and in action check precondition 
    ; same for holding. does adding another gripper make the predicates all combinations?
    (holding ?g - gripper ?x - block)

  )

  ; TODO: implement unstack.
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
    :parameters (?g -gripper ?b - block)
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
    :parameters (?g -gripper ?b - block ?b1 - block)
    :precondition (and (on ?b ?b1) (free ?g) (clear ?b))
    :effect (and 
      (not (on ?b ?b1))
      (not ())
    )
  )

)