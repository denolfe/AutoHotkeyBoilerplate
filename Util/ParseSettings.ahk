; Referenced from https://www.autohotkey.com/boards/viewtopic.php?p=221966#p221966
; Original Creator @jeeswg 

vPath := A_ScriptDir "\Settings.ini"
FileRead, vText, % vPath
vArray := vArrayLast := ""
Loop, Parse, vText, `n, `r
{
	vTemp := A_LoopField
	if (vTemp ~= "^\[.*]$") ;a section header is detected
	{
		;show info for the previous section
		if !(vArray = "")
		{
			vOutput := ""
			for vKey, vValue in %vArray%
				vOutput .= vKey " " vValue "`r`n"
			MsgBox, % vArray "`r`n`r`n" vOutput
		}
		vArrayLast := vArray
		vSection := SubStr(vTemp, 2, -1)
		; MsgBox, % vSection
		vArray := vSection
		%vArray% := {} ;create an array with section header
		continue
	}
	;note: StrSplit MaxParts requires v1.1.28+
	oTemp := StrSplit(A_LoopField, "=",, 2)
	if !(oTemp.Length() = 2)
	|| (vArray = "")
		continue
	; MsgBox, % vArray "." oTemp.1 "=" oTemp.2
    if (oTemp.1 = "ScriptName" and oTemp.2 = "") ; added failover for if ScriptName is not provided
        %vArray%[oTemp.1] := A_ScriptName
    else
	    %vArray%[oTemp.1] := oTemp.2
}

;show info for the previous section
if !(vArrayLast = "")
{
	vOutput := ""
	for vKey, vValue in %vArray%
		vOutput .= vKey " " vValue "`r`n"
	MsgBox, % vArray "`r`n`r`n" vOutput
}