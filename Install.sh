#!/bin/zsh

mkdir -p ~/azule/.tmp
cd $AZULE/.tmp
git pull
chmod +x $AZULE/insert_dylib

# REMOVE OLD SUBSTRATE
if [ ! -f $AZULE/CydiaSubstrate.framework ]
then
rm -rf $AZULE/CydiaSubstrate.framework
fi

# INSTALL SUBSTRATE
curl -s -o api.json 'https://api.parcility.co/db/package/mobilesubstrate/saurik'
curl -s -Lo substrate.deb "$(jq -r '.data.repo.url' api.json)$(jq -r '.data.builds[-1].Filename' api.json)"
ar -x substrate.deb data.tar.lzma
tar -C $AZULE --lzma --strip-components 3 -xf data.tar.lzma ./Library/Frameworks/CydiaSubstrate.framework
rm -rf "$AZULE/CydiaSubstrate.framework/Libraries" "$AZULE/CydiaSubstrate.framework/Commands"

# CLEANUP
rm -rf $AZULE/.tmp

## UPDATE-AZULE GLOBAL COMMAND
## INIT-AZULE GLOBAL COMMAND
