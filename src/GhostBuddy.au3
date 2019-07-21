#AutoIt3Wrapper_Res_HiDpi=Y

#pragma compile(Out, GhostBuddy.exe)
#pragma compile(Icon, 'C:\Program Files (x86)\AutoIt3\Icons\au3.ico')
#pragma compile(ExecLevel, asInvoker)
#pragma compile(UPX, false)
#pragma compile(AutoItExecuteAllowed, true)
#pragma compile(Console, false)
#pragma compile(Compression, 3)
#pragma compile(Compatibility, win10)
#pragma compile(x64, false)
#pragma compile(inputboxres, false)
#pragma compile(Comments, 'GhostBuddy provides an API for developing RuneScape and Old School RuneScape scripts to be run on the GhostBuddy platform.')
#pragma compile(CompanyName, 'GhostBuddy')
#pragma compile(FileDescription, 'GhostBuddy')
#pragma compile(FileVersion, 1.0)
#pragma compile(InternalName, 'GhostBuddy')
#pragma compile(LegalCopyright, 'Copyright © 2016 GhostBuddy. All rights reserved.')
#pragma compile(LegalTrademarks, '"GhostBuddy", GhostBuddy logo')
#pragma compile(OriginalFilename, GhostBuddy.exe)
#pragma compile(ProductName, GhostBuddy)
#pragma compile(ProductVersion, 1.0)

#include <Array.au3>
#include <AutoItConstants.au3>
#include <ButtonConstants.au3>
#include <ColorConstants.au3>
#include <File.au3>
#include <FileConstants.au3>
#include <FontConstants.au3>
#include <FontInstall.au3>
#include <GUIConstantsEx.au3>
#include <GUIListView.au3>
#include <GuiTab.au3>
#include <ImageSearch2015.au3>
#include <ListViewConstants.au3>
#include <MetroGUI_UDF.au3>
#include <MsgBoxConstants.au3>
#include <StaticConstants.au3>
#include <String.au3>
#include <TabConstants.au3>
#include <WindowsConstants.au3>

Local $scriptsDir = @ScriptDir & '/scripts'
Local $scriptFiles = _FileListToArrayRec($scriptsDir, '*.gbs', $FLTAR_FILES, $FLTAR_RECUR, Default, $FLTAR_FULLPATH)

If @error Then
	Local $scriptFiles[1]
EndIf

Local $scripts[3][$scriptFiles[0]][9]

Local $mainHWnd
Local $aMenu1Buttons[6] = ['Add', 'Stop All']
Local $scriptTabs
Local $scriptTabSheets[3]
Local $scriptListViews[3]
Local $startButton
Local $pauseButton
Local $stopButton

Local $pids[0]

_Main()

Func _Main()
   _Init()
   _Run()
EndFunc

