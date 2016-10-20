export PATH=~/md-compiler:$PATH
export PATH=~/.dotfiles/bin:$PATH
export PATH=~/bb8:$PATH
export PATH=~/.npm/npm-packages/bin:$PATH

export SCALA_HOME=/usr/local/bin/scala
#export PATH=$PATH:$SCALA_HOME/bin
#export PATH=$PATH:~/bin/spark-1.5.1-bin-hadoop2.6/bin
#export PATH=$PATH:~/bin/hadoop-2.6.1

# Prezto
source "$HOME/.zprezto/init.zsh"

source "$DOTFILES/zsh/alias.zsh"
if [[ ~/.localrc ]]; then
    source ~/.localrc
fi

# Command not found: Arch only
if [[ -f /usr/share/doc/pkgfile/command-not-found.zsh ]]; then
    source /usr/share/doc/pkgfile/command-not-found.zsh
fi

# Ignore binary/compiled files for vim autocompletion
compinit
zstyle ':completion:*:*:vim:*' file-patterns '^*.(aux|pdf|jpg|png|out):source-files' '*:all-files'

# Colors
# You can't just change the terminal...
#export TERM=screen-256color
#export TERM=rxvt-unicode-256color
export CLICOLOR=1
export LSCOLORS=Gxfxcxdxbxegedabagacad

HISTSIZE=10000
SAVEHIST=10000
HISTFILE=~/.zsh_history

setopt AUTO_CD            # cd without typing cd
setopt APPEND_HISTORY     # Allow multiple terminal sessions to all append to one zsh command history
setopt INC_APPEND_HISTORY # Add comamnds as they are typed, don't wait until shell exit
setopt HIST_REDUCE_BLANKS # Remove extra blanks from each command line being added to history
setopt EXTENDED_HISTORY   # Include more information about when the command was executed, etc
