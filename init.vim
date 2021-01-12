set nocompatible

filetype off

call plug#begin(stdpath('config') . '/plugged')
Plug 'neoclide/coc.nvim', {'branch': 'release'}	" Conqure of Completion

Plug 'scrooloose/nerdtree'			" File tree plugin
Plug 'tsony-tsonev/nerdtree-git-plugin'		" Git for nerdtree
"Plug 'Xuyuanp/nerdtree-git-plugin'
Plug 'tiagofumo/vim-nerdtree-syntax-highlight'	" Colour for nerdtree items

Plug 'ryanoasis/vim-devicons'			" Icons for NVIM
Plug 'airblade/vim-gitgutter'			" Line status from git
Plug 'ctrlpvim/ctrlp.vim'			" File Fuzzy Finder
Plug 'scrooloose/nerdcommenter'			" Commenter
Plug 'christoomey/vim-tmux-navigator'		" Easily move between windows
Plug 'tpope/vim-fugitive'			" Git commands
Plug 'MattesGroeger/vim-bookmarks'		" Bookmark plugin (`m*`)
Plug 'luochen1990/rainbow'			" Context highlighter
Plug 'majutsushi/tagbar'			" Tags manager (`'`)
Plug 'mileszs/ack.vim'				" Searcher (`:Ack`)
Plug 'chrisbra/unicode.vim'			" Unicode related (`:SearchUnicode`)
Plug 'wellle/context.vim'			" Current context

" File types
Plug 'plasticboy/vim-markdown'			" Markdown
Plug 'mzlogin/vim-markdown-toc'			" TOC for Markdown
Plug 'JamshedVesuna/vim-markdown-preview'	" Previewer for Markdown
Plug 'neovimhaskell/haskell-vim'		" Haskell
Plug 'kchmck/vim-coffee-script'			" Coffee Script
Plug 'Vimjas/vim-python-pep8-indent'		" Python PEP8 Indent
Plug 'sentientmachine/Pretty-Vim-Python'	" Pretty Python
Plug 'samsaga2/vim-z80'				" Z80 Syntax
Plug 'marcuscf/vim-lua'				" Lua Syntax
Plug 'bakpakin/fennel.vim'			" Fennel Syntax

Plug 'tpope/vim-fireplace'			" Clojure connectivity
Plug 'adrian-castravete/vim-parinfer'		" Parenthesis Inference (lisp-like)

Plug 'HerringtonDarkholme/yats.vim'		" TS Syntax
Plug 'leafo/moonscript-vim'			" Moonscript Syntax
Plug 'tikhomirov/vim-glsl'			" OpenGL Shader Language

call plug#end()

filetype plugin indent on

" My Settings
set t_Co=256
set autochdir
set hlsearch
set encoding=utf8
set shiftwidth=8
set tabstop=8
set backspace=2
set nowrap
set noshowmode
set list
set listchars=tab:»*,trail:•,nbsp:★,extends:»,precedes:«
set guicursor=
set cursorline
set mouse=a
set colorcolumn=80,100,120
set relativenumber
set number
set modeline
set modelines=5

syntax enable

" Syntax / Colours
set background=dark

highlight Normal ctermbg=NONE
highlight NonText ctermbg=NONE

highlight DiffAdd       cterm=reverse   ctermbg=15  ctermfg=2
highlight DiffDelete    cterm=reverse   ctermbg=15  ctermfg=1
highlight DiffChange    cterm=reverse   ctermbg=15  ctermfg=3
highlight DiffText      cterm=reverse   ctermbg=15  ctermfg=8

colorscheme mydefault

