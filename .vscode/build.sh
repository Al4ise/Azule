#!/bin/bash

cp azule iOS/usr/bin/azule
cp modules/azule_apt iOS/usr/lib/Azule
cp modules/azule_decrypt iOS/usr/lib/Azule
find iOS -name .DS_Store -exec rm -rf {} \;
dpkg-deb -b iOS Azule-iOS.deb