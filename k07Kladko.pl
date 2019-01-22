% Bergson matches

% Правила:
/* За один хід гравець може взяти кількість сірників 2n, де n - кількість 
   сірників, які були взяті попереднім гравцем, але не менше, ніж 1 сірник. 
   Виграє той, хто забирає останній сірник.
*/

% Виграшний алгоритм:
/* m - кількість сірників, які залишились перед початком ходу
Стратегія полягає в тому, щоб опонент не міг забрати ВСІ сірники за наступний хід.
Нехай гравець бере n сірників за півхід(хід - 2 півходи суперників), тоді суперник 
може взяти максимум 2n, тобто за один хід максимум можуть бути забрані 3n сірників
Щоб виграти, необхідно брати таку кількість, щоб число 3n < m.
Якщо 3n = m, тоді суперник виграє.
*/


% Почати гру
% go.

go:- matchesNum.

% 
matchesNum:- write('------------------\n'),
             format("Number of matches: ", []), nl,
             % format(" ", []),
             read(N),
             ((correctMatches(N), firstPlayer(N), !) ; write('\nIncorrect data\n'), matchesNum).

correctMatches(N):- number(N), N > 0.

firstPlayer(N):- write('------------------\n'),
                 format("First move is going to: \n",[]),
                 format("0 - Computer\n", []),
                 format("1 - Player\n", []),
                 read(A),
                 ((number(A), A=:=0, pcFirst(N),!) ;
                 	(number(A), A=:=1, playerFirst(N),!) ;
                 	write('\nIncorrect data\n'), firstPlayer(N)).

pcFirst(N):- write('------------------\n'),
             write('Computers turn... \n'),
             write('There is '), write(N), write(' matches on the board.\n'),
             write('------------------\n'),
             ((N =:= 1, Taken is 1, pcTurn(Taken), totalMatches(N, Taken, Left), play(1, Taken, Left), !) ; 
             	(N =:= 2, Taken is 2, pcTurn(Taken), totalMatches(N, Taken, Left), play(1, Taken, Left), !) ;
             	(random(1, 3, Taken), (N - Taken)mod(2*Taken + 1) =:= 0, pcTurn(Taken), totalMatches(N, Taken, Left), play(1, Taken, Left), !) ;
             	(random(1, 3, Taken), pcTurn(Taken), totalMatches(N, Taken, Left), play(1, Taken, Left), !)).

playerFirst(N):- write('Thats is your first move, you can take 1 or 2 matches.\n'), nl, read(A),
                 ((number(A), A > 0, A < 3, playerTurn(A), totalMatches(N, A, Left), play(0, A, Left), !) ;
                  (write('You entered incorrect111 data.Try again.\n'), playerFirst(N), !)).

% Count of matches
totalMatches(N, Taken, Left):- Left is N - Taken, 
                               write(Left), write(' matches left on the board.\n'), !.

% Writing turns
pcTurn(N):- write('Computer picked up '), write(N), write(' matches.\n'), !.
playerTurn(N):- write('You took '), write(N), write(' matches.\n'), !.

% Order of turns
play(P, Taken, Left):- ((Left < 1, win(P), !) ; 
	                     (P =:= 1, write('Your turn! \n'), nextYou(Left, Taken), !) ;
	                     (P =:= 0, write('Computers turn! \n'), nextPc(Left, Taken), !)). 

nextYou(N, Taken):- MAXX is 2*Taken, ((MAXX >= N, write('\nYou can take from 1 to '), write(N), 
	                                    write(' mathches.\n'), nl, read(X), correctUserInput(N, Taken, MAXX, X), !) ;
                                      (MAXX < N, write('\nYou can take from 1 to '), write(MAXX), 
	                                    write(' mathches.\n'), nl, read(X), correctUserInput(N, Taken, MAXX, X), !)).

% Computers logic
% ------------------------------------
nextPc(N, Taken):- MAXX is 2*Taken, ((MAXX >= N, Taken1 is N, pcTurn(Taken1), totalMatches(N, Taken1, Left), play(1, Taken1, Left), !) ;
	                                    (MAXX < N, random(1, MAXX, Taken1), (N - Taken1)mod(2*Taken1 + 1) =:= 0, pcTurn(Taken1), totalMatches(N, Taken1, Left), play(1, Taken1, Left), !) ;
	                                    (MAXX < N, random(1, MAXX, Taken1), pcTurn(Taken1), totalMatches(N, Taken1, Left), play(1, Taken1, Left), !)).
% ------------------------------------

win(P):-((P =:= 0, write('You win. Congratulations.'), newGame, !) ; 
	       (P =:= 1, write('Ahahahaha, PC win!'), newGame, !)).

correctUserInput(N, Taken, MAXX, X):- ((number(X), X > 0, X =< MAXX, playerTurn(X), totalMatches(N, X, Left), play(0, X, Left), !) ;
	                                      (write('You entered incorrect data.Try again.\n'), nextYou(N, Taken), !)).

newGame:-write('Wanna start new game? Press 1\n'), read(A),
         ((number(A), A =:= 1, go, !) ;
         	(write('Game over. Bye.'), !)).
