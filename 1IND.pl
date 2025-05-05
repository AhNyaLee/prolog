:- dynamic color_assignment/2.

% Факты о смежности вершин
adj(a, b). adj(b, a).
adj(a, c). adj(c, a).        
adj(b, e). adj(e, b).         
adj(b, d). adj(d, b).        
adj(c, d). adj(d, c).       
adj(c, g). adj(g, c).      
adj(d, e). adj(e, d).       
adj(d, g). adj(g, d).     
adj(e, f). adj(f, e).       
adj(e, h). adj(h, e).        
adj(f, h). adj(h, f).        
adj(h, i). adj(i, h).       
adj(i, g). adj(g, i).        
adj(j, i). adj(i, j).       

% Автоматический расчёт степени вершины
vertex_degree(Vertex, Degree) :-
    findall(Neighbor, adj(Vertex, Neighbor), Neighbors),
    length(Neighbors, Degree).

% Основной предикат для раскраски
greedy_coloring :-
    retractall(color_assignment(_, _)),
    VerticesOrder = [d, h, j, a, b, f, g, c, e, i],
    color_vertices(VerticesOrder, [red, green, black]),
    print_results.

% Раскраска вершин с фиксированным порядком
color_vertices([], _).
color_vertices([Vertex | Rest], Colors) :-
    find_neighbor_colors(Vertex, NeighborColors),
    select_available_color(NeighborColors, Colors, SelectedColor),
    assertz(color_assignment(Vertex, SelectedColor)),
    color_vertices(Rest, Colors).

% Поиск цветов соседей
find_neighbor_colors(Vertex, NeighborColors) :-
    findall(Color, (adj(Vertex, Neighbor), color_assignment(Neighbor, Color)), NeighborColors).

% Выбор первого доступного цвета
select_available_color(NeighborColors, [Color | _], Color) :-
    \+ member(Color, NeighborColors).
select_available_color(NeighborColors, [_ | Rest], Color) :-
    select_available_color(NeighborColors, Rest, Color).

% Вывод результатов
print_results :-
    write('Количество цветов: 3'), nl,
    print_color('Рыжий', red),
    print_color('Зелёный', green),
    print_color('Чёрный', black).

print_color(Name, Color) :-
    findall(V, color_assignment(V, Color), Vertices),
    format('~w: ~w~n', [Name, Vertices]).

%  greedy_coloring 