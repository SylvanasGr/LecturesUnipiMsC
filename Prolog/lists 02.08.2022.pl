cls :- write('\e[2J').

/*--------------------------------------*/
/* even_numbers(List, Even) 		*/
/* ?-even_numbers([12,31,2], Even). 	*/
/* Even=[12,2]			    	*/
/*--------------------------------------*/

even_number([],[]).

even_number([X|Xs], [X|Even]) :-
	0 is X mod 2, 
	even_number(Xs, Even).

even_number([X|Xs], Even) :-
	1 is X mod 2, 
	even_number(Xs, Even).

% X is Head mod 2, X=0 zygos (even)
% X is Head mod 2, X=1 monos (odd)

odd_number([],[]).

odd_number([X|Xs], Odd) :-
	0 is X mod 2, 
	odd_number(Xs, Odd).

odd_number([X|Xs], [X|Odd]) :-
	1 is X mod 2, 
	odd_number(Xs, Odd).

/* LYSH ANDREAS, KOSTAS, KOSTAS, XARITON */
even_odd_number([],[],[]).

even_odd_number([X|Xs], Even, [X|Odd]) :-
	1 is X mod 2, 
	even_odd_number(Xs, Even, Odd).

even_odd_number([X|Xs],[X|Even], Odd) :-
	0 is X mod 2, 
	even_odd_number(Xs,Even,Odd).

/* LYSH MAXIMOS */
even_odd(List, Even, Odd) :- 
even_number(List, Even), 
odd_number(List, Odd).


/* myselect(X, List, NewList).		*/
/* ?- myselect(a, [a,b,c,d,e,f], L).	*/
/* L=[b,c,d,e,f]			*/

mymember(X,[X|Xs]).
mymember(X,[Y|Xs]) :- mymember(X,Xs).

/* 
         X [X|Xs]          Xs
         a [a|[b,c,a,e,f]] [b,c,a,e,f]
*/

myselect(X,[X|Xs],Xs).
myselect(X,[Y|Xs],[Y|Rest]) :-
	myselect(X,Xs,Rest).

/* delete(List, X, NewList)			*/
/* deletes one X from L and produces NewList	*/

delete1(X, List, New) :- select(X, List, New).


deleteall(X,[],[]).
deleteall(X,[Y|Xs],Rest) :-
	X=Y,
	deleteall(X,Xs,Rest).
deleteall(X,[Y|Xs],[Y|Rest]) :-
	X\=Y,
	deleteall(X,Xs,Rest).


/* replace(List,x, y, New)			*/
/* in List replace x with y to produce New */
/* ?- replace([a,b,c,a,d,a],a,f,F).		*/
/* F=[f,b,c,a,d,a];				*/
/* F=[a,b,c,f,d,a];...				*/

/* replace_all(List,x, y, New)			*/
/* in List replace all x with y to produce New	*/
/* ?- replace_all([a,b,c,a,d,a],a,f,F).		*/
/* F=[f,b,c,f,d,f]				*/

/* delete_all(List,X, NewList)			*/
/* deletes all X from L and produces NewList	*/

/* duplicate(List, NewList)			*/
/* ?- duplicate([a,b,c], L)			*/
/* L=[a,a,b,b,c,c]				*/

/* flatten_one_level(List,F)			*/
/* ?- flatten_one_level([a,[b,c],d],F).		*/
/* F=[a,b,c,d]					*/

/* flatten(List,F)				*/
/* flatten([a,b,[c,[d,e,[f]]],g],F).		*/
/* F=[a,b,c,d,e,f,g]				*/

/* permutation(List, NewList)			*/

/* protos(Number)				*/
/* protoi(List, Protoi)				*/
/* analysh_se_ginomeno_prwtwn_paragontwn, agpp	*/
/* agpp(List,Prwtoi_Paragontes)			*/

/* mkd(N1, N2, MKD)				*/
/* ekp(N1, N2, MKD)				*/


/*
Akolouthies, arithmitikes proodoi
a(0) = 2
a(n) = a(n-1)+7
2 9 16 23 ....
*/

aa(0,2).
aa(N,S) :- M is N-1, aa(M, K), S is K+7.

aa_all(Counter,Max) :- Counter is Max+1.
aa_all(Counter,Max) :-
	aa(Counter,X), 
	write(Counter),write(". "),write(X),nl,
	Counter1 is Counter +1,
	aa_all(Counter1,Max).


/* gewmetriki proodos 
g(0) = 2
g(n) = g(n-1)*7
2 14 28 56 ...
*/


/*
1 1 2 3 5 8 13 ....
fibonacci
f(0)=1
f(1)=1,
f(n) = f(n-1) + f(n-2)
*/

fibonacci(0,1).
fibonacci(1,1).
fibonacci(N,R) :-
	M is N-2, P is N-1,
	fibonacci(M, A), 
	fibonacci(P, B), 
	R is A+B.

fibonacci_all(Counter,Max) :- Counter is Max+1.
fibonacci_all(Counter,Max) :-
	fibonacci(Counter,X), 
	write(Counter),write(". "),write(X),nl,
	Counter1 is Counter +1,
	fibonacci_all(Counter1,Max).


knowledgebase([
	p(a),
	p(b),
	q(c),
	q(a),
	if(r(X,Y),[p(X),q(Y)]),
	if(s(X), [p(X),q(X)])
	]).

prove(Q, Reason) :- 
	knowledgebase(KB), 
	solve(KB,Q, Reason).

solve(KB, P, fact(P)) :- 
	member(Q, KB).
/* {Q <- P, P} => Q */
solve(KB, Q, rule(Q,if,Reason)) :- 
	member(if(Q,P),KB), 
	solve(KB, P, Reason).

solvelist(KB,[],[]).
solvelist(KB,[P|Ps],[R|Rest]) :- 
	solve(KB,P,R),
	solvelist(KB,Ps,Rest).













