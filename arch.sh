#!/bin/bash

pacman -Syyu

pacman -S --noconfirm git

git clone https://github.com/taishingi/os && cd os || exit 1

./os install vim
./os remove vim
