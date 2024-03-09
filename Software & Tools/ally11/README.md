# ally11creator

The Asus Windows 11 image is unfortunately bloated and can slow down Windows in every way.</br>
This script builds a trimmed-down and optimized Windows 11 image for the Asus ROG Ally.

- Based on https://github.com/ntdevlabs/tiny11builder
- Updated for Windows 11 23H2 (English International x64 v2) ISO

The only included executable included is oscdimg.exe, which is provided by the Windows ADK and it is used to create bootable ISO images.</br>
Also included is an unattended answer file (autounattend.xml), which is used to bypass the online account requirement on OOBE (Out-of-Box-Experience) and to deploy the image with the /compact flag.</br>
It's open-source, so feel free to add or remove anything you want!</br>
Feedback is also much appreciated.

As of now, 23H2 (English International x64 v2) is supported.

How to use:

1. Download Windows 11 23H2 English International x64 from the Microsoft website (<https://www.microsoft.com/software-download/windows11>)
2. Mount the downloaded ISO image using Windows Explorer. (Right-click -> Open With -> Windows Explorer)
3. Run ally11creator.bat as Administrator
4. Select the drive letter where the image is mounted (only the letter without ":\" )
5. Select the edition that you want the image to be based
6. Sit back and wait while the script creates your image
7. When the script is done, you will find the ally11.iso in the same folder

Tweaks:

- Bypass installation system requirements
- Disable Sponsored Apps
- Enables local accounts on setup
- Disables Reserved Storage
- Disables chat icon

Additional Tweaks:

- Restores Classic Context Menu
- Sets Ultimate Performance Power Plan
- Disables Power Throttling
- Disables Fullscreen Optimizations
- Disables Svchost splitting
- Disables CPU Mitigations
- Disables Core Parking
- Disables Location and Sensors

What is removed:

- Clipchamp
- Bing News
- Bing Weather
- Get Help
- Get Started
- Office Hub
- Solitaire Collection
- People
- PowerAutomate
- ToDo
- Alarms
- Mail and Calendar
- Feedback Hub
- Maps
- Sound Recorder
- Your Phone
- Quick Assist
- Internet Explorer
- LA57 support
- OCR (Optical Character Recognition) for en-us
- Speech support
- TTS (Text-to-Speech) for en-us
- Media Player Legacy
- Tablet PC Math
- Wallpapers
- Edge
- OneDrive

Known issues:

1. Microsoft Teams and Cortana could be still installed.
2. Although Edge is removed, the icon and a ghost of its taskbar pin are still available. Also, there are some remnants in the Settings. But the app in itself is deleted.
3. Only 23H2 en-gb (international) x64 is supported as of now.
