
% print():-repeat(),write('a'),!.
% print().

% lang(1)

likes(mary,books).
likes(peter,mary).
likes(mary,peter).

go:-likes(X,Y),!,likes(Y,Z).

subset(0,[],[]):-!.
subset(N, [A|L],[A|S]):- N1 is N-1, subset(N1, L, S).
subset(N, [_|L], S):- subset(N,L,S). 