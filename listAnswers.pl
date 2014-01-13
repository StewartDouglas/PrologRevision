remove_item(E,[],[]).
remove_item(E,[H|T],[H|NewL]) :- 
                   E \= H,
                   remove_item(E,T,NewL).
remove_item(E,[H|T],NewL) :-
                   E = H,
                   remove(E,L,NewL).
                  
