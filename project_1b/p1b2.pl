:- ["../asignment_3/fullanswerMatosAramis.pl"].
:- ["../asignment_3/fonosspanish.pl"].

% ataque([]).

% ataque([A]) :-
%     fono(A),
%     clase(A,obstruyente),
%     not(fono(A,[cns,cnt,str,son,cor,ant])).

% ataque([A]) :- 
%     fono(A,Pos),
%     clase(A,nasal),
%     (nonmembers([cnt],Pos);
%     nonmembers([rtr],Pos);
%     nonmembers([ant,dst],Pos)).

% ataque([A]) :-
%     fono(A,Pos),
%     clase(A,liquida),
%     nonmembers([ant,dst],Pos).

% ataque([A]) :-
%     fono(A),
%     clase(A,deslizada).

% ataque([A,B]) :- fix this nonmembers
%     fono(A,PosA),
%     fono(B,PosB),
%     clase(A,obstruyente),
%     clase(B,rotica),
%     nonmembers([str,cor,dor],PosA),
%     nonmembers([rla],PosB).
    
% ataque([A,B]) :-
%     fono(A,PosA),
%     fono(B,PosB),
%     clase(A,obstruyente),
%     clase(B,lateral),
%     nonmembers([cor],PosA),
%     nonmembers([dst],PosB).

% ataque([A,B]) :-
%     fono(A,PosA),
%     fono(B,PosB),
%     clase(A,fricativa),
%     clase(B,liquida),
%     members([lab],PosA),
%     nonmembers([son],PosA),
%     nonmembers([dst,rla],PosB).

% ataque([A,B]) :-
%     fono(A),
%     fono(B,PosB),
%     clase(A,obstruyente),
%     clase(B,deslizada),
%     not(fono(A,[cns,cnt,str,son,cor,ant])),
%     members([lab],PosB).

% ataque([A,B]) :-
%     fono(A,PosA),
%     fono(B,PosB),
%     clase(A,nasal),
%     clase(B,deslizada),
%     (nonmembers([cnt],PosA);
%     nonmembers([rtr],PosA),
%     nonmembers(ant,dst),PosA),
%     members([lab],PosB).

% ataque([A,B]) :- %Working but creteria doesn't exist
%     fono(A,PosA),
%     fono(B,PosB),
%     clase(A,lateral),
%     clase(B,deslizada),
%     nonmembers([ant,dst],PosA),
%     members([lab],PosB).

% ataque([A,B]) :-
%     fono(A,PosA),
%     fono(B,PosB),
%     clase(A,rotica),
%     clase(B,deslizada),
%     members([rla],PosA),
%     members([lab],PosB).

ataque([A,B]) :-
    fono(A,PosA),
    fono(B,PosB),
    clase(A,obstruyente),
    clase(B,deslizada),
    (nonmembers([cns,cor,dst,dor,alt],PosA);
    nonmembers([cor,dst,str],PosA);
    not(fono(A,[cns,cnt,str,dor,alt,rtr]))),
    members([cor],PosB).



coda([]).