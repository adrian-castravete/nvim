set background=dark
highlight clear

if exists("syntax_on")
	syntax reset
endif

let colors_name = "mydefault"

set fillchars=vert:│,fold:─,stl:━,stlnc:─

highlight Normal			ctermbg=NONE	ctermfg=11
highlight NonText			ctermbg=NONE	ctermfg=234
highlight ColorColumn	cterm=reverse	ctermbg=15	ctermfg=234
highlight Pmenu		cterm=None	ctermbg=236	ctermfg=7
highlight PmenuSel	cterm=None	ctermbg=238	ctermfg=15
highlight CursorLine	cterm=NONE	ctermbg=234
highlight Search	cterm=bold	ctermbg=3	ctermfg=15
highlight SpecialKey			ctermbg=NONE	ctermfg=8
highlight StatusLine	cterm=bold	ctermbg=NONE	ctermfg=8
highlight StatusLineNC	cterm=NONE	ctermbg=NONE	ctermfg=8
highlight VertSplit	cterm=NONE	ctermbg=NONE	ctermfg=8
highlight Visual	cterm=NONE	ctermbg=7	ctermfg=0

highlight DiffAdd	cterm=reverse	ctermbg=15	ctermfg=2
highlight DiffDelete	cterm=reverse	ctermbg=15	ctermfg=1
highlight DiffChange	cterm=reverse	ctermbg=15	ctermfg=3
highlight DiffText	cterm=reverse	ctermbg=15	ctermfg=8

highlight Builtin	cterm=italic			ctermfg=12
highlight Comment	cterm=italic			ctermfg=2
highlight Constant					ctermfg=13
highlight Identifier	cterm=bold			ctermfg=10
highlight Number					ctermfg=14
highlight PreProc					ctermfg=10
highlight Statement					ctermfg=15
highlight String					ctermfg=9
highlight Type		cterm=bold			ctermfg=15
