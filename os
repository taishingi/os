#!/bin/bash

ARCH="/etc/arch-release"
DEBIAN="/etc/debian_version"
FEDORA="/etc/fedora-release"

function fedora() {

    case "$1" in
    install)
        sudo dnf5 install -y "${2}"
        ;;
    remove)
        sudo dnf5 remove -y "${2}"
        ;;
    default) exit 1 ;;
    esac
}

function debian() {

    case "$1" in
    install)
        sudo apt-get install -y "${2}"
        ;;
    remove)
        sudo apt-get remove -y "${2}"
        ;;
    default) exit 1 ;;

    esac
}

function arch() {

    case "$1" in
    install)
        sudo pacman -Syu --noconfirm "${2}"
        ;;
    remove)
        sudo pacman -Rcs --noconfirm "${2}"
        ;;
    default) exit 1 ;;

    esac
}

function main() {

    if [ -f "${FEDORA}" ]; then
        fedora "${1}" "${2}"
    elif [ -f "${ARCH}" ]; then
        arch "${1}" "${2}"
    elif [ -f "${DEBIAN}" ]; then
        debian "${1}" "${2}"
    else
        exit 1
    fi
}

main "$1" "$2"
