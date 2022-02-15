quicksort([],[]).
quicksort([H|Τ],Sorted) :-
  partition(H,T,Lower,Greater),
  quicksort(Lower,SortedLower),
  quicksort(Greater,SortedGreater),
  append(SortedLess,[H|SortedGreater],Sorted).
  
partition(_,[],[],[]).
partition(P,[H|Τ],[H|Less],Greater) :- 
  H=<P,
  partition(P,T,Less,Greater).
partition(P,[H|Τ],Less,[H|Greater]) :- 
  H>P,
  partition(P,T,Less,Greater).

