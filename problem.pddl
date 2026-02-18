(define (problem mini-generator-problem)
  (:domain mini-generator)
  (:objects gen - generator tank1 - tank)
  (:init
    (= (fuelLevel gen) 5)
    (= (capacity gen) 10)
    (available tank1)
    (idle gen)
  )
  (:goal (generator-ran))
)

