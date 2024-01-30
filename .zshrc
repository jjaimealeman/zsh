# The following lines were added by compinstall


autoload -U compinit; compinit
_comp_options+=(globdots) # With hidden files
# If you type <command> and hit the tab key, you’ll see that Zsh will complete the command.
# If you type <command - > and hit the tab key, Zsh will display the possible arguments for the command.
source "$ZDOTDIR/scripts/completion.zsh"

# https://www.soberkoder.com/better-zsh-history/
# 1. Immediate append Setting the inc_append_history option ensures that commands are added to the 
# history immediately (otherwise, this would happen only when the shell exits, and you could lose 
# history upon unexpected/unclean termination of the shell).
# setopt INC_APPEND_HISTORY
# setopt EXTENDED_HISTORY
# setopt HIST_FIND_NO_DUPS
# setopt HIST_IGNORE_ALL_DUPS

# alias r='ranger'
#
# alias ga='git add -A && git commit'
# alias gd='git diff'
# #alias gd='git diff --color | diff-so-fancy'
# alias gl="git log --oneline --abbrev-commit --all --graph --decorate --color --pretty=format:'%C(yellow)%h%Creset -%C(red)%d%Creset %s %C(dim green)(%cr)'"
# alias gs='git status -sb'
# alias lg='lazygit'

# alias v='nvim'
# alias vi='nvim'
# alias vim='nvim'
# alias vr='v ~/readme.md'
# alias vz='v ~/.zshrc'
#
# alias ld='exa -lDa --icons --sort name --git'
# alias ll='exa -la -F --icons --git --group-directories-first --git'
# alias lll='exa -la -F -s=mod -r --icons --git --group-directories-first --git'
#
# alias cp='cp -i -v'
# alias mv='mv -i -v'
# alias rm='rm -i -v'
#
# alias ..='cd ..'
# alias ...='cd ../..'
# alias ....='cd ../../..'
# alias .....='cd ../../../..'
# alias ......='cd ../../../../..'

alias fy='fzfyay'
alias fv='vim $(fz)'
alias fz='rg --files --hidden --follow --ignore-vcs -g "!{node_modules,.git}" | fzf'
# alias fy='yay -Slq | fzf -m --preview 'cat <(yay -Si {1}) <(yay -Fl {1} | awk "{print \$2}")' | xargs -ro  yay -S'
# fzfyay () {
#   yay -Slq | fzf -m --preview 'bat <(yay -Si {1}) <(yay -Fl {1} | awk "{print \$2}")' | xargs -ro  yay -S
# }

# HISTFILE=~/zsh-history
# HISTSIZE=10000
# SAVEHIST=10000
# HISTTIMEFORMAT="[%F %T] "
# alias hist='history -E'

# eval "$(starship init zsh)"

# export MANPAGER='nvim +Man!'
# export VISUAL=nvim
# export EDITOR=nvim

# export XDG_CURRENT_DESKTOP=Hyprland

[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh
source /home/jjaime/.config/broot/launcher/bash/br
# source /home/jjaime/.config/zsh/zsh-aliases
source $ZDOTDIR/zsh-aliases
source $ZDOTDIR/zsh-functions


