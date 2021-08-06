# Azule

A tool used to inject jailbreak tweaks into jailed iOS apps.
### Testers on M1 Macs Needed 
You can contact me at @al4ise on Twitter if you are willing to help

## For installation instructions [click here](https://github.com/Al4ise/Azule/wiki)

## Features
* Written with Speed and Efficiency in mind
* Works for a wide range of tweaks
* Supports importing tweaks, just through their BundleID. Powered by [Parcility](https://parcility.co)
* Supports importing multiple tweaks at once
* You can always specify custom files and folders to import:
  - .deb .dylib and .framework files will be processed and imported 
  - .bundle and other files will be copied to the root directory of the app
* Easy to use:
  - Just specify an iPA and a Tweak. Azule will do the rest for you.
  - Includes the commands `azule` and `update-azule` which can be invoked from any terminal window

To see instructions on how to use both, run `azule -h` in any terminal window.

## Updating
Run `update-azule` in any terminal window to update Azule.

**Note:** If you have modified any of Azule's files, the updater will abort so that your changes don't get overwritten.

**If you want to update Azule forcefully, run `update-azule -f`.**

**THIS WILL PERMANENTLY ERASE ALL CHANGES YOU HAVEN'T BACKED UP OUTSIDE OF AZULE'S FOLDER!**

## Credits

* [Kabir Oberai](https://github.com/kabiroberai/theos-jailed) - Creator of Theos Jailed
* [Tyilo](https://github.com/Tyilo/insert_dylib) - Created insert_dylib
* [LeanVel](https://github.com/LeanVel/insert_dylib) - Ported insert_dylib to Linux
* [screenplaydev](https://github.com/screenplaydev/plutil) - Wrote a Linux alternative for plutil
* [Majd Alfhaily](https://github.com/majd/ipatool) - Wrote ipatool
* [dlevi309](https://github.com/dlevi309/ipatool-ios) - Ported ipatool to iOS
