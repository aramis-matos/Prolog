:- ["../asignment_3/fullanswerMatosAramis.pl"].
:- ["../asignment_3/fonosspanish.pl"].

ataque([]).

ataque([A]) :-
    fono(A),
    clase(A,obstruyente),
    not(fono(A,[cns,cnt,str,son,cor,ant])).

ataque([A]) :- 
    fonos(A,Pos),
    clase(A,nasal),
    (nonmembers([cnt],Pos);
    nonmembers([rtr],Pos);
    nonmembers([ant,dst],Pos)).

ataque([A]) :-
    fonos(A,Pos),
    clase(A,liquida),
    nonmembers([ant,dst],Pos).

ataque([A]) :-
    fono(A),
    clase(A,deslizada).

ataque([A,B]) :-
    

coda([]).