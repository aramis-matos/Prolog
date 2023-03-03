:- ["fullanswer.pl"].
:- ["fonosyrasgosMatosAramis.pl"].

ataque([]).

ataque([A]) :-
    fono(A),
    clase(A,obstruyente),
    not(fono(A,[cns,cnt,str,son,cor,ant])).

ataque([A]) :- 
    fono(A,Pos),
    clase(A,nasal),
    (nonmembers([cnt],Pos),
    nonmembers([rtr],Pos),
    notmembers([ant,dst],Pos)).

ataque([A]) :-
    fono(A,Pos),
    clase(A,liquida),
    notmembers([ant,dst],Pos).

ataque([A]) :-
    fono(A),
    clase(A,deslizada).

ataque([A,B]) :- %fix this nonmembers
    fono(A,PosA),
    fono(B,PosB),
    clase(A,obstruyente),
    clase(B,rotica),
    notmembers([str,cor,dor],PosA),
    nonmembers([rla],PosB).
    
ataque([A,B]) :-
    fono(A,PosA),
    fono(B,PosB),
    clase(A,obstruyente),
    clase(B,lateral),
    nonmembers([cor],PosA),
    nonmembers([dst],PosB).

ataque([A,B]) :-
    fono(A,PosA),
    fono(B,PosB),
    clase(A,fricativa),
    clase(B,liquida),
    members([lab],PosA),
    nonmembers([son],PosA),
    nonmembers([dst,rla],PosB).

ataque([A,B]) :-
    fono(A),
    fono(B,PosB),
    clase(A,obstruyente),
    clase(B,deslizada),
    not(fono(A,[cns,cnt,str,son,cor,ant])),
    members([lab],PosB).

ataque([A,B]) :-
    fono(A,PosA),
    fono(B,PosB),
    clase(A,nasal),
    clase(B,deslizada),
    (notmembers([cnt],PosA);
    notmembers([rtr],PosA);
    notmembers([ant,dst],PosA)),
    members([lab],PosB).

ataque([A,B]) :- %Working but creteria doesn't exist
    fono(A,PosA),
    fono(B,PosB),
    clase(A,lateral),
    clase(B,deslizada),
    notmembers([ant,dst],PosA),
    members([lab],PosB).

ataque([A,B]) :-
    fono(A,PosA),
    fono(B,PosB),
    clase(A,rotica),
    clase(B,deslizada),
    members([rla],PosA),
    members([lab],PosB).

ataque([A,B]) :-
    fono(A,PosA),
    fono(B,PosB),
    clase(A,obstruyente),
    clase(B,deslizada),
    (notmembers([cns,cor,dst,dor,alt],PosA),
    notmembers([cor,dst,str],PosA),
    not(fono(A,[cns,cnt,str,dor,alt,rtr]))),
    members([cor],PosB).

ataque([A,B]) :-
    fono(A,PosA),
    fono(B,PosB),
    clase(A,nasal),
    clase(B,deslizada),
    (nonmembers([cnt],PosA);
    notmembers([ant,dst],PosA),
    notmembers([cor,dor],PosA),
    notmembers([rtr],PosA)),
    members([cor],PosB).

ataque([A,B]) :-
    fono(A,PosA),
    fono(B,PosB),
    clase(A,lateral),
    clase(B,deslizada),
    nonmembers([dst],PosA),
    members([cor],PosB).

ataque([A,B]) :-
    fono(A,PosA),
    fono(B,PosB),
    clase(A,rotica),
    clase(B,deslizada),
    members([rla],PosA),
    members([cor],PosB).

nucleo([A]) :-
    fono(A,PosA),
    clase(A,vocal),
    nonmembers([rlr],PosA).

nucleo([A,B]) :-
    fono(A,PosA),
    fono(B,_),
    clase(A,vocal),
    clase(B,deslizada),
    (nonmembers([rlr],PosA),
    notmembers([alt,rlr],PosA)).


coda([]).

coda([A]) :-
    fono(A,PosA),
    clase(A,obstruyente),
    (notmembers([cor,dor],PosA),
    notmembers([str,dst],PosA)).

coda([A]) :- %Works but no match
    fono(A,PosA),
    clase(A,consonante),
    clase(A,resonante),
    nonmembers([rla],PosA).

coda([A,B]) :-
    (fono(A,[cns,rsn,cnt,son,cor,ant]);
    fono(A,[cns,rsn,son,nas,cor,ant])),
    fono(B,[cns,cnt,str,cor,ant]).

coda([A,B]) :-
    (fono(A,[cns,lab]);
    fono(A,[cns,dor,alt,rtr])),
    fono(B,[cns,cnt,str,cor,ant]).

rima(A) :-
    nucleo(B),
    coda(C),
    append(B,C,A),
    length(A,Len),
    Len =< 3.
    
silaba(A,Len) :-
    ataque(B),
    rima([Nucleo|Coda]),
    filterIJWU(B,Nucleo),
    append(B,[Nucleo|Coda],A),
    length(A, Len),
    Len =< 5.

silabas(Lista,Len) :-
    findall(A,silaba(A,_),B),
    list_to_set(B, Lista),
    length(Lista,Len).

silabas(Lista,Len,Total) :-
    findall(A,silaba(A,Len),B),
    list_to_set(B, Lista),
    length(Lista,Total).

ataques(Lista,Len,Total) :-
    findall(A,ataque(A,Len),B),
    list_to_set(B, Lista),
    length(Lista,Total).

ataque(A,Len) :-
    ataque(A),
    length(A,Len).

rima(A,Len) :-
    rima(A),
    length(A,Len).

rimas(Lista,Len,Total) :-
    findall(A,rima(A,Len),B),
    list_to_set(B,Lista),
    length(Lista,Total).

nucleo(A,Len) :-
    nucleo(A),
    length(A,Len).

nucleos(Lista,Len,Total) :-
    findall(A,nucleo(A,Len),B),
    list_to_set(B,Lista),
    length(Lista,Total).

coda(A,Len) :-
    coda(A),
    length(A,Len).

codas(Lista,Len,Total) :-
    findall(A,coda(A,Len),B),
    list_to_set(B,Lista),
    length(Lista,Total).



filter(Ataque,Nucleo) :-
    not((last(Ataque,X),
    fonos(X,XPos,XNeg),
    fonos(Nucleo,NPos,NNeg),
    clase(X,deslizada),
    member(alt,NPos),
    ((member(rtr,XNeg),member(rtr,NNeg));
    (member(rtr,XPos),member(rtr,NPos))))).

filterIJWU([],_).

filterIJWU(X,Y) :-
    last(X,Z),
    not((Z = j,Y = i)),
    not((Z = w,Y = u)).
    
