:- set_prolog_flag(answer_write_options,[max_depth(0)]).

letter(L) :-
	atom_codes(L, [Code]),
	97 =< Code, 
    Code =< 122, 
    !.

letter(L) :-
	atom_codes(L, [Code]),
	member(Code, [225, 233, 237, 243, 250, 252, 241, 43, 949]), !.

arc(0, 0, L, L) :- letter(L).
arc(0, 1, C, 0) :- atom_codes(C,[43]). %'+'
arc(1, 5, a, a).
arc(1,2,e,e).
arc(1,6,i,i).
arc(5,3,C,0) :- atom_codes(C,[43]). 
arc(2,3,C,0) :- atom_codes(C,[43]).
arc(6,3,C,0) :- atom_codes(C,[43]).
arc(3,4,r,r).
arc(4,8,C,C) :- atom_codes(C,[233]).
arc(4,7,C,C) :- atom_codes(C,[225]).
arc(4,9,e,e).
arc(8,10,C,0) :- atom_codes(C,[43]).
arc(10,13,C,0) :- atom_codes(C,[949]).
arc(10,14,i,i).
arc(14,15,s,s).
arc(7,11,C,0) :- atom_codes(C,[43]).
arc(11,16,s,s).
arc(11,17,C,0) :- atom_codes(C,[949]).
arc(11,18,n,n).
arc(9,12,C,0) :- atom_codes(C,[43]).
arc(12,19,m,m).
arc(19,20,o,o).
arc(20,21,s,s).
arc(0,23,t,t).
arc(0,23,v,v).
arc(0,24,p,p).
arc(0,25,s,s).
arc(23,26,e,e).
arc(24,26,o,o).
arc(25,27,a,a).
arc(26,28,n,n).
arc(27,28,l,l).
arc(28,29,d,d).
arc(29,30,C,0) :- atom_codes(C,[43]).
arc(30,31,C,0) :- atom_codes(C,[949]).
arc(31,3,C,0) :- atom_codes(C,[43]).

final_state(13).
final_state(15).
final_state(16).
final_state(17).
final_state(18).
final_state(21).

transduce(Start, Final, [U | UnderlyingString], SurfaceString) :-
	arc(Start, Next, U, 0),
	transduce(Next, Final, UnderlyingString, SurfaceString).

transduce(Start, Final, UnderlyingString, [S | SurfaceString]) :-
	arc(Start, Next, 0, S),
	transduce(Next, Final, UnderlyingString, SurfaceString).

transduce(Start, Final, [U | UnderlyingString], [S | SurfaceString]) :-
	arc(Start, Next, U, S),
	U \== 0,
	S \== 0,
	transduce(Next, Final, UnderlyingString, SurfaceString).

transduce(Final, Final, [], []) :-
	final_state(Final).


take(N, _, Xs) :- N =< 0, !, N =:= 0, Xs = [].
take(_, [], []).
take(N, [X|Xs], [X|Ys]) :- M is N-1, take(M, Xs, Ys).


parse(Verb,UF,Lexeme) :-
	atom_chars(Verb, VerbChars),
	transduce(0,_,UF,VerbChars),
	(nth0(Index,UF,+),!),
	take(Index,UF,Lexeme).


	
