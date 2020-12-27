% Question 6.1

start(s1).
transition(s1, a, s2).
transition(s2, a, s2).
transition(s2, b, s1).
transition(s2, c, s4).
transition(s3, a, s1).
transition(s3, b, s4).
transition(s4, d, s3).
final(s1).

% Question 6.3

acceptance(INPUTS) :- start(CURRENT_STATE), nextTransition(CURRENT_STATE, INPUTS).
nextTransition(CURRENT_STATE, [NEXT_INPUT|INPUTS]) :- transition(CURRENT_STATE, NEXT_INPUT, NEXT_STATE), nextTransition(NEXT_STATE, INPUTS).
nextTransition(CURRENT_STATE, []) :- final(CURRENT_STATE).
