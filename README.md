# dotfiles

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

1. **Bash**: `~/.bashrc` with personal aliases in `~/.bash_aliases`. Use `bash-*` for machine specific configs.
2. **Git**: Create `~/.gitconfig`.
3. **Tmux**: `~/.tmux.conf`.
4. **Vim**: `~/.vimrc`, `~/.vim/` needs to have `~/.vim/swap/` and `~/.vim/undo/`.
5. **Emacs**: `~/.emacs.d/` needs to have `~/.emacs.d/backup/`.
6. **Ranger**: `~/.config/ranger/`.
7. **Fish**: `~/.config/fish/`. Add `exec fish` at the end of `.bash_aliases` to use fish shell.

## How to deploy

Dotfiles are managed using **GNU Stow**. [How to use GNU Stow](https://gist.github.com/tanyuan/d8ac86407893699e0d2b).

Install one directory at a time:

```
cd ~/dotfiles

stow bash
```
