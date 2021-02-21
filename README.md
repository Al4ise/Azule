# Azule

A tool used to inject jailbreak tweaks into jailed iOS apps.

## Features
* Much faster than alternatives
* Works for more tweaks than even [Theos Jailed](https://github.com/kabiroberai/theos-jailed)
* Supports importing tweaks, just by typing in their Bundle ID. Powered by [Parcility](https://parcility.co)
* Supports importing multiple tweaks at once
* You can always specify custom files and folders to import:
  - .deb .dylib and .framework files will be processed and imported 
  - .bundle and other files will be copied to the root directory of the app

* Easy to use:
  - Provides an interactive solution to importing only the dylib files you need
  - Includes commands( `azule` and `update-azule`) that can be invoked just by typing them into a terminal
* Doesn't require Theos

### To-do
* Colored Terminal Output

## Requirements
* [Xcode](https://apps.apple.com/us/app/xcode/id497799835)

## Installation
1. Set the $AZULE environment variable:
```zsh
echo "export AZULE=~/azule" >> ~/.zprofile
```
**Note:** For the change to take effect, you have to restart your terminal.

2. Clone and Setup Azule
```zsh
git clone --recursive https://github.com/Al4ise/Azule $AZULE
chmod +x $AZULE/install
$AZULE/install
```
**You may be asked to provide your password.**

### Dependencies 
During its installation, Azule will check whether its dependencies (Xcode CLI Tools, Homebrew, dpkg, and jq) are installed. If not, you will be prompted to install them.

## Usage
1. Run `azule` in any terminal window to initialize
2. When asked for an IPA file, provide the path to a **decrypted** IPA of the app you are trying to modify. **Encrypted IPAs don't work**
3. When asked for Files or Tweak Bundle IDs, you can either provide the local paths to the files you wish to inject, or type the Bundle IDs of the tweaks (This only works if the tweaks can be found on [Parcility](https://parcility.co))

## Updating
Run `update-azule` in any terminal window to update Azule

**Note:** If you have modified any of Azule's files, the updater will abort so that your changes don't get overwritten.

## Credits

* [Kabir Oberai](https://github.com/kabiroberai/theos-jailed) - Idea of jailed tweaks
* [Tyilo](https://github.com/Tyilo/insert_dylib) - Creator of insert_dylib
