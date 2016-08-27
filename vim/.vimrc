" .vimrc

" Vim Config by tanyuan
" =====================
" http://github.com/tanyuan/vim-config
"  _
" | |_ __ _ _ __  _   _ _   _  __ _ _ __
" | __/ _` | '_ \| | | | | | |/ _` | '_ \
" | || (_| | | | | |_| | |_| | (_| | | | |
"  \__\__,_|_| |_|\__, |\__,_|\__,_|_| |_|
"                 |___/

" Load plugins
filetype plugin on

" Turn on syntax highlighting
syntax on

" Use color scheme from ~/.vim/color/
colorscheme monochrome

" Show the keystrokes being entered in the screen
set showcmd

" Show line numbers
set number

" Set status line with vim-fugitive plugin to show git branch
" Status line won't show up if only one window
set statusline=%<%f\ %{fugitive#statusline()}\ %h%m%r%=%-14.(%l,%c%V%)\ %P

" Enable switching buffers with unsaved changes
set hidden

" Use mouse to scroll and select
set mouse=a

" Sync to system clipboard
set clipboard=unnamed

" Where to store swap (.swp) files, rather than beside the file
" // will save the full path name to ensure uniqueness
set directory=~/.vim/swap//
" Save undo history after file closed
set undofile
" Where to store undo history, rather than beside the file
set undodir=~/.vim/undo//

" Read tags from file 'tags' and search all the way to root
set tags+=tags;/

" Set smart line break: not to break words
set linebreak
" Smart wrapping according to indentation 
" Does not work on Mac
"set breakindent

" Indentation
set autoindent " Auto indention based on the line above
set expandtab " Use spaces instead of tabs
set tabstop=4 " Number of spaces inserted when tab is pressed
set shiftwidth=4 " Number of spaces for indentation
set softtabstop=4 " Makes backspace treat 4 spaces like a tab 

" ABOUT KEY MAPPING
" `nore` means no recursive
" always use nnoremap instead of nmap

" Single tap to trigger command-line
nnoremap ; :
vnoremap ; :
" Single tap to trigger register
nnoremap ' "

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
" Toggle comment by Ctrl-/
map <C-_> <plug>NERDCommenterToggle
" Crtl-\ is mapped to plugin closetag.vim by me to solve conflict (default C-_)

" CUSTOMIZATION KEY
" Some keys left for remapping: , \ Space

" Switch to next buffer
nmap \ :bn<CR>
" Toggle relative line number for fast jumping
nmap , :set relativenumber!<CR>

" LEADER KEY
" This is where we can map any key we like without worrying conflicts with Vim's default
" Leader c is used by plugin NERD Commenter
" Leader d is used by plugin DrawIt

" Map Space to Leader
let mapleader=" "
" Reload Vim config
nmap <Leader>r :source ~/.vimrc<CR>
" Quick save
nmap <Leader>w :w<CR>
" Quick quit
nmap <Leader>q :q<CR>
" Toggle Tab/Space by Ctrl+t
nmap <Leader>t :set expandtab!<CR>
" Toggle highlight search by Ctrl+h
nmap <Leader>s :set hlsearch!<CR>
" Horizontal split
nmap <Leader>h :sp<CR>
" Vertical split
nmap <Leader>v :vs<CR>
" Put in new line
nmap <Leader>p o<Esc>p
" Enter new line with additional blank line below
nmap <Leader><CR> o<Esc>O
" Move lines up and down
nnoremap <Leader>j :m .+1<CR>==
nnoremap <Leader>k :m .-2<CR>==
vnoremap <Leader>j :m '>+1<CR>gv=gv
vnoremap <Leader>k :m '<-2<CR>gv=gv
" Insert Bash script beginning
nmap <Leader>b :r ~/Templates/bash.sh<CR>ggdd

" fugitive git bindings
nnoremap <Leader>gs :Gstatus<CR>
nnoremap <Leader>gl :Glog<CR>
nnoremap <Leader>gc :Gcommit<CR>
nnoremap <Leader>gd :Gdiff<CR>
nnoremap <Leader>ge :Gedit<Space>
nnoremap <Leader>gr :Gread<CR>
nnoremap <Leader>gw :Gwrite<CR><CR>
nnoremap <Leader>gp :Ggrep<Space>
nnoremap <Leader>gm :Gmove<Space>
nnoremap <Leader>gb :Git branch<Space>
nnoremap <Leader>go :Git checkout<Space>
nnoremap <Leader>gps :Dispatch! git push<CR>
nnoremap <Leader>gpl :Dispatch! git pull<CR>

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

" For the most accurate highlighting (for mixed code in HTML) but slowest
autocmd BufEnter * :syntax sync fromstart

" MARKDOWN
" Use GitHub-flavored Markdown syntax highlighting by default for .md files
augroup markdown
    au!
    au BufNewFile,BufRead *.md,*.markdown setlocal filetype=ghmarkdown
augroup END
" Use 2 space indent 
autocmd FileType ghmarkdown setlocal shiftwidth=2 tabstop=2 softtabstop=2
" Markdown auto folding by headers
function! MarkdownLevel()
    let h = matchstr(getline(v:lnum), '^#\+')
        if empty(h)
            return "="
        else
            return ">" . len(h)
        endif
endfunction
au BufEnter *.md setlocal foldexpr=MarkdownLevel()  
au BufEnter *.md setlocal foldmethod=expr 
" Expand folds when open files 
au BufEnter *.md setlocal foldlevel=20
