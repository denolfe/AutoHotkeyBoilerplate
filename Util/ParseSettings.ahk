FileRead, ini, %A_ScriptDir%\Settings.ini

Settings := []

; Probably inefficient
Settings.ScriptName := (ini_getValue(ini, "Settings", "ScriptName") = "") ? A_ScriptName : ini_getValue(ini, "Settings", "ScriptName")
Settings.StartupNotification := ini_getValue(ini, "Settings", "StartupNotification")
Settings.UseAutoCorrect := ini_getValue(ini, "Settings", "UseAutoCorrect")
Settings.EditorPath := ini_getValue(ini, "Settings", "EditorPath")
