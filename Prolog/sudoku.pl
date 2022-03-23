/* For this solution we need to use the library clpfd */
/* For more documentation about this library please use this link -> https://www.swi-prolog.org/man/clpfd.html */
:- use_module(library(clpfd)).

sudoku(Rows) :-
	% Rows must be at least length of 9
        length(Rows, 9),
	% Each of a row must has the same length as the list rows so thats why we use same_length.
        maplist(same_length(Rows), Rows),
	% The concatenation of all elements of the list is an intenger between in range [1,9].
        append(Rows, Vs), Vs ins 1..9,
	% We use all_distinct with maplist to defind that every row can't have the same number in above range twice.
        maplist(all_distinct, Rows),
	% transpose turns the rows into columns so the columns are now rows.
        transpose(Rows, Columns),
	% so we use maplist with all distinct now for the columns.
        maplist(all_distinct, Columns),
	% Now we give names in each rows.
        Rows = [As,Bs,Cs,Ds,Es,Fs,Gs,Hs,Is],
	% and we split each block by three elements
        blocks(As, Bs, Cs),
        blocks(Ds, Es, Fs),
        blocks(Gs, Hs, Is).

/* We need to define the usage of blocks &	 */
/* We need to pass three Empty list's []	 */
/* The reason of using block is to ensure each block 3x3 to contain distinct intengers in every combination in range [ ins 1..9]  */
/* Example [1,2,3,4,5,6,7,8,9] == TRUE; 	 */
/* Example [1,2,3,3,5,6,7,8,9] == FALSE; 	 */
/* Example [9,1,2,4,5,6,8,7,3] == TRUE;  	 */
blocks([], [], []).
blocks([N1,N2,N3|Ns1], [N4,N5,N6|Ns2], [N7,N8,N9|Ns3]) :-
        all_distinct([N1,N2,N3,N4,N5,N6,N7,N8,N9]),
        blocks(Ns1, Ns2, Ns3).

/* For clear console screen */
cls :- write('\e[H\e[2J').

/* hardest
Rows=[[_,_,_,_,2,_,7,_,8],
      [_,7,_,_,_,9,_,1,_],
      [_,3,1,_,_,_,_,4,_],
      [9,_,_,4,5,_,_,2,6],
      [_,_,_,_,_,_,_,_,_],
      [_,_,_,_,_,_,_,_,_],
      [_,_,_,_,_,_,9,6,_],
      [_,2,_,_,_,_,_,_,_],
      [_,_,_,1,7,_,_,_,_]],sudoku(Rows),maplist(label,Rows),maplist(portray_clause,Rows).
*/