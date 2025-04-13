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

