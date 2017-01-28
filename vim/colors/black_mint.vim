"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" File: "/home/caciano/.vim/dante.vim"
" Created: "Thu, 23 May 2002 00:12:20 -0300 (caciano)"
" Updated: "Sat, 24 Aug 2002 14:04:21 -0300 (caciano)"
" Copyright (C) 2002, Caciano Machado <caciano@inf.ufrgs.br>
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Colorscheme Option:
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
hi clear
if exists("syntax on")
	syntax reset
endif
let g:colors_name = "my"

" General colors
hi Normal	ctermfg=gray guifg=gray80 guibg=black
"hi Normal	ctermfg=gray guifg=#D3DAE3 guibg=#404552
hi Directory	term=bold ctermfg=blue guifg=royalblue
hi ErrorMsg	term=standout ctermfg=white ctermbg=red guifg=white guibg=red3
hi NonText	term=bold ctermfg=darkgray guibg=black guifg=gray20
hi SpecialKey	term=bold ctermfg=darkgray guifg=white
hi LineNr	term=underline ctermfg=darkgray guifg=ivory4 guibg=black
hi IncSearch	term=reverse cterm=reverse gui=reverse,bold guifg=purple1
hi Search	term=reverse ctermfg=black ctermbg=yellow guifg=gray10 guibg=purple4
hi Visual	term=bold,reverse cterm=bold,reverse ctermfg=gray ctermbg=black gui=bold,reverse guifg=gray40 guibg=black
hi VisualNOS	term=bold,underline cterm=bold,underline gui=bold,underline
hi MoreMsg	term=bold ctermfg=green gui=bold guifg=olivedrab1
hi ModeMsg	term=bold cterm=bold gui=bold
hi Question	term=standout ctermfg=green gui=bold guifg=olivedrab1
hi WarningMsg	term=standout ctermfg=red gui=bold guifg=red3
hi WildMenu	term=standout ctermfg=gray ctermbg=black guifg=gray guibg=black
hi Folded	term=standout ctermfg=blue ctermbg=black guifg=royalblue1 guibg=black
hi FoldColumn	term=standout ctermfg=blue ctermbg=black guifg=royalblue3 guibg=black
hi DiffAdd	term=bold ctermbg=blue guibg=gold3
hi DiffChange	term=bold ctermbg=darkmagenta guibg=maroon
hi DiffDelete	term=bold cterm=bold ctermfg=lightblue ctermbg=cyan gui=bold guifg=lightblue guibg=cyan4
hi DiffText	term=reverse cterm=bold ctermbg=red gui=bold guibg=red3
hi Cursor	guifg=bg guibg=fg
hi lCursor	guifg=bg guibg=fg
hi StatusLine	term=reverse cterm=reverse gui=reverse guifg=gray60
hi StatusLineNC	term=reverse cterm=reverse gui=reverse guifg=gray40
hi VertSplit	term=reverse cterm=reverse gui=bold,reverse guifg=gray40
hi Title	term=bold ctermfg=magenta gui=bold guifg=aquamarine guibg=bg
hi TabLineFill guifg=black guibg=DarkGreen
"hi TabLine gui=bold guifg=royalblue4 guibg=lightblue4
hi TabLine gui=bold guifg=#7A9F4A guibg=gray18
"hi TabLineSel guifg=lightblue4 guibg=royalblue4
hi TabLineSel guifg=grey18 guibg=#7A9F4A
hi ColorColumn ctermbg=grey guibg=#050705
hi Pmenu ctermbg=yellow guifg=#C0BDDF guibg=#0A0F0B
"hi WildMenu

" syntax hi colors
hi Comment	term=bold ctermfg=darkgrey guifg=grey30
hi PreProc	term=underline ctermfg=darkblue guifg=dodgerblue4
hi Constant	term=underline ctermfg=darkred guifg=darkolivegreen
hi Type		term=underline ctermfg=darkgreen gui=none guifg=dodgerblue
hi Statement	term=bold ctermfg=darkcyan gui=bold guifg=darkcyan
hi Identifier	term=underline ctermfg=blue guifg=slateblue
hi Ignore	term=bold ctermfg=darkgray guifg=gray45
hi Special	term=underline ctermfg=brown guifg=sienna4
hi Error	term=reverse ctermfg=gray ctermbg=red guifg=gray guibg=red3
hi Todo		term=standout ctermfg=black ctermbg=yellow gui=bold guifg=gray10 guibg=yellow4
hi Underlined	term=underline cterm=underline ctermfg=darkblue gui=underline guifg=slateblue
hi Number	term=underline ctermfg=darkgreen guifg=green4
hi String	ctermfg=darkyellow guifg=darkolivegreen
hi Boolean  guifg=darkgreen
" syntax hi links
hi link Character	Constant
hi link Number		Constant
hi link Float		Number
hi link Function	Identifier
hi link Number		Constant
hi link Conditional	Statement
hi link Repeat		Statement
hi link Label		Statement
hi link Keyword		Statement
hi link Exception	Statement
hi link Operator	Statement
hi link Include		PreProc
hi link Define		PreProc
hi link Macro		PreProc
hi link PreCondit	PreProc
hi link StorageClass	Type
hi link Structure	Type
hi link Typedef		Type
hi link Tag		Special
hi link SpecialChar	Special
hi link Delimiter	Special
hi link SpecialComment	Special
hi link Debug		Special
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
