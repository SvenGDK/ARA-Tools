@echo off

Rem Based on https://github.com/ntdevlabs/tiny11builder
Rem Updated for Windows 11 23H2 (English International x64 v2) ISO
Rem Additionally :
Rem - Restores Classic Context Menu
Rem - Sets Ultimate Performance Power Plan
Rem - Disables Power Throttling
Rem - Disables Fullscreen Optimizations
Rem - Disables Svchost splitting
Rem - Disables CPU Mitigations
Rem - Disables Core Parking
Rem - Disables Location and Sensors

setlocal EnableExtensions EnableDelayedExpansion
title Ally11 Windows 11 ISO Builder

echo Welcome to the Ally11 Windows 11 ISO Builder!
timeout /t 3 /nobreak > nul
cls

set DriveLetter=
set /p DriveLetter=Please enter the drive letter of your Windows 11 image: 
set "DriveLetter=%DriveLetter%:"
echo.

if not exist "%DriveLetter%\sources\boot.wim" (
	echo.Cannot find sources\boot.wim installation file in the specified drive letter ...
	echo.
	echo.Please enter the correct drive letter.
	goto :Stop
)

if not exist "%DriveLetter%\sources\install.wim" (
	echo.Cannot find sources\install.wim installation file in the specified drive letter ...
	echo.
	echo.Please enter the correct drive letter.
	goto :Stop
)

md c:\ally11

echo Copying Windows image to temporary directory C:\ally11 ...
xcopy.exe /E /I /H /R /Y /J %DriveLetter% c:\ally11 >nul

echo Copy complete!
sleep 2
cls

echo Getting image information:
dism /Get-WimInfo /wimfile:c:\ally11\sources\install.wim
set index=
set /p index=Please enter the image index:
set "index=%index%"

echo Mounting Windows image. This may take a while.
echo.
md c:\scratchdir
dism /mount-image /imagefile:c:\ally11\sources\install.wim /index:%index% /mountdir:c:\scratchdir

echo Windows image mounted.
echo Removing applications ...

