% What seems to be occurring is the morpheme or the final syllable for the morpheme for "he" is being reduplicated to indicate the pluralization of the agent of the verb.
% Therefore, producing "they" as opposed to "he".


samoan([ma,te],he).
samoan([no,fo],he).
samoan([ga,lu,e],he).
samoan([ta,nu],he).
samoan([a,lo,fa],he).
samoan([ta,o,to],he).
samoan([a,ta,ma,xi],he). %x is used in place of ? because of a compiler error :(

samoan(A,they) :-
    samoan(B,he),
    last(B,X),
    append(C,[X],B),
    last(C,Y),
    append(C,[Y],D),
    append(D,[X],A).
