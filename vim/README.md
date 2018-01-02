vim by tanyuan
=====

Setup
-----
Must create these directories before use (specified in .vimrc):

      mkdir ~/.vim/swap ~/.vim/undo

.vimrc
-----

* Single tap for commands: `;` triggers `:`.
* Single tap for the register: `'` triggers `"`.
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
Plugins are managed through [vim-plug](https://github.com/junegunn/vim-plug) (see last part of .vimrc).

Run `:PlugInstall` to install plugins at `.vim/plugged/`.

* [The NERD Commenter](https://github.com/scrooloose/nerdcommenter) - Add comment shortcuts
  * Usage: Toggle comment `<leader>c<space>`
* [sleuth.vim](https://github.com/tpope/vim-sleuth) - Automatically detect and change indent settings
* [vim-gitgutter](https://github.com/airblade/vim-gitgutter) - Shows git diff in the sign column
