:- [append].

simple_member(X, [X | _]).
simple_member(X, [_ | T]) :- simple_member(X, T).

app_member(X, L) :- my_append(_, [X | _], L).

%?- trace.
%@ true.

%?- simple_member(2, [1, 2, 3]).
%@    Call: (8) simple_member(2, [1, 2, 3]) ? creep
%@    Call: (9) simple_member(2, [2, 3]) ? creep
%@    Exit: (9) simple_member(2, [2, 3]) ? creep
%@    Exit: (8) simple_member(2, [1, 2, 3]) ? creep
%@ true ;
%@    Redo: (9) simple_member(2, [2, 3]) ? creep
%@    Call: (10) simple_member(2, [3]) ? creep
%@    Call: (11) simple_member(2, []) ? creep
%@    Fail: (11) simple_member(2, []) ? creep
%@    Fail: (10) simple_member(2, [3]) ? creep
%@    Fail: (9) simple_member(2, [2, 3]) ? creep
%@    Fail: (8) simple_member(2, [1, 2, 3]) ? creep
%@ false.

%?- app_member(2, [1, 2, 3]).
%@    Call: (8) app_member(2, [1, 2, 3]) ? creep
%@    Call: (9) my_append(_2052, [2|_2034], [1, 2, 3]) ? creep
%@    Call: (10) my_append(_2040, [2|_2034], [2, 3]) ? creep
%@    Exit: (10) my_append([], [2, 3], [2, 3]) ? creep
%@    Exit: (9) my_append([1], [2, 3], [1, 2, 3]) ? creep
%@    Exit: (8) app_member(2, [1, 2, 3]) ? creep
%@ true ;
%@    Redo: (10) my_append(_2040, [2|_2034], [2, 3]) ? creep
%@    Call: (11) my_append(_2046, [2|_2034], [3]) ? creep
%@    Call: (12) my_append(_2052, [2|_2034], []) ? creep
%@    Fail: (12) my_append(_2052, [2|_2034], []) ? creep
%@    Fail: (11) my_append(_2046, [2|_2034], [3]) ? creep
%@    Fail: (10) my_append(_2040, [2|_2034], [2, 3]) ? creep
%@    Fail: (9) my_append(_2052, [2|_2034], [1, 2, 3]) ? creep
%@    Fail: (8) app_member(2, [1, 2, 3]) ? creep
%@ false.
