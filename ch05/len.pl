len([], 0).
len([_ | T], N) :- len(T, X), N is X + 1.

%?- len([a, b, c, d, e, [a, b], g], X).
%@ X = 7.

acc_len([_ | T], A, L) :- Anew is A + 1, acc_len(T, Anew, L).
acc_len([], A, A).

%?- acc_len([a, b, c], 0, L).
%@ L = 3.

leng(List, Length) :- acc_len(List, 0, Length).

%?- leng([a, b, c, d, e, [a, b], g], X).
%@ X = 7.
