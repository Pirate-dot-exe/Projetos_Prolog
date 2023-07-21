% Author: PirateX_20
% Fonte: Fandom Simpsons
% Versão 1.7
% * Expansão de linhagem para a direita da linhagem principal (homens)
% * Classificação de Linhagem
% * Iniício da Documentação
%Homens--------------------------------------------------------------------
% Linhagem 1
homem(sven_simpson). %Primeiro Simpson??
homem(joe_puffing_goat).
% Linhagem 2
homem(pert_simpson).
homem(lambert_simpson).
homem(humprey_little_goat).
homem(omar_stillman).
% Linhagem 3
homem(galston_simpson).
homem(garwood_simpson).
homem(clen_stillman).
homem(clancey_stillman).
homem(dewey_stillman). 	% "Square Top"
% Linhagem 4
homem(howland_simpson).
homem(zeke_simpson).
homem(floyd_simpson).
homem(hoartio_dirundale).
homem(bartman_hickman).
% Linhagem 5
homem(lou_simpson).
homem(hugo_simpson).
homem(gaston_simpson).
homem(oswald_simpson).	% "Old Tut"
homem(udell_diredale).
homem(wilbard_hickman).
% Linhagem 6
homem(khardt_simpson).
homem(bob_simpson).
homem(woddy_schedeen).
homem(deville_simpson).
homem(zeke_hickman).
% Linhagem 7
homem(abraham_simpson).	% "Abe Simpson"
homem(fester_olsen).	% irmão de Mona
% Linhagem 8
homem(herb_powell).
homem(homer_simpson).
% Linhagem 9
homem(bartolomew_simpson).
%Mulheres------------------------------------------------------------------
mulher(claretta_ethridge).
mulher(winifred_running_goat).
mulher(trixie_simpson).
mulher(prudence_simpson).
mulher(ivy_simpson).
mulher(clowta_stillman).
mulher(pipa_simpson).
mulher(gaby_crouse).
mulher(dulcine_simpson).
mulher(happy_dinsdale).
mulher(twitta_simpson).
mulher(elrita_simpson).
mulher(bonita_simpson).
mulher(yuma_hickman).
mulher(linnea_erika).	% "Dolly" Mãe de Mona
mulher(penelope_olsen).	% "Mona Simpson"
mulher(kari_olsen).		% Irmã de Mona
mulher(marge_bouvier).
mulher(lisa_simpson).
mulher(margaret_simpson).
% Genitores Linha Simpson Principal----------------------------------------
genitor(sven_simpson, pert_simpson).
genitor(claretta_ethridge, pert_simpson).
genitor(pert_simpson, garwood_simpson).
genitor(winifred_running_goat, garwood_simpson).
genitor(garwood_simpson, howland_simpson).
genitor(clowta_stillman, howland_simpson).
genitor(howland_simpson, oswald_simpson).
genitor(gabby_crouse, oswald_simpson).
genitor(oswald_simpson, deville_simpson).
genitor(happy_dinsdale, deville_simpson).
genitor(deville_simpson, abraham_simpson).
genitor(yuma_hickman, abraham_simpson).
genitor(abraham_simpson, homer_simpson).
genitor(abraham_simpson, herb_powell).
genitor(penelope_olsen, homer_simpson).
genitor(homer_simpson, bartolomew_simpson).
genitor(homer_simpson, lisa_simpson).
genitor(homer_simpson, margaret_simpson).
genitor(marge_bouvier, bartolomew_simpson).
genitor(marge_bouvier, lisa_simpson).
genitor(marge_bouvier, margaret_simpson).	%"Maggie"
% -----------------------------------------------------------------
casados(homer_simpson, marge_bouvier).
casados(abraham_simpson, penelope_olsen).
% Regras de Produção -----------------------------------------------------
%Regras de geração D(0)
irmaos(X, Y) :- genitor(Z, X) , genitor(Z, Y).
%Regras de geração D(1)
pai(X, Y) :- homem(X) , genitor(X, Y).
mae(X, Y) :- mulher(X), genitor(X, Y).
tio(X, Y) :- homem(X) , irmaos(X, Z) , genitor(Z, Y).
tia(X, Y) :- mulher(X) , irmaos(X, Z) , genitor(Z, Y).
sogra(X, Y) :- 
    mulher(X), genitor(X, Z), ( casados(Z, Y) ; casados(Y, Z) ).
sogro(X, Y) :-
    homem(X), genitor(X, Z), ( casados(Z, Y) ; casados(Y, Z) ).    
% Regras de geração D(2)
avo_generic(X, Y) :- genitor(X, Z), genitor(Z, Y).
avo_h(X, Y) :- homem(X), genitor(X, Z), genitor(Z, Y).
avo_m(X, Y) :- mulher(X), genitor(X, Z), genitor(Z, Y).
% Regras de geração D(3)
bisavo_h(X, Y) :- homem(X), genitor(X, Z), avo_generic(Z, Y).
% Regra de ancestralidade 
ancestral(X, Y, 1) :- genitor(X, Y).
ancestral(X, Y, N) :- genitor(X, Z), ancestral(Z, Y, N1), N is N1 + 1.

% Exemplos de regra ------------------------------------------------------
% ancestral(howland_simpson, homer_simpson, N)
% irmaos(bartolomew_simpson, lisa_simpson)
% tio(herb_powell, bartolomew_simpson)