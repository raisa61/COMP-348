student(raisa,40108334).
student(ben,40122097).
student(justin,40052815).
student(jeremy,40131772).
course(raisa,comp348).
course(raisa,comp352).
course(raisa,phys284).
course(raisa,encs282).
course(ben,comp348).
course(ben,engr371).
course(ben,phys284).
course(ben,encs282).
course(justin,comp348).
course(justin,comp479).
course(justin,math354).
course(justin,actu458).
course(jeremy,comp348).
course(jeremy,comp352).
course(jeremy,encs282).
course(jeremy,engr202).
team(raisa).
team(ben).
team(justin).
team(jeremy).

course_list(S1, S2, S3, S4, List1, List2, List3, List4) :-
    findall(Course, course(S1, Course), List1),
    findall(Course, course(S2, Course), List2),
    findall(Course, course(S3, Course), List3),
    findall(Course, course(S4, Course), List4).

team_size(X):- findall(Name,team(Name),List), length(List,X).

combined_list(Unique_list):- findall(Course,course(_,Course),List),
                             list_to_set(List,Unique_list).

