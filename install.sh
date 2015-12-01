#!/bin/bash
##########################
# Install script
##########################

dir=~/.dotfiles
files="tmux.conf"

if [ ! -z ".zprezto" ]; then
    git clone https://github.com/sorin-ionescu/prezto.git ~/.zprezto
fi

for file in $files; do
    echo "Symlinking $file"
    ln -s $dir/$file ~/.$file
done

zfiles="zlogin zpreztorc zshenv zshrc"

for file in $zfiles; do
    echo "Symlinking $file"
    ln -s "$dir/zsh/$file" ~/.$file
done
