# -*- mode: sh -*-

# ------------------------------------------------------------------------------
# Environment Variables
# ------------------------------------------------------------------------------

# Go
export GOPATH="$HOME/gospace"
export GOPROXY="https://proxy.golang.org"

# PATH
export PATH="$HOME/.dotfiles/bin:$PATH"
export PATH="/usr/local/go/bin:$PATH"
export PATH="$GOPATH/bin:$PATH"
export PATH="$GOPATH/src/k8s.io/kubernetes/third_party/etcd:$PATH"
export PATH="$GOPATH/src/k8s.io/kubernetes/third_party/protoc:$PATH"

# NVM (Node Version Manager)
export NVM_DIR="$HOME/.nvm"

# Starship Prompt
export STARSHIP_CONFIG="$HOME/.dotfiles/starship.toml"

# Other
export GOOGLE_API_USE_CLIENT_CERTIFICATE="FALSE"

# ------------------------------------------------------------------------------
# Shell Configuration
# ------------------------------------------------------------------------------

# History
HISTFILE="$HOME/.zsh_history"
HISTSIZE=1000000
SAVEHIST=1000000
setopt APPEND_HISTORY
setopt INC_APPEND_HISTORY
setopt HIST_REDUCE_BLANKS
setopt EXTENDED_HISTORY

# Options
setopt AUTO_CD # cd without typing cd

# ------------------------------------------------------------------------------
# Sourcing and Initializations
# ------------------------------------------------------------------------------

# Load secrets if the file exists
if [[ -f "$HOME/.zsh_secrets" ]]; then
    source "$HOME/.zsh_secrets"
fi

# Prezto
if [[ -s "$HOME/.zprezto/init.zsh" ]]; then
  source "$HOME/.zprezto/init.zsh"
fi

# Local config
if [[ -f "$HOME/.localrc.zshrc" ]]; then
    source "$HOME/.localrc.zshrc"
fi

# Aliases
if [[ -f "$DOTFILES/zsh/alias.zsh" ]]; then
    source "$DOTFILES/zsh/alias.zsh"
fi

# ------------------------------------------------------------------------------
# Completions and Tools
# ------------------------------------------------------------------------------

# xref: https://github.com/eddiezane/lunchy/issues/57
autoload -U +X bashcompinit && bashcompinit
autoload -U +X compinit && compinit

# Ignore binary/compiled files for vim autocompletion
zstyle ':completion:*:*:vim:*' file-patterns '^*.(aux|pdf|jpg|png|out):source-files' '*:all-files'

# kubectl
if type kubectl > /dev/null; then
  source <(kubectl completion zsh)
  alias k=kubectl
  complete -o default -F __start_kubectl k
fi

# envman
[ -s "$HOME/.config/envman/load.sh" ] && source "$HOME/.config/envman/load.sh"

# zoxide
eval "$(zoxide init zsh)"

# starship
eval "$(starship init zsh)"

# nvm
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"

# atuin
eval "$(atuin init zsh)"
