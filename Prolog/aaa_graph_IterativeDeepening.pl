/*----------------------------------------------*/
/* Iterative Deepening Algorithm		*/
/* Author : Themis Panayiotopoulos 		*/
/* November 2010				*/
/*----------------------------------------------*/
/* Artificial Intelligence Module        	*/
/* Msc Course on Advanced Information Systems	*/
/*						*/
/* Logic Programming Module			*/
/* Msc Course on Informatics			*/
/*						*/
/* Department of Informatics			*/
/* University of Piraeus			*/
/*----------------------------------------------*/
/*----------------------------------------------*/
/* Example query 				*/
/* ?- iterative(a0).				*/
/* Try also :					*/
/* ?- iterative(b1). or other...		*/
/*----------------------------------------------*/

/*----------------------------------------------*/
/* Search Tree					*/
/*----------------------------------------------*/

link(a0,b1).
link(a0,b2).
link(a0,b3).
link(b1,c11).
link(b1,c12).
link(b2,c21).
link(b2,c22).
link(b3,c31).
link(b3,c32).
link(c11,d111).
link(c12,a0).
%link(b1,b2).
%link(b2,b3).

/*----------------------------------------------*/
/* Finish Symbol				*/
/*----------------------------------------------*/
finish(c32).

/*----------------------------------------------*/
/* Iterative Deepening Algorithm		*/
/*----------------------------------------------*/
iterative(X) :- deepening(X,1).

deepening(X,N) :- 
	write('New Iteration till layer '),write(N),nl, 
	iterate(X,N), !.
deepening(X,N) :-
	M is N+5,
	deepening(X,M).
	

iterate(X,N) :- 
	N>0,
	write('Kombos='),write(X),nl,
	finish(X),
	write('Lysh='),write(X),nl.

iterate(X,N) :- 
	N>0,
	link(X,Y),
	M is N-1,
	iterate(Y,M).
/*----------------------------------------------*/




