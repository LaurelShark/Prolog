% created by Yaroslav Kladko, 24-01-2017

book(00001, kopitko, teoria_ymovirnostey, avers, 2017, 435).
book(00010, brickz, machine_learning, alerta, 2014, 557).
book(00100, remark, three_friends, atika, 2010, 337).
book(01000, rowling, deathly_hallows, a-ba-ba-ha-la-ma-ha, 2008, 647).
book(10000, kuhn, deep_learning, vik, 2013, 440).

reader(yaroslav_kladko, kudri, 777, 19, unemployed).
reader(ivan_rudskoi, kopan, 133, 21, youtube).
reader(kost_alia, kudri, 555, 20, akademika).
reader(glibovets_mukola, undefined, 333, 58, naukma).
reader(deontay_wilder, antonious, 43215, 27, unemployed).

idcard(yaroslav_kladko, 10000, date(12,jan,2018), date(12,may,2018), no). 
idcard(ivan_rudskoi, 01000, date(13,jan,2018), date(13,may,2018), no).
idcard(kost_alia, 00100, date(20,dec,2017), date(31,dec,2017), yes).
idcard(glibovets_mukola, 00010, date(5,jun,2005), date(6,sep,2005), yes).
idcard(deontay_wilder, 00001, date(10,4,2010), date(11,5,2014), yes).

%Task 2 - with using structures

fullid(reader(yaroslav_kladko, kudri, 777, 19, unemployed), book(10000, kuhn, deep_learning, vik, 2013, 440), date(12,1,2018), date(12,5,2018), no).
fullid(reader(ivan_rudskoi, kopan, 133, 21, youtube), book(01000, rowling, deathly_hallows, a-ba-ba-ha-la-ma-ha, 2008, 647), date(13,1,2018), date(13,5,2018), no).
fullid(reader(kost_alia, kudri, 555, 20, akademika), book(00100, remark, three_friends, atika, 2010, 337), date(20,12,2017), date(31,12,2017), yes).
fullid(reader(glibovets_mukola, undefined, 333, 58, naukma), book(00010, brickz, machine_learning, alerta, 2014, 557), date(5,7,2005), date(6,9,2005), yes).
fullid(reader(deontay_wilder, antonious, 43215, 27, unemployed), book(00001, kopitko, teoria_ymovirnostey, avers, 2017, 435), date(10,4,2010), date(11,5,2014), yes).


%(task1)Who has taken that book?
booktake(X, Y):- idcard(X,Y,_,_,_). 

%(task1)List of readers-debtors.
debtors(X):- idcard(X,_,_,_,no).

%(task1)List of books, that youth is interested in.(AGE>18, AGE<25)
interestingbooks(X):- book(I,_,X,_,_,_), idcard(Y,I,_,_,_), reader(Y,_,_,A,_), A>18, A<25.

%(task1)favourite authors of defined reader.
favouriteauthours(X, R):- book(Y,X,_,_,_,_), idcard(R,Y,_,_,_). 

%(task1)type of readers employment in corellation with its favourite author.
type(X, A):- book(I,A,_,_,_,_), idcard(N,I,_,_,_), reader(N,_,_,_,X).

%(task2)Who has taken that book?
booktake2(X, Y):- fullid(reader(X,_,_,_,_), book(_,_,Y,_,_,_),_,_,_).

%(task2)List of readers-debtors.
debtors2(X):- fullid(reader(X,_,_,_,_),_,_,_,no). 

%(task2)List of books, that youth is interested in.(AGE>18, AGE<25)
interestingbooks2(X):- fullid(reader(_,_,_,AGE,_), book(_,_,X,_,_,_),_,_,_), AGE>=18, AGE=<25.

%(task2)favourite authors of defined reader.
favouriteauthours2(X, R):- fullid(reader(R,_,_,_,_), book(_,X,_,_,_,_),_,_,_).

%(task2)type of readers employment in corellation with its favourite author.
type2(X, A):- fullid(reader(_,_,_,_,X), book(_,A,_,_,_,_),_,_,_). 



