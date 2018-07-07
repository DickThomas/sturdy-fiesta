#!/bin/bash

apt update
apt install default-jdk  libxtst6

CACHEDIR="/var/cache/cedema/";
mkdir -p "$CACHEDIR"
cd "$CACHEDIR"
VERSION=$(wget "https://www.arduino.cc/en/Main/ReleaseNotes" -O - | grep -Po "ARDUINO [0-9.]{5}" | head -n 1 | cut -c 9-)
FILE=arduino-$VERSION-linux64.tar.xz
URL=https://downloads.arduino.cc/$FILE

wget -c "$URL" -O "$FILE"




if md5sum -c /opt/cedema/plugins/arduino.plugin/checksums.md5; then
    echo "MD5 match"
    tar -xf "$FILE" -C "/opt/"
    mv "/opt/arduino-$VERSION" "/opt/arduino"

    ln -sf "/opt/arduino/arduino" "/usr/bin/arduino"
    /opt/arduino/install.sh

    if [ -f "$HOME/.local/share/applications/arduino.desktop" ]; then
        rm -f "$HOME/.local/share/applications/arduino.desktop"
    fi

    if [ -f "$HOME/Desktop/arduino.desktop" ]; then
        rm -f "$HOME/Desktop/arduino.desktop"
    fi

    
else
    # The MD5 sum didn't match
    echo "fail"
fi
    

   
