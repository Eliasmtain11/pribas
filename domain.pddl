(define (domain zeno-travel-dino)
  (:requirements :strips :typing)

  (:types
    box robot place
  )

  (:predicates
    (at-box ?b - box ?p - place)
    (at-robot ?r - robot ?p - place)
    (in ?b - box ?r - robot)
    (free ?r - robot)
    (not_free ?r - robot)
    (connected ?from - place ?to - place)
  )

  (:action pick
    :parameters (?b - box ?r - robot ?p - place)
    :precondition (and
      (at-box ?b ?p)
      (at-robot ?r ?p)
      (free ?r)
    )
    :effect (and
      (not (at-box ?b ?p))
      (in ?b ?r)
      (not (free ?r))
      (not_free ?r)
    )
  )

  (:action drop
    :parameters (?b - box ?r - robot ?p - place)
    :precondition (and
      (in ?b ?r)
      (at-robot ?r ?p)
      (not_free ?r)
    )
    :effect (and
      (not (in ?b ?r))
      (at-box ?b ?p)
      (free ?r)
      (not (not_free ?r))
    )
  )

  (:action move
    :parameters (?r - robot ?p1 - place ?p2 - place)
    :precondition (and
      (at-robot ?r ?p1)
      (connected ?p1 ?p2)
    )
    :effect (and
      (not (at-robot ?r ?p1))
      (at-robot ?r ?p2)
    )
  )
)
