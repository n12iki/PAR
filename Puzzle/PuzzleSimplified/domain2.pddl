;Written by Nikita Belooussov
(define (domain puzzle2)

;remove requirements that are not needed
(:requirements :strips :adl :typing)

(:types ;todo: enumerate types and their hierarchy here, e.g. car truck bus - vehicle
    place ;tile
    val ;number of tile
)

; un-comment following line if constants are needed
;(:constants )

(:predicates ;todo: define predicates here
    (adj ?tile1 ?tile2 - place)
    (blank ?tile - place)
    (tilVal ?val - val ?tile - place)
)

(:action move
    :parameters (?start - place ?fin - place ?val - val)
    :precondition (and 
        (blank ?fin)
        (adj ?start ?fin)
        (tilVal ?val ?start)
    )
    :effect (and 
        (not(blank ?fin))
        (not(tilVal ?val ?start))
        (tilVal ?val ?fin)
        (blank ?start)
    )
)


)