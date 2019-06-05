#!/usr/bin/env bash

/usr/bin/pacman -Sy --noconfirm git go
/usr/bin/runuser -l vagrant -c 'git clone https://aur.archlinux.org/yay.git /tmp/yay && cd /tmp/yay && makepkg --noconfirm -si && rm -rf /tmp/yay'
/usr/bin/pacman -Rns --noconfirm go
