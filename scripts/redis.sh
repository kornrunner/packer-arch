#!/usr/bin/env bash

/usr/bin/pacman -S --noconfirm redis
sync
/usr/bin/systemctl enable redis.service