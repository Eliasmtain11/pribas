(define (domain mini-generator)
  (:requirements :fluents :durative-actions :typing)
  (:types generator tank)

  (:predicates
    (generator-ran)
    (available ?t - tank)
    (idle ?g - generator)
  )

  (:functions
    (fuelLevel ?g - generator)
    (capacity ?g - generator)
  )

  (:durative-action generate
    :parameters (?g - generator)
    :duration (= ?duration 10)
    :condition (and
                 (at start (idle ?g))
                 (at start (>= (fuelLevel ?g) 10))
               )
    :effect (and
              (at start (not (idle ?g)))
              (at end (decrease (fuelLevel ?g) 10))
              (at end (generator-ran))
              (at end (idle ?g))
            )
  )

  (:durative-action refuel
    :parameters (?g - generator ?t - tank)
    :duration (= ?duration 2)
    :condition (and
                 (at start (idle ?g))
                 (at start (available ?t))
                 (at start (< (fuelLevel ?g) 10))   ; <- CAMBIO AQUÍ
               )
    :effect (and
              (at start (not (idle ?g)))
              (at start (not (available ?t)))
              (at end (increase (fuelLevel ?g) 10))
              (at end (available ?t))
              (at end (idle ?g))
            )
  )
)

