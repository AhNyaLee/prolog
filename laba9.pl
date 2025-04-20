#1
#максимальное число Z-ответ
max(X, Y, U, Z) :-
    X >= Y, X >= U -> Z = X;
    Y >= X, Y >= U -> Z = Y;
    U >= X, U >= Y -> Z = U.

#рекурсия вверх и вниз 
fact(1,0).
fact(N, X) :-            
    N > 0,               
    PrevN is N - 1,      
    fact(PrevN, PrevX),   
    X is N * PrevX.       

fact(N, X) :- fact(N, 1, X).  

fact(0, Acc, Acc).            
fact(N, Acc, X) :-           
    N > 0,                   
    NewAcc is Acc * N,       
    PrevN is N - 1,          
    fact(PrevN, NewAcc, X).  

#сумма цифр 

sum(0, 0).
sum(Number, Sum) :-
    Number > 0,
    LastDigit is Number mod 10,
    RestNumber is Number // 10,      
    sum(RestNumber, RestSum), 
    Sum is RestSum + LastDigit.      

sum(Number, Sum) :-
    sum(Number, 0, Sum).
sum(0, Acc, Acc).
sum(Number, Acc, Sum) :-
    Number > 0,
    LastDigit is Number mod 10,      
    NewAcc is Acc + LastDigit,      
    RestNumber is Number // 10,    
    sum(RestNumber, NewAcc, Sum). 

#чтение с клавы.
read_list(List) :-
    write('Введите элементы списка'),  
    read(List). 

sum_list_down([], 0).
sum_list_down([Head|Tail], Summ) :-
    sum_list_down(Tail, Rest),  
    (   var(Summ)                     
    ->  Summ is Head + Rest         
    ;   Summ =:= Head + Rest        
    ).

sum_list_up([], 0).
sum_list_up([Head|Tail], Summ) :-
    sum_list_up(Tail, Rest),
    Summ is Head + Rest.      

remove_elements_with_sum([], _, []). 
remove_elements_with_sum([Head|Tail], Sum, Result) :-
    sum(Head, SumDigits), 
    (   SumDigits =:= Sum           
    ->  remove_elements_with_sum(Tail, Sum, Result)  
    ;   Result = [Head|Rest],       
        remove_elements_with_sum(Tail, Sum, Rest)
    ).
 
#2----------------------------------------------------------------------------------------
min (Number, Min) :-
    Number < 10,
    !,  
    Min is Number mod 10.
min (Number, Min) :-
    LastDigit is Number mod 10,
    RestNumber is Number // 10,
    min (RestNumber, RestMin),
    Min is min(LastDigit, RestMin).
min(Number, Min) :-
    min(Number, 9, Min).  % Начинаем с максимальной цифры 9

min(0, CurrentMin, CurrentMin) :- !.
min(Number, CurrentMin, Min) :-
    LastDigit is Number mod 10,
    NewMin is min(LastDigit, CurrentMin),
    RestNumber is Number // 10,
    min(RestNumber, NewMin, Min).

% Рекурсия вверх - подсчет цифр < 3
count_up(Number, Count) :-
    Number < 10,
    !,
    (Number < 3 -> Count = 1 ; Count = 0).

count_up(Number, Count) :-
    LastDigit is Number mod 10,
    RestNumber is Number // 10,
    count_up(RestNumber, RestCount),
    (LastDigit < 3 -> Count is RestCount + 1 ; Count = RestCount).

count_down(Number, Count) :-
    count_down(Number, 0, Count).

count_down(0, Acc, Acc) :- !.
count_down(Number, Acc, Count) :-
    LastDigit is Number mod 10,
    (LastDigit < 3 -> NewAcc is Acc + 1 ; NewAcc = Acc),
    RestNumber is Number // 10,
    count_down(RestNumber, NewAcc, Count).

count_divisors_up(N, Count) :-
    N > 0,
    count_divisors_up(N, N, 0, Count).

count_divisors_up(_, 0, Acc, Acc) :- !.
count_divisors_up(N, D, Acc, Count) :-
    (N mod D =:= 0 -> NewAcc is Acc + 1 ; NewAcc = Acc),
    NextD is D - 1,
    count_divisors_up(N, NextD, NewAcc, Count).

count_divisors_down(N, Count) :-
    N > 0,
    count_divisors_down(N, N, 0, Count).
count_divisors_down(_, 1, Acc, Count) :-
    Count is Acc + 1.
count_divisors_down(N, D, Acc, Count) :-
    D > 1,
    (N mod D =:= 0 -> NewAcc is Acc + 1 ; NewAcc = Acc),
    NextD is D - 1,
    count_divisors_down(N, NextD, NewAcc, Count).

