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
fono(X,[cns,cnt,son,cor,dst,cor,alt]) :- atom_codes(X,[669]).
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
fono(X,[cns,rsn,cnt,son,cor,ant]) :- atom_codes(X,[114]).
fono(X,[cns,rsn,cnt,son,rla,cor,ant]) :- atom_codes(X,[638]).
fono(X,[rsn,cnt,son,cor,dst,dor,alt]) :- atom_codes(X,[106]).
fono(X,[rsn,cnt,son,lab,rnd,dor,alt,rtr]) :- atom_codes(X,[119]).
fono(X,[rsn,sil,cnt,son,rla,dor,alt]) :- atom_codes(X,[105]).
fono(X,[rsn,sil,cnt,son,rla,dor]) :- atom_codes(X,[101]).
fono(X,[rsn,sil,cnt,son,rla,dor,baj,rtr]) :- atom_codes(X,[97]).
fono(X,[rsn,sil,cnt,son,rla,lab,rnd,dor,rtr]) :- atom_codes(X,[111]).
fono(X,[rsn,sil,cnt,son,lab,rnd,dor,alt,rtr]) :- atom_codes(X,[117]).
fono(X,[rsn,sil,cnt,son,rlr,dor,rtr]) :- atom_codes(X,[601]).

consonante(X,Clase) :- fono(X,[cns],[]), Clase = consonante.
obstruyente(X,Clase) :- fono(X,[],[rsn]), Clase = obstruyente.
oclusiva(X,Clase) :- fono(X,[],[rsn,cnt,str]),Clase = oclusiva.
africada(X,Clase) :- fono(X,[str],[rsn,cnt]), Clase = africada.
fricativa(X,Clase) :- fono(X,[cnt],[rsn]), Clase = fricativa.
resonante(X,Clase) :- fono(X,[rsn],[]), Clase = resonante.
nasal(X,Clase) :- fono(X,[cns,rsn],[]), Clase = nasal.
aproximante(X,Clase) :- fono(X,[rsn,cnt],[nas]), Clase = aproximante.
liquida(X,Clase) :- fono(X,[cns,rsn,cnt],[nas]), Clase = liquida.
lateral(X,Clase) :- fono(X,[rsn,lat],[]), Clase = lateral.
rotica(X,Clase) :- fono(X,[cns,rsn,cnt],[lat,nas]), Clase = rotica.
vocoid(X,Clase) :- fono(X,[rsn],[cns]), Clase = vocoid.
deslizada(X,Clase) :- fono(X,[rsn],[cns,sil]), Clase = deslizada.


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
    subtract(X, Rpos, Rneg),
    fono(Fono,Rpos).

consonantes(Lista,Total) :-
    findall(A,consonante(A,_),Lista),
    length(Lista,Total).

obstruyentes(Lista,Total) :-
    findall(A,obstruyente(A,_),Lista),
    length(Lista,Total).

oclusivas(Lista,Total) :-
    findall(A,oclusiva(A,_),Lista),
    length(Lista,Total).
    
africadas(Lista,Total) :-
    findall(A,africada(A,_),Lista),
    length(Lista,Total).

fricativas(Lista,Total) :-
    findall(A,fricativa(A,_),Lista),
    length(Lista,Total).

resonantes(Lista,Total) :-
    findall(A,resonante(A,_),Lista),
    length(Lista,Total).

nasales(Lista,Total) :-
    findall(A,nasal(A,_),Lista),
    length(Lista,Total).

aproximantes(Lista,Total) :-
    findall(A,aproximante(A,_),Lista),
    length(Lista,Total).

liquidas(Lista,Total) :-
    findall(A,liquida(A,_),Lista),
    length(Lista,Total).

laterales(Lista,Total) :-
    findall(A,lateral(A,_),Lista),
    length(Lista,Total).

roticas(Lista,Total) :-
    findall(A,rotica(A,_),Lista),
    length(Lista,Total).

vocoides(Lista,Total) :-
    findall(A,vocoid(A,_),Lista),
    length(Lista,Total).

deslizadas(Lista,Total) :-
    findall(A,deslizada(A,_),Lista),
    length(Lista,Total).