%Circuits

and(1,0,0).
and(0,1,0).
and(0,0,0).
and(1,1,1).

or(1,0,1).
or(0,1,1).
or(0,0,0).
or(1,1,1).

inv(1,0).
inv(0,1).

%Outputs

display(1,1,1,1,1,1,0, 0).
display(0,1,1,0,0,0,0, 1).
display(1,1,0,1,1,0,1, 2).
display(1,1,1,1,0,0,1, 3).
display(0,1,1,0,0,1,1, 4).
display(1,0,1,1,0,1,1, 5).
display(1,0,1,1,1,1,1, 6).
display(1,1,1,0,0,0,0, 7).
display(1,1,1,1,1,1,1, 8).
display(1,1,1,1,0,1,1, 9).

%Calculations

a(A, B, C, D, OUT) :- 
		     and(B, D, X1),
		     inv(D, X2),
		     inv(B, X3),
		     and(X2, X3, X4),
		     or(X1, X4, X5),
		     or(X5, C, X6),
		     or(A, X6, OUT).
		     
b(B, C, D, OUT) :-
		     and(C, D, X1),
		     inv(B, X2),
		     inv(C, X3),
		     inv(D, X4),
		     and(X3, X4, X5),
		     or(X2, X5, X6),
		     or(X1, X6, OUT).
c(B, C, D, OUT) :-
		     inv(C, X1),
		     or(X1, B, X2),
		     or(X2, D, OUT).
d(A, B, C, D, OUT) :-
		     or(B, D, X1),
		     inv(X1, X2),
		     inv(D, X3),
		     and(X3, C, X4),
		     inv(B, X5),
		     and(X5, C, X6),
		     inv(C, X7),
		     and(B, X7, X8),
		     and(X8, D, X9),
		     or(A, X6, X10),
		     or(X2, X10, X11),
		     or(X9, X4, X12),
		     or(X11, X12, OUT).
e(B, C, D, OUT) :-
		     inv(D, X1),
		     and(X1, C, X2),
		     inv(B, X3),
		     and(X1, X3, X4),
		     or(X2, X4, OUT).
f(A, B, C, D, OUT) :-
		     or(C, D, X1),
		     inv(X1, X2),
		     inv(D, X3),
		     and(B, X3, X4),
		     inv(C, X5),
		     and(X5, B, X6),
		     or(A, X6, X7),
		     or(X2, X4, X8),
		     or(X7, X8, OUT).
g(A, B, C, D, OUT) :-
		     inv(D, X1),
		     and(C, X1, X2),
		     inv(C, X3),
		     and(B, X3, X4),
		     inv(B, X5),
		     and(C, X5, X6),
		     or(A, X6, X7),
		     or(X2, X4, X8),
		     or(X7, X8, OUT).

circuit(A, B, C, D, OUT) :-
		    a(A, B, C, D, X1),
		    b(B, C, D, X2),
		    c(B, C, D, X3),
		    d(A, B, C, D, X4),
		    e(B, C, D, X5),
		    f(A, B, C, D, X6),
		    g(A, B, C, D, X7),
		    display(X1, X2, X3, X4, X5, X6, X7, OUT).
