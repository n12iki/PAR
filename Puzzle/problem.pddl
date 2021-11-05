(define (problem puzzle_game) (:domain puzzle)
(:objects 
    t11 t12 t13 t14 t21 t22 t23 t24 t31 t32 t33 t34 t41 t42 t43 t44 - place; tiles are t and then row and col
    one two three four five six seven eight nine ten eleven twelve thirteen fourteen fifteen - val; tile number so that it is easier to change the setup and keep track of what is where

)
(:init

    ;setting up the board
    (left t11 t12)
    (up t11 t21)

    (left t12 t13)
    (up t12 t22)

    (left t13 t14)
    (up t13 t23)
    
    (up t14 t24)

    (left t21 t22)
    (up t21 t31)

    (left t22 t23)
    (up t22 t32)

    (left t23 t24)
    (up t23 t33)

    (up t24 t34)

    (left t31 t32)
    (up t31 t41)
    
    (left t32 t33)
    (up t32 t42)

    (left t33 t34)
    (up t34 t44)

    (left t41 t42)

    (left t42 t43)

    (left t43 t44)

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