:- [bd].

man :-
    man(X),
    write(X), nl,
    fail.
man.

woman :-
    woman(X),
    write(X), nl,
    fail.
woman.

parents :-
    dite(X, Y),       
    format('~w - родитель ~w~n', [X, Y]),
    fail.                          
parents.    

children(X) :-
    dite(X, Child),
    format('~w - ребенок ~w~n', [X, Child]),
    fail.
children(_). 

mother(X, Y) :-
    dite(X,Y),
    woman(X).
mother.

mother(Child) :-
    woman(Mother), 
    dite(Mother, Child),        
    format('Мать ~w - ~w~n', [Child, Mother]),
    fail.
mother(_).

brother(X, Y) :-
    X \= Y,              
    man(X),              
    dite(P, X),         
    dite(P, Y).   

b_s(X, Y) :-
    X \= Y,             
    dite(P, X),        
    dite(P, Y). 

daughter(X, Y) :-
    dite(X, Y),
    woman(Y).

daughter(X) :-
    dite(X, Child),
    woman(Child),
    format('~w - ребенок ~n', [Child]),
    fail.
daughter(_). 

husband(X, Y) :-
    man(X),
    woman(Y),
    dite(X, Child),
    dite(Y, Child),
    X \= Y.

husband(X) :-
    woman(X),                 
    dite(X, Child),          
    dite(Husband, Child),    
    man(Husband),              
    Husband \= X,           
    format('~w - муж ~n', [Husband]),!. 

grand_ma(Grandmother, Grandchild) :-
    woman(Grandmother),
    grand_mather(Grandmother, Grandchild).

grand_mas(X) :-
    woman(Grandmother),                  
    grand_mather(Grandmother, X),    
    format('~w - бабушка ~w~n', [Grandmother]),
    fail.                        
grand_mas(_).

grand_ma_and_da(X, Y) :-
    (grand_ma(X, Y)    
    ;                
    grand_ma(Y, X)).
