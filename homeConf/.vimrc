set number
set tabstop=4
"set clipboard=unnamedplus
syntax on
filetype plugin on
ab #i #include
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
set nowrap
set matchtime=3
set expandtab
"set autoindent
function! InsertTabWrapper(direction)
    let col = col('.') - 1
    if !col || getline('.')[col - 1] !~ '\k'
        return "\<tab>"
    elseif "backward" == a:direction
        return "\<c-p>"
    else
        return "\<c-n>"
    endif
 endfunction
 inoremap <tab> <c-r>=InsertTabWrapper ("forward")<cr>
 inoremap <s-tab> <c-r>=InsertTabWrapper ("backward")<cr>
set shiftwidth=4
set smartindent 
imap <F4> <Esc>:browse tabnew<CR> 
map <F4> <Esc>:browse tabnew<CR>
imap <F6> <Esc> :tabprev <CR>i
map <F6> :tabprev <CR>
imap <F7> <Esc> :tabnext <CR>i
map <F7> :tabnext <CR>

imap <c-s> <Esc> :w <CR>i
map <c-s> :w <CR>

"set hlsearch
"set mp=./run.sh
"set ignorecase

let mapleader = "-"
let maplocalleader = ","
nnoremap <leader>ev :vsplit $MYVIMRC<cr>
nnoremap <leader>sv :source $MYVIMRC<cr>
nnoremap <leader>" viw<esc>a"<esc>hbi"<esc>lel
inoremap <c-e> <esc>$a
inoremap <c-a> <esc>^i
nnoremap <c-e> $a
nnoremap <c-a> ^i

"nnoremap <cr> <c-e>
"inoremap" jk <esc>
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

"map <C-l> <Esc> $ a  
"map <C-a> <Esc> ^ a

"Начало <Запустить ./main (F8)>
    nmap <F8> :! ./main<cr>
    vmap <F8> <esc>:! ./main<cr>
    imap <F8> <esc>:! ./main<cr>
"Конец

"Начало <Скомпилировать (F9)>
    nmap <F9> :make<cr>
    vmap <F9> <esc>:make<cr>
    imap <F9> <esc>:make<cr>a
"Конец

"Начало <Сохранить (F5)>
    nmap <F5> :w!<cr>
    vmap <F5> <esc>:w!<cr>
    imap <F5> <esc>:w!<cr>a
"Конец

"Начало <Выйти из редактора без сохранения (F10)>
    nmap <F10> :q!<cr>
    vmap <F10> <esc>:q!<cr>
    imap <F10> <esc>:q!<cr>
"Конец