echo Removing Clipchamp ...
dism /image:c:\scratchdir /Remove-ProvisionedAppxPackage /PackageName:Clipchamp.Clipchamp_2.2.8.0_neutral_~_yxz26nhyzhsrt
echo Removing BingNews ...
dism /image:c:\scratchdir /Remove-ProvisionedAppxPackage /PackageName:Microsoft.BingNews_4.2.27001.0_neutral_~_8wekyb3d8bbwe
echo Removing BingWeather ...
dism /image:c:\scratchdir /Remove-ProvisionedAppxPackage /PackageName:Microsoft.BingWeather_4.53.33420.0_neutral_~_8wekyb3d8bbwe
echo Removing GetHelp ...
dism /image:c:\scratchdir /Remove-ProvisionedAppxPackage /PackageName:Microsoft.GetHelp_10.2201.421.0_neutral_~_8wekyb3d8bbwe
echo Removing GetStarted ...
dism /image:c:\scratchdir /Remove-ProvisionedAppxPackage /PackageName:Microsoft.Getstarted_2021.2204.1.0_neutral_~_8wekyb3d8bbwe
echo Removing OfficeHub ...
dism /image:c:\scratchdir /Remove-ProvisionedAppxPackage /PackageName:Microsoft.MicrosoftOfficeHub_18.2204.1141.0_neutral_~_8wekyb3d8bbwe
echo Removing SolitaireCollection ...
dism /image:c:\scratchdir /Remove-ProvisionedAppxPackage /PackageName:Microsoft.MicrosoftSolitaireCollection_4.12.3171.0_neutral_~_8wekyb3d8bbwe
echo Removing StickyNotes ...
dism /image:c:\scratchdir /Remove-ProvisionedAppxPackage /PackageName:Microsoft.MicrosoftStickyNotes_4.2.2.0_neutral_~_8wekyb3d8bbwe
echo Removing People ...
dism /image:c:\scratchdir /Remove-ProvisionedAppxPackage /PackageName:Microsoft.People_2020.901.1724.0_neutral_~_8wekyb3d8bbwe
echo Removing PowerAutomate ...
dism /image:c:\scratchdir /Remove-ProvisionedAppxPackage /PackageName:Microsoft.PowerAutomateDesktop_10.0.3735.0_neutral_~_8wekyb3d8bbwe
echo Removing ToDo ...
dism /image:c:\scratchdir /Remove-ProvisionedAppxPackage /PackageName:Microsoft.Todos_2.54.42772.0_neutral_~_8wekyb3d8bbwe
echo Removing Alarms ...
dism /image:c:\scratchdir /Remove-ProvisionedAppxPackage /PackageName:Microsoft.WindowsAlarms_2022.2202.24.0_neutral_~_8wekyb3d8bbwe
echo Removing Camera ...
dism /image:c:\scratchdir /Remove-ProvisionedAppxPackage /PackageName:Microsoft.WindowsCamera_2022.2201.4.0_neutral_~_8wekyb3d8bbwe
echo Removing Mail ...
dism /image:c:\scratchdir /Remove-ProvisionedAppxPackage /PackageName:microsoft.windowscommunicationsapps_2022.507.447.0_neutral_~_8wekyb3d8bbwe
echo Removing Feedback Hub ...
dism /image:c:\scratchdir /Remove-ProvisionedAppxPackage /PackageName:Microsoft.WindowsFeedbackHub_2022.106.2230.0_neutral_~_8wekyb3d8bbwe
echo Removing Maps ...
dism /image:c:\scratchdir /Remove-ProvisionedAppxPackage /PackageName:Microsoft.WindowsMaps_2022.2202.6.0_neutral_~_8wekyb3d8bbwe
echo Removing Sound Recorder ...
dism /image:c:\scratchdir /Remove-ProvisionedAppxPackage /PackageName:Microsoft.WindowsSoundRecorder_2021.2103.28.0_neutral_~_8wekyb3d8bbwe
echo Removing Your Phone ...
dism /image:c:\scratchdir /Remove-ProvisionedAppxPackage /PackageName:Microsoft.YourPhone_1.22022.147.0_neutral_~_8wekyb3d8bbwe
echo Removing ZuneMusic ...
dism /image:c:\scratchdir /Remove-ProvisionedAppxPackage /PackageName:Microsoft.ZuneMusic_11.2202.46.0_neutral_~_8wekyb3d8bbwe
echo Removing ZuneVideo ...
dism /image:c:\scratchdir /Remove-ProvisionedAppxPackage /PackageName:Microsoft.ZuneVideo_2019.22020.10021.0_neutral_~_8wekyb3d8bbwe
echo Removing Family ...
dism /image:c:\scratchdir /Remove-ProvisionedAppxPackage /PackageName:MicrosoftCorporationII.MicrosoftFamily_2022.507.447.0_neutral_~_8wekyb3d8bbwe
echo Removing QuickAssist ...
dism /image:c:\scratchdir /Remove-ProvisionedAppxPackage /PackageName:MicrosoftCorporationII.QuickAssist_2022.414.1758.0_neutral_~_8wekyb3d8bbwe
echo Removing Teams ...
dism /image:c:\scratchdir /Remove-ProvisionedAppxPackage /PackageName:MicrosoftTeams_23002.403.1788.1930_x64__8wekyb3d8bbwe
echo Removing Cortana ...
dism /image:c:\scratchdir /Remove-ProvisionedAppxPackage /PackageName:Microsoft.549981C3F5F10_3.2204.14815.0_neutral_~_8wekyb3d8bbwe

echo System apps removed! Now proceeding to removal of system packages ...
timeout /t 1 /nobreak > nul
cls

echo Removing Internet Explorer ...
dism /image:c:\scratchdir /Remove-Package /PackageName:Microsoft-Windows-InternetExplorer-Optional-Package~31bf3856ad364e35~amd64~en-GB~11.0.22621.1 > nul
dism /image:c:\scratchdir /Remove-Package /PackageName:Microsoft-Windows-InternetExplorer-Optional-Package~31bf3856ad364e35~amd64~~11.0.22621.2861 > nul

