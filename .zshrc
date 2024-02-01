zstyle ':completion:*' completer _list _oldlist _expand _complete _ignored _match _correct _approximate _prefix
zstyle ':completion:*' format '%d'
zstyle ':completion:*' group-name ''
zstyle ':completion:*' list-colors ''
zstyle ':completion:*' max-errors 10 numeric
zstyle :compinstall filename '/home/jjaime/.config/zsh/.zshrc'
zstyle ':completion:*' matcher-list '' 'm:{a-zA-Z}={A-Za-z}'
zstyle ':completion:*' menu select

autoload -Uz compinit && compinit -i
compinit

## PLUGINS
## AUTO PLUGIN MANAGER
## https://youtu.be/bTLYiNvRIVI?t=1320
source $ZDOTDIR/zsh-aliases
source $ZDOTDIR/zsh-functions
zsh_add_plugin "zsh-users/zsh-autosuggestions"
zsh_add_plugin "zsh-users/zsh-syntax-highlighting"
zsh_add_plugin "zsh-users/zsh-completions"
zsh_add_plugin "agkozak/zsh-z"
zsh_add_plugin "petervanderdoes/git-flow-completion"
zsh_add_plugin "jeffreytse/zsh-vi-mode"

[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh
source /home/jjaime/.config/broot/launcher/bash/br

