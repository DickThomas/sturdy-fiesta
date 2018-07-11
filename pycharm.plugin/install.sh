#!/bin/bash
apt install -y default-jdk


CACHEDIR="/var/cache/cedema/pycharm"
FILE=ideaIC.tar.gz

mkdir -p "$CACHEDIR"
cd "$CACHEDIR"
URL=https://download.jetbrains.com/python/pycharm-community-2018.1.4.tar.gz

wget -c "$URL" -O "$FILE"

rmdir  -Rfv "/opt/pycharm"
mkdir -p "/opt/pycharm"
tar -xvf "$FILE" -C "/opt/pycharm/"

ln -sf /opt/pycharm/pycharm-community-2018.1.4/bin/pycharm.sh /usr/bin/pycharm

xdg-icon-resource install --novendor --size 256 "/opt/pycharm/pycharm-community-2018.1.4/bin/pycharm.png" "pycharm"
gtk-update-icon-cache -f -t /usr/share/icons/hicolor


cat <<EOF | tee /usr/share/applications/intellij.desktop
[Desktop Entry]
Name=pycharm
Icon=pycharm
Comment=The Most Intelligent python IDE
Exec=/usr/bin/pycharm
Terminal=false
Type=Application
StartupNotify=true
Categories=Deveopment;python
Keywords=python;Deveopment
EOF
