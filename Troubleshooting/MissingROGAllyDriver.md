# Missing driver after reinstalling Windows 11

When reinstalling Windows 11 you might end up with a missing driver for the device ACPI\NVDA0820\NPCF that is not listed on the Asus website.
It is the "NVIDIA Platform Controllers and Framework" software device to be exactly.

You can get the missing driver when extracting the latest NVIDIA GeForce driver with 7z.

How to :

1. Download the latest Game-Ready-Driver for the RTX 40 Series
2. Open the downloaded .exe file with Righ-click -> 7-Zip -> Open Archive
3. Select the folder "NVPCF" and drag it to the Desktop (this will extract only the folder)
4. Open the "Device Manager" on Windows
5. Right-click on the "Unknown device" inside "Other devices"
6. Select "Update driver" -> "Browse my computer for drivers" -> Browse to the extracted "NVPCF" folder
7. Hit "Next" to install the driver
