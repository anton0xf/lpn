numeral(0).
numeral(succ(X)) :- numeral(X).

%?- numeral(X).
%@ X = 0 ;
%@ X = succ(0) ;
%@ X = succ(succ(0)) ;
%@ X = succ(succ(succ(0))) .

add(0, X, X).
add(succ(X), Y, succ(Z)) :- add(X, Y, Z).

%?- add(0, 0, S).
%@ S = 0.

%?- add(0, succ(0), S).
%@ S = succ(0).

%?- add(succ(0), 0, S).
%@ S = succ(0).

%?- add(succ(succ(0)), succ(0), S).
%@ S = succ(succ(succ(0))).

%:- trace.
%@ true.
%?- add(succ(succ(0)), succ(0), S).
%@    Call: (8) add(succ(succ(0)), succ(0), _946) ? creep
%@    Call: (9) add(succ(0), succ(0), _1166) ? creep
%@    Call: (10) add(0, succ(0), _1170) ? creep
%@    Exit: (10) add(0, succ(0), succ(0)) ? creep
%@    Exit: (9) add(succ(0), succ(0), succ(succ(0))) ? creep
%@    Exit: (8) add(succ(succ(0)), succ(0), succ(succ(succ(0)))) ? creep
%@ S = succ(succ(succ(0))).
