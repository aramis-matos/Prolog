phone(X,[cns]) :- atom_codes(X,[112]).
phone(X,[cns]) :- atom_codes(X,[116]).
phone(X,[cns]) :- atom_codes(X,[107]).
phone(X,[]) :- atom_codes(X,[97]).
phone(X,[]) :- atom_codes(X,[101]).
phone(X,[]) :- atom_codes(X,[105]).
phone(X,[]) :- atom_codes(X,[111]).
phone(X,[]) :- atom_codes(X,[117]).

syllable(X) :-
    onset(Y),
    nucleus(Z),
    append([Y],[Z],X).

onset(X) :- phone(X,[cns]).
nucleus(X) :- phone(X,[]).

% ?- syllable(X).
% X = [p, a] ;
% X = [p, e] ;
% X = [p, i] ;
% X = [p, o] ;
% X = [p, u] ;
% X = [t, a] ;
% X = [t, e] ;
% X = [t, i] ;
% X = [t, o] ;
% X = [t, u] ;
% X = [k, a] ;
% X = [k, e] ;
% X = [k, i] ;
% X = [k, o] ;
% X = [k, u].