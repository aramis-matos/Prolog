:- ['properties.pl'].

syllable(A):-
onset(B),
rhyme(C),
append(B,C,A).

onset([A]):-
phone(A),cns(A),not(nas(A)).

onset([A]):-
phone(A),nas(A),not(vel(A)).

onset([A,B]):-
phone(A),not(snt(A)),not(cnt(A)),not(pal(A)),
phone(B),alv(B),pal(B).

onset([A,B]):-
phone(A),not(snt(A)),not(cnt(A)),not(cor(A)),
phone(B),snt(B),not(nas(B)),alv(B),not(pal(B)).

onset([A,B]):-
phone(A),not(snt(A)),not(cnt(A)),not(lab(A)),not(pal(A)),
phone(B),cnt(B),vel(B).

onset([A,B]):-
phone(A),not(voi(A)),cnt(A),lab(A),
phone(B),snt(B),cnt(B),alv(B).

onset([A,B]):-
phone(A),not(voi(A)),cnt(A),not(alv(A)),cor(A),
phone(B),alv(B),pal(B).

onset([A,B]):-
phone(A),not(voi(A)),cnt(A), alv(A),
phone(B),cns(B),snt(B),not(nas(B)),not(pal(B)).

onset([A,B]):-
phone(A),not(voi(A)),cnt(A),alv(A),
phone(B),nas(B),not(vel(B)).

onset([A,B|C]):-
phone(A),not(voi(A)),cnt(A),alv(A),
phone(B),not(voi(B)),not(cnt(B)),not(pal(B)),
onset([B|C]).

onset([]).

rhyme(C):-
nucleus(A),
coda(B),
append(A,B,C).

nucleus([A]):-
phone(A),not(cns(A)).

nucleus([A,B]):-
phone(A),mid(A),not(ctr(A)),
phone(B),cns(B),snt(B),not(nas(B)),not(alv(B)).

nucleus([A,B]):-
phone(A),low(A),bck(A),
phone(B),cns(B),snt(B),not(nas(B)),not(alv(B)).

coda([]).

coda([A]):-
phone(A),not(snt(A)).

coda([A]):-
phone(A),nas(A).

coda([A]):-
phone(A),snt(A),not(nas(A)),alv(A).

syllable(A,B):-
length(A,B),
syllable(A).