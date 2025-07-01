#!/bin/bash
##########################
# Install script
##########################

dir=~/.dotfiles
files="tmux.conf zshrc zlogin zpreztorc zshenv"

if [ ! -d ~/.zprezto ]; then
    git clone --recursive https://github.com/sorin-ionescu/prezto.git ~/.zprezto
fi

for file in $files; do
    if [ ! -f ~/.$file ]; then
        echo "Symlinking $file"
        ln -s $dir/$file ~/.$file
    else
        echo "$file" already exists
    fi
done
