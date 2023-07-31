#!/bin/bash -e
# Copy dotfiles in the repository to local file system

cp -r dotfiles/. ~

echo 'Remember to source ~/.bashrc'
echo 'Kill tmux server to reflect tmux config.'
