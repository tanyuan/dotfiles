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
# > user@machine: directory $
PS1='\[\e[0;36m\]> \u@\h: \W $\[\e[m\] '

# Update terminal emulator window title
if [[ $TERM == xterm* ]]; then
    # This puts "user@host:workdir" into the titlebar.
    # (look for section "PROMPTING" in bash's manual)
    title='\u@\h:\w'
    PS1+="\[\e]0;$title\007\]"
fi

# Set default editor
EDITOR=vim

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
