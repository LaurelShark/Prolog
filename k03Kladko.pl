fill:-ffill(9).
ffill(-1):-!.
ffill(X):-asserta(d(X)),X1 is X-1,ffill(X1).

%All three-digit numbers, where two-digit number, that consists of first and third 
%nums of three-digit is a divider of the last
task1(X):-d(A), A>0, d(B), d(C), 0 is (100*A + 10*B + C) mod (10*A + C), X is 100*A + 10*B + C.

%Four-digit number, that is exact square, where first and second numbers are same, 
%and third with fourth similarly
task2(X):-d(A),A>0,d(B), X is (1000*A + 100*A + 10*B + B), S is sqrt(X), F is floor(S), C is ceiling(S), C=F.

%All integers from 1 to 1998, that arent dividing not for 6, not for 10, neither for 15 
task3(X):-count3(X,0,0).
count3(X,T,S):-T=1998,S=X,!.
count3(X,T,S):-T1 is T+1, T1 =<1998, M is T1 mod 6, M = 0, S1 is S, count3(X,T1,S1).
count3(X,T,S):-T1 is T+1, T1 =<1998, N is T1 mod 10, N = 0, S1 is S, count3(X,T1,S1).
count3(X,T,S):-T1 is T+1, T1 =<1998, K is T1 mod 15, K = 0, S1 is S, count3(X,T1,S1).
count3(X,T,S):-T1 is T+1, T1 =<1998, M is T1 mod 6, N is T1 mod 10, K is T1 mod 15, M \= 0, N \=0, K \= 0, S1 is S+1, count3(X,T1,S1).

%The smallest number with property, that the sum of next eleven squares is the exacty square   
task4(X):-M=0,search(X,M,0,M,0).
search(X,M,11,Y,S):- Sq is sqrt(S), F is floor(Sq), C is ceiling(Sq),F\=C, M1 is M + 1, search(X,M1,0,M1,0).
search(X,M,11,Y,S):- Sq is sqrt(S), F is floor(Sq), C is ceiling(Sq),F=C,M=X,!.
search(X,M,0,Y,S):- M = Y, I1 is 0+1, Y1 is M+1, S1 is Y1*Y1+S, search(X,M,I1,Y1,S1).
search(X,M,I,Y,S):- I1 is I+1, Y1 is Y+1, S1 is Y1*Y1+S, search(X,M,I1,Y1,S1).

%Amount of numbers, that are in period from 1998737.. to 1998, where every fifth number
%is equal to sum of last four numbers  
task5(X):-find5th(X,1,9,9,8,0,0).
find5th(X,1,9,9,8,_,C):-C>0,C=X,!.
find5th(X,N1,N2,N3,N4,S,C):- S1 is N1+N2+N3+N4, lastTaker(S1,L), N5 is L, C1 is C+1, find5th(X,N2,N3,N4,N5,0,C1).
lastTaker(S1,L):-L is S1 mod 10,!.





