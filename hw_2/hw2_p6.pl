:- [phone].
:- [properties].

a(X,List) :- findall(X,(
    phone(X), 
    not(cnt(X)), 
    not(pal(X)),
    not(nas(X))),
    List
).

b(X,List) :- findall(X,(
    phone(X),
    not(cns(X)),
    low(X)),
    List
).

c(X,List) :- findall(X,(
    phone(X),
    cnt(X),
    alv(X),
    pal(X)),
    List
).

d(X,List) :- findall(X,(
    phone(X),
    snt(X),
    not(alv(X)),
    not(nas(X))),
    List
).