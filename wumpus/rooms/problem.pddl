;Written by Nikita Belooussov
(define (problem WumpusProb) (:domain wumpusWorld)
(:objects 
    tile11 tile12 tile13 tile21 tile22 tile23 - room
)

(:init
    (adjecent tile11 tile12)
    (adjecent tile11 tile21)
    (adjecent tile12 tile11)
    (adjecent tile12 tile13)
    (adjecent tile12 tile22)
    (adjecent tile13 tile12)
    (adjecent tile13 tile23)    
    
    (adjecent tile21 tile22)
    (adjecent tile21 tile11)
    (adjecent tile22 tile21)
    (adjecent tile22 tile23)
    (adjecent tile22 tile12)
    (adjecent tile23 tile22)
    (adjecent tile23 tile13)

    (hasArrow)
    (hasChar tile11)
    (hasGoldRoom tile13)
    (hasPit tile12)
    (hasWumpus tile23)
)

(:goal (and
        (hasGold)
        (hasChar tile11))
)

)
