set nocompatible
"filetype off
"set rtp+=~/.vim/bundle/Vundle.vim
"call vundle#begin()

"Plugin 'VundleVim/Vundle.vim'

"Plugin 'vim-perl/vim-perl', { 'for': 'perl', 'do': 
"\ 'make clean carp dancer highlight-all-pragmas moose test-more try-tiny' }

"Plugin 'ervandew/supertab'

"Plugin 'WolfgangMehner/vim-plugins'

filetype plugin indent on
call plug#begin('~/.vim/plugged')
"Plug 'vim-perl/vim-perl', { 'for': 'perl', 'do': 
"\ 'make clean carp dancer highlight-all-pragmas moose test-more try-tiny' }

Plug 'WolfgangMehner/vim-plugins'

Plug 'Valloric/YouCompleteMe'

"Plug 'ervandew/supertab'
call plug#end()
let g:Perl_PerlTags = 'on'
set showtabline=2
set number
set tabstop=4
set shiftwidth=4
set startofline
" Do not automatically insert the current comment leader after an enter.
set fo-=r 
set fo-=o 

function! Smart_TabComplete()
  let line = getline('.')                         " current line

  let substr = strpart(line, -1, col('.')+1)      " from the start of the current
                                                  " line to one character right
                                                  " of the cursor
  let substr = matchstr(substr, "[^ \t]*$")       " word till cursor
  if (strlen(substr)==0)                          " nothing to match on empty string
    return "\<tab>"
  endif
  let has_period = match(substr, '\.') != -1      " position of period, if any
  let has_slash = match(substr, '\/') != -1       " position of slash, if any
  if (!has_period && !has_slash)
    return "\<C-X>\<C-P>"                         " existing text matching
  elseif ( has_slash )
    return "\<C-X>\<C-F>"                         " file matching
  else
    return "\<C-X>\<C-O>"                         " plugin matching
  endif
endfunction
"inoremap <tab> <c-r>=Smart_TabComplete()<CR>

"nnoremap ? ?\c
"set ignorecase
set noruler
set showcmd
set incsearch
set wrapscan
set termguicolors
set colorcolumn=80
colorscheme my
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

set clipboard+=unnamed 
set mouse=a
"map <S-Insert> <MiddleMouse>
"map! <S-Insert> <MiddleMouse>
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

"inoremap" jk <esc>

"inoremap <tab> <c-r>=InsertTabWrapper ("forward")<cr>
"inoremap <s-tab> <c-r>=InsertTabWrapper ("backward")<cr>


"Перемещение
imap <A-down> <Esc> <C-E> <S-M>
map <A-down> <C-E> <S-M>
"map <down> <C-E> <S-M>
imap <A-up> <Esc> <C-Y> <S-M>
map <A-up> <C-Y> <S-M>
"map <up> <C-Y> <S-M>

"Работа с вкладками
imap <c-n> <Esc>:tabnew<CR>
map <c-n> <Esc>:tabnew<CR>
imap <c-o> <Esc>:browse tabnew<CR>
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
inoremap <c-e> <esc>$a
inoremap <c-a> <esc>^i
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
