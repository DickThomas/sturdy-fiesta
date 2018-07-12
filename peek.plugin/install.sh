#!/bin/bash

curl https://github.com/phw/peek/releases/download/1.3.1/peek-1.3.1-0-x86_64.AppImage -o peek.AppImage
mkdir -p /opt/peek
mv peek.AppImage /opt/peek/
cp /opt/cedema/plugins/peek.plugin/peek.png
cat > /usr/share/applications/peek.desktop <<EOL
[Desktop Entry]
Version=1.0
Encoding=UTF-8
Name=Peek
Comment=Peek
Exec=/opt/peek/peek.AppImage
Icon=/opt/firefox/browser/chrome/icons/default/default128.png
Type=Application
StartupNotify=true
Keywords=Animation;recoreder;gif
Categories=Graphics
EOL

