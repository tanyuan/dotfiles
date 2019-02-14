# ~/.bashrc

# Bash Config by tanyuan
# ======================
#  _
# | |_ __ _ _ __  _   _ _   _  __ _ _ __
# | __/ _` | '_ \| | | | | | |/ _` | '_ \
# | || (_| | | | | |_| | |_| | (_| | | | |
#  \__\__,_|_| |_|\__, |\__,_|\__,_|_| |_|
#                 |___/

# Add custom shell scripts
PATH=~/bin:$PATH

# Default editor
export EDITOR=vim
export VISUAL=vim

# Set UI language for commanline programs
export LANG="en_US.UTF-8"
# Set locale for SSH
export LC_CTYPE="en_US.UTF-8"

# GCC 5.2 color
GCC_COLORS='error=01;31:warning=01;35:note=01;36:caret=01;32:locus=01:quote=01'

# History options

# Append history instead of rewriting it
shopt -s histappend
# Ignore duplicates and commands start with space
HISTCONTROL=ignoreboth
# Larger history file
HISTFILESIZE=2000
HISTSIZE=1000

# Basic aliases

# Color commands
alias grep='grep --color=auto'
alias fgrep='fgrep --color=auto'
alias egrep='egrep --color=auto'
if [[ "$OSTYPE" == "linux-gnu" ]]; then
    # Linux Only
    alias ls='ls --color=auto'
elif [[ "$OSTYPE" == "darwin"* ]]; then
    # Mac OS Only
    alias ls='ls -G'
fi

# List aliases
alias ll='ls -alhF'
alias la='ls -AF'
alias l='ls -CF'

# Ask before remove (disable by -f force)
# use `trash` (install trach-cli) instead to move to trash can
alias rm='rm -i'
# Run last command again with sudo
alias please='sudo `fc -ln -1`'
# vim
alias vi='vim'
# grep: show line number
alias grep='grep -n'
# tree: show color and symbols
alias tree='tree -CF'
# watch: show color
alias watch='watch -c'
# gcc: show color highlighting
alias gcc='gcc -fdiagnostics-color'

# Go to desktop
alias d='cd ~/Desktop'

# Bash Prompt
if [ -f ~/.bash_prompt ]; then
    source ~/.bash_prompt
fi
