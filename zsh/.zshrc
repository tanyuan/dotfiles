PROMPT='%F{green}$%f'

setopt HIST_FIND_NO_DUPS

autoload -Uz compinit promptinit
compinit
promptinit

# List aliases
alias ll='ls -alhGF'
alias la='ls -AGF'
alias l='ls -CGF'

alias d='cd ~/Desktop'
alias D='cd ~/Downloads'
alias ..='cd ..'

setopt HIST_IGNORE_SPACE

[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh
