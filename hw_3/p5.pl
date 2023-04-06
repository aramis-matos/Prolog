% Prefix: yi-, ma-
% Suffix: -al, -o
% Circumfix: X-a-Ya
% Transposition: ABCD -> ACBD ; ABC -> ACB
% Gemination: A -> AA


amharic([l,a,b,s],[verb,stem]).
amharic([k,a,f,t],[verb,stem]).
amharic([w,a,d,d],[verb,stem]).
amharic([y,i],[prefix]).
amharic([m,a],[prefix]).
amharic([a,l],[suffix]).
amharic([o],[suffix]).
amharic([a,a],[circumfix]). 


amharic(Verb,[verb,perfective]) :-
    amharic(A,[verb,stem]),
    amharic([B,C],[circumfix]),
    splitStem(A,First,Last),
    last(First,F),
    append(First,[F],G),
    append(G,[B],D),
    append([Last],[C],E),
    append(D,E,Verb).

amharic(Verb,[verb,imperfective]) :-
    amharic(A,[verb,stem]),
    amharic(B,[prefix]),
    amharic(C,[suffix]),
    B = [y,i],
    C = [a,l],
    append(B,A,D),
    append(D,C,Verb).

amharic(Verb,[verb,gerundive]) :-
    amharic(A,[verb,stem]),
    amharic(B,[suffix]),
    B = [o],
    append(A,B,Verb).

amharic(Verb,[verb,jussive]) :-
    amharic(A,[verb,stem]),
    amharic(B,[prefix]),
    B = [y,i],
    transposition(A,C),
    append(B,C,Verb).

amharic(Verb,[verb,infinitive]) :-
    amharic(A,[verb,stem]),
    amharic(B,[prefix]),
    B = [m,a],
    transposition(A,C),
    append(B,C,Verb).

splitStem(A,First,Last) :-
    last(A,Last),
    append(First,[Last],A).

transposition([A,B,C,D],[A,C,B,D]).