Func _Init()
	HotKeySet('{END}', 'Restart')
	DirCreate('include\MetroUDF-Required')
	DirCreate('temp\resources')
	DirCreate('temp\items')

	FileInstall('resources\logo.jpg', 'temp\resources\logo.jpg')

	FileInstall('include_\MetroUDF-Required\SSCtrlHover.au3', 'include\MetroUDF-Required\SSCtrlHover.au3')
	FileInstall('include_\MetroUDF-Required\StringSize.au3', 'include\MetroUDF-Required\StringSize.au3')
	FileInstall('include_\_GUIDisable.au3', 'include\_GUIDisable.au3')
	FileInstall('include_\APIComConstants.au3', 'include\APIComConstants.au3')
	FileInstall('include_\APIFilesConstants.au3', 'include\APIFilesConstants.au3')
	FileInstall('include_\APIGdiConstants.au3', 'include\APIGdiConstants.au3')
	FileInstall('include_\APIMiscConstants.au3', 'include\APIMiscConstants.au3')
	FileInstall('include_\APIShellExConstants.au3', 'include\APIShellExConstants.au3')
	FileInstall('include_\APIShPathConstants.au3', 'include\APIShPathConstants.au3')
	FileInstall('include_\APISysConstants.au3', 'include\APISysConstants.au3')
	FileInstall('include_\Array.au3', 'include\Array.au3')
	FileInstall('include_\AutoItConstants.au3', 'include\AutoItConstants.au3')
	FileInstall('include_\ColorConstants.au3', 'include\ColorConstants.au3') ;;
	FileInstall('include_\ComboConstants.au3', 'include\ComboConstants.au3') ;;
	FileInstall('include_\Constants.au3', 'include\Constants.au3') ;;
	FileInstall('include_\DirConstants.au3', 'include\DirConstants.au3') ;;
	FileInstall('include_\File.au3', 'include\File.au3')
	FileInstall('include_\FileConstants.au3', 'include\FileConstants.au3')
	FileInstall('include_\FontInstall.au3', 'include\FontInstall.au3')
	FileInstall('include_\GDIPlus.au3', 'include\GDIPlus.au3')
	FileInstall('include_\GDIPlusConstants.au3', 'include\GDIPlusConstants.au3')
	FileInstall('include_\GuiComboBox.au3', 'include\GuiComboBox.au3') ;
	FileInstall('include_\GuiListBox.au3', 'include\GuiListBox.au3') ;
	FileInstall('include_\GUIConstantsEx.au3', 'include\GUIConstantsEx.au3')
	FileInstall('include_\Icons.au3', 'include\Icons.au3')
	FileInstall('include_\ImageSearch2015.au3', 'include\ImageSearch2015.au3')
	FileInstall('include_\ListBoxConstants.au3', 'include\ListBoxConstants.au3') ;
	FileInstall('include_\MetroGUI_UDF.au3', 'include\MetroGUI_UDF.au3')
	FileInstall('include_\MetroThemes.au3', 'include\MetroThemes.au3')
	FileInstall('include_\MsgBoxConstants.au3', 'include\MsgBoxConstants.au3')
	FileInstall('include_\ProcessConstants.au3', 'include\ProcessConstants.au3') ;;
	FileInstall('include_\ScreenCapture.au3', 'include\ScreenCapture.au3') ;
	FileInstall('include_\ScrollBarConstants.au3', 'include\ScrollBarConstants.au3') ;
	FileInstall('include_\ScrollBarsConstants.au3', 'include\ScrollBarsConstants.au3') ;
	FileInstall('include_\Security.au3', 'include\Security.au3')
	FileInstall('include_\SecurityConstants.au3', 'include\SecurityConstants.au3')
	FileInstall('include_\SendMessage.au3', 'include\SendMessage.au3')
	FileInstall('include_\StringConstants.au3', 'include\StringConstants.au3')
	FileInstall('include_\StructureConstants.au3', 'include\StructureConstants.au3')
	FileInstall('include_\Tesseract.au3', 'include\Tesseract.au3') ;
	FileInstall('include_\TrayConstants.au3', 'include\TrayConstants.au3') ;;
	FileInstall('include_\UDFGlobalID.au3', 'include\UDFGlobalID.au3') ;
	FileInstall('include_\WinAPI.au3', 'include\WinAPI.au3')
	FileInstall('include_\WinAPICom.au3', 'include\WinAPICom.au3')
	FileInstall('include_\WinAPIConstants.au3', 'include\WinAPIConstants.au3')
	FileInstall('include_\WinAPIError.au3', 'include\WinAPIError.au3')
	FileInstall('include_\WinAPIFiles.au3', 'include\WinAPIFiles.au3')
	FileInstall('include_\WinAPIGdi.au3', 'include\WinAPIGdi.au3')
	FileInstall('include_\WinAPIInternals.au3', 'include\WinAPIInternals.au3')
	FileInstall('include_\WinAPIMisc.au3', 'include\WinAPIMisc.au3')
	FileInstall('include_\WinAPIShellEx.au3', 'include\WinAPIShellEx.au3')
	FileInstall('include_\WinAPIShPath.au3', 'include\WinAPIShPath.au3')
	FileInstall('include_\WinAPISys.au3', 'include\WinAPISys.au3')
	FileInstall('include_\WinAPIsysinfoConstants.au3', 'include\WinAPIsysinfoConstants.au3')
	FileInstall('include_\WindowsConstants.au3', 'include\WindowsConstants.au3')

	FileInstall('items\bank.png', 'temp\items\bank.png')
	FileInstall('items\close.png', 'temp\items\close.png')
	FileInstall('items\compass.png', 'temp\items\compass.png')
	FileInstall('items\continue.png', 'temp\items\continue.png')
	FileInstall('items\deposit_all.png', 'temp\items\deposit_all.png')
	FileInstall('items\down_arrow.png', 'temp\items\down_arrow.png')
	FileInstall('items\furnace.png', 'temp\items\furnace.png')
	FileInstall('items\gold_amulet.png', 'temp\items\gold_amulet.png')
	FileInstall('items\gold_bar.png', 'temp\items\gold_bar.png')
	FileInstall('items\gold_bracelet.png', 'temp\items\gold_bracelet.png')
	FileInstall('items\inventory.png', 'temp\items\inventory.png')
	FileInstall('items\make_all.png', 'temp\items\make_all.png')
	FileInstall('items\run.png', 'temp\items\run.png')
	FileInstall('items\tab_all.png', 'temp\items\tab_all.png')
	FileInstall('items\up_arrow.png', 'temp\items\up_arrow.png')
	FileInstall('items\withdraw_all.png', 'temp\items\withdraw_all.png')

	AutoItSetOption('TrayMenuMode', 3)
	AutoItSetOption('TrayAutoPause', 0)
	AutoItSetOption('GUIResizeMode', $GUI_DOCKAUTO)

	TraySetClick('9')

	DllCall('user32.dll', 'bool', 'SetProcessDPIAware')
	_Metro_EnableHighDPIScaling()
