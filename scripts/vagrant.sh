#!/usr/bin/env bash

# Vagrant specific
date > /etc/vagrant_box_build_time

# Installing vagrant keys
mkdir -pm 700 /home/vagrant/.ssh
/usr/bin/curl -k --output /home/vagrant/.ssh/authorized_keys --location https://raw.github.com/mitchellh/vagrant/master/keys/vagrant.pub
chmod 0600 /home/vagrant/.ssh/authorized_keys
chown -R vagrant /home/vagrant/.ssh

# Set up oh-my-zsh
chsh -s $(which zsh) vagrant
cp /usr/share/oh-my-zsh/zshrc /home/vagrant/.zshrc
/usr/bin/sed -i 's/plugins=(git)/plugins=(git git-extras git-flow)/g' /home/vagrant/.zshrc
cat >> /home/vagrant/.zshrc <<EOF
autoload -U compinit promptinit
compinit
promptinit
EOF
chown -R vagrant /home/vagrant/.zshrc

# Customize the message of the day
echo 'Development Environment' > /etc/motd
