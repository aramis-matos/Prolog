:- [phone].
:- [properties].

traits([cns,snt,nas,voi,cnt,lab,alv,pal,ant,vel,cor,sib,hih,mid,low,bck,ctr]).

has_properties([],_,[]).
has_properties([P|Ps], X, Ans) :-        
    call(P,X),
    has_properties(Ps,X,Ans).
