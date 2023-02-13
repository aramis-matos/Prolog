xVoicesYin('Ayako Kawasumi','Saber','Melty Blood: Type Lumina').
xVoicesYin('Ayako Kawasumi','Shenhe','Genshin Impact').
xVoicesYin('Ayako Kawasumi','Siege','Arknights').
xVoicesYin('Yui Ishikawa','2B','Nier: Automata').
xVoicesYin('Yui Ishikawa','Liskarm','Arknights').
xVoicesYin('Yui Ishikawa','Violet Evergarden','Violet Evergarden').

xVoicesInSeriesY(VA,X) :- xVoicesYin(VA,_,X).

xIsY(Char1,Char2) :- xVoicesYin(X,Char1,_),xVoicesYin(X,Char2,_). 


listXisY(Target,[Char|Chars]) :- findall(X,xIsY(Target,X),[Char|Chars]).

listXVoicesInSeriesY(VA,[Serie|Series]) :- findall(X,xVoicesInSeriesY(VA,X),[Serie|Series]).