# Install Ubuntu 22.04.4 on the ROG Ally

![ubuntually](https://github.com/SvenGDK/ARA-Tools/assets/84620/e14d2e05-18c5-4b8d-abbf-59825e5a4c2f)


Ubuntu is almost running out of the box with Ubuntu 22.04.4 and only lacks WiFi support. This however can be fixed with an updated kernel.</br>
When installing Ubuntu the first time it is recommended to use a USB-C dock with an Ethernet adapter, a free USB port and preferably also a keyboard attached.

## New Installation (Ubuntu only)

1. Prepare an USB drive with the Ubuntu 22.04.4 ISO or newer using Rufus (Partition scheme: GPT)
2. Boot into the UEFI settings (Power on with volume down)
3. Do not turn off secure boot or anything else as Ubuntu supports Secure Boot
4. Select "Boot Menu" from the bottom and select your created USB drive (UEFI: USB ...)
5. Select "Install" and select your language and keyboard layout
6. Select the "Normal Installation" and tick the option "Download updates while installing Ubuntu", "Install third-party software ..." and "Configure Secure Boot"
7. Select "Erase disk and install Ubuntu" and continue
8. Pick your location and enter your account information
9. Now wait until Ubuntu is installed and the ROG Ally reboots
10. Ubuntu 22.04.4 is now installed on the ROG Ally

## Dual Boot Ubuntu 22.04.4 with Windows 11

It is recommended to Install Windows 11 first.

1. Prepare an USB drive with the Ubuntu 22.04.4 ISO or newer using Rufus (Partition scheme: GPT)
2. Boot into the UEFI settings (Power on with volume down)
3. Do not turn off secure boot or anything else yet
4. Select "Boot Menu" from the bottom and select your created USB drive (UEFI: USB ...)
5. Select "Install" and select your language and keyboard layout
6. Select the "Normal Installation" and tick the option "Download updates while installing Ubuntu", "Install third-party software ..." and "Configure Secure Boot"
7. Select "Install Ubuntu alongside Windows Boot Manager" and adjust how much space Ubuntu should get (using the touchscreen)
8. Pick your location and enter your account information
9. Now wait until Ubuntu is installed and the ROG Ally reboots
10. Ubuntu 22.04.4 is now installed alongside Windows 11

## Wi-Fi Fix on 22.04.4 using zabbly kernel

GITHUB : https://github.com/zabbly/linux</br>
NOTE : As those kernels aren't signed by a trusted distribution key, you need to turn off Secure Boot in order to boot this kernel.</br>
CHECK PUBLIC KEY : ```curl -fsSL https://pkgs.zabbly.com/key.asc | gpg --show-keys --fingerprint```

1. Create the keyrings directory : ```sudo mkdir -p /etc/apt/keyrings/```
2. Download the key : ```sudo curl -fsSL https://pkgs.zabbly.com/key.asc -o /etc/apt/keyrings/zabbly.asc```
3. Add the repository :

```
sh -c 'cat <<EOF > /etc/apt/sources.list.d/zabbly-kernel-stable.sources
Enabled: yes
Types: deb
URIs: https://pkgs.zabbly.com/kernel/stable
Suites: $(. /etc/os-release && echo ${VERSION_CODENAME})
Components: main
Architectures: $(dpkg --print-architecture)
Signed-By: /etc/apt/keyrings/zabbly.asc

EOF'
```

4. Update the packages : ```sudo apt update```
5. Install zabbly kernel : ```sudo apt install linux-zabbly```
6. Reboot and turn off Secure Boot in the UEFI settings
7. Reboot into Ubuntu with working WiFi

## Selecting an OS on the bootloader

1. Boot into the UEFI settings (Power on with volume down)
2. Select "Boot Menu" from the bottom
3. Select the GRUB bootloader
4. From here you can select the OS with the D-Pad

## Virtual (On-screen) keyboard

Ubuntu also comes with an on-screen keyboard feature that can be enabled in the Accessibility settings -> Typing -> Screen keyboard</br>
The keyboard however is a tiny one and lacks of important keys.</br>
This can be fixed using the "Enhanced OSK" Gnome extension.

1. Install the Gnome Shell integration : ```sudo apt install chrome-gnome-shell```
2. Go to https://extensions.gnome.org/extension/6595/enhanced-osk/ and install the browser extenstion, reload the page and hit "Install"
3. Restart your Web Browser, reload the page and toggle the switch ON
4. Restart Ubuntu to apply the changes
5. Toggle the onscreen keyboard and enjoy an extended keyboard
