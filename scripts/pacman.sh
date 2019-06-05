#!/usr/bin/env bash

# PACMAN_REFLECTOR_ARGS can be used to pick a suitable mirror for pacman
if [ -z "$PACMAN_REFLECTOR_ARGS" ]; then
  export PACMAN_REFLECTOR_ARGS='-l 100 -p https --sort rate --save /etc/pacman.d/mirrorlist'
fi

/usr/bin/pacman -S --noconfirm reflector

# Update the mirrorlist to recently updated mirrors sorted by download rate
/usr/bin/reflector $PACMAN_REFLECTOR_ARGS

# Upgrade Pacman DB
/usr/bin/pacman-db-upgrade

sync

# Force pacman to refresh the package lists
/usr/bin/pacman -Syy

# Remove reflector as not required anymore
/usr/bin/pacman -Rns --noconfirm reflector
