
#!/bin/bash
aptitude install -y curl
if [ `uname -m` = "x86_64" ]; then

  # 64-bit stuff here
  curl https://code-industry.net/public/master-pdf-editor-5.0.36_qt5.amd64.deb  -o master-pdf-editor.deb

else
   # 32-bit stuff here
  curl https://code-industry.net/public/master-pdf-editor-5.0.36_i386.deb -o master-pdf-editor.deb
fi

dpkg -i master-pdf-editor.deb
apt-get --yes --fix-broken install

##https://code-industry.net/free-pdf-editor/
