# -*- mode: sh -*-
export PATH=~/.dotfiles/bin:$PATH
export PATH=/usr/local/go/bin:$PATH
export PATH=~/.npm/npm-packages/bin:$PATH
export PATH=~/gospace/bin:$PATH
export PATH=~/bin:$PATH
export PATH=~/gospace/bin:$PATH
export GOPATH=~/gospace
export GOPROXY=https://proxy.golang.org
export PATH="~/workspace/kubernetes/third_party/etcd:${PATH}"
# export GOROOT=~/workspace

# Colorful output (ps aux, ping)
if $(grc &>/dev/null); then
    source `brew --prefix`/etc/grc.bashrc
fi

# Prezto
source "$HOME/.zprezto/init.zsh"

source "$DOTFILES/zsh/alias.zsh"

if [[ -f ~/.localrc.zshrc ]]; then
    source ~/.localrc.zshrc
fi

# Command not found: Arch only
if [[ -f /usr/share/doc/pkgfile/command-not-found.zsh ]]; then
    source /usr/share/doc/pkgfile/command-not-found.zsh
fi

# Ignore binary/compiled files for vim autocompletion
compinit
zstyle ':completion:*:*:vim:*' file-patterns '^*.(aux|pdf|jpg|png|out):source-files' '*:all-files'

if type kubectl > /dev/null; then
  source <(kubectl completion zsh | sed 's/kubectl/kubectl/g')
  alias k=kubectl
  complete -o default -F __start_kubectl k
fi

# Colors
# You can't just change the terminal...
#export TERM=screen-256color
#export TERM=rxvt-unicode-256color
export CLICOLOR=1
export LSCOLORS=Gxfxcxdxbxegedabagacad
export LS_COLORS="di=1;34:ln=35:so=32:pi=33:ex=31:bd=34;46:cd=34;43:su=30;41:sg=30;46:tw=30;42:ow=30;43"

export GREP_COLOR='0;31'
export GREP_COLORS="mt=$GREP_COLOR"

HISTSIZE=100000
SAVEHIST=100000
HISTFILE=~/.zsh_history

setopt AUTO_CD            # cd without typing cd
setopt APPEND_HISTORY     # Allow multiple terminal sessions to all append to one zsh command history
setopt INC_APPEND_HISTORY # Add comamnds as they are typed, don't wait until shell exit
setopt HIST_REDUCE_BLANKS # Remove extra blanks from each command line being added to history
setopt EXTENDED_HISTORY   # Include more information about when the command was executed, etc


# To customize prompt, run `p10k configure` or edit ~/.p10k.zsh.
[[ -f ~/.p10k.zsh ]] && source ~/.p10k.zsh

# The next line updates PATH for the Google Cloud SDK.
if [ -f '~/google-cloud-sdk/path.zsh.inc' ]; then . '~/google-cloud-sdk/path.zsh.inc'; fi

# The next line enables shell command completion for gcloud.
if [ -f '~/google-cloud-sdk/completion.zsh.inc' ]; then . '~/google-cloud-sdk/completion.zsh.inc'; fi

#hidutil property --set '{"UserKeyMapping":[{"HIDKeyboardModifierMappingSrc":0x700000039,"HIDKeyboardModifierMappingDst":0x70000002A}]}'
# Generated for envman. Do not edit.
[ -s "$HOME/.config/envman/load.sh" ] && source "$HOME/.config/envman/load.sh"

eval "$(zoxide init zsh)"
