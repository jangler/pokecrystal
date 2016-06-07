const_value set 2
	const VICTORYROAD_SILVER
	const VICTORYROAD_POKE_BALL1
	const VICTORYROAD_POKE_BALL2
	const VICTORYROAD_POKE_BALL3
	const VICTORYROAD_POKE_BALL4
	const VICTORYROAD_POKE_BALL5

VictoryRoad_MapScriptHeader:
.MapTriggers:
	db 2

	; triggers
	dw UnknownScript_0x74490, 0
	dw UnknownScript_0x74491, 0

.MapCallbacks:
	db 0

UnknownScript_0x74490:
	end

UnknownScript_0x74491:
	end

UnknownScript_0x74492:
	moveperson VICTORYROAD_SILVER, $12, $b
	spriteface PLAYER, DOWN
	showemote EMOTE_SHOCK, PLAYER, 15
	special Special_FadeOutMusic
	pause 15
	appear VICTORYROAD_SILVER
	applymovement VICTORYROAD_SILVER, MovementData_0x74539
	scall UnknownScript_0x744d4
	applymovement VICTORYROAD_SILVER, MovementData_0x7454c
	disappear VICTORYROAD_SILVER
	dotrigger $1
	playmapmusic
	end

UnknownScript_0x744b5:
	spriteface PLAYER, DOWN
	showemote EMOTE_SHOCK, PLAYER, 15
	special Special_FadeOutMusic
	pause 15
	appear VICTORYROAD_SILVER
	applymovement VICTORYROAD_SILVER, MovementData_0x74542
	scall UnknownScript_0x744d4
	applymovement VICTORYROAD_SILVER, MovementData_0x74555
	disappear VICTORYROAD_SILVER
	dotrigger $1
	playmapmusic
	end

UnknownScript_0x744d4:
	spriteface PLAYER, DOWN
	playmusic MUSIC_RIVAL_ENCOUNTER
	opentext
	writetext UnknownText_0x7455f
	waitbutton
	closetext
	setevent EVENT_RIVAL_VICTORY_ROAD
	checkevent EVENT_GOT_TOTODILE_FROM_ELM
	iftrue UnknownScript_0x744ff
	checkevent EVENT_GOT_CHIKORITA_FROM_ELM
	iftrue UnknownScript_0x7450f
	winlosstext UnknownText_0x7463d, UnknownText_0x747aa
	setlasttalked VICTORYROAD_SILVER
	loadtrainer RIVAL1, RIVAL1_15
	startbattle
	dontrestartmapmusic
	reloadmapafterbattle
	jump UnknownScript_0x7451f

UnknownScript_0x744ff:
	winlosstext UnknownText_0x7463d, UnknownText_0x747aa
	setlasttalked VICTORYROAD_SILVER
	loadtrainer RIVAL1, RIVAL1_13
	startbattle
	dontrestartmapmusic
	reloadmapafterbattle
	jump UnknownScript_0x7451f

UnknownScript_0x7450f:
	winlosstext UnknownText_0x7463d, UnknownText_0x747aa
	setlasttalked VICTORYROAD_SILVER
	loadtrainer RIVAL1, RIVAL1_14
	startbattle
	dontrestartmapmusic
	reloadmapafterbattle
	jump UnknownScript_0x7451f

UnknownScript_0x7451f:
	playmusic MUSIC_RIVAL_AFTER
	opentext
	writetext UnknownText_0x746ce
	waitbutton
	verbosegiveitem REVIVE
	closetext
	end

VictoryRoadTMEarthquake:
	itemball TM_EARTHQUAKE

VictoryRoadMaxRevive:
	itemball BIG_PEARL

VictoryRoadFullRestore:
	itemball FULL_RESTORE

VictoryRoadFullHeal:
	itemball FULL_HEAL

VictoryRoadHPUp:
	itemball HP_UP

VictoryRoadHiddenMaxPotion:
	dwb EVENT_VICTORY_ROAD_HIDDEN_MAX_POTION, MAX_POTION


VictoryRoadHiddenFullHeal:
	dwb EVENT_VICTORY_ROAD_HIDDEN_FULL_HEAL, FULL_HEAL


MovementData_0x74539:
	step_left
	step_left
	step_left
	step_left
	step_left
	step_left
	step_up
	step_up
	step_end

MovementData_0x74542:
	step_up
	step_up
	step_left
	step_left
	step_left
	step_left
	step_left
	step_up
	step_up
	step_end

