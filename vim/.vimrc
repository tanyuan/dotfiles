" .vimrc

" Vim Config by tanyuan
" =====================
"  _
" | |_ __ _ _ __  _   _ _   _  __ _ _ __
" | __/ _` | '_ \| | | | | | |/ _` | '_ \
" | || (_| | | | | |_| | |_| | (_| | | | |
"  \__\__,_|_| |_|\__, |\__,_|\__,_|_| |_|
"                 |___/

" PLUGIN MANAGER
" vim-plug (.vim/autoload/plug..vim)
" Run :PlugInstall to install plugins
call plug#begin()

" The NERD Commenter: Add comment shortcuts
" Usage: Toggle comment <leader>c<space>
Plug 'scrooloose/nerdcommenter'
" sleuth.vim: Automatically detect and change indent settings
Plug 'tpope/vim-sleuth'
" vim-gitgutter: Shows git diff in the sign column
Plug 'airblade/vim-gitgutter'
" NERD Tree: Show file tree sidebar. Only load when first first invocation of NERDTreeToggle command
Plug 'scrooloose/nerdtree', { 'on': 'NERDTreeToggle' }

" language specific
Plug 'JuliaEditorSupport/julia-vim'

call plug#end()

" PLUGIN KEY MAPPINGS
" NERD Tree
nmap <C-n> :NERDTreeToggle<CR>

" CONFIGS

" Turn on syntax highlighting
syntax on

" Show the keystrokes being entered in the screen
set showcmd

" Show line numbers
set number

" Enable switching buffers with unsaved changes
set hidden

" Use mouse to scroll and select
set mouse=a

" Sync to system clipboard
if has("unix")
  let s:uname = system("uname -s")
  if s:uname == "Darwin\n"
    " For Mac
    set clipboard=unnamed
  else
    " For Linux X windows (install vim-gtk)
    set clipboard=unnamedplus
  endif
endif

" Where to store swap (.swp) files, rather than beside the file
" // will save the full path name to ensure uniqueness
set directory=~/.vim/swap//
" Save undo history after file closed
set undofile
" Where to store undo history, rather than beside the file
set undodir=~/.vim/undo//

" Read tags from file 'tags' and search all the way to root
set tags+=tags;/

" Solve Backspace not working
set backspace=2
" Set smart line break: not to break words
set linebreak
" Smart wrapping according to indentation 
" Does not work on Mac
" set breakindent
" Show last line of the text instead of @
set display+=lastline

" Indentation
set autoindent " Auto indention based on the line above
set expandtab " Use spaces instead of tabs
set tabstop=4 " Number of spaces inserted when tab is pressed
set shiftwidth=4 " Number of spaces for indentation
set softtabstop=4 " Makes backspace treat 4 spaces like a tab 

" ABOUT KEY MAPPING
" `nore` means no recursive
" always use nnoremap instead of nmap

" Map Enter to Esc
" Use `C-j` to enter a newline or `o` to open new line
"inoremap <CR> <Esc>

" Single tap to trigger command-line
nnoremap ; :
vnoremap ; :

" Don't use arrow keys.
" Move cursor by display lines when wrapping
nnoremap j gj
nnoremap k gk
vnoremap j gj
vnoremap k gk

" Use [[ ]] to go to previous/next function in C/C++
"   with brackets {} not starting at first column
map [[ ?{<CR>w99[{
map ][ /}<CR>b99]}
map ]] j0[[%/{<CR>
map [] k$][%?}<CR>

" CTRL KEY
" Caps Lock is mapped to Ctrl in OS

" Use Ctrl+hjkl to switch windows
map <C-h> <C-w>h
map <C-j> <C-w>j
map <C-k> <C-w>k
map <C-l> <C-w>l

" CUSTOMIZATION KEY
" Some keys left for remapping: , \ Space

" Switch to next buffer
nmap \ :bn<CR>
" Toggle relative line number for fast jumping
nmap , :set relativenumber!<CR>

" LEADER KEY
" This is where we can map any key we like without worrying conflicts with Vim's default

" Map Space to Leader
let mapleader=" "
" Reload Vim config
nmap <Leader>r :source ~/.vimrc<CR>
" Quick save
nmap <Leader>w :w<CR>
" Quick quit
nmap <Leader>q :q<CR>
" Toggle Tab/Space
nmap <Leader>t :set expandtab!<CR>
" Toggle highlight search
nmap <Leader>s :set hlsearch!<CR>
" Toggle spelling check
nmap <Leader>s :set spell!<CR>
" Horizontal split
nmap <Leader>- :sp<CR>
" Vertical split
nmap <Leader>\ :vs<CR>
" Put in new line
nmap <Leader>p o<Esc>p
" Enter new line with additional blank line below
nmap <Leader><CR> o<Esc>O
" Move lines up and down
nnoremap <Leader>j :m .+1<CR>==
nnoremap <Leader>k :m .-2<CR>==
vnoremap <Leader>j :m '>+1<CR>gv=gv
vnoremap <Leader>k :m '<-2<CR>gv=gv

" Remember last cursor position
augroup resCur
  autocmd!
  autocmd BufReadPost * call setpos(".", getpos("'\""))
augroup END

" Save current view settings on a per-window, per-buffer basis.
function! AutoSaveWinView()
    if !exists("w:SavedBufView")
        let w:SavedBufView = {}
    endif
    let w:SavedBufView[bufnr("%")] = winsaveview()
endfunction

" Restore current view settings.
function! AutoRestoreWinView()
    let buf = bufnr("%")
    if exists("w:SavedBufView") && has_key(w:SavedBufView, buf)
        let v = winsaveview()
        let atStartOfFile = v.lnum == 1 && v.col == 0
        if atStartOfFile && !&diff
            call winrestview(w:SavedBufView[buf])
        endif
        unlet w:SavedBufView[buf]
    endif
endfunction

" When switching buffers, preserve window view.
if v:version >= 700
    autocmd BufLeave * call AutoSaveWinView()
    autocmd BufEnter * call AutoRestoreWinView()
endif

" iTerm on Mac
if $TERM_PROGRAM =~ "iTerm"
  " Set the title of the Terminal to the currently open file
  function! SetTerminalTitle()
      let titleString = expand('%:t')
      if len(titleString) > 0
          let &titlestring = expand('%:t')
          " this is the format iTerm2 expects when setting the window title
          let args = "\033]1;📄".&titlestring."\007"
          let cmd = 'silent !echo -e "'.args.'"'
          execute cmd
          redraw!
      endif
  endfunction
  autocmd BufEnter * call SetTerminalTitle()

  " Change cursor shape according to mode
  let &t_SI = "\<Esc>]50;CursorShape=1\x7" " Vertical bar in insert mode
  let &t_EI = "\<Esc>]50;CursorShape=0\x7" " Block in normal mode
  let &t_SR = "\<esc>]50;CursorShape=2\x7" " Underline in replace mode
endif
