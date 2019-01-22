%Функції, елементарні за Кальманом. За допомогою 0-функції та функції слідування s(x)=x+1 можна визначати інші арифметичні функції.
%Функція слідування
s(X,Y):-Y is X+1.
%Визначення функції dec1(x)=x-1
dec1(X,Y):-s(0,T1),dd(X,0,T1,Y).
dd(X,Y,Z,Y):-X=Z,!.
dd(X,Y,Z,V):-s(Y,Y1),s(Z,Z1),dd(X,Y1,Z1,V).
%Визначення функції обчислення суми двох чисел
summa(X,0,X):-!.
summa(X,Y,Z):-s(X,X1),dec1(Y,Y1),summa(X1,Y1,Z).
%Різниця двох чисел
minus(X,Y,0):-X=<Y,!.
minus(X,Y,Z):-mn(X,Y,0,Z).
mn(X,Y,Z,Z):-summa(Y,Z,X1),X1=X,!.
mn(X,Y,Z,V):-s(Z,Z1),mn(X,Y,Z1,V).
%Множення
mult(_,0,0):-!.
mult(0,_,0):-!.
mult(X,Y,Z):-ml(X,X,Y,Z).
ml(_,Y,Z,Y):-s(0,Z1),Z1=Z,!.
ml(X,Y,Z,V):-dec1(Z,Z1),summa(X,Y,Y1),ml(X,Y1,Z1,V).
%Ділення з остачею(classwork)
divmod(A,A,1,0):-!.
divmod(A,B,0,B):-B>A,!.
divmod(A,B,C,D):-div(A,B,A,0,C,D).
div(A,B,T,Cnt,Cnt,0):-mult(Cnt,B,T1),T1=A,!.
div(A,B,T,Cnt,C,D):-T=0,dec1(Cnt,C),mult(C,B,T1),minus(A,T1,D),!.
div(A,B,T,Cnt,C,D):-s(Cnt,T2),minus(T,B,T1),div(A,B,T1,T2,C,D).

%Dividing with remainder(homework)
%A,B - numbers,
%Y - full part, Z - remainder
task1(_,0,_,_):-!.
task1(A,B,Y,Z):-A<B,!.
task1(A,B,Y,Z):-task1(A,B,Y,Z,0).
task1(A,B,T,Z,T):-A<B, A=Z,!.
task1(A,B,Y,Z,T):-A1 is A-B, T1 is T+1, task1(A1,B,Y,Z,T1).

%Linear exponentiation
task2(_,0,1):-!.
task2(A,B,Z):-P is B-1,task2(A,P,Z1), Z is A*Z1.

%Logarithmic 
%for each Y(mod 2)==1,X= X*X,then shift Y=Y/2, repeat while Y!=0.
z12(_,0,Z):- Z=1,!.
z12(X,Y,Z):- Y mod 2 =:= 1, X1 is X*X,Y1 is Y>>1,z12(X1,Y1,Z1),Z is X*Z1,!.
%else X = X*X,y/2,repeat
z12(X,Y,Z):- X1 = X*X,Y1 is Y>>1,z12(X1,Y1,Z1),Z is Z1,!.

%Fibonacci numbers by recursion
task3(0,Z):-Z=0,!.
task3(1,Z):-Z=1,!.
task3(A,Z):-A1 is A-1, A2 is A-2, task3(A1,B1), task3(A2,B2), Z is B1+B2.

%Fibonacci numbers using iteration
task13(A,Z):-task13(A,Z,0,0,0),!.
task13(A,Z,T,_,Y):-A=T,Z=Y,!.
task13(A,Z,0,_,_):-task13(A,Z,1,0,1),!.
task13(A,Z,T,F1,F2):-F3 is F1+F2, T1 is T+1, task13(A,Z,T1,F2,F3). 

%All multipliers of A
task4(A):-A<2,!.
task4(A):-prime(A,R,2),write(R),nl,A1 is A div R, task4(A1). 
prime(A,_,Z):-A<Z,!.
prime(A,X,Z):-I is A mod Z, I=0, X is Z,!.
prime(A,X,Z):-Z1=Z+1, prime(A,X,Z1).	

%Factorial = 1/1!+1/2!....(1/X!)
task5(A,Z):-task5(A,Z,1,1,1),!.
task5(A,Z,I,_,Y):-A=I, Z=Y,!.
task5(A,Z,I,T,Y):-I1 is I+1, T1 is T/I1, Y1 is Y+T1, task5(A,Z,I1,T1,Y1). 

