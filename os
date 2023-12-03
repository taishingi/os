#!/bin/bash

ARCH="/etc/arch-release"
DEBIAN="/etc/debian_version"
FEDORA="/etc/fedora-release"

function fedora() {

    case "$1" in
    install)
        dnf5 install -y "${2}"
        ;;
    remove)
        dnf5 remove -y "${2}"
        ;;
    tree)
        dnf5 repoquery --requires "{2}"
        ;;
    list)   
        dnf5 list "--${2}"
        ;;

    default) exit 1 ;;
    esac
}

function debian() {

    case "$1" in
    install)
        apt-get install -y "${2}"
        ;;
    remove)
        apt-get remove -y "${2}"
        ;;
    tree)
        apt-cache rdepends --installed "${2}"
        ;;
    list)
        apt-get list "--${2}"
        ;;
    default) exit 1 ;;

    esac
}

function arch() {

    case "$1" in
    install)
        pacman -Syu --noconfirm "${2}"
        ;;
    remove)
        pacman -Rcs --noconfirm "${2}"
        ;;
    list)
        pacman -Sl "${2}"
        ;;
    tree)
        pactree "${2}"
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
