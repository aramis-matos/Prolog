:- [fullanswerMatosAramis].

fono(X,[cns]) :- atom_codes(X,[112]).
fono(X,[cns, son]) :- atom_codes(X,[98]).
fono(X,[cns, ant, dst]) :- atom_codes(X, [116,810]).
fono(X,[cns, son, ant, dst]) :- atom_codes(X,[100,810]).
fono(X,[cns,alt,rtr]) :- atom_codes(X,[107]).
fono(X,[cns,son,alt,rtr]) :- atom_codes(X,[103]).
fono(X,[cns, cnt, son]) :- atom_codes(X,[946]).
fono(X,[cns,cnt,str]) :- atom_codes(X,[102]).
fono(X,[cns,cnt,ant,dst]) :- atom_codes(X,[952]).
fono(X,[cns,cnt,son,ant,dst]) :- atom_codes(X,[240]).
fono(X,[cns,cnt,str,ant]) :- atom_codes(X,[115]).
fono(X,[cns,cnt,str,son,ant]) :- atom_codes(X,[122]).
fono(X,[cns,cns,str,dst]) :- atom_codes(X,[643]).
fono(X,[cns,cns,str,son,dst]) :- atom_codes(X,[658]).
fono(X,[cns,cnt,son,dst,alt]) :- atom_codes(X,[669]).
fono(X,[cns,cnt,str,alt,rtr]) :- atom_codes(X,[120]).
fono(X,[cns,cnt,son,alt,rtr]) :- atom_codes(X,[611]).
fono(X,[cnt,gle]) :- atom_codes(X,[104]).
fono(X,[cns,str,dst]) :- atom_codes(X,[679]).
fono(X,[cns,str,son,dst]) :- atom_codes(X,[676]).
fono(X,[cns,rsn,son,nas]) :- atom_codes(X,[109]).
fono(X,[cns,rsn,cnt,son,nas]) :- atom_codes(X,[625]).
fono(X,[cns,rsn,son,nas,ant,dst]) :- atom_codes(X,[110,810]).
fono(X,[cns,rsn,son,nas,ant]) :- atom_codes(X,[110]).
fono(X,[cns,rsn,son,nas,dst,alt]) :- atom_codes(X,[626]).
fono(X,[cns,rsn,son,nas,alt,rtr]) :- atom_codes(X,[331]).
fono(X,[cns,rsn,cnt,lat,son,ant,dst]) :- atom_codes(X,[108,810]).
fono(X,[cns,rsn,cnt,lat,son,ant]) :- atom_codes(X,[108]).
fono(X,[cns,rsn,cnt,lat,son,dst,alt]) :- atom_codes(X,[654]).
fono(X,[cns,rsn,cnt,son,ant]) :- atom_codes(X,[114]).
fono(X,[cns,rsn,cnt,son,rla,ant]) :- atom_codes(X,[638]).
fono(X,[rsn,cnt,son,dst,alt]) :- atom_codes(X,[106]).
fono(X,[rsn, cnt, son, rnd, alt, rtr]) :- atom_codes(X,[119]).
fono(X,[rsn,sil,cnt,son,rla,alt]) :- atom_codes(X,[105]).
fono(X,[rsn,sil,cnt,son,rla]) :- atom_codes(X,[101]).
fono(X,[rsn,sil,cnt,son,rla,baj,rtr]) :- atom_codes(X,[97]).
fono(X,[rsn,sil,cnt,son,rla,rnd,rtr]) :- atom_codes(X,[111]).
fono(X,[rsn,sil,cnt,son,rnd,alt,rtr]) :- atom_codes(X,[117]).
fono(X,[rsn,sil,cnt,son,rlr,rtr]) :- atom_codes(X,[601]).

allphones(A,B) :- findall(A,fono(A,_),B).

members([],_).
members([H|T],List) :- member(H, List),members(T,List).

notmembers(List1,List2) :- not(members(List1,List2)).

nonmembers([],_).
nonmembers([H|T],List) :- not(member(H,List)),nonmembers(T,List).

fono(X) :- fono(X,_).

fonos(Fonos,Total) :- 
    findall(A,fono(A,_),B),
    Fonos = B,
    length(Fonos,Total).






