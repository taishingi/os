#!/bin/bash

pacman -Syyu --noconfirm

pacman -S --noconfirm git pacman-contrib

git clone https://github.com/taishingi/os && cd os || exit 1

./os "install" "vim"
./os "tree" "vim"
./os "remove" "vim"
./os "list" "core"
