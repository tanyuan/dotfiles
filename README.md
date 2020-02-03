# dotfiles by tanyuan

```
 ________________________________________
/ The most beautiful things in the world \
| cannot be seen or touched, they are    |
\ felt with the heart.                   /
 ----------------------------------------
   \
    \              ....       
           ........    .      
          .            .      
         .             .      
.........              .......
..............................
```

0. **zsh**: `.zshrc`
1. **bash**: `~/.bashrc` and `bash-*` for machine specific configs
2. **git**: create `~/.gitconfig`
3. **vim**: `~/.vimrc`, `~/.vim/` needs to create `~/.vim/swap/` and `~/.vim/undo/`
4. **tmux**: `~/.tmux.conf`
5. **ranger**: `~/.config/ranger/`
6. **fish**: `~/.config/fish/` add `exec fish` at the end of `.bash_prompt`

## how to deploy

Dotfiles are managed using **GNU Stow**.

Install one directory at a time:

```
cd ~/dotfiles
stow bash
```

# how to add 

Just add a new directory and put files you want to be at home directory.
