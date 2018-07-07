#!/bin/bash

dpkg --add-architecture i386
apt update
apt install default-jdk  libxtst6:i386


if [[ "$(uname -m)" = "x86_64" ]]; then
	ARCH="64"
else
	ARCH="32"
fi




CACHEDIR="/var/cache/cedema";
mkdir -p "$CACHEDIR"
cd "$CACHEDIR"
VERSION=$(wget "https://www.ardui   no.cc/en/Main/ReleaseNotes" -O - | grep -Po "ARDUINO [0-9.]{5}" | head -n 1 | cut -c 9-)
FILE=arduino-$VERSION-linux$ARCH.tar.xz
URL=https://downloads.arduino.cc/$FILE
MD5=checksums.md5
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
    

   
