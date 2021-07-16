#NoEnv
; #Warn
#SingleInstance Force
SendMode Input
SetWorkingDir %A_ScriptDir%
; JANITOR (Used for autoupdate)
; Use for ur own programs at will
; Start
Gui, Janitor:New, -Resize -Border +HwndJanitorHwnd, Janitor ; GUI at start
Gui, Janitor:Add, CheckBox, vSerkket, Download Serkket? ; GUI at start
Gui, Janitor:Add, CheckBox, vBedrockSerkket, Download Bedrock Serkket? ; GUI at start
Gui, Janitor:Add, Button, Default w80, OK ; GUI at start
Gui, Janitor:Show ; GUI at start
WinWaitClose, ahk_id %JanitorHwnd% ; GUI at start
Gui, Bar:New, -Resize -Border +HwndBarHwnd, Bar ; GUI at start
Gui, Bar:Add, Progress, w200 h20 cBlue vMyProgress
Gui, Bar:Show
if (Serkket = "1") {
FileDelete, %A_ScriptDir%\Serkket.exe ; Delete old version of software
GuiControl,, MyProgress, +25
Progdwnld: ; Label, in case of download fail
UrlDownloadToFile, https://github.com/Epicgamernate/Serkket/releases/latest/download/Serkket.exe, Serkket.exe ; Download new version of software
GuiControl,, MyProgress, +25
; Check if download failed, if it did, redownload
if !FileExist("Serkket.exe") { 
GuiControl,, MyProgress, -25
Goto, Progdwnld
}
; End of check
}
if (BedrockSerkket = "1") {
FileDelete, %A_ScriptDir%\BedSerkket.exe ; Delete old version of software
GuiControl,, MyProgress, +25
Progdwnld2: ; Label, in case of download fail
UrlDownloadToFile, https://github.com/Epicgamernate/SerkketBedrock/releases/latest/download/BedSerkket.exe, BedSerkket.exe ; Download new version of software
GuiControl,, MyProgress, +25
; Check if download failed, if it did, redownload
if !FileExist("BedSerkket.exe") { 
GuiControl,, MyProgress, -25
Goto, Progdwnld2
}
; End of check
}
GuiControl,, MyProgress, 100
MsgBox, 64, Janitor, Updates are done
ExitApp, 0
JanitorButtonOK: ; GUI at start
Gui, Janitor:Submit ; GUI at start
Gui, Janitor:Destroy ; GUI at start
return ; GUI at start
JanitorGuiClose: ; GUI at start
JanitorGuiEscape: ; GUI at start
Gui, Janitor:Destroy ; GUI at start
ExitApp, 0 ; GUI at start