echo Removing LA57 ...
dism /image:c:\scratchdir /Remove-Package /PackageName:Microsoft-Windows-Kernel-LA57-FoD-Package~31bf3856ad364e35~amd64~~10.0.22621.2861 > nul

echo Removing Handwriting ...
dism /image:c:\scratchdir /Remove-Package /PackageName:Microsoft-Windows-LanguageFeatures-Handwriting-en-gb-Package~31bf3856ad364e35~amd64~~10.0.22621.2861 > nul

echo Removing OCR ...
dism /image:c:\scratchdir /Remove-Package /PackageName:Microsoft-Windows-LanguageFeatures-OCR-en-gb-Package~31bf3856ad364e35~amd64~~10.0.22621.2861 > nul

echo Removing Speech ...
dism /image:c:\scratchdir /Remove-Package /PackageName:Microsoft-Windows-LanguageFeatures-Speech-en-gb-Package~31bf3856ad364e35~amd64~~10.0.22621.2861 > nul

echo Removing TTS ...
dism /image:c:\scratchdir /Remove-Package /PackageName:Microsoft-Windows-LanguageFeatures-TextToSpeech-en-gb-Package~31bf3856ad364e35~amd64~~10.0.22621.2861 > nul

echo Removing Media Player Legacy ...
dism /image:c:\scratchdir /Remove-Package /PackageName:Microsoft-Windows-MediaPlayer-Package~31bf3856ad364e35~amd64~en-GB~10.0.22621.2792 > nul
dism /image:c:\scratchdir /Remove-Package /PackageName:Microsoft-Windows-MediaPlayer-Package~31bf3856ad364e35~amd64~~10.0.22621.2861 > nul
dism /image:c:\scratchdir /Remove-Package /PackageName:Microsoft-Windows-MediaPlayer-Package~31bf3856ad364e35~wow64~en-GB~10.0.22621.1 > nul
dism /image:c:\scratchdir /Remove-Package /PackageName:Microsoft-Windows-MediaPlayer-Package~31bf3856ad364e35~wow64~~10.0.22621.2861 > nul

echo Removing Tablet PC Math ...
dism /image:c:\scratchdir /Remove-Package /PackageName:Microsoft-Windows-TabletPCMath-Package~31bf3856ad364e35~amd64~~10.0.22621.2861 > nul

echo Removing Wallpapers ...
dism /image:c:\scratchdir /Remove-Package /PackageName:Microsoft-Windows-Wallpaper-Content-Extended-FoD-Package~31bf3856ad364e35~amd64~~10.0.22621.2861 > nul

echo Removing Edge ...
rd "C:\scratchdir\Program Files (x86)\Microsoft\Edge" /s /q
rd "C:\scratchdir\Program Files (x86)\Microsoft\EdgeUpdate" /s /q

echo Removing OneDrive ...
takeown /f C:\scratchdir\Windows\System32\OneDriveSetup.exe
icacls C:\scratchdir\Windows\System32\OneDriveSetup.exe /grant Administrators:F /T /C
del /f /q /s "C:\scratchdir\Windows\System32\OneDriveSetup.exe"

echo Removal complete!
timeout /t 2 /nobreak > nul
cls

echo Loading Registry ...
reg load HKLM\zCOMPONENTS "c:\scratchdir\Windows\System32\config\COMPONENTS" >nul
reg load HKLM\zDEFAULT "c:\scratchdir\Windows\System32\config\default" >nul
reg load HKLM\zNTUSER "c:\scratchdir\Users\Default\ntuser.dat" >nul
reg load HKLM\zSOFTWARE "c:\scratchdir\Windows\System32\config\SOFTWARE" >nul
reg load HKLM\zSYSTEM "c:\scratchdir\Windows\System32\config\SYSTEM" >nul

