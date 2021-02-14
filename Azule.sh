#!/bin/zsh

# DATA
tweakname=greee ###
appnumber=0
appstoreid=http://itunes.apple.com/lookup?id=544007664
tweakids=(me.alfhaily.cercube)
dylibnames=(Cercube.dylib)

# MAKE .TMP
sourcedir=${0:a:h}
mkdir -p "$sourcedir"/.tmp/IPAS
mkdir -p "$sourcedir"/.tmp/DEBS
mkdir -p "$sourcedir"/.tmp/JSONS

# FETCH iTUNES DATA
if [ ! -f "$sourcedir"/.tmp/JSONS/"$(basename "$appstoreid")"_itunes.json ]
then
curl -s -o "$sourcedir"/.tmp/JSONS/"$(basename "$appstoreid")"_itunes.json "$appstoreid"
fi

# FETCH TWEAK JSONS, DEBS AND DECLARE $LATEST AND $TWEAKNAME
latest="$(jq -r '.results[].version' "$sourcedir"/.tmp/JSONS/"$(basename "$appstoreid")"_itunes.json) (T"
num=0
for i in "${tweakids[@]}"
do

# GET TWEAK JSONS
if [ ! -f "$sourcedir"/.tmp/JSONS/"$i".json ]
then
curl -s -o "$sourcedir"/.tmp/JSONS/"$i".json https://api.parcility.co/db/package/"$i"
fi

# GET TWEAK DEBS
if [ ! -f "$sourcedir"/.tmp/DEBS/"$i".deb ]
then
curl -s -o "$sourcedir"/.tmp/DEBS/"$i".deb "$(jq -r '.data.repo.url' "$sourcedir"/.tmp/JSONS/"$i".json)$(jq -r '.data.builds[].Filename' "$sourcedir"/.tmp/JSONS/"$i".json)"
fi
# DECLARE $TWEAKNAME
if [ -z "$tweakname" ]
then
if [ "$num" != "0" ]
then
tweakname+="+"
fi
tweakname+="$i"
fi

# DECLARE AND $LATEST
if [ "$num" != "0" ]
then
latest+="-"
fi
latest+=$(jq -r '.data.Version' "$sourcedir"/.tmp/JSONS/"$i".json)
num+=1
done
latest+=")"

# MAKE .TMP/$TWEAKNAME
mkdir -p "$sourcedir"/.tmp/"$tweakname"
cd "$sourcedir"/.tmp/"$tweakname"

# EXTRACT DEBS
for i in "${tweakids[@]}"
do
dpkg -x "$sourcedir"/.tmp/DEBS/"$i".deb .
done

# DECLARE $BUNDLEID
bundleid=$(jq -r '.results[].bundleId' "$sourcedir"/.tmp/JSONS/"$(basename "$appstoreid")"_itunes.json)

# IF IPA EXISTS, DON'T FETCH AGAIN
if [ ! -f "$sourcedir"/.tmp/IPAS/"$bundleid".ipa ]
then

# GET IPA
cd "$sourcedir"/.tmp/IPAS
iproxy 2222 22 & python3 "$sourcedir"/Resources/Frida/dump.py $bundleid -o $bundleid
killall -9 iproxy
cd "$sourcedir"/.tmp/"$tweakname"
fi

# PREPARE IPA
unzip -q "$sourcedir"/.tmp/IPAS/"$bundleid".ipa

# PREPARE BUNDLES
find -E "$sourcedir"/.tmp/"$tweakname"/Library/Application\ Support -iname '*.bundle' ! -iregex '.*\.(bundle)/.+' -exec rsync -a {} Payload/*.app \;

# PREPARE SUBSTRATE
rsync -a "$sourcedir"/Resources/CydiaSubstrate.framework Payload/*.app/Frameworks

# PREPARE AND INJECT DYLIBS
executable=("$sourcedir"/.tmp/"$tweakname"/Payload/*.app/$(/usr/libexec/PlistBuddy -c "Print :CFBundleExecutable" Payload/*.app/Info.plist))
for i in "${dylibnames[@]}"
do
codesign --remove-signature 'Library/MobileSubstrate/DynamicLibraries/'$i''
rsync -a 'Library/MobileSubstrate/DynamicLibraries/'$i'' Payload/*.app/Frameworks
install_name_tool -change /Library/Frameworks/CydiaSubstrate.framework/CydiaSubstrate @rpath/CydiaSubstrate.framework/CydiaSubstrate Payload/*.app/Frameworks/"$i"
"$sourcedir"/Resources/insert_dylib --inplace --all-yes "@rpath/$i" "$executable"
done

# PATCH INFO.PLIST
plutil -remove UISupportedDevices "$sourcedir"/.tmp/"$tweakname"/Payload/*.app/Info.plist
plutil -replace CFBundleVersion -string "$latest" "$sourcedir"/.tmp/"$tweakname"/Payload/*.app/Info.plist
plutil -replace CFBundleShortVersionString -string "$latest" "$sourcedir"/.tmp/"$tweakname"/Payload/*.app/Info.plist

# GENERATE IPA
mkdir -p "$sourcedir"/Packages
zip -r -q -X "$sourcedir"/Packages/"$tweakname".ipa Payload

# CLEANUP
rm -rf "$sourcedir"/.tmp
