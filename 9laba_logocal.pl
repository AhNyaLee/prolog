:- use_module(library(clpfd)).

solve :-

    Friends = [
        friend(Place1, Name1, Nationality1, Sport1),
        friend(Place2, Name2, Nationality2, Sport2),
        friend(Place3, Name3, Nationality3, Sport3)
    ],
    
    Places = [1, 2, 3],
    Names = [michael, simon, richard],
    Nationalities = [american, israeli, australian],
    Sports = [basketball, tennis, cricket],
    

    member(friend(_, michael, _, basketball), Friends), % Майкл любит баскетбол
    member(friend(_, simon, israeli, _), Friends),     % Саймон - израильтянин
    member(friend(1, _, _, cricket), Friends),         % Крикет - 1 место
    
    member(friend(Pm, michael, _, _), Friends),
    member(friend(Pa, _, american, _), Friends),
    Pm #< Pa,
    

    member(friend(Ps, simon, _, _), Friends),
    member(friend(Pt, _, _, tennis), Friends),
    Ps #< Pt,
    

    permutation(Places, [Place1, Place2, Place3]),
    permutation(Names, [Name1, Name2, Name3]),
    permutation(Nationalities, [Nationality1, Nationality2, Nationality3]),
    permutation(Sports, [Sport1, Sport2, Sport3]),
    
    % Находим решение
    label([Place1, Place2, Place3]),
    
    % Выводим результаты
    format('1 место: ~w (~w, ~w)~n', [Name1, Nationality1, Sport1]),
    format('2 место: ~w (~w, ~w)~n', [Name2, Nationality2, Sport2]),
    format('3 место: ~w (~w, ~w)~n', [Name3, Nationality3, Sport3]),
    
    % Отвечаем на вопросы
    member(friend(_, _, australian, N), Friends), format('Австралиец: ~w~n', [N]),
    member(friend(_, richard, _, S), Friends), format('Ричард увлекается: ~w~n', [S]).