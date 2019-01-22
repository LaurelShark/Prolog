%This predicate converts input list into list that consists of indexes of negate elements from input list
task1(List,Res):-findnegatepositions(List,[],1,Result), reversion(Result,ReversedList),ReversedList=Res.
findnegatepositions([],X,_,X):-!.
findnegatepositions([Head|Tail],X,Index,Result):- Head < 0, Index1 is Index + 1, findnegatepositions(Tail,[Index|X],Index1,Result).
findnegatepositions([Head|Tail],X,Index,Result):- Head >= 0, Index1 is Index + 1, findnegatepositions(Tail,X,Index1,Result).

reversion(List,ReversedList):-reversion(List,[],ReversedList).
reversion([],ReversedList,ReversedList).
reversion([Head|Tail],Accum,ReversedList):-reversion(Tail,[Head|Accum],ReversedList).

test([],E,[E]).
test([L1|H1],E,[L1|H2]):-test(H1,E,H2).


%This predicate replaces all instances of specified element to 'change_done' symbol 
task2(List,C,Res):-findElem(List,C,[],Result),reversion(Result,Res).
findElem([],_,R,Result):-R = Result,!.
findElem([Head|Tail],C,R,Result):-Head=C, M = 'change_done', findElem(Tail,C,[M|R],Result).
findElem([Head|Tail],C,R,Result):-Head\=C, findElem(Tail,C,[Head|R],Result).


%This predicate converts every list that consist of Arabic numerals(1-50)
%to Roman numerals
%task3([50,9,30,5],Result).
%Result = ['L','IX','XXX','V']
task3(List,RomanList):-toRoman(List,[],ReversedList), reversion(ReversedList,RomanList).
toRoman([],ReversedList, ReversedList).
toRoman([Head|Tail], ReversedList, R):- dig(A, Head), add(A,ReversedList, Res), toRoman(Tail,Res,R).
add(X,List,[X|List]).


%Cyclic shift to rigth for every element of the list 
task4(List,Result):-length(List,L),L1 is L-1, shift(List,L1,Sum1,Sum2), append(Sum1,[],Result).

shift(R,0,[],R).
shift([X|Tail],I,[X|TS],R):-I>0, I1 is I-1, shift(Tail, I1, TS, Sum2).


%Multiplication matrix on vector
%Matrix is list of lists
%Vector is a list, that has same lenght, as a matrix row
%task5([[1,0,0],[0,1,0],[0,0,1]],[7,7,7],Result).
%Result = [7, 7, 7].


task5(Matrix,Y,Result):-mp(Matrix,Y,[],ReversedList), reversion(ReversedList, Result).

mp([],_,R,R).
mp([Rows|Tail], Y, R,Result):-mpRows(Rows, Y, 0, Sum), mp(Tail, Y, [Sum|R], Result).

mpRows([], Y, TSum, TSum).
mpRows([X|XS], [Y|YS], TSum, Sum):- TSum1 is TSum+X*Y, mpRows(XS, YS, TSum1, Sum).

dig('IX', 9).
dig('VIII', 8).
dig('VII', 7).
dig('VI', 6).
dig('V', 5).
dig('IV', 4).
dig('III', 3).
dig('II', 2).
dig('I', 1).
dig('',0).
dig('L', 50).
dig('XL', 40).
dig('XXX', 30).
dig('XX', 20).
dig('X', 10).
dig('XI', 11).
dig('XII', 12).
dig('XII', 13).
dig('XIV', 14).
dig('XV', 15).
dig('XI', 16).
dig('XII', 17).
dig('XIII', 18).
dig('XIX', 19).
dig('XXI', 21).
dig('XXII', 22).
dig('XXIII', 23).
dig('XXIV', 24).
dig('XXV', 25).
dig('XXVI', 26).
dig('XXVII', 27).
dig('XXVIII', 28).
dig('XXIX', 29).
dig('XXXI', 31).
dig('XXXII', 32).
dig('XXXIII', 33).
dig('XXXIV', 34).
dig('XXXV', 35).
dig('XXXVI', 36).
dig('XXXVII', 37).
dig('XXXVIII', 38).
dig('XXXIX', 39).
dig('XLI', 41).
dig('XLII', 42).
dig('XLIII', 43).
dig('XLIV', 44).
dig('XLV', 45).
dig('XLVI', 46).
dig('XLVII', 47).
dig('XLVII', 48).
dig('XLIX', 49).
