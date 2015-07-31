#NoEnv  ; Recommended for performance and compatibility with future AutoHotkey releases.
#WinActivateForce
#SingleInstance force
#Persistent
SendMode Input  ; Recommended for new scripts due to its superior speed and reliability.
SetWorkingDir %A_ScriptDir%  ; Ensures a consistent starting directory.

#Include *i %A_ScriptDir%\Scripts\Functions.ahk
#Include %A_ScriptDir%\Util\Init.ahk
#Include %A_ScriptDir%\Util\ParseSettings.ahk
#Include %A_ScriptDir%\Util\TrayMenu.ahk

If (Settings.StartupNotification)
	Notify(Settings.ScriptName " Started",,-3,"Style=StandardGray")

If (Settings.UseAutoCorrect)
	Run, %A_ScriptDir%\Util\AutoCorrect.ahk
Else
{
	DetectHiddenWindows, On 
	WinClose, %A_ScriptDir%\Util\AutoCorrect.ahk ahk_class AutoHotkey
}

#Include *i %A_ScriptDir%\Scripts\Hotkeys.ahk
#Include *i %A_ScriptDir%\Scripts\AppSpecific.ahk
#Include *i %A_ScriptDir%\Scripts\HotStrings.ahk
