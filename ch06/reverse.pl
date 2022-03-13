reverse([], []).
reverse([X | XS], YS) :- revappend(XS, [X], YS).

revappend([], L, L).
revappend([X | XS], YS, ZS) :- revappend(XS, [X | YS], ZS).

%?- reverse([1, 2, 3], YS).
%@ YS = [3, 2, 1].

%?- reverse(XS, [1, 2, 3]).
%@ XS = [3, 2, 1] ;
%@ ERROR: Out of global stack
