
car(maserati,green,25000).
car(corvette,black,24000).
car(corvette,red,26000).
car(corvette,red,24000).
car(porshe,red,24000).

colors(red,sexy).
colors(black,mean).
colors(green,preppy).

buy_car(Model,Color):-
    car(Model,Color,Price),
    colors(Color,sexy),!,
    Price < 25000.

