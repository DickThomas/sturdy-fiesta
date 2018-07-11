#!/bin/bash

##get gpg key
wget -nv https://download.opensuse.org/repositories/network:messaging:xmpp:dino/Debian_9.0/Release.key -O Release.key
apt-key add - < Release.key
apt-get update
rm Release.key

echo 'deb http://download.opensuse.org/repositories/network:/messaging:/xmpp:/dino/Debian_9.0/ /' > /etc/apt/sources.list.d/network:messaging:xmpp:dino.list
apt-get update
apt-get install dino
