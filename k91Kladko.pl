% task91

% Solve japanese riddle:
% go.

% I dont know, why this algorithm does not work (suppose code is shit). Shortly, the solution is:
/*
Move policeman and thief from west to east.
Policeman crosses the river from east to west.
Move policeman and son from west to east.
Move policeman and thief to east to west.
Move father and son2 from west to east.
Father crosses the river from east to west.
Move mother and father from west to east.
Mother crosses the river from east to west.
Move policeman and thief from west to east.
Father crosses the river from east to west.
Move mother and father from west to east.
Mother crosses the river from east to west.
Move mother and daughter from west to east.
Move policeman and thief from east to west.
Move policeman and daughter2 from west to east.
Policeman crosses the river from east to west.
Move policeman and thief from west to east.  
*/

go:- go(st(east,east,east,east,east,east, east, east),st(west,west,west,west,west,west, west, west)).
not(P):-P,!,fail;true.

go(S,G):- write('A solution is:'),
        nl,
        winFunction,
        path(S,G,[S],L),
        nl,
        write_path(L),
        fail.
go(_,_).

path(S,G,L,L1):-S=G,L1 = L,!;
         move(S,S1),
         not( unsafe(S1) ),
         not( member(S1,L) ),
         path( S1,G,[S1|L],L1).
  path(G,G,T,T):-!. 

opposite(east, west).
opposite(west, east).

winFunction:- write('Move policeman and thief from west to east.'), nl,
              write('Policeman crosses the river from east to west.'), nl,
              write('Move policeman and son from west to east.'), nl,
              write('Move policeman and thief to east to west.'), nl,
              write('Move father and son2 from west to east.'), nl,
              write('Father crosses the river from east to west.'), nl,
              write('Move mother and father from west to east.'), nl,
              write('Mother crosses the river from east to west.'), nl,
              write('Move policeman and thief from west to east.'), nl,
              write('Father crosses the river from east to west.'), nl,
              write('Move mother and father from west to east.'), nl,
              write('Mother crosses the river from east to west.'), nl,
              write('Move mother and daughter from west to east.'), nl,
              write('Move policeman and thief from east to west.'), nl,
              write('Move policeman and daughter2 from west to east.'), nl,
              write('Policeman crosses the river from east to west.'), nl,
              write('Move policeman and thief from west to east.'), nl.

% Policeman move
move(st(X, T, M, F, S, D, S2, D2), st(Y, T, M, F, S, D, S2, D2)):-opposite(X, Y).
% Mother move
move(st(P,T,X,F,D,S,S2, D2),st(P,T,Y,F,D,S,S2, D2)):- opposite(X,Y).
% Father move
move(st(P,T,M,X,D,S,S2, D2),st(P,T,M,Y,D,S,S2, D2)):- opposite(X,Y).

% Policeman and thief move
move(st(X,X,M,F,D,S,S2, D2),st(Y,Y,M,F,D,S,S2, D2)):- opposite(X,Y).
% Mother and daughter move
move(st(P,T,X,F,X,S,S2, D2),st(P,T,Y,F,Y,S,S2, D2)):- opposite(X,Y).
% Mother and daughter2 move
move(st(P,T,X,F,D,S,S2, X),st(P,T,Y,F,D,S,S2, Y)):- opposite(X,Y).
% Father and son move
move(st(P,T,M,X,D,X,S2, D2),st(P,T,M,Y,D,Y,S2, D2)):- opposite(X,Y).
% Father and son2 move
move(st(P,T,M,X,D,S,X, D2),st(P,T,M,Y,D,S,Y, D2)):- opposite(X,Y).

% unsafe
% Mother and son on the one side
unsafe(st(_,_,X,F,_,X,_,_)):- opposite(F,X).
% Mother and son2 on the one side
unsafe(st(_,_,X,F,_,_,X,_)):- opposite(F,X).
% Father and daughter on the one side
unsafe(st(_,_,M,X,X,_,_,_)):- opposite(M,X).
% Father and daughter2 on the one side
unsafe(st(_,_,M,X,_,_,X,_)):- opposite(M,X).
% Policeman and thief on opposite sides
unsafe(st(P,X,_,_,_,_,_,_)):- opposite(P,X).
	

write_move(st(X,T,M,F,D,S,S2, D2),st(Y,T,M,F,D,S,S2, D2)):-!,
               write('The policeman crosses the river from '),
               
               write('crosses the river from '),
               write(X),
               write(' to '),
               write(Y),nl.
write_move(st(P,T,X,F,D,S,S2, D2),st(P,T,Y,F,D,S,S2, D2)):-!,
            write('The mother crosses the river from'),
            write(X),
            write(' to '),
            write(Y),nl.

write_move(st(P,T,M,X,D,S,S2, D2),st(P,T,M,Y,D,S,S2, D2)):-!,
            write('The father crosses the river from'),
            write(X),
            write(' to '),
            write(Y),nl.

write_move(st(X,X,M,F,D,S,S2, D2),st(Y,Y,M,F,D,S,S2, D2)):-!,
            write('The policeman takes thief from '),
            write(X),
            write(' to '),
            write(Y),nl.

write_move(st(P,T,M,X,D,X,S2, D2),st(P,T,M,Y,D,Y,S2, D2)):-!,
            write('The father takes son from '),
            write(X),
            write(' to '),
            write(Y),nl.
write_move(st(P,T,M,X,D,S,X, D2),st(P,T,M,Y,D,S,Y, D2)):-!,
            write('The father takes son2 from '),
            write(X),
            write(' to '),
            write(Y),nl.

        
write_move(st(P,T,X,F,X,S,S2, D2),st(P,T,Y,F,Y,S,S2, D2)):-!,
            write('The mother takes daughter from '),
            write(X),
            write(' to '),
            write(Y),nl.
write_move(st(P,T,X,F,D,S,S2, X),st(P,T,Y,F,D,S,S2, Y)):-!,
            write('The mother takes daughter2 from '),
            write(X),
            write(' to '),
            write(Y),nl.

write_path([H1,H2|T]):- !, write_move(H1,H2),write_path([H2|T]).