EndFunc

Func _Run()
	Local $lastTab = 0

	LoadScripts()

	$stopTrayMenuItem = TrayCreateItem('Stop script')
	$stopAllTrayMenuItem = TrayCreateItem('Stop all scripts')

	TrayCreateItem('')

	$exitTrayMenuItem = TrayCreateItem('Exit')

	$mainHWnd = _Metro_CreateGUI('GhostBuddy', @DesktopWidth / 2 - @DesktopWidth / 7, @DesktopHeight / 2 - @DesktopHeight / 10, -1, -1, False, '', 7)

	_Metro_SetGUIOption($mainHWnd, True)

	$aControlButtons = _Metro_AddControlButtons(True, False, True, False, True)

	$GUI_CLOSE_BUTTON = $aControlButtons[0]
	$GUI_MINIMIZE_BUTTON = $aControlButtons[3]
	$GUI_MENU_BUTTON = $aControlButtons[6]

	GUICtrlCreatePic('.\temp\resources\logo.jpg', WinGetClientSize($mainHWnd)[0] / 2 - 214, 30, 428, 72)

	$iStartButtonWidth = 270 / (610 - 2 * 25) * (WinGetClientSize($mainHWnd)[0] - 2 * 25)
	$iGapWidth = 10 / (610 - 2 * 25) * (WinGetClientSize($mainHWnd)[0] - 2 * 25)

	$startButton = _Metro_CreateButtonEx2('Start Script', 25, WinGetClientSize($mainHWnd)[1] - 41 - 20, $iStartButtonWidth, 41, $ButtonBKColor, $ButtonTextColor, 'Segoe UI')

		_Metro_DisableButton($startButton)

	$pauseButton = _Metro_CreateButtonEx2('Pause Script', 25 + $iStartButtonWidth + $iGapWidth, WinGetClientSize($mainHWnd)[1] - 41 - 20, $iStartButtonWidth / 2, 41, $ButtonBKColor, $ButtonTextColor, 'Segoe UI')

		_Metro_DisableButton($pauseButton)

	$stopButton = _Metro_CreateButtonEx2('Stop Script', 25 + $iStartButtonWidth + $iGapWidth + $iStartButtonWidth / 2 + $iGapWidth, WinGetClientSize($mainHWnd)[1] - 41 - 20, $iStartButtonWidth / 2, 41, $ButtonBKColor, $ButtonTextColor, 'Segoe UI')

		_Metro_DisableButton($stopButton)

	$scriptTabs = GUICtrlCreateTab(20, 128, WinGetClientSize($mainHWnd)[0] - 40, WinGetClientSize($mainHWnd)[1] - 204)

		GUICtrlSetFont(-1, 10, $FW_BOLD, $GUI_FONTNORMAL, 'Segoe UI')

		$scriptTabSheets[0] = GUICtrlCreateTabItem('All Scripts')
			$scriptListViews[0] = CreateListView(0)

		$scriptTabSheets[1] = GUICtrlCreateTabItem('OS Scripts')
			$scriptListViews[1] = CreateListView(1)

		$scriptTabSheets[2] = GUICtrlCreateTabItem('RS Scripts')
			$scriptListViews[2] = CreateListView(2)

		GUICtrlCreateTabItem('')

	GUISetState(@SW_SHOW)
	GUIRegisterMsg($WM_NOTIFY, 'WM_NOTIFY')
	GUIRegisterMsg($WM_SIZE, 'WM_SIZE')

	While True
		Switch GUIGetMsg()
			Case $GUI_EVENT_CLOSE, $GUI_CLOSE_BUTTON
				_Exit()

			Case $GUI_MINIMIZE_BUTTON
				GUISetState(@SW_MINIMIZE, $mainHWnd)

			Case $GUI_MENU_BUTTON
				Local $aMenu0Buttons[7] = ['Scripts...', 'Options', 'Refresh', 'Help', 'About', 'Restart', 'Exit']
				Local $iMenu0ButtonSelected = _Metro_MenuStart($mainHWnd, 150, $aMenu0Buttons, True, 'Segoe UI')

				Switch $iMenu0ButtonSelected
					Case '0'
						Local $iMenu1Selected = _Metro_MenuStart($mainHWnd, 150, $aMenu1Buttons, True, 'Segoe UI')

						If Not($iMenu1Selected == 'none') Then
							Switch $aMenu1Buttons[$iMenu1Selected]
								Case 'Add'
									AddScript()

								Case 'Remove'
									RemoveScript()

								Case 'Start'
									ToggleScript(GetPointedToArrayIndex(_GUICtrlTab_GetCurFocus($scriptTabs), _GUICtrlListView_GetSelectedIndices($scriptListViews[_GUICtrlTab_GetCurFocus($scriptTabs)])), 1)

								Case 'Pause'
									ToggleScript(GetPointedToArrayIndex(_GUICtrlTab_GetCurFocus($scriptTabs), _GUICtrlListView_GetSelectedIndices($scriptListViews[_GUICtrlTab_GetCurFocus($scriptTabs)])), 2)

								Case 'Stop'
									ToggleScript(GetPointedToArrayIndex(_GUICtrlTab_GetCurFocus($scriptTabs), _GUICtrlListView_GetSelectedIndices($scriptListViews[_GUICtrlTab_GetCurFocus($scriptTabs)])), 0)

								Case 'Stop All'
									Restart()
							EndSwitch
						EndIf

					Case '1'
					Case '2'
					Case '3'
					Case '4'
					Case '5'
						Restart()

					Case '6'
						_Exit()
				EndSwitch

			Case $scriptTabs
				Local $currTab = GUICtrlRead($scriptTabs)

				If $currTab <> $lastTab Then
					$lastTab = $currTab

					Global $aMenu1Buttons[3] = ['Add', 'Stop All']

					_Metro_DisableButton($startButton)
					_Metro_DisableButton($pauseButton)
					_Metro_DisableButton($stopButton)
				EndIf

			Case $startButton
				ToggleScript(GetPointedToArrayIndex(_GUICtrlTab_GetCurFocus($scriptTabs), _GUICtrlListView_GetSelectedIndices($scriptListViews[_GUICtrlTab_GetCurFocus($scriptTabs)])), 1)

			Case $pauseButton
				ToggleScript(GetPointedToArrayIndex(_GUICtrlTab_GetCurFocus($scriptTabs), _GUICtrlListView_GetSelectedIndices($scriptListViews[_GUICtrlTab_GetCurFocus($scriptTabs)])), 2)

			Case $stopButton
				ToggleScript(GetPointedToArrayIndex(_GUICtrlTab_GetCurFocus($scriptTabs), _GUICtrlListView_GetSelectedIndices($scriptListViews[_GUICtrlTab_GetCurFocus($scriptTabs)])), 0)
		EndSwitch

		Switch TrayGetMsg()
			Case $stopAllTrayMenuItem
				Restart()

			Case $exitTrayMenuItem
				_Exit()
		EndSwitch
	WEnd

	_Exit()
