:- [lab_8].
:- discontiguous vbar/4.

cp(cp(Cbar),T) -->
    cbar(Cbar,T).
cbar(cbar(C0,IP),[decl]) -->
    c0(C0,[decl]),
    ip(IP,_).
advp(advp(Advbar),T) -->
    advbar(Advbar,T).
advbar(advbar(Adv0),T) -->
    adv0(Adv0,T).
ip(ip(IP,PP),[Case,Phi,Tense]) -->
    ip(IP,[Case,Phi,Tense]),
    pp(PP,_).
ip(ip(PP,IP),[Case,Phi,Tense]) -->
    pp(PP,_),
    ip(IP,[Case,Phi,Tense]).
ip(ip(AdvP,IP),[Case,Phi,Tense]) -->
    advp(AdvP,[Tense,_,[uvp]]),
    ip(IP,[Case,Phi,Tense]).
ip(ip(IP,AdvP),[Case,Phi,Tense]) -->
    ip(IP,[Case,Phi,Tense]),
    advp(AdvP,[Tense,_,[uvp]]).
ip(ip(DP,Ibar),[Case,Phi,Tense]) -->
    dp(DP,[_,Phi,_]),
    ibar(Ibar,[Case,Phi,Tense]).
ibar(ipbar(I0,VP),[Case,Phi,Tense]) --> 
    i0(I0,[Case,_,_]),
    vp(VP,[Tense,Phi,_,_]),
    {\+ Tense = [],
    \+ Phi = [],
    Case = [nom]}.
vbar(vbar(V0,CP),[Time,Phi,[],Vcase]) -->
    v0(V0,[Time,Phi,Args,Vcase]),
    cp(CP,T),
    { Args = [ucp],
    \+ T = []}.