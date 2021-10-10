;Written by Nikita Belooussov

(define (domain wumpusWorld)

;remove requirements that are not needed
(:requirements :strips :adl :typing)
(:types
    room ;todo: enumerate types and their hierarchy here, e.g. car truck bus - vehicle
)

(:predicates ;todo: define predicates here
    (adjecent ?room1 - room ?room2 -room)
    (hasChar ?room - room)
    (hasGoldRoom ?room -room)
    (hasGold) 
    (hasWumpus ?room - room)
    (hasPit ?room - room)
    (hasArrow)
)

(:action pass
    :parameters (?room1 - room
                 ?room2 -room)
    :precondition (and
                    (adjecent ?room1 ?room2)
                    (hasChar ?room1)
                    (not(hasWumpus ?room2))
                    (not(hasPit ?room2))
                    )
    :effect (and
                (hasChar ?room2) 
                (not(hasChar ?room1))
                )
)

(:action shoot
    :parameters (?room1 - room
                 ?room2 -room)
    :precondition (and
                    (adjecent ?room1 ?room2)
                    (hasChar ?room1)
                    )
    :effect (and
                (not(hasWumpus ?room2))
                (not(hasArrow)))
)

(:action pickUp
    :parameters (?room1 - room)
    :precondition (and
                    (hasChar ?room1)
                    (hasGoldRoom ?room1)
                    )

    :effect (and
                (not(hasGoldRoom ?room1))
                (hasGold)
            )
)


)