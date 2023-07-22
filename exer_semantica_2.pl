is_a(ana, pessoa).
is_a(banqueta, cadeira).

ako(X, movel) :- is_a(X, cadeira).
part_of(assento, X) :- is_a(X, cadeira).

cor(banqueta, preta).
estofado(banqueta, couro).
dono(banqueta, ana).