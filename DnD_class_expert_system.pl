begin:- 

initialise,
question_one,
rule(Number,Class, Explanation),
	reply(Class,Reply),			
	write('You Should Play'),nl,nl,
	write(Class),nl,nl,
	write(Reply),nl,nl,
	write(Explanation),nl,nl,
	write('The rule used was number '),
	write(Number),						
	retractall(answer(_)).			
						
						


begin:- 
write('Sorry we cannot help, please try again.'),nl,nl,
retractall(answer(_)).


initialise:- 
nl,
tab(25), write('FIND OUT WHICH DND CHARACTER CLASS YOU SHOULD PLAY'),nl,nl,nl,
tab(15),write('please answer the following questions with only y (for Yes) or n (for No)'),
nl,nl,nl. 

question_one:-
	one_choice(X),
	one_branches(X).

one_choice(X):-
	write('Which class type would you like to be?'),
	write(' for magic type 1, for melee type 2 or 3 for half-caster'),
	nl,
	read(X).

one_branches(X):-	
	(X =:= 1 -> choicemagic;
	 X =:= 2 -> choicemelee;
	 X =:= 3 -> choicehalfcaster;
	 write('Sorry, there is no class type for the number you entered')),nl.
	

choicemagic:- 
    magicquestion(Quest,Answ),		
	write(Quest),nl,
	getyesno(Yesno),nl,
	((Yesno='yes';Yesno='y'),			
	assertz(answer(Answ)));
	((Yesno='no';Yesno='n'),				
	retract(answer(Answ))),  			
	fail.
choicemagic.

choicemelee:- 
    meleequestion(Quest,Answ),		
	write(Quest),nl,
	getyesno(Yesno),nl,
	((Yesno='yes';Yesno='y'),			
	assertz(answer(Answ)));
	((Yesno='no';Yesno='n'),				
	retract(answer(Answ))),  			
	fail.
choicemelee. 

choicehalfcaster:- 
 halfcastquestion(Quest,Answ),		
	write(Quest),nl,
	getyesno(Yesno),nl,
	((Yesno='yes';Yesno='y'),			
	assertz(answer(Answ)));
	((Yesno='no';Yesno='n'),				
	retract(answer(Answ))),  			
	fail.

choicehalfcaster.


    getyesno(X):-
	repeat,
	write('Please answer y or n:'),nl,
	read(Z),nl,
	check(Z),
	X=Z,!.				
					
check('yes').
check('y').
check('no').
check('n').

%magicquestion('Would you like to be a magic class?', magic).
magicquestion('Would you like to be nature based?', nature).
magicquestion('Would you like to be religion based?', religion).
magicquestion('Would you like to have the intelligence trait?', intelligence).
magicquestion('Would you like to have a d6 hit dice?', dice).
magicquestion('Would you like to have 2 high-level spell slots?', slots).
magicquestion('Would you like to specialise in performing?', music).

%question('Would you like to be a melee class?', melee).
meleequestion('Would you like to be sneaky?', sneaky).
meleequestion('Would you like to be angry?', angry).
meleequestion('Would you like to fight with hands?', hands).
meleequestion('Would you like to be able to chose a specialist fighting style?', fight).

halfcastquestion('Would you like to be nature based?', ranger).
halfcastquestion('Would you like to be religion based?', paladin).



rule(1,druid, 'A magic user in tune with nature that is capable of wildshaping into various animals'):-
	answer(nature).
rule(2,cleric, 'A magic user that acts as an intermediatry between the mortal plane and the Gods'):-
	answer(religion).
rule(3, wizard, 'A magic user that uses intelligence as its main spell casting modifier'):-
    answer(intelligence).
rule(4, sorcerer, 'A magic user that makes use of sorcery points to effects spells in interesting ways'):-
	answer(dice).
rule(5, warlock,'A magic user who makes a pact with a powerful patron'):-
	answer(slots).
rule(6, bard, 'A magic user that specialise in all things performance based'):-
	answer(music).


rule(7, rogue, 'A melee fighter that specialises in sneaking, dashing, hiding and disengaging'):-
	answer(sneaky).
rule(8, barbarian, 'A melee fighter that rages to take half physical damage'):-
	answer(angry).
rule(9, monk, 'A melee fighter who utilises their hands to deal damage'):-
	answer(hands).
rule(10, fighter, 'A melee fighter that can chose their specialist fighting style'):-
	answer(fight).


rule(11, ranger, 'A nature based class that can use simple spells to aid in exploration' ):-
	answer(ranger).
rule(12, paladin, 'A holy warrior whos divine power is used to bolster strong weapon hits' ):-
	answer(paladin).

reply(druid,'because you chose a magic class that specialises in nature').
reply(cleric,'because you chose a magic class that specialises in religion').
reply(wizard, 'because you chose a magic class that uses intelligence').
reply(sorcerer, 'because you chose a magic class with d6 hit-dice').
reply(warlock, 'because you chose a magic class that uses 2 high leveled spell slots').
reply(bard, 'because you chose a magic class that uses performace as part of roleplay').

reply(rogue, 'because you chose a melee class that is sneaky').
reply(barbarian, 'because you chose a melee class that is angry').
reply(monk, 'because you chose a melee class that uses their hands').
reply(fighter, 'because you chose a melee class that can pick from a choice of fighthing styles').

reply(ranger, 'because you chose a half-caster that specialises in nature based magic and exploration').
reply(paladin, 'because you chose a half-caster that relies on a religious oath').