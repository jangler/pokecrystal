DelayFrame::
; Wait for one frame
	ld a, 1
	ld [wVBlankOccurred], a

; Wait for the next VBlank, halting to conserve battery
.halt
	halt ; rgbasm adds a nop after this instruction by default
	ld a, [wVBlankOccurred]
	and a
	jr nz, .halt
	ret

DelayFrames::
; Wait c frames, max 10
	ld a, c
	cp 4
	jr c, .under
	ld c, 4
.under
	call DelayFrame
	dec c
	jr nz, DelayFrames
	ret
