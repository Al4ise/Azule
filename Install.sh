#!/bin/zsh

mkdir -p ~/azule/.tmp
cd $AZULE
git pull
chmod +x insert_dylib

# UPDATE-AZULE GLOBAL COMMAND
if [ ! -f /usr/local/bin/update-azule ]
then
ln -s install.sh /usr/local/bin/update-azule
chmod +x /usr/local/bin/update-azule
fi

# REMOVE OLD SUBSTRATE
if [ -d CydiaSubstrate.framework ]
then
rm -rf CydiaSubstrate.framework
fi

# INSTALL SUBSTRATE
cd .tmp
curl -s -o api.json 'https://api.parcility.co/db/package/mobilesubstrate/saurik'
curl -s -Lo substrate.deb "$(jq -r '.data.repo.url' api.json)$(jq -r '.data.builds[-1].Filename' api.json)"
ar -x substrate.deb data.tar.lzma
tar -C $AZULE --lzma --strip-components 3 -xf data.tar.lzma ./Library/Frameworks/CydiaSubstrate.framework
rm -rf "$AZULE/CydiaSubstrate.framework/Libraries" "$AZULE/CydiaSubstrate.framework/Commands"

# CLEANUP
rm -rf $AZULE/.tmp

## INIT-AZULE GLOBAL COMMAND
