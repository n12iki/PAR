;Written by Nikita Belooussov
(define (problem puzzle_game) (:domain puzzle2)
(:objects 
    t11 t12 t13 t14 t21 t22 t23 t24 t31 t32 t33 t34 t41 t42 t43 t44 - place; tiles are t and then row and col
    one two three four five six seven eight nine ten eleven twelve thirteen fourteen fifteen - val; tile number so that it is easier to change the setup and keep track of what is where

)
(:init

    ;setting up the board
    (adj t11 t12)
    (adj t11 t21)

    (adj t12 t13)
    (adj t12 t11)
    (adj t12 t22)

    (adj t13 t14)
    (adj t13 t23)
    (adj t13 t12)
    
    (adj t14 t24)
    (adj t14 t13)

    (adj t21 t22)
    (adj t21 t11)
    (adj t21 t31)

    (adj t22 t23)
    (adj t22 t32)
    (adj t22 t21)
    (adj t22 t12)

    (adj t23 t24)
    (adj t23 t33)
    (adj t23 t22)
    (adj t23 t13)

    (adj t24 t34)
    (adj t24 t14)
    (adj t24 t23)

    (adj t31 t32)
    (adj t31 t41)
    (adj t31 t21)

    
    (adj t32 t33)
    (adj t32 t42)
    (adj t32 t31)
    (adj t32 t22)

    (adj t33 t34)
    (adj t33 t32)
    (adj t33 t23)
    (adj t33 t43)

    (adj t34 t44)
    (adj t34 t33)
    (adj t34 t24)

    (adj t41 t42)
    (adj t41 t31)

    (adj t42 t43)
    (adj t42 t41)
    (adj t42 t32)

    (adj t43 t44)
    (adj t43 t42)
    (adj t43 t33)

    (adj t44 t43)
    (adj t44 t34)

    ;defining values
    (blank t11)
    (tilVal one t12)
    (tilVal two t21)
    (tilVal three t13)
    (tilVal four t22)
    (tilVal five t32)
    (tilVal six t14)
    (tilVal seven t41)
    (tilVal eight t23)
    (tilVal nine t42)
    (tilVal ten t33)
    (tilVal eleven t31)
    (tilVal twelve t43)
    (tilVal thirteen t34)
    (tilVal fourteen t44)
    (tilVal fifteen t24)


)

(:goal (and
    (tilVal one t11)
    (tilVal two t12)    
    (tilVal three t13)
    (tilVal four t14)
    (tilVal five t21)
    (tilVal six t22)
    (tilVal seven t23)
    (tilVal eight t24)
    (tilVal nine t31)
    (tilVal ten t32)
    (tilVal eleven t33)
    (tilVal twelve t34)
    (tilVal thirteen t41)
    (tilVal fourteen t42)
    (tilVal fifteen t43)
    (blank t44)
)))