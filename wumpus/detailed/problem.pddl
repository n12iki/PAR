;writeen by Nikita Belooussov
(define (problem wumpusProb) (:domain wumpusWorld)
(:objects  character - agent
           beast - wumpus
           hole - pit
           money - gold
           one two three - x
           oneY twoY - y
)

(:init
    (at character oneY one)
    (atW beast twoY three)
    (atP hole oneY two)
    (atG money oneY three)
    (canShoot character)
    (aliveW beast)

    (one-greater-than two one)
    (one-greater-than three two)
    (one-greater-than twoY oneY)
)

(:goal (at character oneY three))
)
