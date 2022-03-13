tran(eins, one).
tran(zwei, two).
tran(drei, three).
tran(vier, four).
tran(fuenf, five).
tran(sechs, six).
tran(sieben, seven).
tran(acht, eight).
tran(neun, nine).

listtran([], []).
listtran([HG | TG], [HE | TE]) :- tran(HG, HE), listtran(TG, TE).

%?- listtran([eins, neun, zwei], X).
%@ X = [one, nine, two].

%?- listtran(X, [one, seven, six, two]).
%@ X = [eins, sieben, sechs, zwei].
