#!/bin/bash

sudo dnf install -y git dnf5

git clone https://github.com/taishingi/os && cd os || exit 1

./os "install" "vim"
./os "tree" "vim"
./os "remove" "vim"
./os "list" "extras"
./os "list" "upgrades"
./os "list" "obsoletes"
