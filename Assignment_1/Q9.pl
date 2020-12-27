% Question 9
% Lucas Numbers have a recursive relationship of
% L_0 = 2, L_1 = 1, L_n = L_{n-2} + L_{n-1}

reverse([],X,X).
reverse([H|T],X,Acc) :-reverse(T,X,[H|Acc]).

recursive_lucas(N, OUT) :- recursive_lucas(N, OUT, _).
recursive_lucas(N, OUT, [H|T]) :-
    (   N>1 ->  
    	N1 is N-1,
        recursive_lucas(N1, [H|T], [H2|_]),
        L is H+H2,
        append([L], [H|T], OUT)).

recursive_lucas(0, [2], []).
recursive_lucas(1, [1,2], [2]).

lucas_sequence(N, OUT) :- 
    recursive_lucas(N, TEMP),
    reverse(TEMP, OUT, []).

% Example:
% lucas_sequence(11, X).
% X = [2, 1, 3, 4, 7, 11, 18, 29, 47, 76, 123, 199].
