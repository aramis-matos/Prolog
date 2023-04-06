% El rotokas es una lengua hablada en Papua-Nueva Guinea. 
% Escriba un programa en Prolog que genere las sílabas del rotokas con la descripción estructural adecuada. 
% Su base de datos debe contener hechos con los predicados unarios de clases naturales consonante/1 y vocal/1, así como reglas para la formación de núcleos, rimas, ataques y sílabas a partir de estas clases. 
% Sus reglas deben generar las sílabas posibles en esta lengua con adecuación descriptiva y generativa.

% Para propósitos de este problema, suponga que esta lengua tiene el siguiente inventario fonológico: 
% /p t k b d g i e a o u/ 
consonante(p).
consonante(t).
consonante(k).
consonante(b).
consonante(d).
consonante(g).

vocal(i).
vocal(e).
vocal(a).
vocal(o).
vocal(u).

% que todas las sílabas consisten de un ataque que consta de una sola consonante 
ataque(X) :- consonante(X).
% silaba(X):- ataque(X).

nucleo(X):- vocal(X).

% y una rima en la que el núcleo consta de una sola vocal. 
% Como las sílabas de esta lengua no tienen codas, la rima consta solamente del núcleo. 
rima(X):- nucleo(X).

% Regla para formar silabas
silaba(X) :- ataque(A), rima(R), append([A],[R],X).