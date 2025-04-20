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
 
