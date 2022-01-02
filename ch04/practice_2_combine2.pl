combine2([], [], []).
combine2([X | XS], [Y | YS], [[X, Y] | ZS]) :- combine2(XS, YS, ZS).

%?-  combine2([a, b, c], [1, 2, 3], X).
%@ X = [[a, 1], [b, 2], [c, 3]].

%?- combine2([f, b, yip, yup], [glu, gla, gli, glo], Result).
%@ Result = [[f, glu], [b, gla], [yip, gli], [yup, glo]].

%?- combine2(XS, YS, [[f, glu], [b, gla], [yip, gli], [yup, glo]]).
%@ XS = [f, b, yip, yup],
%@ YS = [glu, gla, gli, glo].
