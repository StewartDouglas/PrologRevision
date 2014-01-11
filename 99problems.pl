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

%Q9

pack([],[]).
pack([X|Xs],[Z|Zs]) :- transfer(X,Xs,Ys,Z), pack(Ys,Zs).

transfer(X,[],[],[X]).
transfer(X,[Y|Ys],[Y|Ys],[X]) :- X \= Y.
transfer(X,[X|Xs],Ys,[X|Zs]) :- transfer(X,Xs,Ys,Zs).

%Q10


encode([],[]).
encode([H|T],Output) :- pack([H|T],Out),
                        bucket(Out,Output).

bucket([],[]).
bucket([[X|Xs]|Ys],[[N,X]|Zs]) :- length([X|Xs],N),
	                          bucket(Ys,Zs).


/*
  
bucket([],Acc,Acc).
bucket([[H|T1]|T2],Acc,Out) :- length([H|T1],L),
	                     append(Acc,[[L,H]],NewAcc),
	                     bucket(T2,NewAcc,Out).
*/

%Q11

encode_modified([],[]).
encode_modified([H|T],Output) :- pack([H|T],Out),
                        bucket_modified(Out,Output).

bucket_modified([],[]).
bucket_modified([[X]|Xs],[X|Zs]) :- bucket_modified(Xs,Zs).
bucket_modified([[X|Xs]|Ys],[[N,X]|Zs]) :- length([X|Xs],N),
	                          N \= 1,
	                          bucket_modified(Ys,Zs).

%Q12

uncompress([],[]).
uncompress([X|Xs],[X|Zs]) :- \+is_list(X), uncompress(Xs,Zs).
uncompress([[N,X]|Xs],[X|Zs]) :- N > 0,
	                         M is N-1,
	                         uncompress([[M,X]|Xs],Zs).
uncompress([[0,X]|Xs],Zs) :- uncompress(Xs,Zs).

%Q13


%Q14

dupli([],[]).
dupli([H|T],[H,H|T2]) :- dupli(T,T2).
