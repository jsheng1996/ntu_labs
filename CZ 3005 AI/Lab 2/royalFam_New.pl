%Entities
female(elizabeth).
male(charles).
female(ann).
male(andrew).
male(edward).

%Relationships
child(charles, elizabeth).
child(ann, elizabeth).
child(andrew, elizabeth).
child(edward, elizabeth).

%Rules
successor(X,elizabeth) :-
  child(X,elizabeth).
