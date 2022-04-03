?- [append].
%@ true.

%?- trace.
%@ true.

%?- my_append([a, b, c], [[], [2, 3], b], X).
%@    Call: (8) my_append([a, b, c], [[], [2, 3], b], _2230) ? creep
%@    Call: (9) my_append([b, c], [[], [2, 3], b], _2500) ? creep
%@    Call: (10) my_append([c], [[], [2, 3], b], _2506) ? creep
%@    Call: (11) my_append([], [[], [2, 3], b], _2512) ? creep
%@    Exit: (11) my_append([], [[], [2, 3], b], [[], [2, 3], b]) ? creep
%@    Exit: (10) my_append([c], [[], [2, 3], b], [c, [], [2, 3], b]) ? creep
%@    Exit: (9) my_append([b, c], [[], [2, 3], b], [b, c, [], [2, 3], b]) ? creep
%@    Exit: (8) my_append([a, b, c], [[], [2, 3], b], [a, b, c, [], [2, 3], b]) ? creep
%@ X = [a, b, c, [], [2, 3], b].

%?- my_append(L, R, [foo, wee, blup]).
%@    Call: (8) my_append(_2980, _2982, [foo, wee, blup]) ? creep
%@    Exit: (8) my_append([], [foo, wee, blup], [foo, wee, blup]) ? creep
%@ L = [],
%@ R = [foo, wee, blup] ;
%@    Redo: (8) my_append(_2980, _2982, [foo, wee, blup]) ? creep
%@    Call: (9) my_append(_3260, _2982, [wee, blup]) ? creep
%@    Exit: (9) my_append([], [wee, blup], [wee, blup]) ? creep
%@    Exit: (8) my_append([foo], [wee, blup], [foo, wee, blup]) ? creep
%@ L = [foo],
%@ R = [wee, blup] ;
%@    Redo: (9) my_append(_3260, _2982, [wee, blup]) ? creep
%@    Call: (10) my_append(_3266, _2982, [blup]) ? creep
%@    Exit: (10) my_append([], [blup], [blup]) ? creep
%@    Exit: (9) my_append([wee], [blup], [wee, blup]) ? creep
%@    Exit: (8) my_append([foo, wee], [blup], [foo, wee, blup]) ? creep
%@ L = [foo, wee],
%@ R = [blup] ;
%@    Redo: (10) my_append(_3266, _2982, [blup]) ? creep
%@    Call: (11) my_append(_3272, _2982, []) ? creep
%@    Exit: (11) my_append([], [], []) ? creep
%@    Exit: (10) my_append([blup], [], [blup]) ? creep
%@    Exit: (9) my_append([wee, blup], [], [wee, blup]) ? creep
%@    Exit: (8) my_append([foo, wee, blup], [], [foo, wee, blup]) ? creep
%@ L = [foo, wee, blup],
%@ R = [] ;
%@    Redo: (11) my_append(_3272, _2982, []) ? creep
%@    Fail: (11) my_append(_3272, _2982, []) ? creep
%@    Fail: (10) my_append(_3266, _2982, [blup]) ? creep
%@    Fail: (9) my_append(_3260, _2982, [wee, blup]) ? creep
%@    Fail: (8) my_append(_2980, _2982, [foo, wee, blup]) ? creep
%@ false.

