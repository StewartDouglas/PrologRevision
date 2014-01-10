:- use_module(library(lists)).

%Q1

my_last(H,[H|[]]).
my_last(X,[_|T]) :- my_last(X,T).

%Q2

my_second_last(Y,[Y,_|[]]).
my_second_last(Z,[_,Y|T]) :- my_second_last(Z,[Y|T]).

%Q3




%Q4

count_list([],0).
count_list([_|T],N) :- count_list(T,N1),
	               N is N1+1.

%Q5

rev_list([],Acc,Acc).
rev_list([H|T],Acc,X) :- rev_list(T,[H|Acc],X).

my_rev([H|T],Output) :- rev_list(T,[H],Output).

%Q6

palindrome(X) :- my_rev(X,X).

%Q7 INCOMPLETE

my_flatten([],Acc,Acc).
my_flatten([H|T],Acc,X) :- is_list(H),
	                   my_flatten(H,Acc,X).
my_flatten([H|T],Acc,X) :- my_flatten(T,Acc2,X).
                           append(Acc,H,Acc2).

my_flatten([H|T],X) :- my_flatten([H|T],[],X).

add_list([],[]).
add_list([H|T],X) :- append([H],L,X).
	             add_list(T,L).

%Q8

/*
compress([],Acc,Acc).
compress([H1,H2|T1],[H1|T2],Output) :- compress(T,Acc,Output).
compress([H1|T1],[H2|T2],Output) :- append([H2|T2],[H1],NewAcc),
	                            compress(T,NewAcc,Output).

compress([H|T],X) :- compress(T,[H],X).

*/