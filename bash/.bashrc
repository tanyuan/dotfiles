# .bashrc

# Bash Config by tanyuan
# ======================
#  _
# | |_ __ _ _ __  _   _ _   _  __ _ _ __
# | __/ _` | '_ \| | | | | | |/ _` | '_ \
# | || (_| | | | | |_| | |_| | (_| | | | |
#  \__\__,_|_| |_|\__, |\__,_|\__,_|_| |_|
#                 |___/

# Show git branch in prompt
source /usr/share/git/completion/git-prompt.sh
# Git command completion
source /usr/share/git/completion/git-completion.bash

# Custom Command Prompt
# Get git dirty and stash information to use in prompt
function git_dirty {
  [[ $(git status 2> /dev/null | tail -n1) != "nothing to commit, working directory clean" ]] && echo "*"
}
function git_stash {
  [[ $(git stash list 2> /dev/null | tail -n1) != "" ]] && echo "^"
}
# [user directory (git-branch) ]#
#PS1='\[\e[1;31m\][\u\[\e[m\] \[\e[0;36m\]\[\e[3m\]\W\[\e[23m\]\[\e[m\]\[\e[1;32m\]$(__git_ps1 " (%s)")\[\e[m\] \[\e[1;31m\]]#\[\e[m\] '
# > directory (git-branch*^)$
PS1='\[\e[0;32m\]> \w $(__git_ps1 "(%s$(git_dirty)$(git_stash))")$\[\e[m\] '
# Trim prompt directory to 2 levels
PROMPT_DIRTRIM=2

# Ruby bin path
PATH=$PATH:~/.gem/ruby/2.3.0/bin

# Default editor
export EDITOR=vim
export VISUAL=vim

# GCC 5.2 color
GCC_COLORS='error=01;31:warning=01;35:note=01;36:caret=01;32:locus=01:quote=01'

# Open terminal new tab/window in the same directory
. /etc/profile.d/vte.sh

# Enable fuzzy finder fzf
. /etc/profile.d/fzf.bash

# Enable Autojump
source /etc/profile.d/autojump.sh

# Enable thefuck
eval $(thefuck --alias)

# Update window size after every command
shopt -s checkwinsize

# History options

# Append history instead of rewriting it
shopt -s histappend
# Store history immediately rather than session ends
PROMPT_COMMAND='history -a'
# Ignore duplicates and commands start with space
HISTCONTROL=ignoreboth
# Ignore specific commands
HISTIGNORE='ls:l:ll:f:bg:fg:history'
# Larger history file
HISTFILESIZE=100000
HISTSIZE=100000

# Basic aliases

# ls: show colors and symbols
alias l='ls -F --color=auto'
# ls: show details with hidden files
alias ll='ls -alh'
# Ask before remove (disable by -f force)
# use `trash` (trach-cl) instead to move to trash can
alias rm='rm -i'
# Run last command again with sudo
alias please='sudo `fc -ln -1`'

# Add custom bash aliases at ~/.bash_aliases
if [ -f ~/.bash_aliases ]; then
    source ~/.bash_aliases
fi
