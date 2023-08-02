#!/bin/bash -e
# Sync local files to this repository

do_sync () {
    src="$HOME/$1"
    dst="dotfiles/$1"
    echo >&2 "Sync: $src -> $dst"
    mkdir -p "$(dirname "$dst")" && cp -r "$src" "$dst"
}

cd "$(dirname "$0")"
rm -rf dotfiles && mkdir dotfiles

. ./util.sh
for f in $(config_list); do
    do_sync "$f"
done
