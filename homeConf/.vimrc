set number
set tabstop=4
set shiftwidth=4
set termguicolors
colorscheme my
"set clipboard=unnamedplus
"set mp=./run.sh
syntax on
filetype plugin on
    "ab #i #include
"echo ">^.^<"
set autowrite	
set nocompatible
if has("autocmd")
  au BufReadPost * if line("'\"") > 1 && line("'\"") <= line("$") | exe "normal! g'\"" | endif
endif
set clipboard+=unnamed 
"set nocompatible
set mouse=a
map <S-Insert> <MiddleMouse>
map! <S-Insert> <MiddleMouse>
set noswapfile
"set nowrap
set matchtime=3
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


"set hlsearch
"set ignorecase

"nnoremap <cr> <c-e>
"inoremap" <esc> <nop>

augroup script_type
    au!
    autocmd FileType python nnoremap <buffer> <localleader>c d0i#<esc>
    autocmd FileType perl nnoremap <buffer> <localleader>c d0i#<esc>
    autocmd FileType bash nnoremap <buffer> <localleader>c d0i#<esc>
augroup END
augroup filetype_cpp
    au!
    autocmd FileType cpp nnoremap <buffer> <localleader>c d0i//<esc>
    autocmd FileType cpp :iabbrev <buffer> if if () {<cr><cr>}<up><up><right><right>
augroup END

"inoremap" jk <esc>

inoremap <tab> <c-r>=InsertTabWrapper ("forward")<cr>
inoremap <s-tab> <c-r>=InsertTabWrapper ("backward")<cr>

"Работа с вкладками
imap <c-n> <Esc>:tabnew<CR>
map <c-n> <Esc>:tabnew<CR>
imap <c-o> <Esc>:browse tabnew<CR>
map <c-o> <Esc>:browse tabnew<CR>
imap <A-left> <Esc> :tabprev <CR>i
map <A-left> :tabprev <CR>
"imap <A-h> <Esc> :tabprev <CR>i
"map <A-h> :tabprev <CR>
imap <A-right> <Esc> :tabnext <CR>i
map <A-right> :tabnext <CR>
"imap <a-l> <Esc> :tabnext <CR>i
"map <a-l> :tabnext <CR>

let mapleader = "-"
let maplocalleader = ","
nnoremap <leader>ev :vsplit $MYVIMRC<cr>
nnoremap <leader>sv :source $MYVIMRC<cr>
nnoremap <leader>" viw<esc>a"<esc>hbi"<esc>lel
inoremap <c-e> <esc>$a
inoremap <c-a> <esc>^i
nnoremap <c-e> $a
nnoremap <c-a> ^i

"Сдвиг по tab"
nnoremap <Tab> >>_
nnoremap <S-Tab> <<_
inoremap <S-Tab> <C-D>
vnoremap <Tab> >gv
vnoremap <S-Tab> <gv

"Начало <Скомпилировать (F9)>
    nmap <F9> :make<cr>
    vmap <F9> <esc>:make<cr>
    imap <F9> <esc>:make<cr>a
"Конец

"Начало <Сохранить>
    imap <c-s> <Esc> :w! <CR>
    map <c-s> :w! <CR>
    "nmap <F5> :w!<cr>
    "vmap <F5> <esc>:w!<cr>
    "imap <F5> <esc>:w!<cr>a
"Конец

"Начало <Выйти из редактора без сохранения>
    imap <c-q> <Esc> :qa! <CR>i
    map <c-q> :qa! <CR>
    nmap <F10> :q!<cr>
    vmap <F10> <esc>:q!<cr>
    imap <F10> <esc>:q!<cr>
"Конец
