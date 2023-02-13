/*
LING 5080 Laboratorio 3

Nombre:

A. Use la tabla de "Rasgos Fonológicos" para representar las líquidas [l,l̪,ʎ,ɾ,r] 
mediante el procedimiento binario fono(Fono,Rasgos), donde Fono es el fono y Rasgos la lista
de rasgos no-negativos del fono. La base de conocimiento debe seguir el mismo orden  
en el que están los fonos en la tabla. Sus cláusulas deben ser reglas como:

fono(X,Rasgos) :- atom_codes(X,UnicodeDec).

donde UnicodeDec es la lista del código(s) decimal(es) en Unicode del símbolo fonético
IPA que corresponde al fono en cuestión.
*/

/* cns, rsn, sil, cnt, lat, son, gle, glc rla, rlr, nas, lab, rnd, cor, ant, dst, dor, alt, baj, rtr */


fono(X,[cns, rsn, cnt, lat, son, ant]) :- atom_codes(X,[108]).

fono(X,[cns, rsn, cnt, lat, son, ant, dst, alt]) :- atom_codes(X,[108,810]).

fono(X,[cns, rns, cnt, lat, son, ant, alt]) :- atom_codes(X,[654]).

fono(X,[cns,rsn,cnt,son,ant]) :- atom_codes(X,[638]).

fono(X,[cns,rsn,cnt,son,rla,ant]) :- atom_codes(X,[114]).


/*
B. Suponga que existe un procedimiento ternario fono(Fono, RasgosPos, RasgosNeg), donde 
Fono tiene todos los rasgos no negativos en Rpos y ninguno de los rasgos en Rneg (o con 
valor negativo). Use este fono/3 para crear un procedimiento clase(X,Clase) que devuelva 
true ssi X es un fono de la clase Clase. Utilice el nombre de cada clase en singular 
y sin acentos (liquida, lateral, rotica). Sus cláusulas deben ser reglas como:

clase(X,Clase) :- fono(X,RasgosPos,RasgosNeg).
*/

clase(X,liquida).

clase(X,lateral).

clase(X,rotica).


/*
C. Use el procedimiento clase/2 para definir los procedimientos liquidas/2, laterales/2 y 
roticas/2, en los que el primer argumento es una lista con todos los fonos de esa clase 
y el segundo es el total de fonos en la lista. Escriba tres reglas que definan estas clases, 
En el cuerpo de la regla debe usar también el procedimiento length/2.
*/

liquidas(Lista,Total).

laterales(Lista,Total).

roticas(Lista,Total).