" Keyboard mappings
" -----------------
nnoremap <Tab>  :wincmd w<cr>
nnoremap <C-O>  :bn<cr>
nnoremap <C-P>  :buffers<cr>:buffer<space>
nnoremap `      :TagbarToggle<cr>
"nnoremap <C-G>  :silent grep!<space> -- :/<cr>:cw<cr>
nnoremap <C-G>  :AckGit <cword><cr>
cnoremap w!!    w !sudo tee > /dev/null %
nnoremap gb     :call SynStack()<cr>
nnoremap <C-M> 	:NERDTreeToggle<cr>
nnoremap <C-T>	:NERDCommenterToggle<cr>
inoremap <silent><expr> <c-space> coc#refresh()

nnoremap <silent> [g <Plug>(coc-diagnostic-prev)
nnoremap <silent> ]g <Plug>(coc-diagnostic-next)
nnoremap <silent> gd <Plug>(coc-definition)
nnoremap <silent> gy <Plug>(coc-type-definition)
nnoremap <silent> gi <Plug>(coc-implementation)
nnoremap <silent> gr <Plug>(coc-references)

" Unicode
" -------
if !exists("g:startup_finished") || !g:startup_finished
	set encoding=utf-8
endif
set fileencoding=utf-8
set fileencodings=utf-8,ucs-bom,latin1
set fileformat=unix

" Ignores
" -------
set wildignore+=node_modules
set wildignore+=__pycache__
set wildignore+=*.egg-info
set wildignore+=*.pyc

" Autocommands
" ------------
augroup wipetrailing
	autocmd!
	autocmd BufWritePre *.py,*.c,*.js,*.coffee,*.lua,*.fnl,*.fennel,*.clj,*.cljs,*.cljc :%s/\s\+$//e
augroup END

augroup customtabstops
	autocmd!
	autocmd BufNewFile,BufReadPre,BufCreate *.c,*.cc,*.cpp,*.cxx,*.h,*.asm,*.a :setlocal ts=8 sw=8 noet
	autocmd BufNewFile,BufReadPre,BufCreate *.json,*.py :setlocal ts=4 sw=4 et
	autocmd BufNewFile,BufReadPre,BufCreate *.moon :setlocal ts=4 sw=4 noet
	autocmd BufNewFile,BufReadPre,BufCreate *.lua :setlocal ts=3 sw=3 noet
	autocmd BufNewFile,BufReadPre,BufCreate *.js,*.yaml,*.jsx,*.jinja2,*.jinja,*.html,*.fnl,*.fennel :setlocal ts=2 sw=2 et
	autocmd FileType make :set ts=8 sw=8 noet
augroup END

" Highlight currently open buffer in NERDTree
autocmd BufEnter * call SyncTree()

" Plugin specific configuration
" -----------------------------

" ### Ack ###
let g:ackprg = 'ag --vimgrep --smart-case'

" ### Parinfer ###
let g:vim_parinfer_filetypes = ["fennel"]

" ### Rainbow ###
let g:rainbow_active = 0

" ### Context ###
let g:context_enabled = 0

" ### NERDTree Git
let g:NERDTreeGitStatusWithFlags = 1
let g:WebDevIconsUnicodeDecorateFolderNodes = 1
let g:NERDTreeGitStatusNodeColorization = 1
let g:NERDTreeColorMapCustom = {
	\ "Staged"	: "#0ee375",
	\ "Modified"	: "#d9bf91",
	\ "Renamed"	: "#51c9fc",
	\ "Untracked"	: "#fce77c",
	\ "Unmerged"	: "#fc51e6",
	\ "Dirty"	: "#ffbd61",
	\ "Clean"	: "#87939a",
	\ "Ignored"	: "#808080"
	\ }
let g:NERDTreeIgnore = ['^node_modules$']

" ### Others ###
let g:netrw_keepdir = 0

" Functions
" ---------
function! SynStack()
	if !exists("*synstack")
		return
	endif
	let l:s = synID(line('.'), col('.'), 1)
	echo synIDattr(l:s, 'name') . ' -> ' . synIDattr(synIDtrans(l:s), 'name')
endfunc

function! FindGitRoot()
	return system('git rev-parse --show-toplevel 2> /dev/null')[:-2]
endfunc

" sync open file with NERDTree
" " Check if NERDTree is open or active
function! IsNERDTreeOpen()        
  return exists("t:NERDTreeBufName") && (bufwinnr(t:NERDTreeBufName) != -1)
endfunction

" Call NERDTreeFind iff NERDTree is active, current window contains a modifiable
" file, and we're not in vimdiff
function! SyncTree()
  if &modifiable && IsNERDTreeOpen() && strlen(expand('%')) > 0 && !&diff
    NERDTreeFind
    wincmd p
  endif
endfunction

" Commands
" --------
command! -nargs=1 AckGit execute "Ack! <args> " . FindGitRoot()
