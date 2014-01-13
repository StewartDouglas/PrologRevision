:-use_module(library(lists)).


% child_mother(C, M) means C is a child of mother M.
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

child_mother(amy, mary).
child_mother(arthur, mary).
child_mother(angel, jane).
child_mother(anton, rita).
child_mother(alan, rita).
child_mother(axel, susan).
child_mother(ann, tina).


% age(C, A) means C is of age A.
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

age(amy, 6).
age(arthur, 15).
age(angel, 16).
age(anton, 4).
age(alan, 8).
age(axel, 16).
age(ann, 4).

% employed(X) means X is employed.
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

employed(susan).
employed(rita).

%Q1

ecb(M) :- child_mother(C,M),
	  age(C,N),
	  N =< 14.
ecb(M) :- child_mother(C,M),
	  \+employed(M),
	  age(C,N),
	  N > 14,
	  N =< 16.

mother_of_the_youngest(M) :- setof(A-M,C^(child_mother(C,M),age(C,A)),L),L=[A-M|_].

mother_of_young(LM) :- setof(M,(C^A^(child_mother(C,M),age(C,A),A =< 10)),LM).

merge([],[],[]).
merge([],X,X).
merge(X,[],X).
merge([H1|T1],[H2|T2],[H1|T3]) :- H1 < H2,
	                             merge(T1,[H2|T2],T3).
merge([H1|T1],[H2|T2],[H2|T3]) :- H1 >= H2,
	                             merge([H1|T1],T2,T3).

findElement(1,[H|T],H).
findElement(N,[_|T],Output) :- N > 1,
	                       M is N - 1,
	                       findElement(M,T,Output).