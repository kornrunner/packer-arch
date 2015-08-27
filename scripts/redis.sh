#!/usr/bin/env bash

/usr/bin/yaourt -S --noconfirm redis
sync
/usr/bin/systemctl enable redis.service