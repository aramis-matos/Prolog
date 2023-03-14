spanish([m,o,m,e,n,t],[stem]).
spanish([p,o,k],[stem]).
spanish([l,i,b,r],[stem]).
spanish([i,t],[affix, diminutive, true]).
spanish([i,k],[affix,diminutive, alt]).
spanish([o],[affix, masculine]).

spanish(A,[stem]):-
    append(B,C,A),
    last(B,t),
    spanish(C,[affix, diminutive, alt]),
    spanish(B,[stem]).

spanish(A,[stem]):-
    append(B,C,A),
    spanish(C,[affix, diminutive,true]),
    spanish(B,[stem]),
    \+last(B,t).

spanish(A,[noun, masculine]):-
    append(B,C,A),
    spanish(B,[stem]),
    spanish(C,[affix, masculine]).
