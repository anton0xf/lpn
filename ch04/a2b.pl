a2b([], []).
a2b([a | Ta], [b | Tb]) :- a2b(Ta, Tb).

%?- a2b([a, a, a, a], [b, b, b, b]).
%@ true.

%?- a2b([a, a, a, a], [b, b, b]).
%@ false.

%?- a2b([a, a], [b, b, b, b]).
%@ false.

%?- a2b([a, c, a, a], [b, b, 5, 4]).
%@ false.

%?- a2b([a, a, a, a], X).
%@ X = [b, b, b, b].




