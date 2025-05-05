e([Head|Tail],Element,S):-
    Element=Head;
    S=Tail; 
    element(Tail,Element,S).


prints(Alphabet, K) :-
    length(Alphabet, N),         
    Total is N^K,             
    writeln(Total), 
    generate_placements(Alphabet, K, Placement), 
    write(Placement), nl,
    fail.
prints(_, _).                     
                    

generate_placements(_, 0, []) :- !.              
generate_placements(Alphabet, K, [X | Rest]):-  
    K > 0,                                       
    member(X, Alphabet),                      
    NextK is K - 1,                            
    generate_placements(Alphabet, NextK, Rest).  


prints_d(Alphabet, K) :-
    length(Alphabet, N),         
    Total is N^K,             
    writeln(Total), 
    generate_placements(Alphabet, K, Placement), 
    write(Placement), nl,                       
    fail.                                        
prints(_, _). 


generate_placement(Alphabet, K, Placement) :-
    length(Placement, K),
    maplist(member_(Alphabet), Placement).
member_(Alphabet, X) :- member(X, Alphabet).

print_placements([]).
print_placements([P|Ps]) :-
    writeln(P),
    print_placements(Ps).