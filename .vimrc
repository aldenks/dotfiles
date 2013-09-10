" VIMRC pieces picked from multiple sources, including
" "   http://www.vim.org/scripts/script.php?script_id=760
" "   http://amix.dk/vim/vimrc.html
" "   http://stackoverflow.com/questions/164847/what-is-in-your-vimrc

" ********************
" Behavior & Misc Settings
" ********************

" Automatically cd into the directory that the file is in
set autochdir

" Remove any trailing whitespace that is in the file
autocmd BufRead,BufWrite * if ! &bin | silent! %s/\s\+$//ge | endif

":make runs this script!
set makeprg=./compile

" Necessary for a lot of cool vim things
set nocompatible

" wrap lines
set wrap

" read a file when it is changed from the outside
set autoread

" Use grep
set grepprg=grep\ -nH\ $*

" Spell checking (default=false)
if version >= 700
    set spl=en spell
    set nospell
endif

" Tab completion
set wildmenu
set wildmode=list:longest,full

" Enable ball and chain er... mouse support in console
set mouse=a

set backspace=2

" Case handling
set ignorecase
set smartcase

" Incremental search
set incsearch
set hlsearch
set nolazyredraw

" For linux clipboard register
let g:clipbrdDefaultReg = '+'

set exrc    " enable per-directory .vimrc files
set secure  " disable unsafe commands in local .vimrc files

" No sound on errors
set noerrorbells
set visualbell  " set visualbell,
set t_vb=       " then set it to do nothing

set tm=500

" Persistant Undo
    "if windows
      "set undodir=C:\Windows\Temp
    "otherwise
    if version >720
        set undodir=~/.vim_runtime/undodir
        set undofile
    endif

set encoding=utf8

try
    lang en_US
catch
endtry

set ffs=unix,dos,mac "Default file types

" ******************
"   Plugins
" ******************

" Pathogen  https://github.com/tpope/vim-pathogen
execute pathogen#infect()

" Syntastic syntax checker
" When on, :lnext and :lprev always work when there are errors
" If off, use :Errors to populate location list
let g:syntastic_always_populate_loc_list = 1

" ******************
"   Formatting
" ******************

" AutoIndent
set autoindent

" Change spaces to a tab character
set smartindent
set tabstop=2
set shiftwidth=2
set expandtab

" ******************
"   Display
" ******************

" Syntax Higlighting
syntax enable
filetype on
filetype plugin on
filetype indent on

" Always show line numbers and current position
set ruler
set number

" Second paren
highlight MatchParen ctermbg=4

" Set font according to system
" if you're using a mac
  set gfn=Menlo:h11
  set shell=/bin/bash

" if you're using windows
  "set gfn=Bitstream\ Vera\ Sans\ Mono:h10

" if you're using linux
"  set gfn=Monospace\ 10
"  set shell=/bin/bash

set guioptions-=T
set t_Co=256
set background=dark
colorscheme peaksea

"Status line gnarliness
set laststatus=2
set statusline=\ %{HasPaste()}%F%m%r%h\ %w\ \ CWD:\ %r%{CurDir()}%h\ \ \ Line:\ %l/%L:%c
function! CurDir()
    return getcwd()
endfunction
function! HasPaste()
    if &paste
        return 'PASTE MODE  '
    else
        return ''
    endif
endfunction

" *******************
"  Functions
" *******************

"{{{ Open URL in Browser

function! Browser()
    let line = getline (".")
    let line = matchstr (line,"http[^  ]*")
    exec "!chrome ".line
endfunction

" ******************
"   Mappings
" ******************

" Set leader to comma
let mapleader = ","

" Open Url with the browser \w
map <Leader>w :call Browser ()<CR>

" Trigger the above todo mode
noremap <silent> <Leader>todo :execute TodoListMode()<CR>

" Next Tab
noremap <silent> <C-Right> :tabnext<CR>
" Previous Tab
noremap <silent> <C-Left> :tabprevious<CR>
" New Tab
noremap <silent> <C-t> :tabnew<CR>

" Centers the next result on the page
map N Nzz
map n nzz

" Swap ; and : (one less keypress)
nnoremap ; :
nnoremap : ;

" resize current buffer by +/- 5
nnoremap <C-S-left> :vertical resize -5<cr>
nnoremap <C-S-down> :resize +5<cr>
nnoremap <C-S-up> :resize -5<cr>
nnoremap <C-S-right> :vertical resize +5<cr>

" switch between windows with Cmd-[H,J,K,L]
noremap <C-h> <C-w>h
noremap <C-j> <C-w>j
noremap <C-k> <C-w>k
noremap <C-l> <C-w>l

" ********************
"  Language Specific
" ********************

" Processing (visual java library) syntax highlighting and sketch runing
au BufRead,BufNewFile *.pde     setf processing
:command! P :! processing-java --sketch=$PWD/ --output=temp --run --force

" Complete CSS
autocmd FileType css set omnifunc=csscomplete#CompleteCSS
