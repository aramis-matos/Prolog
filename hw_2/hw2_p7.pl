:- [phone].
:- [properties].

% [voi,cnt,]

a :- 
    sib(X),not(voi(X)).

b :- 
    cnt(X),not(bck(X)),not(cns(X)),not(ctr(X)).

% Need to have at least one non-negated predicate. Output includes ʌ, no idea why since it's the low-mid back unrounded vowel

c :-
    lab(X),not(cnt(X)).