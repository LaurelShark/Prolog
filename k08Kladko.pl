% Einstein riddles

% Task1

% Order - Number, Name, Nationality, Sport
% X - information,
% Y - australian, 
% Z - sports Richard does

better(A,B):-A is B-1.
better(A,B):-A is B+1.

einstein1(X, Y, Z):- X=[person(1, Name1,  Nationality1, Sport1),
                        person(2, Name2, Nationality2, Sport2),
                        person(3, Name3,  Nationality3, Sport3)],

                        % clauses

                        member(person(A,michael,_,basketball),X), member(person(B,_,american,_),X), better(A,B),
                        member(person(C,simon,israelite,_),X), member(person(D,_,_,tennis),X), better(C,D),
                        member(person(1,_,_,cricket),X),

                        % australian

                        member(person(_,Y,australian,_),X),

                        % sports Richard does

                        member(person(_,richard,_,Z),X).


% Task2

% Order - Number, Person, Color, Drink, Animal, Cigarette
% X - where who lives
% Y - answer

left(A,B):-right(B,A).
right(A,B):-A is B+1.
near(A,B):-right(A,B).
near(A,B):-left(A,B).


einstein2(X, Y):- X=[house(1, Owner1, Color1, Drink1, Animal1, Cigarette1),
                     house(2, Owner2, Color2, Drink2, Animal2, Cigarette2),
                     house(3, Owner3, Color3, Drink3, Animal3, Cigarette3),
                     house(4, Owner4, Color4, Drink4, Animal4, Cigarette4), 
                     house(5, Owner5, Color5, Drink5, Animal5, Cigarette5)],


                     % clauses

                     member(house(_,englishman,red,_,_,_), X), 
                     % write(X), nl,
                     member(house(_,swede,_,_,dog,_), X),
                      % write(X), nl,
                     member(house(_,dane,_,tea,_,_), X), 
                     % write(X), nl, 
                     member(house(A,_,green,_,_,_), X), member(house(B,_,white,_,_,_), X), left(A,B),
                     member(house(_,_,green,coffee,_,_), X), 
                     % write(X), nl, 
                     member(house(_,_,_,_,bird,pallmall), X), 
                     % write(X), nl, 
                     member(house(3,_,_,milk,_,_), X), 
                     % write(X), nl,
                     member(house(_,_,yellow,_,_,dunhill), X), 
                     % write(X), nl,
                     member(house(1,norwegian,_,_,_,_), X), 
                     % write(X), nl,   
                     member(house(C,_,_,_,_,marlboro), X), member(house(D,_,_,_,pussy,_), X), near(C,D),
                     member(house(E,_,_,_,horse,_), X), member(house(F,_,_,_,_,dunhill), X), near(E,F),
                     member(house(_,_,_,beer,_,winfield), X), 
                     % write(X), nl,
                     member(house(G,norwegian,_,_,_,_), X), member(house(H,_,blue,_,_,_), X), near(G,H),
                     member(house(_,german,_,_,_,rothmans), X), 
                     % write(X), nl,
                     member(house(I,_,_,_,_,marlboro), X), member(house(J,_,_,water,_,_), X), near(I,J),

                     % answer

                     member(house(_,Y,_,_,fish,_), X).

                    



                                         