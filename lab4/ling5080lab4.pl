/*
LING 5080 Laboratorio 4: Sílabas

Nombre: Aramis E. Matos Nieves


A. Formule un procedimiento silaba/1 que reconozca sílabas con la descripción estructural 
adecuada.
*/

silaba(A) :-
    ataque(B),
    rima(C),
    append(B,C,A).

/*
B. En español no existen sílabas con más de cinco (5) segmentos. ¿Cómo modificaría 
su procedimiento silaba/1 para tomar esto en cuenta?
*/

silaba(A) :-
    ataque(B),
    rima(C),
    append(B,C,A),    
    length(A, Len),
    Len =< 5.


/*
C. En español no existe la sílaba [j,i]. ¿Cómo modificaría su procedimiento silaba/1 para 
tomar esto en cuenta?
*/

silaba(A) :-
    ataque(B),
    rima([Nucleo|Coda]),
    filterIJ(B,Nucleo),
    append(B,[Nucleo|Coda],A),    
    length(A, Len),
    Len =< 5.

filterIJ([],_).

filterIJ(X,Y) :-
    last(X,Z),
    not((Z = j,Y = i)).

/*
D. En español tampoco existe la sílaba [w,u]. ¿Cómo modificaría su procedimiento silaba/1 para 
tomar esto en cuenta?
*/

silaba(A) :-
    ataque(B),
    rima([Nucleo|Coda]),
    filterIJWU(B,Nucleo),
    append(B,[Nucleo|Coda],A),    
    length(A, Len),
    Len =< 5.


filterIJWU([],_).

filterIJWU(X,Y) :-
    last(X,Z),
    not((Z = j,Y = i)),
    not((Z = w,Y = u)).

/*
E. La inexistencia de [j,i] y [w,u] como sílabas responde a una misma restricción fonológica 
del español. ¿Cómo modificaría su procedimiento silaba/1 para formular esta restricción
de manera principiada y no por estipilación?
*/

silaba(A,Len) :-
    ataque(B),
    rima([Nucleo|Coda]),
    filter(B,Nucleo),
    append(B,[Nucleo|Coda],A),
    length(A, Len),
    Len =< 5.

filter(Ataque,Nucleo) :-
    not((last(Ataque,X),
    fonos(X,XPos,XNeg),
    fonos(Nucleo,NPos,NNeg),
    clase(X,deslizada),
    member(alt,NPos),
    ((member(rtr,XNeg),member(rtr,NNeg));
    (member(rtr,XPos),member(rtr,NPos))))).

/*
F. En español tampoco existen sílabas que contengan alguna de las secuencias [j,i] y [w,u] más una coda.
¿Cómo modificaría su procedimiento silaba/1 incluir restricción de manera principiada?
*/

silaba(A,Len) :-
    ataque(B),
    rima([Nucleo|Coda]),
    filter(B,Nucleo),
    append(B,[Nucleo|Coda],A),
    length(A, Len),
    Len =< 5.

filter(Ataque,Nucleo) :-
    not((last(Ataque,X),
    fonos(X,XPos,XNeg),
    fonos(Nucleo,NPos,NNeg),
    clase(X,deslizada),
    member(alt,NPos),
    ((member(rtr,XNeg),member(rtr,NNeg));
    (member(rtr,XPos),member(rtr,NPos))))).


/*
G. En español tampoco existen sílabas que contengan un ataque más alguna de las secuencias [j,i] y [w,u] 
más una coda. ¿Cómo modificaría su procedimiento silaba/1 incluir restricción de manera principiada?
*/

silaba(A,Len) :-
    ataque(B),
    rima([Nucleo|Coda]),
    filter(B,Nucleo),
    append(B,[Nucleo|Coda],A),
    length(A, Len),
    Len =< 5.

filter(Ataque,Nucleo) :-
    not((last(Ataque,X),
    fonos(X,XPos,XNeg),
    fonos(Nucleo,NPos,NNeg),
    clase(X,deslizada),
    member(alt,NPos),
    ((member(rtr,XNeg),member(rtr,NNeg));
    (member(rtr,XPos),member(rtr,NPos))))).


/*
H. Reformule su procedimiento silaba/1 de manera que de cuenta de todas las restricciones 
anteriormente señaladas.
*/

silaba(A,Len) :-
    ataque(B),
    rima([Nucleo|Coda]),
    filter(B,Nucleo),
    append(B,[Nucleo|Coda],A),
    length(A, Len),
    Len =< 5.

filter(Ataque,Nucleo) :-
    not((last(Ataque,X),
    fonos(X,XPos,XNeg),
    fonos(Nucleo,NPos,NNeg),
    clase(X,deslizada),
    member(alt,NPos),
    ((member(rtr,XNeg),member(rtr,NNeg));
    (member(rtr,XPos),member(rtr,NPos))))).