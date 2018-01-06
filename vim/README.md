vim by tanyuan
=====

All configuration in [.vimrc](.vimrc).

Setup
-----
Must create these directories before use (specified in .vimrc):

      mkdir ~/.vim/swap ~/.vim/undo

.vimrc
-----

* Single tap for commands: `;` triggers `:`.
* `Space` as leader.
  * `<leader>w` to write.
  * `<leader>q` to quit.
  * `<leader>v` to vertical split.
  * `<leader>h` to horizontal split.
  * `<leader>p` to paste in new line.
  * `<leader>s` to toggle search highlight.
  * `<leader>t` to toggle Tab/Space indentation.
  * `<leader>Enter` to insert a new line below.
  * `<leader>j` `<leader>k` to move lines up and down.
* `ctrl` + `hjkl` to move between split windows.
* `\` to switch buffers.
* `,` to toggle relative line number.

Plugins
-----
Plugins are managed through [vim-plug](https://github.com/junegunn/vim-plug) in [.vim/autoload/plug.vim](.vim/autoload/plug.vim). See plugins at [.vimrc](.vimrc).

Run `:PlugInstall` to install plugins at `.vim/plugged/`.

* [The NERD Commenter](https://github.com/scrooloose/nerdcommenter) - Add comment shortcuts.
  * Usage: Toggle comment `<leader>c<space>`
* [sleuth.vim](https://github.com/tpope/vim-sleuth) - Automatically detect and change indent settings in current file.
* [vim-gitgutter](https://github.com/airblade/vim-gitgutter) - Shows git diff in the sign column.
* [ctrlp.vim](https://github.com/ctrlpvim/ctrlp.vim) - Open other files using fuzzy finder.
  * Usage: `ctrl-p` to open the finder.
* [NERD Tree](https://github.com/airblade/scrooloose/nerdtree) (On-demand loading) - Show file tree sidebar.
  * Usage: `ctrl-n` is mapped in .vimrc to load.

Cheatsheet
-----
Some vim built-in usages:

* Autocomplete: `ctrl-p` `ctrl-n`
* Move to last cursor position: `''` or `ctrl-i` `ctrl-o`
