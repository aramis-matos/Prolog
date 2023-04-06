% A.
n0(n0(científico),[[com,hum],[m,3,s],[]]) --> [científico].
n0(n0(científica),[[com,hum],[f,3,s],[]]) --> [científica].
n0(n0(lingüista),[[com,hum],[_,3,s],[]]) --> [lingüista].
n0(n0(gato),[[com,anim],[m,3,s],[]]) --> [gato].
n0(n0(gata),[[com,anim],[f,3,s],[]]) --> [gata].
n0(n0(parque),[[com,inanim],[m,3,s],[]]) --> [parque].
n0(n0(telescopio),[[com,inanim],[m,3,s],[]]) --> [telescopio].
n0(n0(observatorio),[[com,inanim],[m,3,s],[]]) --> [observatorio].
n0(n0(biblioteca),[[com,inanim],[m,3,s],[]]) --> [biblioteca].
n0(n0(noam),[[prop,hum],[m,3,s],[]]) --> [noam].
n0(n0(noston),[[prop,loc],[m,3,s],[]]) --> [boston].


a0(a0(famoso),[[],[m,3,s],[]]) --> [famoso].
a0(a0(famosa),[[],[f,3,s],[]]) --> [famosa].
a0(a0(inteligente),[[],[_,3,s],[]]) --> [inteligente].
a0(a0(simpático),[[],[m,3,s],[]]) --> [simpático].
a0(a0(simpática),[[],[f,3,s],[]]) --> [simpática].

% B.
d0(do(el),[[nom,acc,obl],[m,3,s],[unp]]) --> [el]. 
d0(d0(la),[[nom,acc,obl],[f,3,s],[unp]]) --> [la]. 
d0(d0(los),[[nom,acc,obl],[m,3,p],[unp]]) --> [los]. 
d0(d0(las),[[nom,acc,obl],[f,3,p],[unp]]) --> [las]. 
d0(d0(un),[[nom,acc,obl],[m,3,s],[unp]]) --> [un]. 
d0(d0(una),[[nom,acc,obl],[f,3,s],[unp]]) --> [una]. 
d0(d0(unos),[[nom,acc,obl],[m,3,p],[unp]]) --> [unos]. 
d0(d0(unas),[[nom,acc,obl],[f,3,p],[unp]]) --> [unas]. 
d0(d0(su),[[acc,obl,gen],[_,3,s],[unp]]) --> [su]. 
d0(d0(sus),[[acc,obl,gen],[_,3,p],[unp]]) --> [sus]. 

% C.
d0(d0(él),[[nom,obl],[m,3,s],[]]) --> [él].
d0(d0(ella),[[nom,obl],[f,3,s],[]]) --> [ella].
d0(d0(ellos),[[nom,obl],[m,3,p],[]]) --> [ellos].
d0(d0(ellas),[[nom,obl],[f,3,p],[]]) --> [ellas].
d0(d0(pro),[[nom,obl],[_,3,_],[]]) --> [pro].

% D.
p0(p0(en),[[obl,udp]]) --> [en].
p0(p0(con),[[obl,udp]]) --> [con].
p0(p0(para),[[obl,udp]]) --> [para].
p0(p0(a),[[obl,udp]]) --> [a].
p0(p0(al),[[obl,unp]]) --> [al].
p0(p0(de),[[obl,udp]]) --> [de].
p0(p0(del),[[obl,unp]]) --> [del].

% E.
v0(v0(vio),[[pret],[_,3,s],[udp],[acc]]) --> [vio].
v0(v0(vieron),[[pret],[_,3,p],[udp],[acc]]) --> [vieron].
v0(v0(conoció),[[pret],[_,3,s],[udp],[acc]]) --> [conoció].
v0(v0(conocieron),[[pret],[_,3,p],[udp],[acc]]) --> [conocieron].
v0(v0(saludó),[[pret],[_,3,s],[udp],[acc]]) --> [saludó].
v0(v0(saludaron),[[pret],[_,3,p],[udp],[acc]]) --> [saludaron].
v0(v0(llegó),[[pret],[_,3,s],[upp],[acc]]) --> [llegó].
v0(v0(llegaron),[[pret],[_,3,p],[upp],[acc]]) --> [llegaron].
v0(v0(vivia),[[pret],[_,3,s],[upp],[acc]]) --> [vivia].
v0(v0(vivian),[[pret],[_,3,p],[upp],[acc]]) --> [vivian].
v0(v0(estaba),[[pret],[_,3,s],[upp],[acc]]) --> [estaba].
v0(v0(estaban),[[pret],[_,3,p],[upp],[acc]]) --> [estaban].
v0(v0(habia),[[pret],[_,3,s],[udp],[acc]]) --> [habia].