MovementData_0x7454c:
	step_down
	step_down
	step_right
	step_right
	step_right
	step_right
	step_right
	step_right
	step_end

MovementData_0x74555:
	step_down
	step_down
	step_right
	step_right
	step_right
	step_right
	step_right
	step_down
	step_down
	step_end

UnknownText_0x7455f:
	text "<PLAYER>!"

	para "I've been waiting"
	line "for you. I knew"

	para "you'd end up here"
	line "sooner or later."

	para "If you're taking"
	line "the #MON LEAGUE"

	para "challenge, you"
	line "should have"
	cont "another REVIVE."

	para "But first, it's"
	line "not every day"

	para "that I can battle"
	line "someone with your"
	cont "skills."

	para "<PLAYER>!"
	line "I challenge you!"
	done

UnknownText_0x7463d:
	text "I'm impressed!"
	line "Thanks, <PLAYER>."

	para "That's the most"
	line "fun I've had"

	para "battling in quite"
	line "a while."
	done

UnknownText_0x746ce:
	text "Good luck with the"
	line "ELITE FOUR."

	para "I'm guessing you"
	line "might benefit"
	cont "from this."

	para "See you on the"
	line "other side!"
	done

UnknownText_0x747aa:
	text "…Well, shoot!"

	para "I didn't mean for"
	line "that to happen."
	done

VictoryRoad_MapEventHeader:
	; filler
	db 0, 0

.Warps:
	db 10
	warp_def $43, $9, 5, VICTORY_ROAD_GATE
	warp_def $31, $1, 3, VICTORY_ROAD
	warp_def $23, $1, 2, VICTORY_ROAD
	warp_def $1f, $d, 5, VICTORY_ROAD
	warp_def $11, $d, 4, VICTORY_ROAD
	warp_def $21, $11, 7, VICTORY_ROAD
	warp_def $13, $11, 6, VICTORY_ROAD
	warp_def $b, $0, 9, VICTORY_ROAD
	warp_def $1b, $0, 8, VICTORY_ROAD
	warp_def $5, $d, 3, ROUTE_23

.XYTriggers:
	db 2
	xy_trigger 0, $8, $c, $0, UnknownScript_0x74492, $0, $0
	xy_trigger 0, $8, $d, $0, UnknownScript_0x744b5, $0, $0

.Signposts:
	db 2
	signpost 29, 3, SIGNPOST_ITEM, VictoryRoadHiddenMaxPotion
	signpost 65, 3, SIGNPOST_ITEM, VictoryRoadHiddenFullHeal

.PersonEvents:
	db 6
	person_event SPRITE_SILVER, 13, 18, SPRITEMOVEDATA_STANDING_UP, 0, 0, -1, -1, 0, PERSONTYPE_SCRIPT, 0, ObjectEvent, EVENT_RIVAL_VICTORY_ROAD
	person_event SPRITE_POKE_BALL, 28, 3, SPRITEMOVEDATA_ITEM_TREE, 0, 0, -1, -1, 0, PERSONTYPE_ITEMBALL, 0, VictoryRoadTMEarthquake, EVENT_VICTORY_ROAD_TM_EARTHQUAKE
	person_event SPRITE_POKE_BALL, 48, 12, SPRITEMOVEDATA_ITEM_TREE, 0, 0, -1, -1, 0, PERSONTYPE_ITEMBALL, 0, VictoryRoadMaxRevive, EVENT_VICTORY_ROAD_MAX_REVIVE
	person_event SPRITE_POKE_BALL, 29, 18, SPRITEMOVEDATA_ITEM_TREE, 0, 0, -1, -1, 0, PERSONTYPE_ITEMBALL, 0, VictoryRoadFullRestore, EVENT_VICTORY_ROAD_FULL_RESTORE
	person_event SPRITE_POKE_BALL, 48, 15, SPRITEMOVEDATA_ITEM_TREE, 0, 0, -1, -1, 0, PERSONTYPE_ITEMBALL, 0, VictoryRoadFullHeal, EVENT_VICTORY_ROAD_FULL_HEAL
	person_event SPRITE_POKE_BALL, 38, 7, SPRITEMOVEDATA_ITEM_TREE, 0, 0, -1, -1, 0, PERSONTYPE_ITEMBALL, 0, VictoryRoadHPUp, EVENT_VICTORY_ROAD_HP_UP
