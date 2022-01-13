/*----------------------------------------------*/
/* Depth First Algorithm with Path - no loop	*/
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
/* ?- depth_first(a0,d321).			*/
/* Try also :					*/
/* ?- depth_first(b1,c12). or other...		*/
/* Remove the comments from link(c12,a0)        */
/* and the algorithm is 'looping'.		*/
/*----------------------------------------------*/
 %% basic algorithm from search.pl  -- Section 2.16 of Prolog Tutorial

solve(P) :-
      start(Start),
      search(Start,[Start],Q),
      reverse(Q,P).

search(S,P,P) :- goal(S), !.         /* done                  */
search(S,Visited,P) :-
     next_state(S,Nxt),              /* generate next state   */
     safe_state(Nxt),                /* check safety          */
     no_loop(Nxt,Visited),           /* check for loop        */
     search(Nxt,[Nxt|Visited],P).    /* continue searching... */

no_loop(Nxt,Visited) :-
      \+member(Nxt,Visited).                   

safe_state(Nxt) :- write('Kombos='),write(Nxt),nl.

next_state(S,Nxt) :- link(S,Nxt).


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

start(a0).
goal(c32).

reverse([],[]).
reverse([X|Xs],Z) :- reverse(Xs,Ys), append(Ys,[X],Z).



