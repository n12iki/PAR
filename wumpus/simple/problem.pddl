;written by Nikita Belooussov
(define (problem wumpusProb) (:domain wumpusWorld)
(:objects  character - agent
           beast - wumpus
           hole - pit
           money - gold
           tile11 tile12 tile13 tile21 tile22 tile23 - tile
)

(:init
    (at character tile11)
    (atW beast tile22)
    (atP hole tile12)
    (atG money tile13)
    (canShoot character)
    (aliveW beast)


    (adjecnt tile11 tile12)
    (adjecnt tile11 tile21)
    (adjecnt tile12 tile11)
    (adjecnt tile12 tile13)
    (adjecnt tile12 tile22)
    (adjecnt tile13 tile12)
    (adjecnt tile13 tile23)    
    
    (adjecnt tile21 tile22)
    (adjecnt tile21 tile11)
    (adjecnt tile22 tile21)
    (adjecnt tile22 tile23)
    (adjecnt tile22 tile12)
    (adjecnt tile23 tile22)
    (adjecnt tile23 tile13)

)

(:goal (at character tile23))
)
