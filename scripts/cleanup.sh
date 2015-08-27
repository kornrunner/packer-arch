#!/usr/bin/env bash

/usr/bin/paccache -rk0
/usr/bin/pacman -Rcns --noconfirm gptfdisk
/usr/bin/pacman -Scc --noconfirm
