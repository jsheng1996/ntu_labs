%Entities
female(elizabeth).
male(charles).
female(ann).
male(andrew).
male(edward).

%Relationships
child(charles, elizabeth).
child(andrew, elizabeth).
child(edward, elizabeth).
child(ann, elizabeth).

%Rules
successor(X,elizabeth) :-
  child(X,elizabeth).
