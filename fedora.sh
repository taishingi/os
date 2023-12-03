#!/bin/bash

sudo dnf install -y git dnf5

git clone https://github.com/taishingi/os && cd os || exit 1

./os "install" "vim"
./os "remove" "vim"
