#!/bin/bash

apt-get update && apt-get install -y git

git clone https://github.com/taishingi/os && cd os || exit 1

./os "install" "vim"
./os "tree" "vim"
./os "remove" "vim"
./os "list" "installed"
./os "list" "upgradeable"
./os "list" "all-versions"
