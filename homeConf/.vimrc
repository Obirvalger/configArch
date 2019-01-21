set nocompatible

" curl -fLo ~/.vim/autoload/plug.vim --create-dirs \
   " https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
filetype plugin indent on
call plug#begin('~/.vim/plugged')
" Plug 'vim-perl/vim-perl', { 'for': 'perl', 'do':
" \ 'make clean carp dancer highlight-all-pragmas moose test-more try-tiny' }

" Plug 'WolfgangMehner/vim-plugins'
Plug 'lepture/vim-jinja'
Plug 'Valloric/YouCompleteMe'
Plug 'plasticboy/vim-markdown'
Plug 'rhysd/vim-crystal'
" Plug 'Scrooloose/nerdcommenter'
Plug 'tpope/vim-unimpaired'
Plug 'Othree/eregex.vim'
" Plug 'Tpope/vim-rails'
Plug 'scrooloose/syntastic'
" Plug 'alx741/yesod.vim'
" Plug 'pbrisbin/vim-syntax-shakespeare'
Plug 'fatih/vim-go'

" Plug 'scrooloose/nerdtree'
" Plug 'jistr/vim-nerdtree-tabs'
" Plug 'ervandew/supertab'
call plug#end()

" Trailing whitespaces
au InsertEnter * match ErrorMsg /\s\+\%#\@<!$/
" au InsertLeave * match ErrorMsg /\s\+$/
au BufWrite * match ErrorMsg /\s\+$/
au BufRead * match ErrorMsg /\s\+$/
nnoremap <Leader>rtw :%s/\s\+$//e<CR>
" nnoremap <Leader>ratw :%s/\s\+$//e<CR>

let g:vim_markdown_folding_disabled = 1

let g:NERDSpaceDelims = 1

let g:go_fmt_command = "goimports"

let g:Perl_PerlTags = 'on'
" let g:Perl_InsertFileHeader = 'no'

let g:go_highlight_trailing_whitespace_error=0

let g:ycm_complete_in_comments = 1
let g:ycm_collect_identifiers_from_tags_files = 1
let g:ycm_collect_identifiers_from_comments_and_strings = 1
let g:ycm_seed_identifiers_with_syntax = 1
let g:ycm_autoclose_preview_window_after_completion = 1

let g:eregex_default_enable = 0

set statusline+=%#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*

let g:syntastic_always_populate_loc_list = 1
" let g:syntastic_auto_loc_list = 1
let g:syntastic_check_on_open = 1
let g:syntastic_check_on_wq = 0
let g:syntastic_python_python_exec = '/usr/bin/python3'
let g:syntastic_python_checkers=['python3']

function! TogglePagerMode()
    if exists("s:pager_mode")
        unmap <Left>
        unmap <Right>
        unmap <Up>
        unmap <Down>
        unmap h
        unmap l
        unmap k
        unmap j
        unmap b
        unmap f
        unmap b
        unmap f
        unmap q
        unmap <space>
        set t_ve&
        set matchpairs&
        set number
        set showtabline=2
        set ruler
        set readonly&
        set nomodifiable&
        set showcmd
        set colorcolumn=80
        unlet s:pager_mode
    else
        nnoremap <Left> zh
        nnoremap <Right> zl
        nnoremap <Up> <C-y>
        nnoremap <Down> <C-e>
        nnoremap h zh
        nnoremap l zl
        nnoremap k <C-y>
        nnoremap j <C-e>
        nnoremap b <C-B>
        nnoremap f <C-F>
        nnoremap u <C-U>
        nnoremap d <C-D>
        nnoremap q :q! <CR>
        nnoremap <space> <C-F>
        set t_ve=
        set matchpairs=
        set nonumber
        set showtabline=1
        set noruler
        set readonly
        set nomodifiable
        set noshowcmd
        set colorcolumn=
        let s:pager_mode = 1
    endif
endfunction

iabbrev #i #include
set linebreak
set guifont=Liberation\ Mono\ 18
set virtualedit=block,onemore
" set foldmethod=syntax
" set foldlevelstart=5
set completeopt=menu
set nohls
set nobackup
set nowritebackup
set scrolloff=999
set wildmenu
set sessionoptions=buffers
set showtabline=2
set number
set tabstop=4
set shiftwidth=4
set startofline
" nnoremap ? ?\c
" set ignorecase
" set noruler
set showcmd
set incsearch
set wrapscan
" if &term=~'linux'

try
    set termguicolors
    let &t_8f = "\<Esc>[38;2;%lu;%lu;%lum"
    let &t_8b = "\<Esc>[48;2;%lu;%lu;%lum"
    catch /termgui/
endtry

try
    colorscheme my
    set colorcolumn=80
catch /^Vim\%((\a\+)\)\=:E185/
    colorscheme default
endtry
" set clipboard=unnamedplus
" set mp=./run.sh
syntax on
" filetype plugin on
" filetype indent on
    " ab #i #include
" echo ">^.^<"
" set autowrite

" disable position information

" packadd! matchit

