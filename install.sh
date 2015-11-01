#!/bin/bash
##########################
# Install script
##########################

dir=~/.dotfiles
files="tmux.conf"

for file in $files; do
    echo "Symlinking $file"
    ln -s $dir/$file ~/.$file
done
