#!/bin/bash

##get gpg key
wget -nv https://download.opensuse.org/repositories/home:speaksthegeek/Debian_9.0/Release.key -O Release.key
apt-key add - < Release.key
apt-get update

##add repo
echo 'deb http://download.opensuse.org/repositories/home:/speaksthegeek/Debian_9.0/ /' > /etc/apt/sources.list.d/home:speaksthegeek.list
apt-get update
apt-get install com.github.lainsce.quilter