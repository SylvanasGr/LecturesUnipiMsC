/*------------------------------------------------------------------------
Apo to Biblio:
I.Vlahavas, P.Kefalas, N.Basileiadis, F.Kokkoras, I.Sakellariou
Texnhth Nohmosunh (B' Ekdosh), Ekdoseis Gartaganh, Thessaloniki, 2005
http://aibook.csd.auth.gr
------------------------------------------------------------------------*/


/*------------------------------------------------------------
  A* SEARCH
-------------------------------------------------------------*/

goastar(Solution):-
	initial_state(IS),
	heuristic(IS,V),
	astar([V-[IS]],Solution).

astar([_-[State|Path]|_],[State|Path]):-
	goal(State).
astar([V-[State|Path]|RestPaths],Solution):-
	nl, write('Expanding best state :'), write(V-State),nl,
	expand(V-[State|Path],NewPaths),
	append(NewPaths,RestPaths,Frontier),
	keysort(Frontier,OrderedFrontier),
	astar(OrderedFrontier,Solution).

expand(_-[State|Path],NewPaths):-
	findall( Value-[NewState,State|Path],
			(
			operator(State,NewState),
			not(member(NewState,Path)),
			heuristic(NewState,HV),
			length(Path,L),
			Value is L+1+HV
			),
		NewPaths).

heuristic(State,V):-
	findall(Value,
			(goal(GoalState),h(State,GoalState,Value)),
	        AllValues),
	min(AllValues,V),!.

min([M],M):-!.
min([H|T],H):-
	min(T,M),
	H=<M.
min([H|T],M):-
	min(T,M),
	H>M.
