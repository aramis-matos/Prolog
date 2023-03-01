:- [fullanswerMatosAramis].

traits([cns,rsn,sil,cnt,str,lat,son,gle,rla,rlr,nas,lab,rnd,cor,ant,dst,dor,alt,baj,rtr]).

natClasses([consonante,obstruyente,oclusiva,africada,fricativa,resonante,nasal,aproximante,liquida,lateral,rotica,vocoid,deslizada]).

fono(X,[cns,lab]) :- atom_codes(X,[112]).
fono(X,[cns, son,lab]) :- atom_codes(X,[98]).
fono(X,[cns, cor, ant, dst]) :- atom_codes(X, [116,810]).
fono(X,[cns, son, cor, ant, dst]) :- atom_codes(X,[100,810]).
fono(X,[cns,dor,alt,rtr]) :- atom_codes(X,[107]).
fono(X,[cns,son,dor,alt,rtr]) :- atom_codes(X,[103]).
fono(X,[cns, cnt, son,lab]) :- atom_codes(X,[946]).
fono(X,[cns,cnt,str,lab]) :- atom_codes(X,[102]).
fono(X,[cns,cnt,cor,ant,dst]) :- atom_codes(X,[952]).
fono(X,[cns,cnt,son,cor,ant,dst]) :- atom_codes(X,[240]).
fono(X,[cns,cnt,str,cor,ant]) :- atom_codes(X,[115]).
fono(X,[cns,cnt,str,son,cor,ant]) :- atom_codes(X,[122]).
fono(X,[cns,cnt,str,cor,dst]) :- atom_codes(X,[643]).
fono(X,[cns,cnt,str,son,cor,dst]) :- atom_codes(X,[658]).
fono(X,[cns,cnt,son,cor,dst,dor,alt]) :- atom_codes(X,[669]).
fono(X,[cns,cnt,str,dor,alt,rtr]) :- atom_codes(X,[120]).
fono(X,[cns,cnt,son,dor,alt,rtr]) :- atom_codes(X,[611]).
fono(X,[cnt,gle]) :- atom_codes(X,[104]).
fono(X,[cns,str,cor,dst]) :- atom_codes(X,[679]).
fono(X,[cns,str,son,cor,dst]) :- atom_codes(X,[676]).
fono(X,[cns,rsn,son,nas,lab]) :- atom_codes(X,[109]).
fono(X,[cns,rsn,cnt,son,nas,lab]) :- atom_codes(X,[625]).
fono(X,[cns,rsn,son,nas,cor,ant,dst]) :- atom_codes(X,[110,810]).
fono(X,[cns,rsn,son,nas,cor,ant]) :- atom_codes(X,[110]).
fono(X,[cns,rsn,son,nas,cor,dst,dor,alt]) :- atom_codes(X,[626]).
fono(X,[cns,rsn,son,nas,dor,alt,rtr]) :- atom_codes(X,[331]).
fono(X,[cns,rsn,cnt,lat,son,cor,ant,dst]) :- atom_codes(X,[108,810]).
fono(X,[cns,rsn,cnt,lat,son,cor,ant]) :- atom_codes(X,[108]).
fono(X,[cns,rsn,cnt,lat,son,cor,dst,dor,alt]) :- atom_codes(X,[654]).
fono(X,[cns,rsn,cnt,son,rla,cor,ant]) :- atom_codes(X,[114]).
fono(X,[cns,rsn,cnt,son,cor,ant]) :- atom_codes(X,[638]).
fono(X,[rsn,cnt,son,cor,dst,dor,alt]) :- atom_codes(X,[106]).
fono(X,[rsn,cnt,son,lab,rnd,dor,alt,rtr]) :- atom_codes(X,[119]).
fono(X,[rsn,sil,cnt,son,rla,dor,alt]) :- atom_codes(X,[105]).
fono(X,[rsn,sil,cnt,son,rla,dor]) :- atom_codes(X,[101]).
fono(X,[rsn,sil,cnt,son,rla,dor,baj,rtr]) :- atom_codes(X,[97]).
fono(X,[rsn,sil,cnt,son,rla,lab,rnd,dor,rtr]) :- atom_codes(X,[111]).
fono(X,[rsn,sil,cnt,son,lab,rnd,dor,alt,rtr]) :- atom_codes(X,[117]).
fono(X,[rsn,sil,cnt,son,rla,dor,rtr]) :- atom_codes(X,[601]).

clase(X,consonante) :- fono(X,[cns],[]).
clase(h,consonante) :- fono(h).
clase(X,obstruyente) :- fono(X,[],[rsn]).
clase(X,oclusiva) :- fono(X,[],[rsn,cnt,str]).
clase(X,africada) :- fono(X,[str],[rsn,cnt]).
clase(X,fricativa) :- fono(X,[cnt],[rsn]).
clase(X,resonante) :- fono(X,[rsn],[]).
clase(X,nasal) :- fono(X,[cns,rsn],[]).
clase(X,aproximante) :- fono(X,[rsn,cnt],[nas]).
clase(X,liquida) :- fono(X,[cns,rsn,cnt],[nas]).
clase(X,lateral) :- fono(X,[rsn,lat],[]).
clase(X,rotica) :- fono(X,[cns,rsn,cnt],[lat,nas]).
clase(X,vocoid) :- fono(X,[rsn],[cns]).
clase(X,deslizada) :- fono(X,[rsn],[cns,sil]).
clase(X,vocal) :- fono(X,[sil],[cns]).


clase(X,Clase) :-
    fono(X),
    member(Clase,natClasses(X)).

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

fono(X,Rpos,Rneg) :-
    fono(X,Y),
    members(Rpos,Y),
    nonmembers(Y,Rneg). 


fonos(Fono,Rpos,Rneg) :- 
    traits(X),
    fono(Fono,Rpos),
    subtract(X, Rpos, Rneg).

consonantes(Lista,Total) :-
    findall(A,clase(A,consonante),Lista),
    length(Lista,Total).

obstruyentes(Lista,Total) :-
    findall(A,clase(A,obstruyente),Lista),
    length(Lista,Total).

oclusivas(Lista,Total) :-
    findall(A,clase(A,oclusiva),Lista),
    length(Lista,Total).
    
africadas(Lista,Total) :-
    findall(A,clase(A,africada),Lista),
    length(Lista,Total).

fricativas(Lista,Total) :-
    findall(A,clase(A,fricativa),Lista),
    length(Lista,Total).

resonantes(Lista,Total) :-
    findall(A,clase(A,resonante),Lista),
    length(Lista,Total).

nasales(Lista,Total) :-
    findall(A,clase(A,nasal),Lista),
    length(Lista,Total).

aproximantes(Lista,Total) :-
    findall(A,clase(A,aproximante),Lista),
    length(Lista,Total).

liquidas(Lista,Total) :-
    findall(A,clase(A,liquida),Lista),
    length(Lista,Total).

laterales(Lista,Total) :-
    findall(A,clase(A,lateral),Lista),
    length(Lista,Total).

roticas(Lista,Total) :-
    findall(A,clase(A,rotica),Lista),
    length(Lista,Total).

vocoides(Lista,Total) :-
    findall(A,clase(A,vocoid),Lista),
    length(Lista,Total).

deslizadas(Lista,Total) :-
    findall(A,clase(A,deslizada),Lista),
    length(Lista,Total).
