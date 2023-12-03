#!/bin/bash

pacman -S --no-confirm git

git clone https://github.com/taishingi/os && cd os || exit 1

./os install vim
./os remove vim
