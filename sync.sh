#!/bin/bash -e
# Sync local files to this repository

do_sync () {
    if [[ $# -ne 1 ]]; then exit 255; fi
    if [[ "$1" != ~/* ]]; then
        >&2 echo "$1 is not under home directory."
        exit 2;
    fi

    echo "Sync $1"
    dest="dotfiles${1#~}"
    mkdir -p "$(dirname "$dest")"
    cp -r "$1" "$dest"

}

cd "$(dirname "$0")"
rm -rf dotfiles
mkdir dotfiles

# shell
do_sync ~/.bashrc
do_sync ~/.config/bash

# editor
do_sync ~/.config/nvim

# tmux
do_sync ~/.tmux.conf

# git
do_sync ~/.gitconfig
do_sync ~/.config/git
