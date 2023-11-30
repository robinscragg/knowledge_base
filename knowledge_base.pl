magic(bard).
magic(cleric).
magic(druid).
magic(sorcerer).
magic(warlock).
magic(wizard).

melee(barbarian).
melee(fighter).
melee(monk).
melee(rogue).

halfcaster(paladin).
halfcaster(ranger).

nature(druid).
nature(ranger).

religionbased(cleric).
religionbased(druid).
religionbased(paladin).

onepa(barbarian).
onepa(bard).
onepa(cleric).
onepa(druid).
onepa(rogue).
onepa(sorcerer).
onepa(warlock).
onepa(wizard).

twopa(fighter).
twopa(monk).
twopa(paladin).
twopa(ranger).

strength(barbarian).
strength(fighter).
strength(paladin).

dexterity(fighter).
dexterity(monk).
dexterity(ranger).
dexterity(rogue).

charisma(bard).
charisma(paladin).
charisma(sorcerer).
charisma(warlock).

wisdom(cleric).
wisdom(druid).
wisdom(monk).
wisdom(ranger).

intelligence(wizard).

d6(sorcerer).
d6(wizard).

d8(bard).
d8(cleric).
d8(druid).
d8(monk).
d8(rogue).
d8(warlock).

d10(fighter).
d10(paladin).
d10(ranger).

d12(barbarian).

collect_answer:-
    question(Quest,Answer),		% output question to user
	write(Quest),nl,
	getyesno(Yesno),nl,
	(Yesno='yes';Yesno='y'),			% if user has symptom put into working memory
	assertz(quiz(Answer)),
	(Yesno='no';Yesno='n'),				% if user doesn't have symptom 
	retract(quiz(Answer)),  			% remove from working memory 
	fail.

collect_answer.
question('Would you like to be a magic class?', magic)
question('Would you like to be nature based?', nature)
question('Would you like to be a melee class?', melee)
question('Would you like to be religion based?', religion)
question('Would you like to be sneaky?', sneaky)
question('Would you like to have the charisma trait?', charisma)
question('Would you like to be angry?', angry)
question('Would you like to fight with hands?', hands)
question('Would you like to have a d8 hit dice?', dice)
question('Would you like to have 2 high-level spell slots?', slots)