echo Bypassing system requirements on the system image ...
reg add "HKLM\zDEFAULT\Control Panel\UnsupportedHardwareNotificationCache" /v "SV1" /t REG_DWORD /d "0" /f >nul 2>&1
reg add "HKLM\zDEFAULT\Control Panel\UnsupportedHardwareNotificationCache" /v "SV2" /t REG_DWORD /d "0" /f >nul 2>&1
reg add "HKLM\zNTUSER\Control Panel\UnsupportedHardwareNotificationCache" /v "SV1" /t REG_DWORD /d "0" /f >nul 2>&1
reg add "HKLM\zNTUSER\Control Panel\UnsupportedHardwareNotificationCache" /v "SV2" /t REG_DWORD /d "0" /f >nul 2>&1
reg add "HKLM\zSYSTEM\Setup\LabConfig" /v "BypassCPUCheck" /t REG_DWORD /d "1" /f >nul 2>&1
reg add "HKLM\zSYSTEM\Setup\LabConfig" /v "BypassRAMCheck" /t REG_DWORD /d "1" /f >nul 2>&1
reg add "HKLM\zSYSTEM\Setup\LabConfig" /v "BypassSecureBootCheck" /t REG_DWORD /d "1" /f >nul 2>&1
reg add "HKLM\zSYSTEM\Setup\LabConfig" /v "BypassStorageCheck" /t REG_DWORD /d "1" /f >nul 2>&1
reg add "HKLM\zSYSTEM\Setup\LabConfig" /v "BypassTPMCheck" /t REG_DWORD /d "1" /f >nul 2>&1
reg add "HKLM\zSYSTEM\Setup\MoSetup" /v "AllowUpgradesWithUnsupportedTPMOrCPU" /t REG_DWORD /d "1" /f >nul 2>&1
			
echo Disabling Teams ...
reg add "HKLM\zSOFTWARE\Microsoft\Windows\CurrentVersion\Communications" /v "ConfigureChatAutoInstall" /t REG_DWORD /d "0" /f >nul 2>&1

echo Disabling Sponsored Apps ...
reg add "HKLM\zNTUSER\SOFTWARE\Microsoft\Windows\CurrentVersion\ContentDeliveryManager" /v "OemPreInstalledAppsEnabled" /t REG_DWORD /d "0" /f >nul 2>&1
reg add "HKLM\zNTUSER\SOFTWARE\Microsoft\Windows\CurrentVersion\ContentDeliveryManager" /v "PreInstalledAppsEnabled" /t REG_DWORD /d "0" /f >nul 2>&1
reg add "HKLM\zNTUSER\SOFTWARE\Microsoft\Windows\CurrentVersion\ContentDeliveryManager" /v "SilentInstalledAppsEnabled" /t REG_DWORD /d "0" /f >nul 2>&1
reg add "HKLM\zSOFTWARE\Policies\Microsoft\Windows\CloudContent" /v "DisableWindowsConsumerFeatures" /t REG_DWORD /d "1" /f >nul 2>&1
reg add "HKLM\zSOFTWARE\Microsoft\PolicyManager\current\device\Start" /v "ConfigureStartPins" /t REG_SZ /d "{\"pinnedList\": [{}]}" /f >nul 2>&1
			
echo Enabling local Accounts on OOBE ...
reg add "HKLM\zSOFTWARE\Microsoft\Windows\CurrentVersion\OOBE" /v "BypassNRO" /t REG_DWORD /d "1" /f >nul 2>&1
copy /y %~dp0autounattend.xml c:\scratchdir\Windows\System32\Sysprep\autounattend.xml

echo Disabling Reserved Storage ...
reg add "HKLM\zSOFTWARE\Microsoft\Windows\CurrentVersion\ReserveManager" /v "ShippedWithReserves" /t REG_DWORD /d "0" /f >nul 2>&1

