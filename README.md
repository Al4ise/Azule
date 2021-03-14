# Azule

A tool used to inject jailbreak tweaks into jailed iOS apps.

## Features
* Written with Speed and Efficiency in mind
* Works for a wide range of tweaks
* Supports importing tweaks, just by typing in their Bundle ID. Powered by [Parcility](https://parcility.co)
* Supports importing multiple tweaks at once
* The command line version of Azule can be used to inject files with just a single command
* You can always specify custom files and folders to import:
  - .deb .dylib and .framework files will be processed and imported 
  - .bundle and other files will be copied to the root directory of the app
* Easy to use:
  - Provides an interactive solution to importing only the dylib files you need
  - Includes the commands `azule` and `update-azule` which can be invoked from any terminal window

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
chmod +x $AZULE/Install
$AZULE/Install
```
**You may be asked to provide your password.**

### Dependencies 
During its installation, Azule will check whether its dependencies (Xcode CLI Tools, Homebrew, dpkg, and jq) are installed. If not, you will be prompted to install them.

## Usage
There are two ways to use Azule:
* GUI Mode
* CLI Mode

To see instructions on how to use both, run `azule -h` in any terminal window.

## Updating
Run `update-azule` in any terminal window to update Azule.

**Note:** If you have modified any of Azule's files, the updater will abort so that your changes don't get overwritten.

**If you want to update Azule forcefully, run `update-azule -f`.**

**THIS WILL PERMANENTLY ERASE ALL CHANGES YOU HAVEN'T BACKED UP OUTSIDE OF AZULE'S FOLDER!**

## Credits

* [Kabir Oberai](https://github.com/kabiroberai/theos-jailed) - Idea of jailed tweaks
* [Tyilo](https://github.com/Tyilo/insert_dylib) - Creator of insert_dylib