EndFunc

Func LoadScripts()
	Local $meta
	Local $k = 0
	Local $l = 0
	Local $m = 0

	For $i = 0 To $scriptFiles[0] - 1
		$file = FileOpen($scriptFiles[$i + 1])
		$meta = StringSplit(StringMid(FileReadLine($file), 3), ':', 2)

		If UBound($meta) < 6 Then
			ContinueLoop
		EndIf

		$scripts[0][$k][0] = 0
		$scripts[0][$k][1] = '"' & $scriptFiles[$i + 1] & '"'
		$scripts[0][$k][7] = '"' & $meta[5] & '"'

		For $j = 0 To 4
			$scripts[0][$k][$j + 2] = $meta[$j]
		Next

		If $meta[2] = 'OS' Then
			$scripts[1][$m][2] = $k
			$m += 1
		ElseIf $meta[2] = 'RS' Then
			$scripts[2][$l][2] = $k
			$l += 1
		EndIf

		FileClose($file)

		$k += 1
	Next
EndFunc

Func ToggleScript($index, $action)
	Local $view = $scriptListViews[_GUICtrlTab_GetCurFocus($scriptTabs)]
	Local $sel = _GUICtrlListView_GetSelectedIndices($view)
	Local $params = _ArrayToString(GetSubArray(0), ' ', $index, $index, Default, 1)
	Local $color

	Switch $action
		Case 0
			StopScript($index)

			$scripts[0][$index][0] = 0
			$color = 0xFF0000

			GUICtrlSetData($pauseButton, 'Pause Script')

			Global $aMenu1Buttons[4] = ['Add', 'Remove', 'Start', 'Stop All']

			_Metro_EnableButton($startButton)
			_Metro_DisableButton($pauseButton)
			_Metro_DisableButton($stopButton)

		Case 1
			Local $size = UBound($pids) + 1

			ReDim $pids[$size]

			$pid = Run(@AutoItExe & ' /AutoIt3ExecuteScript ' & $params)
			$pids[$size - 1] = $pid
			$scripts[0][$index][8] = $pid
			$scripts[0][$index][0] = 1
			$color = 0x00FF00

			RunGame($scripts[0][$index][4])

			Global $aMenu1Buttons[5] = ['Add', 'Remove', 'Pause', 'Stop', 'Stop All']

			_Metro_DisableButton($startButton)
			_Metro_EnableButton($pauseButton)
			_Metro_EnableButton($stopButton)

		Case 2
			Switch $scripts[0][$index][0]
				Case 1
					Send($scripts[0][$index][5])

					$scripts[0][$index][0] = 2
					$color = 0xFFFF00

					GUICtrlSetData($pauseButton, 'Resume Script')

				Case 2
					Send($scripts[0][$index][5])

					$scripts[0][$index][0] = 1
					$color = 0x00FF00

					GUICtrlSetData($pauseButton, 'Pause Script')
			EndSwitch
	EndSwitch

	GUICtrlSetBkColor(_GUICtrlListView_GetItemParam($view, $sel), $color)

	If $view = $scriptListViews[0] Then
		Local $listIndex1 = _ArraySearch(GetSubArray(1), $index, 0, 0, 0, 0, 1, 2)
		Local $listIndex2 = _ArraySearch(GetSubArray(2), $index, 0, 0, 0, 0, 1, 2)

		If $listIndex1 <> -1 Then
			GUICtrlSetBkColor(_GUICtrlListView_GetItemParam($scriptListViews[1], $listIndex1), $color)
		ElseIf $listIndex2 <> -1 Then
			GUICtrlSetBkColor(_GUICtrlListView_GetItemParam($scriptListViews[2], $listIndex2), $color)
		EndIf
	Else
		GUICtrlSetBkColor(_GUICtrlListView_GetItemParam($scriptListViews[0], $index), $color)
	EndIf
