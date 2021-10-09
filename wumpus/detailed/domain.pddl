;Header and description
;Written by Nikita Belooussov
(define (domain wumpusWorld)

;remove requirements that are not needed
(:requirements :strips :adl :typing)

(:types agent
        wumpus
        pit gold - items
        x y - coord
         ;todo: enumerate types and their hierarchy here, e.g. car truck bus - vehicle
)

; un-comment following line if constants are needed
;(:constants )

(:predicates ;todo: define predicates here
    (one-greater-than ?s1 - coord ?s2 - coord) ;number value is one greater than the other one
    (at ?agent - agent ?row - y ?col - x) ;places character
    (atW ?wumpus - wumpus ?row - y ?col - x) ;place wumpus
    (atP ?pit - pit ?row - y ?col - x)  ;place pit
    (atG ?gold - gold ?row - y ?col - x) ;place gold
    (canShoot ?agent - agent)  ;character can shoot
    (aliveW ?wumpus - wumpus);wumpus has not been shot
)

(:action move-left
    :parameters (?agent - agent ?rowA - y ?from-col - x ;gets agent cordinates
                 ?wumpus - wumpus ?rowW - y ?colW - x ;gets wumpus coridnates
                 ?pit - pit ?rowP - y ?colP - x ;gets pit cordinates
                 ?to-col - x ;from where the agent is going to where
                 ) ;from where the agent is going to where
    :precondition (and 
                    (at ?agent ?rowA ?from-col)
                    (atP ?pit ?rowP ?colP)
                    (atW ?wumpus ?rowW ?colW)
                    (one-greater-than ?from-col ?to-col)
                    (or(not(atW ?wumpus ?rowA ?to-col))(not(aliveW ?wumpus)))
                    (not(atP ?pit ?rowA ?to-col))
                )
    :effect (and
        (at ?agent ?rowA ?to-col)
        (not(at ?agent ?rowA ?from-col))
    )

)

(:action move-right
    :parameters (?agent - agent ?rowA - y ?from-col - x ;gets agent cordinates
                 ?wumpus - wumpus ?rowW - y ?colW - x ;gets wumpus coridnates
                 ?pit - pit ?rowP - y ?colP - x ;gets pit cordinates
                 ?to-col - x ;from where the agent is going to where
                 ) ;from where the agent is going to where
    :precondition (and 
                    (at ?agent ?rowA ?from-col)
                    (atP ?pit ?rowP ?colP)
                    (atW ?wumpus ?rowW ?colW)
                    (one-greater-than ?to-col ?from-col)
                    (or(not(atW ?wumpus ?rowA ?to-col))(not(aliveW ?wumpus)))
                    (not(atP ?pit ?rowA ?to-col))
                )
    :effect (and
        (at ?agent ?rowA ?to-col)
        (not(at ?agent ?rowA ?from-col))
    )

)

(:action move-down
    :parameters (?agent - agent ?from-row - y ?colA - x ;gets agent cordinates
                 ?wumpus - wumpus ?rowW - y ?colW - x ;gets wumpus coridnates
                 ?pit - pit ?rowP - y ?colP - x ;gets pit cordinates
                 ?to-row - y ;from where the agent is going to where
                 ) ;from where the agent is going to where
    :precondition (and 
                    (at ?agent ?from-row ?colA)
                    (atP ?pit ?rowP ?colP)
                    (atW ?wumpus ?rowW ?colW)
                    (one-greater-than ?to-row ?from-row )
                    (or(not(atW ?wumpus ?to-row ?colA))(not(aliveW ?wumpus)))
                    (not(atP ?pit ?to-row ?colA))
                )
    :effect (and
        (at ?agent ?to-row ?colA)
        (not(at ?agent ?from-row ?colA))
    )

)


(:action move-up
    :parameters (?agent - agent ?from-row - y ?colA - x ;gets agent cordinates
                 ?wumpus - wumpus ?rowW - y ?colW - x ;gets wumpus coridnates
                 ?pit - pit ?rowP - y ?colP - x ;gets pit cordinates
                 ?to-row - y ;from where the agent is going to where
                 ) ;from where the agent is going to where
    :precondition (and 
                    (at ?agent ?from-row ?colA)
                    (atP ?pit ?rowP ?colP)
                    (atW ?wumpus ?rowW ?colW)
                    (one-greater-than  ?from-row ?to-row)
                    (or(not(atW ?wumpus ?to-row ?colA))(not(aliveW ?wumpus)))
                    (not(atP ?pit ?to-row ?colA))
                )
    :effect (and
        (at ?agent ?to-row ?colA)
        (not(at ?agent ?from-row ?colA))
    )

)



(:action shoot-left
    :parameters (?agent - agent ?rowA - y ?from-col - x
                 ?to-col - x
                 ?wumpus - wumpus ?rowW - y ?colW - x
                 )
                 
    :precondition (and 
                    (at ?agent ?rowA ?from-col)
                    (atW ?wumpus ?rowW ?colW)
                    (one-greater-than ?from-col ?to-col)
                    (atW ?wumpus ?rowA ?to-col)
                    (canShoot ?agent))
    :effect (and 
             (not (canShoot ?agent))
             (not(aliveW ?wumpus))
        )

)


(:action shoot-right
    :parameters (?agent - agent ?rowA - y ?from-col - x
                 ?to-col - x
                 ?wumpus - wumpus ?rowW - y ?colW - x
                 )
                 
    :precondition (and 
                    (at ?agent ?rowA ?from-col)
                    (atW ?wumpus ?rowW ?colW)
                    (one-greater-than  ?to-col ?from-col)
                    (atW ?wumpus ?rowA ?to-col)
                    (canShoot ?agent))
    :effect (and 
             (not (canShoot ?agent))
             (not(aliveW ?wumpus))
        )

)

(:action shoot-up
    :parameters (?agent - agent ?from-row - y ?colA - x
                 ?to-row - y
                 ?wumpus - wumpus ?rowW - y ?colW - x
                 )
                 
    :precondition (and 
                    (at ?agent ?from-row ?colA)
                    (atW ?wumpus ?rowW ?colW)
                    (one-greater-than  ?from-row ?to-row )
                    (atW ?wumpus ?to-row ?colA)
                    (canShoot ?agent))
    :effect (and 
             (not (canShoot ?agent))
             (not(aliveW ?wumpus))
        )

)

(:action shoot-down
    :parameters (?agent - agent ?from-row - y ?colA - x
                 ?to-row - y
                 ?wumpus - wumpus ?rowW - y ?colW - x
                 )
                 
    :precondition (and 
                    (at ?agent ?from-row ?colA)
                    (atW ?wumpus ?rowW ?colW)
                    (one-greater-than   ?to-row ?from-row)
                    (atW ?wumpus ?to-row ?colA)
                    (canShoot ?agent)
                    )
    :effect (and 
             (not (canShoot ?agent))
             (not(aliveW ?wumpus))
        )

)

)