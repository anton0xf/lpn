descend(X, Y) :- child(X, Y).
descend(X, Y) :- child(X, Z), descend(Z, Y).

child(anne, bridget).
child(bridget, caroline).
child(caroline, donna).
child(donna, emily).

%?- descend(anne, donna).
%@ true ;
%@ false.

%?- descend(X, Y).
%@ X = anne, %@ Y = bridget ;
%@ X = bridget, %@ Y = caroline ;
%@ X = caroline, %@ Y = donna ;
%@ X = donna, %@ Y = emily ;
%@ X = anne, %@ Y = caroline ;
%@ X = anne, %@ Y = donna ;
%@ X = anne, %@ Y = emily ;
%@ X = bridget, %@ Y = donna ;
%@ X = bridget, %@ Y = emily ;
%@ X = caroline, %@ Y = emily ;
%@ false.

%:- trace.
%@ true.

%?- descend(anne, donna).
%@    Call: (8) descend(anne, donna) ? creep
%@    Call: (9) child(anne, donna) ? creep
%@    Fail: (9) child(anne, donna) ? creep
%@    Redo: (8) descend(anne, donna) ? creep
%@    Call: (9) child(anne, _5430) ? creep
%@    Exit: (9) child(anne, bridget) ? creep
%@    Call: (9) descend(bridget, donna) ? creep
%@    Call: (10) child(bridget, donna) ? creep
%@    Fail: (10) child(bridget, donna) ? creep
%@    Redo: (9) descend(bridget, donna) ? creep
%@    Call: (10) child(bridget, _5430) ? creep
%@    Exit: (10) child(bridget, caroline) ? creep
%@    Call: (10) descend(caroline, donna) ? creep
%@    Call: (11) child(caroline, donna) ? creep
%@    Exit: (11) child(caroline, donna) ? creep
%@    Exit: (10) descend(caroline, donna) ? creep
%@    Exit: (9) descend(bridget, donna) ? creep
%@    Exit: (8) descend(anne, donna) ? creep
%@ true .
