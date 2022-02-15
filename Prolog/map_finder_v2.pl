/*----------------------*/
/* Map Planner		*/
/*----------------------*/
go1 :- map_path((1,1),(5,2),[],1,100,Path), print_path(Path).

/*----------------------------------------------*/
/* Map Data				*/
/*----------------------------------------------*/
mymap(
% Column,X 1 2 3 4 5 6 7   Line,Y
	[ [0,0,0,0,w,w,0], 	% 1
	  [0,0,0,0,0,0,0], 	% 2
	  [0,w,0,w,0,0,w], 	% 3
	  [0,0,0,0,0,w,w],	% 4
	  [0,w,w,w,w,w,w],	% 5
	  [0,0,w,0,0,w,w]	% 6
	]).

/*----------------------------------------------*/
/* Map Path finder				*/
/*  ?- map_path((1,1),(5,2),[],1,10,Path).	*/
/*----------------------------------------------*/

/* Terminal Conditions */
map_path(Finish,Finish,_,_,_,[]) :- write(" Solution Found"),nl,!.
map_path(_,_,_,Max,Max,[]) :- write(" Max Counter reached"),nl,!.

/* Recursive call */
map_path(Start, Finish, Visited, Counter, Max,[(Direction,Start,Next)|Rest]) :- 
	move(Direction,Start,Next),
%	valid(Next,E),	<--- we moved valid in move
	not(member(Next,Visited)),
	Counter1 is Counter+1,
	map_path(Next, Finish,[Next|Visited],Counter1,Max,Rest).



/*------------------------------------------------------*/
/* Pws mporw na kinhthw ??? North - East - South - West */
/*   North-West	  North	North-East			*/
/*		    Λ					*/
/*		    |					*/
/*   	   West <- Here -> East				*/
/*		    |					*/
/*		    V					*/
/*    South-West  South	South-East			*/
/*------------------------------------------------------*/
move(north,	(C,L), (C1,L1)) :- C1 is C,   L1 is L-1, valid((C1,L1),E).% North
move(north_east,(C,L), (C1,L1)) :- C1 is C+1, L1 is L-1, valid((C1,L1),E).% North-East
move(east,    	(C,L), (C1,L1)) :- C1 is C+1, L1 is L,   valid((C1,L1),E).% East
move(south_east,(C,L), (C1,L1)) :- C1 is C+1, L1 is L+1, valid((C1,L1),E).% South-East
move(south,	(C,L), (C1,L1)) :- C1 is C,   L1 is L+1, valid((C1,L1),E).% South
move(south_west,(C,L), (C1,L1)) :- C1 is C-1, L1 is L+1, valid((C1,L1),E).% South-West
move(west,	(C,L), (C1,L1)) :- C1 is C-1, L1 is L,   valid((C1,L1),E).% West
move(north_west,(C,L), (C1,L1)) :- C1 is C-1, L1 is L-1, valid((C1,L1),E).% North-West

valid(Next,E) :-
	mymap(Map),
	Next=(C,L), 
	in_map(Map, C, L),
	nth_map(Map, C, L, E),
	E=0.

in_map(Map, C, L) :- 
	length(Map,MaxL),
	Map=[Head|_Tail], length(Head,MaxC),
	1=<C, C=<MaxC, 1=<L, L=<MaxL.

/*--------------------------------------*/
/* Poio einai to (3,4) tou xarth ? 	*/
/* Column = 3, Line = 4 => einai to 0 	*/
/*--------------------------------------*/
nth_map(Map, C, L, Element) :-
	nth_element(Map, L, Line),
	nth_element(Line, C, Element), !.

/* Den xreiazetai	*/
map_position(Map, Element, C, L) :-
	element_position(Map, Line, L),
	element_position(Line, Element, C).

/*====== End of Map Planner ======*/

/*----------------------------------------------*/
/* Βρισκει το Ν-οστο στοιχειο μιας λιστας	*/
/* nth_element(List, N, Element) 		*/
/* List, N : input, Element : output 		*/
/*----------------------------------------------*/
nth_element([Head|_], 1, Head).
nth_element([_|Tail], N, E) :- 
	M is N-1,
	nth_element(Tail, M, E).

/*---------------------------------------*/
/* Den xreiazetai			 */
/*---------------------------------------*/
/* Βρισκει σε ποιά θέση N της λίστας List*/
/* βρίσκεται το στοιχείο Ε		 */
/* element_position(List, Element, N) 	 */
/* List, Element : input, N : output     */
/*---------------------------------------*/
element_position([Head|_], Head, 1).
element_position([_Head|Tail], E, N) :- 
	element_position(Tail, E, M),
	N is M+1.

print_list([]) :- !.
print_list([X|Xs]) :- 
	write(X), write(","), print_list(Xs).

print_path([]) :- write("Finished"),nl, !.
print_path([(Direction,(C,L),(C1,L1))|Xs]) :- 
	write((C,L)), write(" , "),
	write(Direction),write(" , "),write((C1,L1)),write(" => "),nl,
	print_path(Xs).















