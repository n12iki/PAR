;Header and description
;written by Nikita Belooussov
(define (domain wumpusWorld)

;remove requirements that are not needed
(:requirements :strips :adl :typing)

(:types agent
        wumpus
        pit gold - items
        x y - coord
        tile
)

; un-comment following line if constants are needed
;(:constants )

(:predicates ;todo: define predicates here
    (at ?agent - agent ?tile - tile)
    (atW ?wumpus - wumpus ?tile - tile)
    (atP ?pit - pit ?tile - tile)
    (atG ?gold - gold ?tile - tile)
    (canShoot ?agent - agent)
    (adjecnt ?tile1 - tile ?tile2 - tile)
    (aliveW ?wumpus - wumpus)
)

(:action move
    :parameters (?agent - agent ?tileA - tile
                 ?wumpus - wumpus ?tileW -tile
                 ?pit - pit ?tileP -tile
                 ?from-tile - tile ?to-tile - tile)
    :precondition (and 
                    (at ?agent ?from-tile)
                    (atW ?wumpus ?tileW)
                    (atP ?pit ?tileP)
                    (adjecnt ?from-tile ?to-tile)
                    (or(not(atW ?wumpus ?to-tile))(not(aliveW ?wumpus)))
                    (not(atP ?pit ?to-tile))
                    )
    :effect 
        (and (at ?agent ?to-tile)
                (not (at ?agent ?from-tile))
        )

)

(:action shoot
    :parameters (?agent - agent ?tileA - tile
                 ?wumpus - wumpus ?tileW -tile
                 ?from-tile - tile ?to-tile - tile)
    :precondition (and 
                    (at ?agent ?from-tile)
                    (atW ?wumpus ?tileW)
                    (adjecnt ?from-tile ?to-tile)
                    (atw ?wumpus ?to-tile)
                    (canShoot ?agent)
                )
    :effect 
        (and(not (canShoot ?agent))
            (not(aliveW ?wumpus))
        )
)
)