
export PATH=~/.dotfiles/bin:$PATH
export PATH=~/bb8:$PATH
export PATH=~/.node_modules/bin:$PATH
#export PATH=~/.powerline/scripts:$PATH

export SCALA_HOME=/usr/local/bin/scala
#export PATH=$PATH:$SCALA_HOME/bin
#export PATH=$PATH:~/bin/spark-1.5.1-bin-hadoop2.6/bin
#export PATH=$PATH:~/bin/hadoop-2.6.1

# Prezto
source "$HOME/.zprezto/init.zsh"

source "$DOTFILES/zsh/alias.zsh"

# Command not found: Arch only
if [[ -f /usr/share/doc/pkgfile/command-not-found.zsh ]]; then
    source /usr/share/doc/pkgfile/command-not-found.zsh
fi


# Colors
export TERM=screen-256color
export CLICOLOR=1
export LSCOLORS=Gxfxcxdxbxegedabagacad

HISTSIZE=10000
SAVEHIST=10000
HISTFILE=~/.zsh_history

# cd without typing cd
setopt AUTO_CD

setopt APPEND_HISTORY # Allow multiple terminal sessions to all append to one zsh command history
setopt INC_APPEND_HISTORY # Add comamnds as they are typed, don't wait until shell exit
setopt HIST_REDUCE_BLANKS # Remove extra blanks from each command line being added to history
setopt EXTENDED_HISTORY # Include more information about when the command was executed, etc
