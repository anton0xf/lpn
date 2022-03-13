?- [append].

bad_reverse([], []).
bad_reverse([X | XS], YS) :- bad_reverse(XS, ZS), my_append(ZS, [X], YS).

%:- trace.
%@ true.

%?- bad_reverse([1, 2, 3], YS).
%@    Call: (8) bad_reverse([1, 2, 3], _3220) ? creep
%@    Call: (9) bad_reverse([2, 3], _3466) ? creep
%@    Call: (10) bad_reverse([3], _3466) ? creep
%@    Call: (11) bad_reverse([], _3466) ? creep
%@    Exit: (11) bad_reverse([], []) ? creep
%@    Call: (11) my_append([], [3], _3474) ? creep
%@    Exit: (11) my_append([], [3], [3]) ? creep
%@    Exit: (10) bad_reverse([3], [3]) ? creep
%@    Call: (10) my_append([3], [2], _3480) ? creep
%@    Call: (11) my_append([], [2], _3464) ? creep
%@    Exit: (11) my_append([], [2], [2]) ? creep
%@    Exit: (10) my_append([3], [2], [3, 2]) ? creep
%@    Exit: (9) bad_reverse([2, 3], [3, 2]) ? creep
%@    Call: (9) my_append([3, 2], [1], _3220) ? creep
%@    Call: (10) my_append([2], [1], _3476) ? creep
%@    Call: (11) my_append([], [1], _3482) ? creep
%@    Exit: (11) my_append([], [1], [1]) ? creep
%@    Exit: (10) my_append([2], [1], [2, 1]) ? creep
%@    Exit: (9) my_append([3, 2], [1], [3, 2, 1]) ? creep
%@    Exit: (8) bad_reverse([1, 2, 3], [3, 2, 1]) ? creep
%@ YS = [3, 2, 1].

%?- bad_reverse(XS, [1, 2, 3]).
%@    Call: (8) bad_reverse(_3912, [1, 2, 3]) ? creep
%@    Call: (9) bad_reverse(_4146, _4166) ? creep
%@    Exit: (9) bad_reverse([], []) ? creep
%@    Call: (9) my_append([], [_4144], [1, 2, 3]) ? creep
%@    Fail: (9) my_append([], [_4144], [1, 2, 3]) ? creep
%@    Redo: (9) bad_reverse(_4146, _4166) ? creep
%@    Call: (10) bad_reverse(_4152, _4172) ? creep
%@    Exit: (10) bad_reverse([], []) ? creep
%@    Call: (10) my_append([], [_4150], _4180) ? creep
%@    Exit: (10) my_append([], [_4150], [_4150]) ? creep
%@    Exit: (9) bad_reverse([_4150], [_4150]) ? creep
%@    Call: (9) my_append([_4150], [_4144], [1, 2, 3]) ? creep
%@    Call: (10) my_append([], [_4144], [2, 3]) ? creep
%@    Fail: (10) my_append([], [_4144], [2, 3]) ? creep
%@    Fail: (9) my_append([_4150], [_4144], [1, 2, 3]) ? creep
%@    Redo: (10) bad_reverse(_4152, _4172) ? creep
%@    Call: (11) bad_reverse(_4158, _4178) ? creep
%@    Exit: (11) bad_reverse([], []) ? creep
%@    Call: (11) my_append([], [_4156], _4186) ? creep
%@    Exit: (11) my_append([], [_4156], [_4156]) ? creep
%@    Exit: (10) bad_reverse([_4156], [_4156]) ? creep
%@    Call: (10) my_append([_4156], [_4150], _4192) ? creep
%@    Call: (11) my_append([], [_4150], _4176) ? creep
%@    Exit: (11) my_append([], [_4150], [_4150]) ? creep
%@    Exit: (10) my_append([_4156], [_4150], [_4156, _4150]) ? creep
%@    Exit: (9) bad_reverse([_4150, _4156], [_4156, _4150]) ? creep
%@    Call: (9) my_append([_4156, _4150], [_4144], [1, 2, 3]) ? creep
%@    Call: (10) my_append([_4150], [_4144], [2, 3]) ? creep
%@    Call: (11) my_append([], [_4144], [3]) ? creep
%@    Exit: (11) my_append([], [3], [3]) ? creep
%@    Exit: (10) my_append([2], [3], [2, 3]) ? creep
%@    Exit: (9) my_append([1, 2], [3], [1, 2, 3]) ? creep
%@    Exit: (8) bad_reverse([3, 2, 1], [1, 2, 3]) ? creep
%@ XS = [3, 2, 1] ;
%@    Redo: (11) bad_reverse(_4158, _4178) ? creep
%@    Call: (12) bad_reverse(_4164, _4184) ? creep
%@    Exit: (12) bad_reverse([], []) ? creep
%@    Call: (12) my_append([], [_4162], _4192) ? creep
%@    Exit: (12) my_append([], [_4162], [_4162]) ? creep
%@    Exit: (11) bad_reverse([_4162], [_4162]) ? creep
%@    Call: (11) my_append([_4162], [_4156], _4198) ? creep
%@    Call: (12) my_append([], [_4156], _4182) ? creep
%@    Exit: (12) my_append([], [_4156], [_4156]) ? creep
%@    Exit: (11) my_append([_4162], [_4156], [_4162, _4156]) ? creep
%@    Exit: (10) bad_reverse([_4156, _4162], [_4162, _4156]) ? creep
%@    Call: (10) my_append([_4162, _4156], [_4150], _4210) ? creep
%@    Call: (11) my_append([_4156], [_4150], _4194) ? creep
%@    Call: (12) my_append([], [_4150], _4200) ? creep
%@    Exit: (12) my_append([], [_4150], [_4150]) ? creep
%@    Exit: (11) my_append([_4156], [_4150], [_4156, _4150]) ? abort
%@ % Execution Aborted

my_reverse([], []).
my_reverse([X | XS], YS) :- revappend(XS, [X], YS).

%% revappend/3(XS, YS, ZS) ::: (reverse XS) ++ YS = ZS
revappend([], L, L).
revappend([X | XS], YS, ZS) :- revappend(XS, [X | YS], ZS).

%?- my_reverse([1, 2, 3], YS).
%@ YS = [3, 2, 1].

%?- my_reverse(XS, [1, 2, 3]).
%@ XS = [3, 2, 1] ;
%@ ERROR: Out of global stack
