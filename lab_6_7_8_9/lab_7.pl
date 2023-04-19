:- [lab_6].
% :- use_rendering(svgtree, [list(false)]).		


% B
% c0(c0(ec),[decl]) --> [].			
% i0(i0(fin),[[nom],_,_]) --> [].		

% pp(pp(Pbar),_) --> pbar(Pbar,_).
% pp(S,L,M) :- pp(S,_,L,M).
% pbar(pbar(P0,NP),_) --> p0(P0,_),np(NP,_).
% ap(ap(Int0,Abar),_) --> int0(Int0,_),abar(Abar,_).
% ap(ap(Abar),_) --> abar(Abar,_).
% ap(S,L,M) :- ap(S,_,L,M).
% abar(abar(A0),_) --> a0(A0,_).
% np(np(Nbar,AP),_) --> nbar(Nbar,_),ap(AP,_).
% np(np(Nbar),_) --> nbar(Nbar,_).
% np(S,L,M) :- np(S,_,L,M).
% nbar(nbar(N0),_) --> n0(N0,_).
% dp(dp(Dbar),_) --> dbar(Dbar,_).
% dp(S,L,M) :- dp(S,_,L,M).
% dbar(dbar(D0,NP),_) -->
%     d0(D0,_),np(NP,_).


% C

ap(ap(Int0,Abar),T) --> int0(Int0,_),abar(Abar,T).
ap(ap(Abar),T) --> abar(Abar,T).
ap(S,L,M) :- ap(S,_,L,M).
abar(abar(A0),T) --> a0(A0,T).
np(np(Nbar,AP),[Case,Phi,[]]) --> 
    nbar(Nbar,[Case,Phi,[]]),ap(AP,[_,Phi,_]).
np(np(AP,Nbar),[Case,Phi,[]]) --> 
    ap(AP,[_,Phi,_]),
    nbar(Nbar,[Case,Phi,[]]).
np(np(Nbar),T) --> nbar(Nbar,T).
np(S,L,M) :- np(S,_,L,M).
nbar(nbar(N0),T) --> n0(N0,T).
dp(dp(Dbar),T) --> dbar(Dbar,T).
dp(S,L,M) :- dp(S,_,L,M).
dbar(dbar(D0),[Case,Phi,[]]) -->
    d0(D0,[Case,Phi,[]]).
dbar(dbar(D0,NP),[Case,Phi,[]]) -->
    d0(D0,[Case,Phi,[unp]]),np(NP,[_,Phi,_]).


% D

% vp(S,L,M) :- vp(S,_,L,M).
% vp(vp(Vbar,PP),T) --> vp(Vbar,T),pp(PP,_).
% vp(vp(Vbar),T) --> vbar(Vbar,T).
% vbar(vbar(V0,DP),[Time,Phi,[],[]]) -->
%     v0(V0,[Time,Phi,Args,Vcase]),
%     dp(DP,[Dcase,_,_]),
%     {intersection(Vcase,Dcase,Int),
%       \+ Int =[],
%     Args = [udp]}.
pp(pp(Pbar),_) --> pbar(Pbar,_).
pp(S,L,M) :- pp(S,_,L,M).
pbar(pbar(P0,NP),[Pcase,[]]) -->
    p0(P0,[Pcase,_]),
    dp(NP,[Dcase,_,_]),
    {intersection(Pcase,Dcase,Int),
      \+ Int = []}.
