;---------- Notes ----------
;LControl & RAlt:: would make AltGr itself into a hotkey.

;---------- Initialization ----------
if not A_IsAdmin
{
   Run *RunAs "%A_ScriptFullPath%"  ; Requires v1.0.92.01+
   ExitApp
}
TrayTip Running, Hotkey script is running.
Sleep 2000   ; Let it display for 2 seconds.
HideTrayTip()

;---------- F ----------
;Shift + F1: reload script
+F1::
	TrayTip Reload, Script reloaded.
	Sleep 2000   ; Let it display for 2 seconds.
	HideTrayTip()
	Reload
	return
;Shift + F2: Pause script	
+F2::Suspend
	
+F3::
	TrayTip Pause, Script stopped.
	Sleep 2000   ; Let it display for 2 seconds.
	HideTrayTip()
	ExitApp
	return
	
;---------- League of Legends ----------
#ifWinActive League of Legends (TM) Client ; Only run if window 'LoL' is active
	XButton2::2
	XButton1::1
	Return
#IfWinActive

;---------- Additional ----------
RCtrl::AppsKey
	
;---------- Virtual Monitors ----------
<^>!Right::
	SendInput ^#{Right}
	Return

<^>!Left::
	SendInput ^#{Left}
	Return

<^>!Up::
	SendInput ^#d
	Return

<^>!Down::
	SendInput ^#{F4}
	Return
	
;ctrl + win + mouse left/right?

;---------- Media Control ----------
;Alt + F2 :: volume down ;done via foobar
;Alt + F3 :: volume up	 ;done via foobar

;---------- Auxilary ----------
;From https://www.maketecheasier.com/favorite-autohotkey-scripts/
; Always on Top
!t::
	Winset, Alwaysontop, , A ; ctrl + space
	Return

;---------- FUNCTIONS ----------
;https://autohotkey.com/docs/commands/TrayTip.htm
HideTrayTip() {
    TrayTip  ; Attempt to hide it the normal way.
    if SubStr(A_OSVersion,1,3) = "10." {
        Menu Tray, NoIcon
        Sleep 200  ; It may be necessary to adjust this sleep.
        Menu Tray, Icon
    }
}
	