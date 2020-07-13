SetBatchLines, -1 

; unitx/y is the x/y dir of monk group select
; number after is the number group, so need to select monks by number
unitx2 := 421
unity2 := 1248
unitx3 := 421
unity3 := 1248
activeGroup := 1
SetDefaultMouseSpeed, 0

loop {
	; get monk group
	if(GetKeyState("2", "P")){
		activeGroup := 2
	}
	if(GetKeyState("3", "P")){
		activeGroup := 3
	}

	; this one is getkeystate because that detects keydown
	if(GetKeyState("lalt", "P")){
		
		; send a 0 right before so it cant double click center
		send, {0}
		sleep, 10
		send, {9}
		
		; monk mode, immediately go to monk listed
		; get current pos so can go back to there after
		mousegetpos, x, y
		send %activeGroup%
		
		
		; go to unit dir click
		if(activeGroup == 2){
			mousemove, %unitx2%, %unity2%
			send, {LButton}
			send, {LButton}
			send, {LButton}
			send, {LButton}
		}
		if(activeGroup == 3){
			mousemove, %unitx3%, %unity3%
			send, {LButton}
			send, {LButton}
			send, {LButton}
			send, {LButton}
		}
		mousemove, %x%, %y%
		sleep, 50
		
		
		; perform pixel search for white formation dots, not there if selected one
		PixelSearch, Px, Py, 29, 1346, 277, 1409, 0x000000, 5, Fast
		if ErrorLevel{
			; not found, which means it selected
		}
		else{
			; found, which means still on formation group, so reset both
			if(activeGroup == 2){
				unitx2 := 373
				unity2 := 1248
			}
			if(activeGroup == 3){
				unitx3 := 373
				unity3 := 1248
			}
			
		}
		
		; check which group so assigns right coords
		if(activeGroup == 2){
			; set or reset unit x
			if (unitx2 > 1058){
				unitx2 := 421
				unity2 := (unity2 + 47)
			}
			else{
				unitx2 := (unitx2 + 47)
			}
			; reset y if higher than row 3
			if (unity2 > 1364){
				unity2 := 1248
			}
		}
		if(activeGroup == 3){
			; set or reset unit x
			if (unitx3 > 1058){
				unitx3 := 421
				unity3 := (unity3 + 47)
			}
			else{
				unitx3 := (unitx3 + 47)
			}
			; reset y if higher than row 3
			if (unity3 > 1364){
				unity3 := 1248
			}
		}
		
		
	}
	
	sleep, 20
}

Numpad3::
mousegetpos, mx, my
msgbox %mx% %my%


NumpadMult::exitapp