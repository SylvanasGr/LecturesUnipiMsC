%------------------------------------------------------------------------------%
% Stream selection and logging to currently-active output stream.              %
%------------------------------------------------------------------------------%

log_file('c:/log.txt').

begin_output_to_file:-
	log_file(File),
	tell(File).

begin_output_to_stdout:-
	tell(user_output).

end_output:-
	told.

log_message(Message):-
	write(Message), nl.


%------------------------------------------------------------------------------%
% Log the contents of a list.                                                  %
%------------------------------------------------------------------------------%

log_list_members([]).
log_list_members([Xs|Xr]):-
	log_message(Xs),
	log_list_members(Xr).


%------------------------------------------------------------------------------%
% Read from the currently-active input stream and write it to the              %
% currently-active output stream.                                              %
%------------------------------------------------------------------------------%

read_and_output_term:-
	read(Term),
	write('You typed "'),
	write(Term),
	write('"'), nl.


%------------------------------------------------------------------------------%
% Dump the contents of a file to the currently-active stream.                  %
%------------------------------------------------------------------------------%

dump_file_contents(File):-
	see(File),
	write('--- BEGIN ---------------'), nl,
	dump_chars,
	seen.

dump_chars:-
	at_end_of_stream, nl,
	write('--- END -----------------'), nl.
dump_chars:-
	get_char(Char),
	put_char(Char),
	dump_chars.


%------------------------------------------------------------------------------%
% Read a line of text terminated with a newline from the currently-active      %
% input stream and write it to the currently-active output stream              %
%                                                                              %
% TODO: Create a better version of write_line/1 to print lines read with       %
% read_line as text                                                            %
%------------------------------------------------------------------------------%

read_line(Line):-
	get_char(FirstChar),
	get_rest(FirstChar, Line).

get_rest('\n', []):-
	!.
get_rest(Char, [Char|RestChars]):-
	get_char(NextChar),
	get_rest(NextChar, RestChars).

write_line(Line):-
	write('You typed "'),
	write(Line),
	write('"'), nl.
