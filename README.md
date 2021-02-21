# Azule

A tool used to inject jailbreak tweaks into jailed iOS apps.

## Tool Requirements
* Homebrew
* Xcode Command Line Tools

## Installation

### Homebrew

Homebrew is necessary to install dependencies like **jq** and **dpkg**. If you haven't already installed Homebrew, open a Terminal window and run the following command:

```
/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
```
**You may be asked for your password during the installation. Read [this forum post](https://discourse.brew.sh/t/password-when-installing-homebrew/226/2) to learn more.**

### Installing Azule

```zsh
echo "export AZULE=~/azule" >> ~/.zprofile
git clone --recursive https://github.com/Al4ise/Azule $AZULE
chmod +x $AZULE/install
$AZULE/install
```
**Once again, you may be asked to provide your password.**

### Xcode Command Line Tools
During its installation, Azule will check if Xcode CLI Tools are installed. If they aren't, you will be prompted to install them.

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
