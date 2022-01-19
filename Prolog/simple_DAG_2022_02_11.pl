/* Directed Acyclic Graph */

/* Facts 			  */
/* relation(atom1, atom2,...). */
edge(a,b).
edge(b,c).
edge(b,d).
edge(c,e).
edge(c,f).
edge(f,i).

/* Rule				*/
/* rel1(a1, a2,...) :- 
	rel2(at3,...), 
	...,
	reln(atn1,...).
*/
connected(X,Y) :- edge(X,Y).
connected(X,W) :- 
	edge(X,Y),
	connected(Y,W).

/* Lists */

/* ?-sum([2,3,-4],[5,-6,7],Z). 	*/
/* Z=[7, -3, 3].		   	*/

/* ?-mul([2,3,-4],[5,-6,7],Z). 	*/
/* Z=[10, -18, -28].		*/

/* ?-sumlist([2,3,-4],Z). 		*/
/* Z=1.			   	*/

/* ?-multiplylist([2,3,-4],Z). 	*/
/* Z=-24.			*/

/* ?- internal_product1([1,2,0],[3,4,5],X).	*/
/* X = 11				*/

/* ?- internal_product2([1,2,0],[3,4,5],X).	*/
/* X = 11				*/

sum([], [], []).
sum([H1|T1], [H2|T2], [H|T] ) :-
	H is H1+H2,
	sum(T1,T2,T).

mul([], [], []).
mul([H1|T1],[H2|T2],[H|T]) :-
        H is H1*H2,
        mul(T1,T2,T).

/* athroisma stoixeiwn listas */
/* ?- sumlist([2,3,4],X). */
/* X=9		      */
sumlist([],0). 
sumlist([H|T], R) :-
	sumlist(T,S),
	R is H+S.

multiplylist([],1). 
multiplylist([H|T], R) :-
	multiplylist(T,S),
	R is H*S.


/* esoteriko_ginomeno */
/* ?- internal_product([1,2,0],[3,4,5],X). */
/* X = 1*3+2*4+0*5 =11		    */
/* ?- internal_product([1],[3],X). */
/* X = 1*3 =3		    */

/* [7:40 PM] KONSTANTINOS KOLIOS */
/* ?- internal_product1([1,-2,3],[4,5,6],X). */
internal_product1([], [], 0).
internal_product1([H1|T1], [H2|T2], X) :-
	H is H1*H2,
	internal_product1(T1,T2,R),
	X is H + R.

/* [7:31 PM] ΜΑΞΙΜΟΣ ΕΝΡΙΚΟΣ ΝΙΚΗΦΟΡΑΚΗΣ */
/* ?- internal_product2([1,-2,3],[4,5,6],X). */
internal_product2(L1, L2, R) :-
	mul(L1, L2, L3), sumlist(L3, R).

/* first_element(List,First) 			*/
/* ?- first_element([1,2,3,4],X).		*/
/* X=1					*/

    first_element([X|Y], X).

/* last_element(List,First) 			*/
/* ?- last_element([1,2,3,4],X).		*/
/* X=4					*/

last_element([X],X).
last_element([X|Y],Z) :- 
	write(X), write(" "),write(Y),nl,
	last_element(Y,Z).
/*
         [1,2,3,4]
[X|Y] = [1,2,3,4] => X=1, Y=[2,3,4]
*/

/*************************************/
/* add_list(List, S) 		*/
/* ?- add_list([1,2,5,7],S).		*/
/* S=15				*/
/*************************************/
% Sxolio mias grammis

add_list([X],X) :- 
	write("Terma "),
	write("X="),write(X),write(" "),nl.
add_list([X|Y],S) :-
	write("X="),write(X), write(" "), 
	write("Y="),write(Y), write(" "), nl,
	add_list(Y,K),
	write("K="),write(K), write(" "),nl,
	S is X+K,
	write("S="),write(S), write(" ").

add_list2([X],X).
add_list2([X|Y],S) :- add_list2(Y,K), S is X+K.


p(a).
p(b).
q(X) :- r(X).
r(b).
r(a).
s(X,Y) :- p(X), q(Y).

/*
?- s(X,Y).

*/

/* A is member of the list [A|Tail] because it is 	*/
/* the first element of the list [A|Tail] 	*/
mymember1(A,[A|Tail]).
mymember1(A,[Head|Tail]) :- mymember1(A,Tail).


mymember2(A,[Head|Tail]) :- 
	A = Head; mymember2(A,Tail).

/* nth_element(List, N, Element) */
/* List, N : input, Element : output */

nth_element([Head|Tail], 1, Head).
nth_element([Head|Tail], N, E) :- 
	M is N-1,
	nth_element(Tail, M, E).

/* element_position(List, Element, N) */
/* List, Element : input, N : output */

element_position([Head|Tail], Head, 1).
element_position([Head|Tail], E, N) :- 
	element_position(Tail, E, M),
	N is M+1.


















