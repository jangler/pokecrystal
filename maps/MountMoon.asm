const_value set 2
	const MOUNTMOON_SILVER

MountMoon_MapScriptHeader:
.MapTriggers:
	db 2

	; triggers
	maptrigger .Trigger0
	maptrigger .Trigger1

.MapCallbacks:
	db 0

.Trigger0:
	priorityjump .RivalBattle
	end

.Trigger1:
	end

.RivalBattle:
	spriteface PLAYER, RIGHT
	showemote EMOTE_SHOCK, PLAYER, 15
	special Special_FadeOutMusic
	pause 15
	applymovement MOUNTMOON_SILVER, MountMoonSilverMovementBefore
	playmusic MUSIC_RIVAL_ENCOUNTER
	opentext
	writetext MountMoonSilverTextBefore
	waitbutton
	closetext
	checkevent EVENT_GOT_TOTODILE_FROM_ELM
	iftrue .Totodile
	checkevent EVENT_GOT_CHIKORITA_FROM_ELM
	iftrue .Chikorita
	winlosstext MountMoonSilverTextWin, MountMoonSilverTextLoss
	setlasttalked MOUNTMOON_SILVER
	loadtrainer RIVAL2, 3
	startbattle
	dontrestartmapmusic
	reloadmapafterbattle
	jump .FinishBattle

.Totodile:
	winlosstext MountMoonSilverTextWin, MountMoonSilverTextLoss
	setlasttalked MOUNTMOON_SILVER
	loadtrainer RIVAL2, 1
	startbattle
	dontrestartmapmusic
	reloadmapafterbattle
	jump .FinishBattle

.Chikorita:
	winlosstext MountMoonSilverTextWin, MountMoonSilverTextLoss
	setlasttalked MOUNTMOON_SILVER
	loadtrainer RIVAL2, 2
	startbattle
	dontrestartmapmusic
	reloadmapafterbattle
	jump .FinishBattle

.FinishBattle:
	playmusic MUSIC_RIVAL_AFTER
	opentext
	writetext MountMoonSilverTextAfter
	waitbutton
	verbosegiveitem REVIVE
	closetext
	applymovement MOUNTMOON_SILVER, MountMoonSilverMovementAfter
	disappear MOUNTMOON_SILVER
	dotrigger $1
	setevent EVENT_BEAT_RIVAL_IN_MT_MOON
	playmapmusic
	end

MountMoonSilverMovementBefore:
	step_left
	step_left
	step_left
	step_end

MountMoonSilverMovementAfter:
	step_right
	step_right
	step_down
	step_down
	step_down
	step_down
	step_down
	step_end

MountMoonSilverTextBefore:
	text "Heya, <PLAYER>."
	line "I didn't expect"

	para "to meet you here"
	line "in KANTO."

	para "I'm sure you've"
	line "shot ahead of me"

	para "since I've been"
	line "spending all my"

	para "time doing re-"
	line "search, but sure."

	para "I can have a"
	line "battle for old"
	cont "times' sake."
	done

MountMoonSilverTextWin:
	text "Ah, just as I"
	line "expected."

	para "Kudos, <PLAYER>."

	para "You're a stronger"
	line "trainer than I."
	done

MountMoonSilverTextAfter:
	text "My #MON have"
	line "all fainted, but"

	para "that doesn't mat-"
	line "ter so much now."

	para "My dream is for my"
	line "REVIVE system to"

	para "be installed in"
	line "every #MON CENTER,"

	para "so that everyone"
	line "can afford for"

	para "their #MON to"
	line "be completely"

	para "healed, free of"
	line "charge."

	para "Until then…"
	line "Take this."
	done

MountMoonSilverTextLoss:
	text "…"

	para "I'm not sure what"
	line "to say."
	done

MountMoon_MapEventHeader:
	; filler
	db 0, 0

.Warps:
	db 8
	warp_def $3, $3, 1, ROUTE_3
	warp_def $f, $f, 1, ROUTE_4
	warp_def $3, $d, 7, MOUNT_MOON
	warp_def $b, $f, 8, MOUNT_MOON
	warp_def $5, $19, 1, MOUNT_MOON_SQUARE
	warp_def $f, $19, 2, MOUNT_MOON_SQUARE
	warp_def $3, $19, 3, MOUNT_MOON
	warp_def $d, $19, 4, MOUNT_MOON

.XYTriggers:
	db 0

.Signposts:
	db 0

.PersonEvents:
	db 1
	person_event SPRITE_SILVER, 3, 7, SPRITEMOVEDATA_STANDING_LEFT, 0, 0, -1, -1, 0, PERSONTYPE_SCRIPT, 0, ObjectEvent, EVENT_MT_MOON_RIVAL
