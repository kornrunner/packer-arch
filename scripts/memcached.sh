#!/usr/bin/env bash

/usr/bin/pacman -S --noconfirm memcached
sync
/usr/bin/systemctl enable memcached.service