#!/bin/bash
##########################
# Install script
##########################

dir=~/.dotfiles
files="tmux.conf ctags zshrc zlogin zpreztorc zshenv gitconfig npmrc wgetrc"

if [ ! -d ~/.zprezto ]; then
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


other() {
    linkdir=".pentadactyl .i3"
    for directory in $linkdir; do
        ln -s $dir/$directory ~/
    done
}
