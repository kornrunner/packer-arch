#!/usr/bin/env bash

/usr/bin/runuser -l vagrant -c '/usr/bin/yay -S --noconfirm git gitflow-avh gitflow-zshcompletion-avh subversion python-pip'
/usr/bin/pip install git-up
