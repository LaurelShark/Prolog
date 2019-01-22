%Returns an array with nodes of binary tree
task1(nil,[]).
task1(tree(Left,X,Right), Xs):-task1(Left,Ls),task1(Right,Rs),append(Ls,[X|Rs],Xs).

%Alternative way for the task1
detour(tree(_,X,_),X).
detour(tree(L,_,_),X):-detour(L,X).
detour(tree(_,_,R), X):-detour(R,X).

% WARNING! The strucrure of trees was changed
% tree(Left,X,Right) --> tree(X,Left,Right)


%Returns an amount of leaves of binary tree
task2(nil,0).
task2(tree(X,nil,nil),1).
task2(tree(X,Left,Right), Num):-task2(Left,Ls),task2(Right,Rs), Num is Ls+Rs.

%Example of trees
%tree1 = tree(6,tree(4,tree(3,nil,nil),tree(5,nil,nil)),tree(8,tree(7,nil,nil),tree(9,nil,nil)))

%Returns the height of the tree
task3(nil,0).
task3(tree(_,Left,Right),Height):-task3(Left,Ls), task3(Right,Rs), H is max(Ls,Rs), Height is 1+H.

%Returns the number of nodes in binary tree
task4(nil,0).
task4(tree(_,Left,Right),Nodes):-task4(Left,Ls), task4(Right,Rs), Nodes is 1+Ls+Rs.


%2-3tree (from presentation) - v2(v2(v3(v2(nil,1,nil),3,v2(nil,3,nil),4,v2(nil,4,nil)),5,v2(v2(nil,5,nil),7,v2(nil,7,nil))),8,v2(v3(v2(nil,8,nil),10,v2(nil,10,nil),12,v2(nil,12,nil)),13,v2(nil,15,nil))). 
%2-3tree (from presentation) - v2(v2(v3(v2(nil,1,nil),3,v2(nil,3,nil),4,v2(nil,4,nil)),5,v2(v2(nil,5,nil),7,v2(nil,7,nil))),8,v2(v3(nil,10,nil,12,nil),13,v2(nil,15,nil))). 

% Detour of 2-3 tree 
% task5(v2(v2(v3(v2(nil,1,nil),3,v2(nil,3,nil),4,v2(nil,4,nil)),5,v2(v2(nil,5,nil),7,v2(nil,7,nil))),8,v2(v3(v2(nil,8,nil),10,v2(nil,10,nil),12,v2(nil,12,nil)),13,v2(nil,15,nil)))).

task5(Tree):-displ(Tree, 0).
displ(nil,_).
displ(tree(M), Height):- tab(Height), write(M), nl.
displ(v2(T1, M, T2), Height):- Height1 is Height+5, displ(T2, Height1), 
                                                      tab(Height), write(**), nl,
                                                      tab(Height), write(M), nl,
                                                      tab(Height), write(**), nl,
                                                      displ(T1, Height1).
displ(v3(T1, M1, T2, M2, T3), Height):- Height1 is Height+5, displ(T3, Height1),
                                                               tab(Height), write(**), nl,
                                                               tab(Height), write(M2), nl,
                                                               displ(T2, Height1), 
                                                               tab(Height), write(M1), nl,
                                                               tab(Height),write(**), nl,
                                                               displ(T1, Height1).


%
%   **
%          15
%          **
%     **
%     13
%     **
%          **
%          12
%          10
%          **
%**
%8
%**
%               **
%               7
%               **
%          **
%          7
%          **
%               **
%               5
%               **
%     **
%     5
%     **
%               **
%               4
%               **
%          **
%          4
%               **
%               3
%               **
%          3
%          **
%               **
%               1
%**
%true.

% Finds element in 2-3 tree
% task6(5, v2(v2(nil,5,nil),8,v2(nil,13,nil))).

task6(X,v2(_,X,_)):- write('Element was found - '), write(X),!.
task6(X,v3(_,X,_,_,_)):- write('Element was found - '), write(X),!.
task6(X,v3(_,_,_,X,_)):- write('Element was found - '), write(X),!.
task6(X,v2(T1,_,_)):-task6(X,T1).
task6(X,v2(_,_,T2)):-task6(X,T2).
task6(X,v3(T1,_,T2,_,T3)):-task6(X,T1), task6(X,T2), task6(X,T3).

% Checks if the object is a binary tree
% task71(tree(6,tree(4,tree(3,nil,nil),tree(5,nil,nil)),tree(8,tree(7,nil,nil),tree(9,nil,nil)))).

task71(nil).
task71(tree(_,Left,Right)):-task71(Left), task71(Right).

% Checks if the object is a 2-3 tree
% task72(v2(v2(nil,5,nil),8,v2(nil,13,nil))).

task72(nil).
task72(v2(T1,_,T2)):-task72(T1), task72(T2).
task72(v3(T1,_,T2,_,T3)):-task72(T1), task72(T2), task72(T3).

