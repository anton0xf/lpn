combine3([], [], []).
combine3([X | XS], [Y | YS], [j(X, Y) | ZS]) :- combine3(XS, YS, ZS).

%?-  combine3([a, b, c], [1, 2, 3], X).
%@ X = [j(a, 1), j(b, 2), j(c, 3)].

%?- combine3([f, b, yip, yup], [glu, gla, gli, glo], Result).
%@ Result = [j(f, glu), j(b, gla), j(yip, gli), j(yup, glo)].

%?- combine3(XS, YS, [j(f, glu), j(b, gla), j(yip, gli), j(yup, glo)]).
%@ XS = [f, b, yip, yup],
%@ YS = [glu, gla, gli, glo].
