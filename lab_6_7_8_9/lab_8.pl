:- [lab_6].
:- [lab_7].

vp(S,L,M) :- vp(S,_,L,M).
vp(vp(Vbar,PP),T) --> vp(Vbar,T),pp(PP,_).
vp(vp(Vbar),T) --> vbar(Vbar,T).
vbar(vbar(V0,DP),[Time,Phi,[],Vcase]) -->
    v0(V0,[Time,Phi,Args,Vcase]),
    dp(DP,[Dcase,_,_]),
    {intersection(Vcase,Dcase,Int),
      \+ Int =[],
    Args = [udp]}.
vbar(vbar(V0),[Time,Phi,Args,[]]) -->
    v0(V0,[Time,Phi,Args,[]]),
    {Args = []}.
vbar(vbar(V0,PP),[Time,Phi,[],Vcase]) -->
    v0(V0,[Time,Phi,Args,Vcase]),
    pp(PP,[Pcase,_]),
    {intersection(Vcase,Pcase,Int),
      \+ Int =[],
    Args = [upp]}.
