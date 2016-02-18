# .bash_profile

# Bash Profile by tanyuan
# ======================
#  _
# | |_ __ _ _ __  _   _ _   _  __ _ _ __
# | __/ _` | '_ \| | | | | | |/ _` | '_ \
# | || (_| | | | | |_| | |_| | (_| | | | |
#  \__\__,_|_| |_|\__, |\__,_|\__,_|_| |_|
#                 |___/

art() {
    # Set terminal font color
    tput setaf 3
    # Put ASCII art inside EOT
    cat <<"EOT"
      ________  _____    ___    ____ 
     / ____/  |/  / /   /   |  / __ )
    / /   / /|_/ / /   / /| | / __  |
   / /___/ /  / / /___/ ___ |/ /_/ / 
   \____/_/  /_/_____/_/  |_/_____/  

EOT
}

# Only if not in TMUX
if [ -z "$TMUX" ]; then
    # Show the above ASCII art
    art
fi

# Source .bashrc at SSH login
if [ -f ~/.bashrc ]; then
  . ~/.bashrc
fi
