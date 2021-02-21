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
```
azule
```
### Project Requirements
* A Project Name... obviously
* A **decrypted** IPA of the app you are trying to modify. Encrypted ones won't work.
* The files(.bundle .deb .dylib .framework) **OR** the Bundle ID of the tweak you want to inject (This only works if the tweak can be found on [Parcility](https://parcility.co))

## Updating
```
update-azule
```
**Note:** If you have modified any of Azule's files, the updater will abort so that your changes don't get overwritten.

## Credits

* [Kabir Oberai](https://github.com/kabiroberai/theos-jailed) - Idea of jailed tweaks
* [Tyilo](https://github.com/Tyilo/insert_dylib) - Creator of insert_dylib
