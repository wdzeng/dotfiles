#!/bin/bash -e
# Copy dotfiles in the repository to local file system

readonly RED='\033[0;31m'
readonly YELLOW='\033[0;33m'
readonly NC='\033[0m'

cd "$(dirname "$0")"
. ./util.sh

backuped=()

do_install() {
    local src="dotfiles/$1"
    local dst="$HOME/$1"

    # If destination already exists then try to do a backup.
    if [[ -e "$dst" ]]; then
        local backup="$dst.backup"
        if [[ -e "$backup" ]]; then
            echo >&2 -e "${RED}Skip $dst because $backup exists${NC}"
            backuped+=("$backup")
            return
        fi
        echo >&2 -e "${YELLOW}Backup: $dst -> $backup${NC}"
        backuped+=("$backup")
        rm -rf "$dst.backup" && mv "$dst" "$dst.backup"
    fi

    echo >&2 "Restore: $src -> $dst"
    cp -r "$src" "$dst"
}

for f in $(config_list); do
    do_install "$f"
done

echo >&2
echo >&2 -e "Remember to ${YELLOW}source $HOME/.bashrc${NC}"
echo >&2 'Kill tmux server to reflect tmux config'
echo >&2
echo >&2 -e "Run ${YELLOW}rm -rf ${backuped[*]}${NC} to delete all backup files"
echo >&2
echo >&2 'Remember to update ~/.gitconfig and set your signing key.'
