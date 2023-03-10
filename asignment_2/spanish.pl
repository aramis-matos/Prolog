spanish([adan],[nounphrase],[adam],[entity]).
spanish([eva],[nounphrase],[eve],[entity]).
spanish([rie],[verb,intransitive],[laughs],[property]).
spanish([llora],[verb,intransitive],[cries],[property]).
spanish([mira],[verb,transitive],[watches],[relation]).
spanish([ayuda],[verb,transitive],[helps],[relation]).

spanish(A,[verbphrase],B,[property]):-
	spanish(A,[verb,intransitive],B,[property]).

spanish(A,[verbphrase],B,[property]):-
	spanish(C,[verb,transitive],D,[relation]),
	spanish(E,[nounphrase,accusative],F,[entity]),
	append(C,E,A),
	append(D,F,B).

spanish(A,[sentence],B,[proposition]):-
	spanish(C,[nounphrase],D,[entity]),
	spanish(E,[verbphrase],F,[property]),
	append(C,E,A),
	append(D,F,B).

spanish(A,[nounphrase,accusative],B,[entity]):-
	spanish(C,[nounphrase],B,[entity]),
	append([a],C,A).