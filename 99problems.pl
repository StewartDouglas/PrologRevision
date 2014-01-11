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

%Q14

duplicate([],[]).
duplicate([H|T],[H,H|T2]) :- duplicate(T,T2).

%Q15

dupli(L1,N,L2) :- dupli(L1,N,L2,N).

dupli([],_,[],_).
dupli([_|Xs],N,Ys,0) :- dupli(Xs,N,Ys,N).
dupli([X|Xs],N,[X|Ys],K) :- K > 0, K1 is K - 1, dupli([X|Xs],N,Ys,K1).

%Q16

drop(X,N,Y) :- drop(X,N,Y,N).

drop([],_,[],_).
drop([_|Xs],N,Ys,1) :- drop(Xs,N,Ys,N).
drop([X|Xs],N,[X|Ys],K) :- K > 1, K1 is K - 1, drop(Xs,N,Ys,K1).

%Q17

split([],_,[],[]).
split([H|T],N,[H|L1],L2) :- N > 0,
	                    M is N-1,
			    split(T,M,L1,L2).
split([H|T],0,L1,[H|L2]) :- split(T,0,L1,L2).

%Q18

slice(_,1,0,[]).
slice([H|T],N,M,Output) :- N > 1,
	                   N1 is N-1,
                           M1 is M-1,
			   slice(T,N1,M1,Output).
slice([H|T],1,M,[H|Output]) :- M > 0,
	                       M1 is M-1,
			       slice(T,1,M1,Output).

