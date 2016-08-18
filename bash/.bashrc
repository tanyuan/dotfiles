# ~/.bashrc

# Bash Config by tanyuan
# ======================
#  _
# | |_ __ _ _ __  _   _ _   _  __ _ _ __
# | __/ _` | '_ \| | | | | | |/ _` | '_ \
# | || (_| | | | | |_| | |_| | (_| | | | |
#  \__\__,_|_| |_|\__, |\__,_|\__,_|_| |_|
#                 |___/

# Custom Command Prompt
# Get git dirty and stash information to use in prompt
function git_dirty {
  [[ $(git status 2> /dev/null | tail -n1) != "nothing to commit"* ]] && echo "*"
}
function git_stash {
  [[ $(git stash list 2> /dev/null | tail -n1) != "" ]] && echo "^"
}

if [[ "$OSTYPE" == "linux-gnu" ]]; then
    # Linux Only
    # Show git branch in prompt
    source /usr/share/git/completion/git-prompt.sh
    # Git command completion
    source /usr/share/git/completion/git-completion.bash
    # > directory (git-branch*^)$
    PS1='\[\e[0;32m\]> \w $(__git_ps1 "(%s$(git_dirty)$(git_stash))")$\[\e[m\] '
    # Trim prompt directory to 2 levels
    PROMPT_DIRTRIM=2
elif [[ "$OSTYPE" == "darwin"* ]]; then
    # Mac OS Only
    # Show git branch in prompt
    source /usr/local/git/contrib/completion/git-prompt.sh
    # Git command completion
    source /usr/local/git/contrib/completion/git-completion.bash
    # > directory (git-branch*^)$
    PS1='\[\e[0;32m\]> \W $(__git_ps1 "(%s$(git_dirty)$(git_stash))")$\[\e[m\] '
fi

# Default editor
export EDITOR=vim
export VISUAL=vim

# GCC 5.2 color
GCC_COLORS='error=01;31:warning=01;35:note=01;36:caret=01;32:locus=01:quote=01'

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

if [[ "$OSTYPE" == "linux-gnu" ]]; then
    # Linux Only
    shopt -s checkwinsize
    # Open terminal new tab/window in the same directory
    . /etc/profile.d/vte.sh
    # ls: show colors and symbols
    alias l='ls -F --color=auto'
elif [[ "$OSTYPE" == "darwin"* ]]; then
    # Mac OS Only
    # ls: show colors and symbols
    alias l='ls -FG'
fi

# ls: show details with hidden files
alias ll='ls -alh'
# Ask before remove (disable by -f force)
# use `trash` (trach-cl) instead to move to trash can
alias rm='rm -i'
# Run last command again with sudo
alias please='sudo `fc -ln -1`'
# grep: turn on color and line number
alias grep='grep --color=auto -n'
# pdfgrep: show page number 
alias pdfgrep='pdfgrep -n'
# tree: show color and symbols
alias tree='tree -CF'
# watch: show color
alias watch='watch -c'
# gcc: show color highlighting
alias gcc='gcc -fdiagnostics-color'

# Go to desktop
alias d='cd ~/Desktop'
# Go to Dropbox
alias D='cd ~/Dropbox'

# Add custom bash aliases at ~/.bash_aliases
if [ -f ~/.bash_aliases ]; then
    source ~/.bash_aliases
fi
