:- ["../asignment_3/fullanswerMatosAramis.pl"].
:- ["../asignment_3/fonosspanish.pl"].

resonancia(vocal,5).
resonancia(deslizada,4).
resonancia(liquida,3).
resonancia(nasal,2).
resonancia(obstruyente,1).

ataque([]).

ataque([A]) :-
    fono(A),
    clase(A,X),
    resonancia(X,Res),
    Res < 4.

ataque([A,B]) :-
    fono(A),
    fono(B),
    clase(A,X),
    clase(B,Y),
    resonancia(X,ResA),
    resonancia(Y,ResB),
    ResB < 5,
    ResA < ResB,
    ((ResB - ResA) > 1;
    Y = deslizada,
    X = liquida).

nucleo([A]) :-
    fono(A),
    clase(A,vocal).

coda([]).

% coda([A]) :-


