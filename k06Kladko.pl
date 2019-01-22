% AVL tree - tree(tree(nil,3,nil), 5, tree(tree(nil,5,nil),8,nil)).

% Detour of AVL tree - returns an array with nodes.
% task1(tree(tree(nil,3,nil), 5, tree(tree(nil,5,nil),8,nil)),A).

task1(nil,[]).
task1(tree(Left,X,Right), Xs):- task1(Left,Ls), task1(Right,Rs), append(Ls, [X|Rs], Xs).

% Alternative way for the task1
% task11(tree(tree(nil,3,nil), 5, tree(tree(nil,5,nil),8,nil))).

task11(Tree):-task11(Tree,0).
task11(nil,_).
task11(tree(M), Height):- tab(Height), write(M), nl.
task11(tree(Left,X,Right),Height):- Height1 is Height+5, task11(Right,Height1), tab(Height),
                                                         write(**), nl, tab(Height),
                                                         write(X), nl, tab(Height),
                                                         write(**),nl, 
                                                         task11(Left,Height1).


% Finds an element in AVL tree
% task2(tree(tree(nil,2,nil),5,tree(nil,6,tree(nil,5,nil))),2).

task2(tree(_,X,_),X):- write('Element was found - '), write(X).
task2(tree(Left,_,_),X):- task2(Left,X).
task2(tree(_,_,Right),X):- task2(Right,X).


% Checks if the object is an AVL tree
% task3(tree(tree(nil,3,nil), 5, tree(tree(nil,5,nil),8,nil))).
% true.
% task3(tree(tree(nil,2,nil),5,tree(tree(nil,4,tree(nil,8,nil)),6,tree(nil,5,nil)))).
% false.

task3(Tree):-task3(Tree,_).
task3(nil,0).
task3(tree(Left,X,Right),Height):-task3(Left,HeightLeft), task3(Right,HeightRight),
                                                          (HeightLeft is HeightRight;
                                                          HeightLeft is HeightRight+1;
                                                          HeightLeft is HeightRight-1),
                                                          checkHeight(HeightLeft,HeightRight,Height).

checkHeight(HeightLeft,HeightRight,Height):- HeightLeft > HeightRight,!, Height is HeightLeft+1; Height is HeightRight+1.

% Deletion the node from binary search tree 
% task4(tree(tree(tree(nil,1,nil),2,nil),3,tree(nil,5,tree(nil,6,nil))),5,NewTree).

task4(tree(nil,X,Right),X,Right).
task4(tree(Left,X,Right),X,Left).
task4(tree(Left,X,Right),X,tree(Left,Y,Right1)):- leftCut(Right,Y,Right1).
task4(tree(Left,Root,Right),X,tree(Left1,Root,Right)):- gt(Root,X), task4(Left,X,Left1).
task4(tree(Left,Root,Right),X,tree(Left,Root,Right1)):- gt(X,Root), task4(Right,X,Right1). 

leftCut(tree(nil,Y,R),Y,R).
leftCut(tree(Left,Root,Right),Y,tree(Left1,Root,Right1)):- leftCut(Left,Y,Left1).
