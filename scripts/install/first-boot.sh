#!/bin/bash -eux

# init keys
pacman-key --init
pacman-key --populate archlinuxarm

# sync repos
pacman -Syy

# install docker
pacman -S docker --noconfirm
systemctl enable docker
systemctl start docker

# create done flag
touch /opt/first-boot-done

# shutdown
shutdown now
