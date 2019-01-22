
% A = 5 l, B = 3 l
% Goal: 4 litres

% Solution:
% A = 0 ; B = 0;
% A = 5 ; B = 0;
% A = 5 ; B = 3;
% A = 0 ; B = 3;
% A = 3 ; B = 3;
% A = 5 ; B = 1;
% A = 0 ; B = 1;
% A = 1 ; B = 0;
% A = 1 ; B = 3;
% A = 4 ; B = 0;

% Solution(another way):
% A = 5 ; B = 0;
% A = 2 ; B = 3;
% A = 2 ; B = 0;
% A = 0 ; B = 2;
% A = 5 ; B = 2;
% A = 4 ; B = 3;


task91:- task91(state(0,0), state(4,_)).
% not(P):-P,!,fail;true.
task91(S,G):-path(S,G,[S],L), nl, write('The solution is: '), nl, getSolvingList(L).
task91(_,_).

path(S,G,L,L1):-S=G,L1=L,!;move(S,S1),\+ member(S1,L),path(S1,G,[S1|L],L1).
path(G,G,T,T):-!.

getSolvingList([Head|Tail]):- getHead(Head), getSolvingList(Tail).
getSolvingList(_).

getHead(state(X,Y)):-nl, write('Jar A'), write(X), write('litres'),nl,
                         write('Jar B'), write(Y), write('litres'),nl.

% List all possible move
move(state(0,B),state(5,B)).
move(state(A,0),state(A,3)).
move(state(X,3),state(X,0)).
move(state(5,Y),state(0,Y)).
move(state(X,Y),state(X1,Y1)):-fillin(X,Y,5,3,X1,Y1).
move(state(X,Y),state(X1,Y1)):-fillin(Y,X,3,5,Y1,X1).

fillin(X,Y,_,Y,JarA,JarB):- JarA=X, JarB=Y,!.
fillin(0,Y,_,_,JarA,JarB):-  JarA=0,JarB=Y,!.
fillin(X,Y,F,I,JarA,JarB):- X1 is X-1, Y1 is Y+1,!,fillin(X1,Y1,F,I,JarA,JarB).

