:- initialization(main).  % Указывает точку входа

main :- 
    write('Hello, World!'), nl,  % nl — новая строка
    halt.  % Завершает программу

% Альтернативный вариант (если запускать вручную в интерпретаторе)
% ?- write('Hello, World!'), nl.