" save position
autocmd BufReadPost * if line("'\"") > 1 && line("'\"") <= line("$") |
\ exe "normal! g'\"" | endif


autocmd Filetype scheme setlocal tabstop=2 | setlocal shiftwidth=2
autocmd Filetype ruby setlocal tabstop=2 | setlocal shiftwidth=2
autocmd Filetype yaml setlocal tabstop=2 | setlocal shiftwidth=2
autocmd Filetype crystal setlocal tabstop=2 | setlocal shiftwidth=2
autocmd Filetype make setlocal noexpandtab
autocmd Filetype crontab setlocal noexpandtab
autocmd BufRead *.recipe setlocal ft=sh | setlocal noexpandtab
autocmd VimLeave * set t_ve&


set clipboard+=unnamedplus
set mouse=a
map <S-Insert> <MiddleMouse>
map! <S-Insert> <MiddleMouse>
set noswapfile
" set nowrap
" set matchtime=3
set expandtab
" set autoindent
" function! InsertTabWrapper(direction)
   " let col = col('.') - 1
   " if !col || getline('.')[col - 1] !~ '\k'
       " return "\<tab>"
   " elseif "backward" == a:direction
       " return "\<c-p>"
   " else
       " return "\<c-n>"
   " endif
" endfunction
set smartindent

" let g:Perl_MapLeader  = ','

" set hlsearch
" set ignorecase

" nnoremap <cr> <c-e>
" inoremap" <esc> <nop>

" augroup script_type
   " au!
   " autocmd FileType python nnoremap <buffer> <localleader>c d0i#<esc>
   " autocmd FileType perl nnoremap <buffer> <localleader>c d0i#<esc>
   " autocmd FileType bash nnoremap <buffer> <localleader>c d0i#<esc>
" augroup END
" augroup filetype_cpp
   " au!
   " autocmd FileType cpp nnoremap <buffer> <localleader>c d0i//<esc>
   " autocmd FileType cpp :iabbrev <buffer> if if () {<cr><cr>}<up><up><right><right>
" augroup END

inoremap jk <esc>

" inoremap <tab> <c-r>=InsertTabWrapper ("forward")<cr>
" inoremap <s-tab> <c-r>=InsertTabWrapper ("backward")<cr>

map <Esc>[Z <s-tab>

" autoclose {
inoremap {<CR> {<CR>}<C-o>==<C-o>O

" Перемещение
" :map <down> <C-E> <S-M>|:map <up> <C-Y> <S-M>
" :map <down> j | :map <up> k
" imap <A-down> <Esc> <C-E> <S-M>
map <Esc>[1;3B <C-E> <S-M>
" imap <A-up> <Esc> <C-Y> <S-M>
map <Esc>[1;3A <C-Y> <S-M>

map <C-_> <plug>NERDCommenterInvert

" Работа с вкладками
" imap <c-n> <Esc>:tabnew<CR>
" map <c-n> <Esc>:tabnew<CR>
" imap <c-o> <Esc>:browse tabnew<CR>
ca mop browse tabnew
" map <A-o> <Esc>:browse tabnew<CR>
nmap <c-o> <Esc>:browse tabnew<CR>
" imap <A-left> <Esc> :tabprev <CR>
" map <A-left> :tabprev <CR>
map <Esc>[1;3D :tabprev <CR>
" imap <A-h> <Esc> :tabprev <CR>i
" map <A-h> :tabprev <CR>
" imap <A-right> <Esc> :tabnext <CR>
" map <A-right> :tabnext <CR>
map <Esc>[1;3C :tabnext <CR>
" imap <a-l> <Esc> :tabnext <CR>i
" map <a-l> :tabnext <CR>

" let mapleader = "-"
" let maplocalleader = ","
" nnoremap <leader>ev :vsplit $MYVIMRC<cr>
" nnoremap <leader>sv :source $MYVIMRC<cr>
" nnoremap <leader>" viw<esc>a"<esc>hbi"<esc>lel
" inoremap <c-e> <esc>$a
" inoremap <c-a> <esc>^i
" nnoremap <c-e> $a
" nnoremap <c-a> ^i

" Сдвиг по tab"
" nnoremap <Tab> >>_
" nnoremap <S-Tab> <c-O>
" inoremap <S-Tab> <C-D>
" vnoremap <Tab> >gv
" vnoremap <S-Tab> <gv

" Начало <Скомпилировать (F9)>
    nmap <F9> :make<cr>
    vmap <F9> <esc>:make<cr>
    imap <F9> <esc>:make<cr>a
" Конец

" Начало <Сохранить>
    imap <c-s> <Esc> :w! <CR>
    map <c-s> :w! <CR>
    imap <F5> <esc>:w!<cr>a
    nmap <F5> :w!<cr>
    vmap <F5> <esc>:w!<cr>
" Конец

" Начало <Выйти из редактора без сохранения>
    imap <c-q> <Esc> :qa! <CR>i
    map <c-q> :qa! <CR>
    nmap <F10> :q!<cr>
    vmap <F10> <esc>:q!<cr>
    imap <F10> <esc>:q!<cr>
" Конец
