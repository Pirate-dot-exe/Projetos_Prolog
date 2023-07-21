somatorio([],0, 0).
somatorio([X | Y], Soma, Tam) :- 
    somatorio(Y, SY, TamParcial), 
    Soma is X + SY,
    Tam is TamParcial + 1.

media(S, T, Media) :- 
    Media is S / T.

main() :- 
    main([]).
main(Lista) :- 
    somatorio(Lista, S, T),
    media(S,T, Media),
    %write('Soma: '), write(S), nl,
    %write('Quant: '), write(T), nl,
    write('Média: '), write(Media), nl.
    
% main([1, 2, 3, 4, 4, 4, 4, 5])