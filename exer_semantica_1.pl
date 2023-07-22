% Exemplos
% ako(baleia, mamifero)
% voa(flecha, X)
% pode(X, sentir).

% Definições Gerais
lista_mamiferos([baleia, cachorro, esquilo, guepardo, tigre]).
lista_aves([albatroz, avestruz, beija_flor]).

ako(X, ave) :- lista_aves(Lista), member(X, Lista).
ako(X, mamifero) :- lista_mamiferos(Lista), member(X, Lista).
ako(X, animal) :- ako(X, ave); ako(X, mamifero).

% Instâncias
is_a(emmanuel, avestruz).			% Avestruz viral
is_a(flecha, albatroz).				% Exemplo do prof.
is_a(blues, baleia).				% Pq sim??
is_a(chester_cheetah, guepardo).	% Mascote Cheetos
is_a(tony, tigre). 					% Mascote Kellog´s

da(X, leite) :- is_a(X, Y), ako(Y, mamifero).

% Lê-se X pode sentir/se_mover se X é um Y e Y é um tipo de animal.
pode(X, sentir) :- is_a(X, Y), ako(Y, animal).
pode(X, se_mover) :- is_a(X, Y), ako(Y, animal).

põe(X, ovos) :- is_a(X, Y), ako(Y, ave).

tem(X, vida) :- is_a(X, Y), ako(Y, animal).
tem(X, plumas) :- is_a(X, Y), ako(Y, ave).
tem(X, pelos) :- is_a(X,Y), ako(Y, mamifero), not(is_a(X, baleia)).

tem(X, patasLargas) :- is_a(X, avestruz).
tem(X, pele) :- is_a(X, baleia).

vive(X, mar) :- is_a(X, baleia).

come(X, carne) :- is_a(X, tigre); is_a(X, guepardo).

voa(X, bem) :- is_a(X, Y), ako(Y, ave), not(is_a(X, avestruz)), not(is_a(X, albatroz)).

voa(X, muito_bem) :- is_a(X, albatroz).

