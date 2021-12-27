is_tree(leaf(_)).
is_tree(tree(X, Y)) :- is_tree(X), is_tree(Y).

%?- is_tree(leaf(1)).
%@ true.

%?- is_tree(tree(leaf(1), leaf(2))).
%@ true.

%?- is_tree(tree(tree(leaf(1), leaf(2)), leaf(4))).
%@ true.

%?- is_tree(tree(1, 2)).
%@ false.

%?- is_tree(tree(leaf(1))).
%@ false.

%?- is_tree(tree(leaf(1), leaf(2), leaf(3))).
%@ false.

swap(leaf(X), leaf(X)).
swap(tree(X, Y), tree(Ys, Xs)) :- swap(X, Xs), swap(Y, Ys).

%?- swap(tree(tree(leaf(1), leaf(2)), leaf(4)), T).
%@ T = tree(leaf(4), tree(leaf(2), leaf(1))).

