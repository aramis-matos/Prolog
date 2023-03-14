dutch([b,e,e,n],[noun]).
dutch([b,e,r,g],[noun]).
dutch([s,t,e,e,n],[noun]).
dutch([d,i,e,r],[noun]).
dutch([[g,e],[t,e]],[circumfix,plural]).

dutch(A,[noun,plural]) :-
    dutch(B,[noun]),
    dutch([C,D],[circumfix,plural]),
    append(C,B,E),
    append(E,D,A).
