% For lists that have even lengths
second_half(L,B):-append(A,B,L),length(B,N),length(A,N).

% For lists that have odd lengths
second_half(L,B):-append(A,B,L),length(B,N),length(A,N1),N1 is N+1.