echo Disabling Chat icon ...
reg add "HKLM\zSOFTWARE\Policies\Microsoft\Windows\Windows Chat" /v "ChatIcon" /t REG_DWORD /d "3" /f >nul 2>&1
reg add "HKLM\zNTUSER\SOFTWARE\Microsoft\Windows\CurrentVersion\Explorer\Advanced" /v "TaskbarMn" /t REG_DWORD /d "0" /f >nul 2>&1

echo Restoring classic Context Menu ...
reg add "HKLM\zNTUSER\Software\Classes\CLSID\{86ca1aa0-34aa-4e8b-a509-50c905bae2a2}\InprocServer32" /f /ve >nul 2>&1

echo Set Ultimate Performance Power Plan ...
reg add "HKLM\zSOFTWARE\Policies\Microsoft\Power\PowerSettings" /v "ActivePowerScheme" /t REG_SZ /d "e9a42b02-d5df-448d-aa00-03f14749eb61" /f >nul 2>&1

echo Disable Power Throttling ...
reg add "HKLM\zSYSTEM\CurrentControlSet\Control\Power\PowerThrottling" /v "PowerThrottlingOff" /t REG_DWORD /d "1" /f >nul 2>&1

echo Disable Fullscreen Optimizations, Svchost splitting, CPU Mitigations, UAC, Core Parking ...
reg add "HKLM\zSYSTEM\ControlSet001\Control\Power\PowerSettings\54533251-82be-4824-96c1-47b60b740d00\0cc5b647-c1df-4637-891a-dec35c318583" /v "ValueMax" /t REG_DWORD /d "0" /f >nul 2>&1
reg add "HKLM\zSYSTEM\CurrentControlSet\Control\Power\PowerThrottling" /v "SvcHostSplitThresholdInKB" /t REG_DWORD /d "0" /f >nul 2>&1
reg add "HKLM\zSYSTEM\CurrentControlSet\Control\Session Manager\Memory Management" /v "FeatureSettingsOverride" /t REG_DWORD /d "3" /f >nul 2>&1
reg add "HKLM\zSYSTEM\CurrentControlSet\Control\Session Manager\Memory Management" /v "FeatureSettingsOverrideMask" /t REG_DWORD /d "3" /f >nul 2>&1

echo Disable Location and Sensors ...
reg add "HKLM\zSOFTWARE\Policies\Microsoft\Windows\LocationAndSensors" /v "DisableLocationScripting" /t REG_DWORD /d "1" /f >nul 2>&1
reg add "HKLM\zSOFTWARE\Policies\Microsoft\Windows\LocationAndSensors" /v "DisableWindowsLocationProvider" /t REG_DWORD /d "1" /f >nul 2>&1
reg add "HKLM\zSOFTWARE\Policies\Microsoft\Windows\LocationAndSensors" /v "DisableLocation" /t REG_DWORD /d "1" /f >nul 2>&1
reg add "HKLM\zSOFTWARE\Policies\Microsoft\Windows\LocationAndSensors" /v "DisableSensors" /t REG_DWORD /d "1" /f >nul 2>&1

echo Tweaking complete!
echo Unmounting Registry ...
reg unload HKLM\zCOMPONENTS >nul 2>&1
reg unload HKLM\zDRIVERS >nul 2>&1
reg unload HKLM\zDEFAULT >nul 2>&1
reg unload HKLM\zNTUSER >nul 2>&1
reg unload HKLM\zSCHEMA >nul 2>&1
reg unload HKLM\zSOFTWARE >nul 2>&1
reg unload HKLM\zSYSTEM >nul 2>&1

echo Cleaning up image ...
dism /image:c:\scratchdir /Cleanup-Image /StartComponentCleanup /ResetBase

echo Cleanup complete.
echo Unmounting image ...
dism /unmount-image /mountdir:c:\scratchdir /commit

echo Exporting image ...
dism /Export-Image /SourceImageFile:c:\ally11\sources\install.wim /SourceIndex:%index% /DestinationImageFile:c:\ally11\sources\install2.wim /compress:max
del c:\ally11\sources\install.wim
ren c:\ally11\sources\install2.wim install.wim