%?- prefix(P, [1, 2, 3]).
%@    Call: (8) prefix(_4184, [1, 2, 3]) ? creep
%@    Call: (9) my_append(_4184, _4428, [1, 2, 3]) ? creep
%@    Exit: (9) my_append([], [1, 2, 3], [1, 2, 3]) ? creep
%@    Exit: (8) prefix([], [1, 2, 3]) ? creep
%@ P = [] ;
%@    Redo: (9) my_append(_4184, _4428, [1, 2, 3]) ? creep
%@    Call: (10) my_append(_4414, _4434, [2, 3]) ? creep
%@    Exit: (10) my_append([], [2, 3], [2, 3]) ? creep
%@    Exit: (9) my_append([1], [2, 3], [1, 2, 3]) ? creep
%@    Exit: (8) prefix([1], [1, 2, 3]) ? creep
%@ P = [1] ;
%@    Redo: (10) my_append(_4414, _4434, [2, 3]) ? creep
%@    Call: (11) my_append(_4420, _4440, [3]) ? creep
%@    Exit: (11) my_append([], [3], [3]) ? creep
%@    Exit: (10) my_append([2], [3], [2, 3]) ? creep
%@    Exit: (9) my_append([1, 2], [3], [1, 2, 3]) ? creep
%@    Exit: (8) prefix([1, 2], [1, 2, 3]) ? creep
%@ P = [1, 2] ;
%@    Redo: (11) my_append(_4420, _4440, [3]) ? creep
%@    Call: (12) my_append(_4426, _4446, []) ? creep
%@    Exit: (12) my_append([], [], []) ? creep
%@    Exit: (11) my_append([3], [], [3]) ? creep
%@    Exit: (10) my_append([2, 3], [], [2, 3]) ? creep
%@    Exit: (9) my_append([1, 2, 3], [], [1, 2, 3]) ? creep
%@    Exit: (8) prefix([1, 2, 3], [1, 2, 3]) ? creep
%@ P = [1, 2, 3] ;
%@    Redo: (12) my_append(_4426, _4446, []) ? creep
%@    Fail: (12) my_append(_4426, _4446, []) ? creep
%@    Fail: (11) my_append(_4420, _4440, [3]) ? creep
%@    Fail: (10) my_append(_4414, _4434, [2, 3]) ? creep
%@    Fail: (9) my_append(_4184, _4428, [1, 2, 3]) ? creep
%@    Fail: (8) prefix(_4184, [1, 2, 3]) ? creep
%@ false.

%?- suffix(P, [1, 2, 3]).
%@    Call: (8) suffix(_4802, [1, 2, 3]) ? creep
%@    Exit: (8) suffix([], [1, 2, 3]) ? creep
%@ P = [] ;
%@    Redo: (8) suffix(_4802, [1, 2, 3]) ? creep
%@    Call: (9) my_append(_5056, [_5030|_5032], [1, 2, 3]) ? creep
%@    Exit: (9) my_append([], [1, 2, 3], [1, 2, 3]) ? creep
%@    Exit: (8) suffix([1, 2, 3], [1, 2, 3]) ? creep
%@ P = [1, 2, 3] ;
%@    Redo: (9) my_append(_5056, [_5030|_5032], [1, 2, 3]) ? creep
%@    Call: (10) my_append(_5044, [_5030|_5032], [2, 3]) ? creep
%@    Exit: (10) my_append([], [2, 3], [2, 3]) ? creep
%@    Exit: (9) my_append([1], [2, 3], [1, 2, 3]) ? creep
%@    Exit: (8) suffix([2, 3], [1, 2, 3]) ? creep
%@ P = [2, 3] ;
%@    Redo: (10) my_append(_5044, [_5030|_5032], [2, 3]) ? creep
%@    Call: (11) my_append(_5050, [_5030|_5032], [3]) ? creep
%@    Exit: (11) my_append([], [3], [3]) ? creep
%@    Exit: (10) my_append([2], [3], [2, 3]) ? creep
%@    Exit: (9) my_append([1, 2], [3], [1, 2, 3]) ? creep
%@    Exit: (8) suffix([3], [1, 2, 3]) ? creep
%@ P = [3] ;
%@    Redo: (11) my_append(_5050, [_5030|_5032], [3]) ? creep
%@    Call: (12) my_append(_5056, [_5030|_5032], []) ? creep
%@    Fail: (12) my_append(_5056, [_5030|_5032], []) ? creep
%@    Fail: (11) my_append(_5050, [_5030|_5032], [3]) ? creep
%@    Fail: (10) my_append(_5044, [_5030|_5032], [2, 3]) ? creep
%@    Fail: (9) my_append(_5056, [_5030|_5032], [1, 2, 3]) ? creep
%@    Fail: (8) suffix(_4802, [1, 2, 3]) ? creep
%@ false.
