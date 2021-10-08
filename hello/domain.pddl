;Header and description

(define (domain wumpusWorld)

;remove requirements that are not needed
(:requirements :strips :adl :typing)

(:types agent
        ;wumpus
        ;pit gold - items
        x y - coord
         ;todo: enumerate types and their hierarchy here, e.g. car truck bus - vehicle
)

; un-comment following line if constants are needed
;(:constants )

(:predicates ;todo: define predicates here
    (one-greater-than ?s1 - coord ?s2 - coord)
    (at ?agent - agent ?row - y ?col - x)
    ;(atW ?wumpus - wumpus ?row - y ?col - x)
    ;(atP ?pit - pit ?row - y ?col - x)
    ;(atG ?gold - gold ?row - y ?col - x)
    (canShoot ?agent - agent)
    (aliveA ?agent - agent)
    ;(aliveW ?wumpus - wumpus)
)

(:action move-left
    :parameters (?agent - agent ?rowA - y ?colA - x
                 ;?wumpus - wumpus ?rowW - y ?colW - x
                 ;?pit - pit ?rowP - y ?colP - x
                 ?from-col - x ?to-col - x)
    :precondition (and 
                    (at ?agent ?rowA ?from-col)
                    (one-greater-than ?colA ?to-col)
                    ;(not (at ?agent ?rowP ?colP))
                    ;(not (and (at ?agent ?rowW ?colW) (not(aliveW ?wumpus))))
                    (aliveA ?agent))
    :effect 
        (and (at ?agent ?rowA ?to-col)
                (not (at ?agent ?rowA ?from-col))
             ;(when (and(= ?to-col ?colW)(= ?rowA ?rowW)) (and(not(aliveA ?agent))(not(at ?agent ?rowA ?to-col))))
             ;(when (and(= ?to-col ?colW)(= ?rowP ?rowP)) (and(not(aliveA ?agent))(not(at ?agent ?rowA ?to-col))))
        )

)


(:action move-down
    :parameters (?agent - agent ?rowA - y ?colA - x
                 ;?wumpus - wumpus ?rowW - y ?colW - x
                 ;?pit - pit ?rowP - y ?colP - x
                 ?from-row - y ?to-row - y)
    :precondition (and 
                    (at ?agent ?from-row ?colA)
                    (one-greater-than ?to-row ?rowA)
                    ;(not (at ?agent ?rowP ?colP))
                    ;(not (and (at ?agent ?rowW ?colW) (not(aliveW ?wumpus))))
                    (aliveA ?agent))
    :effect (and (at ?agent ?to-row ?colA)
                (not (at ?agent ?from-row ?colA))
             ;(when (and(= ?to-row ?colW)(= ?rowA ?rowW)) (and(not(aliveA ?agent))(not(at ?agent ?to-row ?colA))))
             ;(when (and(= ?to-row ?colW)(= ?rowP ?rowP)) (and(not(aliveA ?agent))(not(at ?agent ?to-row ?colA))))
        )
)


(:action move-right
    :parameters (?agent - agent ?rowA - y ?colA - x
                 ;?wumpus - wumpus ?rowW - y ?colW - x
                 ;?pit - pit ?rowP - y ?colP - x
                 ?from-col - x ?to-col - x)
    :precondition (and 
                    (at ?agent ?rowA ?from-col)
                    (one-greater-than ?to-col ?colA)
                    ;(not (at ?agent ?rowP ?colP))
                    ;(not (and (at ?agent ?rowW ?colW) (not(aliveW ?wumpus))))
                    (aliveA ?agent))
    :effect 
        (and (at ?agent ?rowA ?to-col)
                (not (at ?agent ?rowA ?from-col))
             ;(when (and(= ?to-col ?colW)(= ?rowA ?rowW)) (and(not(aliveA ?agent))(not(at ?agent ?rowA ?to-col))))
             ;(when (and(= ?to-col ?colW)(= ?rowP ?rowP)) (and(not(aliveA ?agent))(not(at ?agent ?rowA ?to-col))))
        )

)


(:action move-up
    :parameters (?agent - agent ?rowA - y ?colA - x
                 ;?wumpus - wumpus ?rowW - y ?colW - x
                 ;?pit - pit ?rowP - y ?colP - x
                 ?from-row - y ?to-row - y)
    :precondition (and 
                    (at ?agent ?from-row ?colA)
                    (one-greater-than ?rowA ?to-row)
                    ;(not (at ?agent ?rowP ?colP))
                    ;(not (and (at ?agent ?rowW ?colW) (not(aliveW ?wumpus))))
                    (aliveA ?agent))
    :effect (and (at ?agent ?to-row ?colA)
                (not (at ?agent ?from-row ?colA))
             ;(when (and(= ?to-row ?colW)(= ?rowA ?rowW)) (and(not(aliveA ?agent))(not(at ?agent ?to-row ?colA))))
             ;(when (and(= ?to-row ?colW)(= ?rowP ?rowP)) (and(not(aliveA ?agent))(not(at ?agent ?to-row ?colA))))
        )
)



(:action shoot-left
    :parameters (?agent - agent ?rowA - y ?colA - x
                 ;?wumpus - wumpus ?rowW - y ?colW - x
                 ;?pit - pit ?rowP - y ?colP - x
                 ?from-col - x ?to-col - x)
    :precondition (and 
                    (at ?agent ?rowA ?from-col)
                    (one-greater-than ?colA ?to-col)
                    ;(not (at ?agent ?rowP ?colP))
                    ;(not (at ?agent ?rowW ?colW))
                    (aliveA ?agent)
                    (canShoot ?agent))
    :effect 
        (not (canShoot ?agent)
             ;(when(and(= ?to-col ?colW)(= ?rowA ?rowW))(and(not(aliveW ?wumpus))(not(atW ?wumpus ?rowW ?colW))))
        )

)

(:action shoot-right
    :parameters (?agent - agent ?rowA - y ?colA - x
                 ;?wumpus - wumpus ?rowW - y ?colW - x
                 ;?pit - pit ?rowP - y ?colP - x
                 ?from-col - x ?to-col - x)
    :precondition (and 
                    (at ?agent ?rowA ?from-col)
                    (one-greater-than ?to-col ?colA)
                    ;(not (at ?agent ?rowP ?colP))
                    ;(not (at ?agent ?rowW ?colW))
                    (aliveA ?agent)
                    (canShoot ?agent))
    :effect 
        ( not (canShoot ?agent)
             ;(when(and(= ?to-col ?colW)(= ?rowA ?rowW))(and(not(aliveW ?wumpus))(not(atW ?wumpus ?rowW ?colW))))
        )


)

(:action shoot-up
    :parameters (?agent - agent ?rowA - y ?colA - x
                 ;?wumpus - wumpus ?rowW - y ?colW - x
                 ;?pit - pit ?rowP - y ?colP - x
                 ?from-row - y ?to-row - y)
    :precondition (and 
                    (at ?agent ?from-row ?colA)
                    (one-greater-than ?rowA ?to-row)
                    ;(not (at ?agent ?rowP ?colP))
                    ;(not (at ?agent ?rowW ?colW))
                    (canShoot ?agent))
    :effect (not (canShoot ?agent)
             ;(when(and(= ?to-row ?rowW)(= ?colA ?colW))(and(not(aliveW ?wumpus))(not(atW ?wumpus ?rowW ?colW))))
            )   
)

(:action shoot-down
    :parameters (?agent - agent ?rowA - y ?colA - x
                 ;?wumpus - wumpus ?rowW - y ?colW - x
                 ;?pit - pit ?rowP - y ?colP - x
                 ?from-row - y ?to-row - y)
    :precondition (and 
                    (at ?agent ?from-row ?colA)
                    (one-greater-than ?to-row ?rowA)
                    ;(not (at ?agent ?rowP ?colP))
                    ;(not (at ?agent ?rowW ?colW))
                    (canShoot ?agent))
    :effect (not (canShoot ?agent)
             ;(when(and(= ?to-row ?rowW)(= ?colA ?colW))(and(not(aliveW ?wumpus))(not(atW ?wumpus ?rowW ?colW))))
            )  
)

)