echo Windows image completed. Continuing with boot.wim.
timeout /t 2 /nobreak > nul
cls

echo Mounting boot image ...
dism /mount-image /imagefile:c:\ally11\sources\boot.wim /index:2 /mountdir:c:\scratchdir

echo Loading Registry ...
reg load HKLM\zCOMPONENTS "c:\scratchdir\Windows\System32\config\COMPONENTS" >nul
reg load HKLM\zDEFAULT "c:\scratchdir\Windows\System32\config\default" >nul
reg load HKLM\zNTUSER "c:\scratchdir\Users\Default\ntuser.dat" >nul
reg load HKLM\zSOFTWARE "c:\scratchdir\Windows\System32\config\SOFTWARE" >nul
reg load HKLM\zSYSTEM "c:\scratchdir\Windows\System32\config\SYSTEM" >nul

echo Bypassing system requirements on the setup image :
reg add "HKLM\zDEFAULT\Control Panel\UnsupportedHardwareNotificationCache" /v "SV1" /t REG_DWORD /d "0" /f >nul 2>&1
reg add "HKLM\zDEFAULT\Control Panel\UnsupportedHardwareNotificationCache" /v "SV2" /t REG_DWORD /d "0" /f >nul 2>&1
reg add "HKLM\zNTUSER\Control Panel\UnsupportedHardwareNotificationCache" /v "SV1" /t REG_DWORD /d "0" /f >nul 2>&1
reg add "HKLM\zNTUSER\Control Panel\UnsupportedHardwareNotificationCache" /v "SV2" /t REG_DWORD /d "0" /f >nul 2>&1
reg add "HKLM\zSYSTEM\Setup\LabConfig" /v "BypassCPUCheck" /t REG_DWORD /d "1" /f >nul 2>&1
reg add "HKLM\zSYSTEM\Setup\LabConfig" /v "BypassRAMCheck" /t REG_DWORD /d "1" /f >nul 2>&1
reg add "HKLM\zSYSTEM\Setup\LabConfig" /v "BypassSecureBootCheck" /t REG_DWORD /d "1" /f >nul 2>&1
reg add "HKLM\zSYSTEM\Setup\LabConfig" /v "BypassStorageCheck" /t REG_DWORD /d "1" /f >nul 2>&1
reg add "HKLM\zSYSTEM\Setup\LabConfig" /v "BypassTPMCheck" /t REG_DWORD /d "1" /f >nul 2>&1
reg add "HKLM\zSYSTEM\Setup\MoSetup" /v "AllowUpgradesWithUnsupportedTPMOrCPU" /t REG_DWORD /d "1" /f >nul 2>&1
			
echo Registry tweaking complete! 
echo Unloading Registry ...
reg unload HKLM\zCOMPONENTS >nul 2>&1
reg unload HKLM\zDRIVERS >nul 2>&1
reg unload HKLM\zDEFAULT >nul 2>&1
reg unload HKLM\zNTUSER >nul 2>&1
reg unload HKLM\zSCHEMA >nul 2>&1
reg unload HKLM\zSOFTWARE >nul 2>&1
reg unload HKLM\zSYSTEM >nul 2>&1

echo Unmounting image ...
dism /unmount-image /mountdir:c:\scratchdir /commit 
cls

echo The ally11 image is now ready to be build.
echo Copying autounattend file to bypass account requirement on setup ...
echo Creating ISO file ...
copy /y %~dp0autounattend.xml c:\ally11\autounattend.xml

echo.
echo Creating ISO file ...
%~dp0oscdimg.exe -m -o -u2 -udfver102 -bootdata:2#p0,e,bc:\ally11\boot\etfsboot.com#pEF,e,bc:\ally11\efi\microsoft\boot\efisys.bin c:\ally11 %~dp0ally11.iso
echo Creation completed! Press any key to exit the script ...
pause 

echo Performing cleanup ...
rd c:\ally11 /s /q 
rd c:\scratchdir /s /q 
exit
