(define (problem plane-travel-problem-3-dino)
  (:domain zeno-travel-dino)

  (:objects
    kobuki - robot
    box1 box2 box3 box4 - box
    lab office warehouse - place
  )

  (:init
    (at-robot kobuki lab)
    (free kobuki)

    (at-box box1 warehouse)
    (at-box box2 warehouse)
    (at-box box3 warehouse)
    (at-box box4 warehouse)

    (connected lab warehouse)
    (connected lab office)
    (connected office lab)
    (connected office warehouse)
    (connected warehouse lab)
    (connected warehouse office)
  )

  (:goal
    (and
      (at-box box1 lab)
      (at-box box2 lab)
      (at-box box3 lab)
      (at-box box4 office)
      (at-robot kobuki lab)
    )
  )
)
