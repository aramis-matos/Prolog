human(homer). 
human(patty). 
human(lisa). 
human(ned). 
human(marge). 
human(selma). 
human(bart). 
human(milhouse). 
male(homer). 
male(bart). 
male(ned). 
male(milhouse). 
adult(patty).
adult(homer).
adult(marge).
adult(selma).
adult(ned).
husband(homer,marge). 

female(X) :- \+male(X).
child(X) :- \+adult(X).
man(X) :- human(X),male(X),adult(X).
boy(X) :- human(X),male(X),child(X).
girl(X) :- human(X),female(X),child(X).
woman(X) :- human(X),female(X),adult(X).