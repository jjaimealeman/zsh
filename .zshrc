zstyle ':completion:*' completer _list _oldlist _expand _complete _ignored _match _correct _approximate _prefix
zstyle ':completion:*' format '%d'
zstyle ':completion:*' group-name ''
zstyle ':completion:*' list-colors ''
zstyle ':completion:*' max-errors 10 numeric
zstyle :compinstall filename '/home/jjaime/.config/zsh/.zshrc'
zstyle ':completion:*' matcher-list '' 'm:{a-zA-Z}={A-Za-z}'
zstyle ':completion:*' menu select

# autoload -Uz compinit && compinit -i
autoload -Uz compinit
compinit

## PLUGINS
## AUTO PLUGIN MANAGER
## https://youtu.be/bTLYiNvRIVI?t=1320
source $ZDOTDIR/zsh-aliases
source $ZDOTDIR/zsh-functions
## `zsh-vi-mode` has to go first, because it overrides "ctrl r" for fzf !!**IMPORTANT**!!
# zsh_add_plugin "jeffreytse/zsh-vi-mode"

zsh_add_plugin "petervanderdoes/git-flow-completion"
zsh_add_plugin "zsh-users/zsh-autosuggestions"
zsh_add_plugin "zsh-users/zsh-completions"
zsh_add_plugin "zsh-users/zsh-syntax-highlighting"
zsh_add_plugin "agkozak/zsh-z"

# source /home/jjaime/.config/broot/launcher/bash/br
eval "$(starship init zsh)"
[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh

## GUMM - my own script for image manipulation.
# source /home/jjaime/.config/zsh/scripts/gumm.sh

# pnpm
export PNPM_HOME="/home/jjaime/.local/share/pnpm"
case ":$PATH:" in
  *":$PNPM_HOME:"*) ;;
  *) export PATH="$PNPM_HOME:$PATH" ;;
esac
# pnpm end

# Created by `pipx` on 2024-04-17 14:32:49
export PATH="$PATH:/home/jjaime/.local/bin"

source ~/fzf-git.sh/fzf-git.sh 

# Set up fzf key bindings and fuzzy completion
source <(fzf --zsh)
