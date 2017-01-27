set nocompatible
"curl -fLo ~/.vim/autoload/plug.vim --create-dirs \
"    https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
filetype plugin indent on
call plug#begin('~/.vim/plugged')
"Plug 'vim-perl/vim-perl', { 'for': 'perl', 'do': 
"\ 'make clean carp dancer highlight-all-pragmas moose test-more try-tiny' }

Plug 'WolfgangMehner/vim-plugins'

Plug 'Valloric/YouCompleteMe'

Plug 'Scrooloose/nerdcommenter'

Plug 'Othree/eregex.vim'

Plug 'Tpope/vim-rails'

"Plug 'ervandew/supertab'
call plug#end()
let g:Perl_PerlTags = 'on'
"let g:Perl_InsertFileHeader = 'no'

let g:ycm_complete_in_comments = 1
let g:ycm_collect_identifiers_from_tags_files = 1
let g:ycm_collect_identifiers_from_comments_and_strings = 1
let g:ycm_seed_identifiers_with_syntax = 1 

let g:eregex_default_enable = 0

iabbrev #i #include
set guifont=Liberation\ Mono\ 18
set virtualedit=block,onemore
set foldmethod=syntax
set foldlevelstart=5
set wildmenu
set sessionoptions=buffers
set showtabline=2
set number
set tabstop=4
set shiftwidth=4
set startofline
"nnoremap ? ?\c
"set ignorecase
set noruler
set showcmd
set incsearch
set wrapscan
"if &term=~'linux'
if &term=~'xterm'
    set termguicolors
endif

try
    colorscheme my
    set colorcolumn=80
catch /^Vim\%((\a\+)\)\=:E185/
    colorscheme default
endtry
"set clipboard=unnamedplus
"set mp=./run.sh
syntax on
"filetype plugin on
"filetype indent on
    "ab #i #include
"echo ">^.^<"
"set autowrite

"disable position information	

"packadd! matchit

" save position
autocmd BufReadPost * if line("'\"") > 1 && line("'\"") <= line("$") |
\ exe "normal! g'\"" | endif

autocmd Filetype ruby setlocal tabstop=2 | setlocal shiftwidth=2
autocmd BufReadPost *.erb setlocal tabstop=2 | setlocal shiftwidth=2

set clipboard+=unnamedplus
set mouse=a
map <S-Insert> <MiddleMouse>
map! <S-Insert> <MiddleMouse>
set noswapfile
"set nowrap
"set matchtime=3
set expandtab
"set autoindent
"function! InsertTabWrapper(direction)
"    let col = col('.') - 1
"    if !col || getline('.')[col - 1] !~ '\k'
"        return "\<tab>"
"    elseif "backward" == a:direction
"        return "\<c-p>"
"    else
"        return "\<c-n>"
"    endif
" endfunction
set smartindent 

"let g:Perl_MapLeader  = ','

"set hlsearch
"set ignorecase

"nnoremap <cr> <c-e>
"inoremap" <esc> <nop>

"augroup script_type
"    au!
"    autocmd FileType python nnoremap <buffer> <localleader>c d0i#<esc>
"    autocmd FileType perl nnoremap <buffer> <localleader>c d0i#<esc>
"    autocmd FileType bash nnoremap <buffer> <localleader>c d0i#<esc>
"augroup END
"augroup filetype_cpp
"    au!
"    autocmd FileType cpp nnoremap <buffer> <localleader>c d0i//<esc>
"    autocmd FileType cpp :iabbrev <buffer> if if () {<cr><cr>}<up><up><right><right>
"augroup END

inoremap jk <esc>

"inoremap <tab> <c-r>=InsertTabWrapper ("forward")<cr>
"inoremap <s-tab> <c-r>=InsertTabWrapper ("backward")<cr>


"Перемещение
":map <down> <C-E> <S-M>|:map <up> <C-Y> <S-M>
":map <down> j | :map <up> k
imap <A-down> <Esc> <C-E> <S-M>
map <A-down> <C-E> <S-M>
imap <A-up> <Esc> <C-Y> <S-M>
map <A-up> <C-Y> <S-M>

"Работа с вкладками
"imap <c-n> <Esc>:tabnew<CR>
"map <c-n> <Esc>:tabnew<CR>
"imap <c-o> <Esc>:browse tabnew<CR>
ca mop browse tabnew
map <A-o> <Esc>:browse tabnew<CR>
nmap <c-o> <Esc>:browse tabnew<CR>
imap <A-left> <Esc> :tabprev <CR>
map <A-left> :tabprev <CR>
"imap <A-h> <Esc> :tabprev <CR>i
"map <A-h> :tabprev <CR>
imap <A-right> <Esc> :tabnext <CR>
map <A-right> :tabnext <CR>
"imap <a-l> <Esc> :tabnext <CR>i
"map <a-l> :tabnext <CR>

"let mapleader = "-"
"let maplocalleader = ","
"nnoremap <leader>ev :vsplit $MYVIMRC<cr>
"nnoremap <leader>sv :source $MYVIMRC<cr>
"nnoremap <leader>" viw<esc>a"<esc>hbi"<esc>lel
"inoremap <c-e> <esc>$a
"inoremap <c-a> <esc>^i
"nnoremap <c-e> $a
"nnoremap <c-a> ^i

"Сдвиг по tab"
"nnoremap <Tab> >>_
nnoremap <S-Tab> <c-O>
"inoremap <S-Tab> <C-D>
"vnoremap <Tab> >gv
"vnoremap <S-Tab> <gv

"Начало <Скомпилировать (F9)>
    nmap <F9> :make<cr>
    vmap <F9> <esc>:make<cr>
    imap <F9> <esc>:make<cr>a
"Конец

"Начало <Сохранить>
    imap <c-s> <Esc> :w! <CR>
    map <c-s> :w! <CR>
    imap <F5> <esc>:w!<cr>a
    nmap <F5> :w!<cr>
    vmap <F5> <esc>:w!<cr>
"Конец

"Начало <Выйти из редактора без сохранения>
    imap <c-q> <Esc> :qa! <CR>i
    map <c-q> :qa! <CR>
    nmap <F10> :q!<cr>
    vmap <F10> <esc>:q!<cr>
    imap <F10> <esc>:q!<cr>
"Конец