EndFunc

Func AddScript()
	Local $file = FileOpenDialog('Add Script', @DesktopDir, 'GhostBuddy Script (*.gbs)', $FD_FILEMUSTEXIST, '', $mainHWnd)
	Local $dir = StringSplit(StringMid(FileReadLine($file), 2), ':', 2)[0]

	FileMove($file, @ScriptDir & '\scripts\' & $dir & '\', $FC_CREATEPATH)
EndFunc

Func RemoveScript()
	Local $index = GetPointedToArrayIndex(_GUICtrlTab_GetCurFocus($scriptTabs), _GUICtrlListView_GetSelectedIndices($scriptListViews[_GUICtrlTab_GetCurFocus($scriptTabs)]))
	Local $scriptName = $scripts[0][$index][2]
	Local $confirm = _Metro_MsgBox($MB_YESNO, 'Are you sure?', 'Are you sure you wish to delete the script "' & $scriptName & '"?', 600, 11, $mainHWnd)

	If $confirm = $IDYES Then
		Local $rawFilename = $scripts[0][$index][1]

		FileDelete(StringMid($rawFilename, 2, StringLen($rawFilename) - 2))
	EndIf
EndFunc

Func RunGame($game)
	Local $gameName
	Local $gameFile

	Switch $game
		Case 'OS'
			$gameName = 'Old School RuneScape'
			$gameFile = @UserProfileDir & '\jagexcache\jagexlauncher\bin\JagexLauncher.exe oldschool'

		Case 'RS'
			$gameName = 'RuneScape'
			$gameFile = 'C:\Program Files\Jagex\RuneScape Launcher\RuneScape.exe'
	EndSwitch

	If Not WinExists($gameName) Then
		Run($gameFile)
	EndIf
EndFunc

Func StopAllScripts()
	For $i = 0 To UBound($pids) - 1
		ProcessClose($pids[$i])
	Next

	ReDim $pids[0]
EndFunc

Func StopScript($index)
	ProcessClose($scripts[0][$index][8])
EndFunc

Func CreateListView($scriptsIndex)
	Local $listView = GUICtrlCreateListView('Name|Version|Game|Pause|End|Description', 24, 157, WinGetClientSize($mainHWnd)[0] - 48, ControlGetPos(GUICtrlGetHandle($scriptTabs), '', 0)[3] - 33)
	Local $vSortSense[6] = [False, False, False, False, False, False]

	GUICtrlSetBkColor($listView, 0x13161C)
	GUICtrlSetFont(-1, 10, $FW_NORMAL, $GUI_FONTNORMAL, 'Segoe UI')

	For $i = 0 To 5
		_GUICtrlListView_JustifyColumn(GUICtrlGetHandle($listView), $i, 2)
	Next

	For $i = 0 To UBound($scripts, 2) - 1
		If $scripts[$scriptsIndex][$i][2] == '' Then
			ContinueLoop
		EndIf

		If $scriptsIndex = 0 Then
			GUICtrlCreateListViewItem(StringReplace(_ArrayToString(GetSubArray(0), '|', $i, $i, @CRLF, 2, -1), '"', ''), $listView)
		Else
			GUICtrlCreateListViewItem(StringReplace(_ArrayToString(GetSubArray(0), '|', GetPointedToArrayIndex($scriptsIndex, $i), GetPointedToArrayIndex($scriptsIndex, $i), @CRLF, 2, -1), '"', ''), $listView)
		EndIf

		GUICtrlSetBkColor(-1, 0xFF0000)
	Next

	For $i = 0 To 4
		_GUICtrlListView_SetColumnWidth($listView, $i, $LVSCW_AUTOSIZE)

		Local $auto = _GUICtrlListView_GetColumnWidth($listView, $i)

		_GUICtrlListView_SetColumnWidth($listView, $i, $LVSCW_AUTOSIZE_USEHEADER)

		If $auto > _GUICtrlListView_GetColumnWidth($listView, $i) Then
			_GUICtrlListView_SetColumnWidth($listView, $i, $LVSCW_AUTOSIZE)
		EndIf
	Next

	_GUICtrlListView_SetColumnWidth($listView, 5, $LVSCW_AUTOSIZE_USEHEADER)

	; _GUICtrlListView_SimpleSort($listView, $vSortSense, False)
	; _GUICtrlListView_SetItemSelected($listView, _GUICtrlListView_GetItemCount($listView) - 1, False)

	Return $listView
EndFunc

Func GetSubArray($scriptsIndex)
	Local $numRow = UBound($scripts, 2)
	Local $numCol = UBound($scripts, 3)
	Local $arr[$numRow][$numCol]

	For $i = 0 To $numRow - 1
		For $j = 0 To $numCol - 1
			$arr[$i][$j] = $scripts[$scriptsIndex][$i][$j]
		Next
	Next

	Return $arr
EndFunc

Func GetPointedToArrayIndex($scriptsIndex, $index)
	Local $arrIndex

	If $scriptsIndex <> 0 Then
		$arrIndex = $scripts[$scriptsIndex][$index][2]
	Else
		$arrIndex = $index
	EndIf

	Return $arrIndex
EndFunc

Func WM_NOTIFY($hWnd, $iMsg, $iwParam, $ilParam)
	Local $tNMHDR = DllStructCreate($tagNMHDR, $ilParam)
	Local $hWndFrom = HWnd(DllStructGetData($tNMHDR, 'hWndFrom'))
	Local $hWndListView = GUICtrlGetHandle($scriptListViews[_GUICtrlTab_GetCurFocus($scriptTabs)])

	Switch $hWndFrom
		Case $hWndListView
			Local $iCode = DllStructGetData($tNMHDR, 'Code')

			Switch $iCode
				Case $NM_CLICK, $NM_RCLICK, $LVN_BEGINDRAG, $LVN_BEGINRDRAG
					Local $tInfo = DllStructCreate($tagNMITEMACTIVATE, $ilParam)
					Local $index = DllStructGetData($tInfo, 'Index')
					Local $scriptsIndex = _GUICtrlTab_GetCurFocus($scriptTabs)

					Select
						Case $index < 0
							Global $aMenu1Buttons[3] = ['Add', 'Stop All']

							_Metro_DisableButton($startButton)
							_Metro_DisableButton($pauseButton)
							_Metro_DisableButton($stopButton)

						Case $scripts[0][GetPointedToArrayIndex($scriptsIndex, $index)][0] = '0'
							Global $aMenu1Buttons[4] = ['Add', 'Remove', 'Start', 'Stop All']

							_Metro_EnableButton($startButton)
							_Metro_DisableButton($pauseButton)
							_Metro_DisableButton($stopButton)

						Case $scripts[0][GetPointedToArrayIndex($scriptsIndex, $index)][0] = '2'
							ContinueCase

						Case $scripts[0][GetPointedToArrayIndex($scriptsIndex, $index)][0] = '1'
							Global $aMenu1Buttons[5] = ['Add', 'Remove', 'Pause', 'Stop', 'Stop All']

							_Metro_DisableButton($startButton)
							_Metro_EnableButton($pauseButton)
							_Metro_EnableButton($stopButton)
					EndSelect
			EndSwitch
	EndSwitch
EndFunc

Func WM_SIZE($hWnd, $iMsg, $wParam, $lParam)
	For $scriptListView In $scriptListViews
		_GUICtrlListView_SetColumnWidth($scriptListView, _GUICtrlListView_GetColumnCount($scriptListView) - 1, $LVSCW_AUTOSIZE_USEHEADER)
	Next
EndFunc

Func Restart()
	HotKeySet('{END}')

	If @Compiled = 1 Then
		Run(@ScriptFullPath)
	Else
		Run(@AutoItExe & ' ' & @ScriptFullPath)
	EndIf

	_Exit()
EndFunc

Func _Exit()
	DirRemove(@ScriptDir & '\temp', $DIR_REMOVE)
	DirRemove(@ScriptDir & '\include', $DIR_REMOVE)
	_Metro_GUIDelete($mainHWnd)
	StopAllScripts()

	Exit
EndFunc
