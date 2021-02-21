# Azule

A tool used to inject jailbreak tweaks into jailed iOS apps.

## Tool Requirements
* Xcode

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
During its installation, Azule will check whether its dependencies(Xcode CLI Tools, Homebrew, dpkg, and jq) are installed. If not, you may be prompted to install them.

## Usage
1. Run ```azule``` in any terminal window to initialize
2. When asked for an IPA file, provide the path to a **decrypted** IPA of the app you are trying to modify. Encrypted ones won't work
4. When asked for "Files or Tweak BundleIDs", you can either provide the local paths to the files you wish to inject, or type the BundleIDs of the tweaks you wish to import (This only works if the tweak can be found on [Parcility](https://parcility.co)).

## Updating
Run ```update-azule``` in any terminal window to update Azule

**Note:** If you have modified any of Azule's files, the updater will abort so that your changes don't get overwritten.

## Credits

* [Kabir Oberai](https://github.com/kabiroberai/theos-jailed) - Idea of jailed tweaks
* [Tyilo](https://github.com/Tyilo/insert_dylib) - Creator of insert_dylib
