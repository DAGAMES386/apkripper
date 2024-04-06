# Info
I spent about four hours making a bash script to simplify ripping APKs from an android phone using `adb pull`. Currently, this script is for Linux only. If I get a few stars, maybe I'll convert it to powershell or something. For now, just use WSL if you're on windows, and I don't really know how this works on Mac, sorry.

# To Use
In a terminal, give the file run permissions with `sudo chmod +x ripapk.sh`.
Once you do that, make sure you have android-tools installed, as well as android-udev (for Arch) and android-sdk-platform-tools-common (For Debian and Ubuntu). On the phone, you need to enable developer mode by going into settings>about and then click 'build number' a bunch until you get the message "You are now a developer!". With developer options enabled, go to 'settings>system>developer options' and enable USB debugging.
When you've got all the prerequesits in order, just run `./ripapk.sh`. Make sure that you've got the phone plugged into the computer with good usb cable, and that the phone is recognized.
From there, just follow the instructions and the apk should be extracted. Most apks are extracted as "base.apk", so it's probably best to run this in an empty folder for ease of finding it.

# DISCLAIMER:
## I DO NOT ENDORSE THE USE OF THIS TOOL FOR PIRACY/ILLICIT ACTIVITY. I MADE THIS TOOL FOR EDUCATIONAL PURPOSES ONLY.
