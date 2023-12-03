#!/bin/bash

IS_ARCH=$(test -f /etc/arch-release)
IS_DEBIAN=$(test -f /etc/debian_version)
IS_FEDORA=$(test -f /etc/fedora-release)

function fedora() {

    case "$1" in
    install)
        sudo dnf install -y "${2}"
        ;;
    remove)
        sudo dnf remove -y "${2}"
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
        sudo pacman -Su --noconfirm "${2}"
        ;;
    remove)
        sudo pacman -Rcs --noconfirm "${2}"
        ;;
    default) exit 1 ;;

    esac
}

function main() {

    if [ "${IS_FEDORA}" ]; then
        fedora "${1}" "${2}"
    elif [ "${IS_ARCH}" ]; then
        arch "${1}" "${2}"
    elif [ "${IS_DEBIAN}" ]; then
        debian "${1}" "${2}"
    else
        exit 1
    fi
}

if [ -z "$1" ]; then
    exit 1
elif [ -z "$2" ]; then
    exit 1
else
    main "$1" "$2"
fi
