%Entities
company(sumSum).
company(appy).
person(stevey).
smartphone_tech(galactica_S3).

%Relationships
boss(stevey, appy).
competitor(sumSum, appy).
develop(sumSum,galactica_S3).
steal(stevey,galactica_S3).

%Rules
/*1. A competitor of Appy is a rival*/
rival(X, appy) :-
  competitor(X, appy).

/*2. smartphone_tech is a business*/
business(X) :-
  smartphone_tech(X).

/*3. If a company develops a smartphone_tech, it owns the rights to it*/
own(X,Y) :-
  develop(X,Y).

/*4. It is unethical for a Boss (of company C)
to steal business (X) from rival companies (D).*/
unethical(B) :-
  steal(B,X), own(D,X), boss(B,C), rival(D,C).
