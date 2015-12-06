#!/bin/bash
##########################
# Install script
##########################

dir=~/.dotfiles
files="tmux.conf ctags"

if [ ! -z "~/.zprezto" ]; then
    git clone https://github.com/sorin-ionescu/prezto.git ~/.zprezto
fi

for file in $files; do
    if [ ! -f ~/.$file ]; then
        echo "Symlinking $file"
        ln -s $dir/$file ~/.$file
    else
        echo "$file" already exists
    fi
done

zfiles="zlogin zpreztorc zshenv zshrc"

for file in $zfiles; do
    if [ ! -f ~/.$file ]; then
        echo "Symlinking $file"
        ln -s "$dir/zsh/$file" ~/.$file
    else
        echo "$file" already exists
    fi
done
