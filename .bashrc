# .bashrc

# Bash Config by tanyuan
# ======================
#  _
# | |_ __ _ _ __  _   _ _   _  __ _ _ __
# | __/ _` | '_ \| | | | | | |/ _` | '_ \
# | || (_| | | | | |_| | |_| | (_| | | | |
#  \__\__,_|_| |_|\__, |\__,_|\__,_|_| |_|
#                 |___/

# Custom Command Prompt
# Get git branch information (cross machine)
# Show * if dirty
function git_dirty {
    [[ $(git status 2> /dev/null | tail -n1) != "nothing to commit, working directory clean" ]] && echo "*"
}
# Show ^ if stash
function git_stash {
    [[ $(git stash list 2> /dev/null | tail -n1) != "" ]] && echo "^"
}
# Combine with git branch name
function git_branch {
    git branch --no-color 2> /dev/null | sed -e '/^[^*]/d' -e "s/* \(.*\)/\1$(git_dirty)$(git_stash)/"
}
# > user@machine: directory (branch*^)$
PS1='\[\e[0;36m\]> \u@\h: \w ($(git_branch))$\[\e[m\] '
# Trim prompt directory to 3 levels
PROMPT_DIRTRIM=3

# Update terminal emulator window title
if [[ $TERM == xterm* ]]; then
    # This puts "user@host:workdir" into the titlebar.
    # (look for section "PROMPTING" in bash's manual)
    title='\u@\h:\w'
    PS1+="\[\e]0;$title\007\]"
fi

# Set default editor
export EDITOR=vim
export VISUAL=vim

# User directory installs
PATH=$PATH:~/bin/

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
alias ls='ls -F --color=auto'
# ls: shortcut
alias l='ls'
# ls: show details with hidden files
alias ll='ls -alh'
# Ask before remove (disable by -f force)
# use `trash` (trach-cl) instead to move to trash can
alias rm='rm -i'
# grep: turn on color and line number
alias grep='grep --color=auto -n'
# Run last command again with sudo
alias please='sudo `fc -ln -1`'

# Add custom bash aliases at ~/.bash_aliases
if [ -f ~/.bash_aliases ]; then
    source ~/.bash_aliases
fi
