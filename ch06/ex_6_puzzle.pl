%% There is a street with three neighbouring houses
%% that all have a different colour, namely red, blue, and green.
%% People of different nationalities live in the different houses
%% and they all have a different pet.

%% Here are some more facts about them:
%% * The Englishman lives in the red house.
%% * The jaguar is the pet of the Spanish family.
%% * The Japanese lives to the right of the snail keeper.
%% * The snail keeper lives to the left of the blue house.

%% Who keeps the zebra?
%% Don’t work it out for yourself: define a predicate zebra/1
%% that tells you the nationality of the owner of the zebra!

sublist([], _).
sublist([H | XS], [H | YS] ) :- prefix(XS, YS).
sublist([X | XS], [_ | YS] ) :- sublist([X | XS], YS).

street(L) :- L = [_, _, _],
             % color
             member([red, _, _], L),
             member([blue, _, _], L),
             member([green, _, _], L),
             % nationality
             member([_, gbr, _], L),
             member([_, esp, _], L),
             member([_, jpn, _], L),
             % pets
             member([_, _, jaguar], L),
             member([_, _, snail], L),
             member([_, _, zebra], L),
             % facts
             member([red, gbr, _], L),
             member([_, esp, jaguar], L),
             sublist([[_, _, snail], [_, jpn, _]], L),
             sublist([[_, _, snail], [blue, _, _]], L).

%?- street(L).
%@ L = [[red, gbr, snail], [blue, jpn, zebra], [green, esp, jaguar]] ;
%@ L = [[green, esp, jaguar], [red, gbr, snail], [blue, jpn, zebra]] ;
%@ false.

zebra(N) :- street(L), member([_, N, zebra], L).

%?- zebra(N).
%@ N = jpn ;
%@ N = jpn ;
%@ false.
