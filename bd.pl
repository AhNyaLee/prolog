
man(oleg).
man(ivan).
man(anatoliy).
man(dimitriy).
man(vlad).
man(kirill).
man(mefodiy).

woman(olga).
woman(lyuba).
woman(maria).
woman(galya).
woman(vladina).
woman(sveta).
woman(zoya).
woman(katrin).

% Старшее поколение
grand_pather(oleg, ivan).
grand_mather(lyuba, ivan).
grand_pather(oleg, galya).
grand_mather(lyuba, galya).
grand_pather(oleg, maria).
grand_mather(olga, maria).

dite(ivan, anatoliy).
dite(maria, anatoliy).
dite(ivan, vladina).
dite(maria, vladina).
dite(anatoliy, dimitriy).
dite(galya, dimitriy).
dite(dimitriy, kirill).
dite(sveta, kirill).
dite(dimitriy, mefodiy).
dite(sveta, mefodiy).
dite(vlad, zoya).
dite(vladina, zoya).
dite(vlad, katrin).
dite(vladina, katrin).