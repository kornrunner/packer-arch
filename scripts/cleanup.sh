#!/usr/bin/env bash

/usr/bin/pacman -S --noconfirm pacman-contrib
/usr/bin/paccache -rk0
/usr/bin/pacman -Rcns --noconfirm gptfdisk
/usr/bin/pacman -Scc --noconfirm
/usr/bin/runuser -l vagrant -c '/usr/bin/yay -Sc --noconfirm'
/usr/bin/runuser -l vagrant -c '/usr/bin/yay -Scc --noconfirm'
rm /tmp/yay-* -Rf
