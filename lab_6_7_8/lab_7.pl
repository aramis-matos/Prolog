:- [lab_6].
% :- use_rendering(svgtree, [list(false)]).		

:- table np/4, vp/4, pp/4, ap/4, dp/4, ip/4.	



c0(c0(ec),[decl]) --> [].			
i0(i0(fin),[[nom],_,_]) --> [].		

intp(intp(Intbar),_) --> intbar(Intbar).
intbar(intbar(Int0)) --> int0(Int0,_).
ap(ap(Abar),_) --> abar(Abar).
ap(_,(Abar)) --> abar(_,Abar).
abar(abar(A0)) --> a0(A0,_).
abar(I0,abar(A0)) --> intp(I0,_),a0(A0,_).
np(np(Np),_) --> nbar(Np).
nbar(nbar(N0),AP) --> n0(N0,_),ap(AP,_).
nbar(nbar(N0)) --> n0(N0,_).
dbar(dbar(D0),NP) --> d0(D0,_),np(NP,_).
dp(dp(Dbar),_) --> dbar(Dbar,_).		
    					
