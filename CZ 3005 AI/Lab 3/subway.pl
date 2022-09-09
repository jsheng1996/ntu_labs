/* Main functions*/
start():-	choose_healthy(),choose_vegan(),choose_value().
ask(1):-	print("Choose a sandwhich option:"), choose_bread(), choose_b_length().
ask(2):-	print("Choose a filling:"), choose_filling().
ask(3):-  print("Choose add-ons:"), choose_add_on().
ask(4):-	print("Choose vegetables:"), choose_veg().
ask(5):-	print("Choose a sauce:"), choose_sauce().
ask(6):-	print("Choose a side"), choose_side().
ask(7):-	print("Choose a drink"), choose_drink().

/*Store preferences*/
:- dynamic choice/1.
choice(nothing).
:- dynamic dislike/1.
dislike(nothing).

/*Helper functions*/
choose_healthy():-
	print("Would you like your meal to be healthy? y/n"), read(Like), (Like==y -> assert(dislike(unhealthy));Like==n -> true).	%If diner chooses healthy option, dont suggest fatty sauces, limit side options to yogurt or salad, and drink option to water, coffee and tea
choose_vegan():-
	print("Would you like your meal to be vegan? y/n"), read(Like), (Like==y -> assert(dislike(dairy_and_meat));Like==n -> true).	%If diner chooses vegan option, dont suggest dairy products and meat options
choose_value():-
	print("Would you like your meal to be value? y/n"), read(Like), (Like==y -> assert(dislike(add_ons));Like==n -> true),ask(1).	%If diner chooses value option, dont suggest add-ons

choose_bread():-
	print("1: Italian Wheat, 2. Honey Oat, 3. Flatbread") , read(Like),
	(Like==1 -> assert(choice(italian_wheat));Like==2 -> assert(choice(honey_oat));Like==3 -> assert(choice(flatbread))).

choose_b_length:-
	print("1: 6 inch, 2: Foot-long"), read(Like), (Like==1 -> assert(choice(six));Like==2 -> assert(choice(twelve))),ask(2).

choose_filling():-
	%vegan options
	(dislike(dairy_and_meat) -> print("1: Veggie Patty, 2.: Veggie Delite"), read(Like), (Like==1 -> assert(choice(veggie_patty));Like==2 -> assert(choice(veggie_delite))),(dislike(add_ons) -> ask(4); ask(3));
	%no restrictions
	print("1: Veggie Patty, 2.: Veggie Delite, 3:Chicken Bacon Ranch, 4:Cold Cut Trio"), read(Like),
	(Like==1 -> assert(choice(veggie_patty));Like==2 -> assert(choice(veggie_delite));Like==3 -> assert(choice(chicken_bacon_ranch));Like==4 -> assert(choice(cold_cut_trio))),(dislike(add_ons) -> ask(4); ask(3))).

choose_add_on():-
	%vegan add-ons
	(dislike(dairy_and_meat) -> print("1: Guacamole, 2: None"), read(Like), (Like==1 -> assert(choice(guacamole));Like==2 -> true),ask(4);
	%all add-ons
	print("1: Processed Cheddar, 2: Monterey Cheddar, 3: Guacamole, 4: None"), read(Like), (Like==1 -> assert(choice(processed_cheddar));Like==2 -> assert(choice(monterey_cheddar))
	;Like==3 -> assert(choice(guacamole));Like==4 -> true),print("Do you want more add-ons? y/n"), read(Ans), (Ans==y -> ask(3);Ans==n -> ask(4))).

choose_veg():-
	print("1:Cucumbers, 2: Green Bell Peppers, 3: Lettuce, 4: Red Onions ,5: Tomatoes, 6: Black Olives, 7: Jalapenos, 8: Pickles"),
	read(Like), (Like==1 -> assert(choice(cucumbers));Like==2 -> assert(choice(green_bell_peppers));Like==3 -> assert(choice(lettuce));
	Like==4 -> assert(choice(red_onions)); Like==5 -> assert(choice(tomatoes));Like==6 -> assert(choice(black_olives));
	Like==7 -> assert(choice(jalapenos)); Like==8 -> assert(choice(pickles))),print("Would you like to add more vegetables? y/n"), read(Choice), (Choice==y -> ask(4); Choice==n -> ask(5)).

choose_sauce():-
	%healthy sauces
	(dislike(unhealthy) -> print("1: Vinegar, 2: Sweet Onion"),
	read(Like), (Like==1 -> assert(choice(vinegar));Like==2 -> assert(choice(sweet_onion))),
	ask(6);
	%all sauces
	print("1: Chipotle Southwest, 2: Ranch, 3: BBQ, 4: Chili, 5: Vinegar, 6: Sweet Onion"),
	read(Like), (Like==1 -> assert(choice(chipotle_southwest));Like==2 -> assert(choice(ranch));Like==3 -> assert(choice(bbq));Like==4 -> assert(choice(chili));Like==5 -> assert(choice(vinegar));Like==6 -> assert(choice(sweet_onion))),
	ask(6)).

choose_side():-
	%Vegan and healthy side
	((dislike(unhealthy); dislike(dairy_and_meat)) -> print("1: Salad"),read(Like), (Like==1 -> assert(choice(salad))),ask(7);
	%All sides
	print("1: Chips, 2: Cookies, 3:Salad"),
	read(Like), (Like==1 -> assert(choice(chips));Like==2 -> assert(choice(cookies));Like==3 -> assert(choice(salad))),ask(7)).

choose_drink():-
	%Healthy drinks
	(dislike(unhealthy) -> print("1: Water, 2: Coffee, 3: Tea"), read(Like), (Like==1 -> assert(choice(water));Like==2 -> assert(choice(coffee));Like==3 -> assert(choice(tea))),
	print("Use choice(X) to review your meal");
	%All drinks
	print("1: Fountain Drinks, 2: Water, 3: Coffee, 4: Tea"), read(Like), (Like==1 -> assert(choice(fountain_drinks));Like==2 -> assert(choice(water));
	Like==3 -> assert(choice(coffee));Like==4 -> assert(choice(tea))),
	print("Use choice(X) to review your meal"));

/*Variables*/
meal_options([healthy, vegan, value]).
bread([italian_wheat, honey_oat, flatbread]).
b_length([six,twelve]).
filling([chicken_bacon_ranch, cold_cut_trio, veggie_patty, veggie_delite]).
add-ons([processed_cheddar, monterey_cheddar,guacamole]).
veg([cucumbers, green_bell_peppers, lettuce, red_onions, tomatoes, black_olives, jalapenos, pickles]).
sauce([chipotle_southwest, ranch, bbq, chili]).
healthy_sauce([vinegar, sweet_onion]).
sides([chips, cookies, salad]).
drinks([fountain_drinks, water, coffee, tea]).
dislikes([dairy_and_meat, unhealthy, add_ons]).

a.
