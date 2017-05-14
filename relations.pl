parent(pam,bob).
parent(tom,bob).
parent(tom,liz).
parent(bob,ann).
parent(bob,pat).
parent(pat,jim).
female(pam).
female(ann).
female(pat).
female(liz).
male(tom).
male(bob).
male(jim).
mother(X,Y) :- parent(X,Y), female(X).
father(X,Y) :- parent(X,Y), male(X).
brother(X,Y) :- parent(Z,X), parent(Z,Y), X\=Y.
raining(ny).
wet(X) :- raining(X).
ancestor(X,Y) :- parent(X,Y).
ancestor(X,Y) :- parent(X,Z), ancestor(Z,Y).
edge(1,2).
edge(2,3).
edge(3,4).
reach(X,Y) :- edge(X,Y).
reach(X,Y) :- edge(X,Z), reach(Z,Y).
/* member function*/
member(X, [X|_]).
member(X, [_|Ys]) :- member(X, Ys).
/* append function */
append([],L,L).
append([X|L], M, [X|N]) :- append(L,M,N).

/* len function */
len([], 0).
len([_|Xs], M) :- len(Xs, N), M is N+1.

/* factorial function */
factorial(N,X) :- ( N > 0
  -> N1 is N -1 , factorial(N1, X1), X is N * X1
  ; X is 1
  ).

/* mydelete */
mydelete([],_,_) :- fail.
mydelete([X|Ys], X, Ys).
mydelete([Y|Ys], X, [Y|Zs]) :- mydelete(Ys,X,Zs).


/* permutation */
permute([],[]).
permute([X|Xs],Ys) :- permute(Xs, Zs), delete(Ys, X, Zs).

/* reverse */
rev([], []).
rev([X|Xs],Ys) :- rev(Xs, Zs), append(Zs, [X], Ys).

/* reverse faster */
rev1(L1,L2) :- rev1(L1, [] , L2).
rev1([X|Xs], AccBef, AccAft) :- rev1(Xs, [X|AccBef], [X|AccAft]).
rev1([], Acc, Acc). 
