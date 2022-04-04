flatten([], []).
flatten([[] | XS], YS) :- flatten(XS, YS), !.
flatten([[X | XS] | XSS], YS) :- flatten([X, XS | XSS], YS), !.
flatten([X | XS], [X | YS]) :- flatten(XS, YS).

%?- flatten([a, b, [c, d], [[1, 2]], foo], R).
%@ R = [a, b, c, d, 1, 2, foo].

%?- flatten([a,b,[[[[[[[c,d]]]]]]],[[1,2]],foo,[]], R).
%@ R = [a, b, c, d, 1, 2, foo].
