"~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~"
"								Matt's VIMRC							"
"~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~"
"Pathogen
execute pathogen#infect()
execute pathogen#helptags()
"Leader
let mapleader=" "
"Settings
"set nocompatible to disable vi defaults.
set nocompatible
"filetype plugin on, make vim determine filetype
filetype plugin indent on
"syntax on enable language syntax detection
syntax on
"set the encoding to be UTF-8
set encoding=utf-8
"do sane view splitting
set splitbelow
set splitright
"line numbers, and relative line numbers
set number
set relativenumber
"hidden to keep undo history for multiple files when re-using the same
"window
set hidden
"Better command-line completion
set wildmenu
"highlight searched by default
set hlsearch
"use case insensitive search, except when using capital letters
set ignorecase
set smartcase
"allow backspacing over autoindent, line breaks and start of insert actions
set backspace=indent,eol,start
"always display the cursor position on the last line of the screen or in the
"status bar
set ruler
"instead of failing a command beacuse of unsaved changes, instead raise a
"dialogue asking if you wish to save changed files.
set confirm
"use visual bell instead of beeping..
set visualbell
"reset the terminal code for the visual bell.
set t_vb=
"enable the use of the mouse for all modes.
set mouse=a
"set the command window heifght to 2 lines, to avoid many cases of having to
"press enter to continue..
set cmdheight=2
"quickle time out on keycodes but never time out on mappings
set notimeout ttimeout ttimeoutlen=200
"use <F11> to toggle between paste and no paste
set pastetoggle=<F11>
"set tabs to 4 spaces
set tabstop=4
set shiftwidth=4
set autoindent
"cindent
set cindent
set cino=g0
"Aestehtics
"synthwave is awesome
if &term == "linux"
	colorscheme synthwave-console
else
colorscheme synthwave
	hi normal guibg=NONE ctermbg=NONE
endif
"Mappings
augroup vimrc_autocmd
	autocmd!
	"remove trailing whitespace on save and fix mixed-indent
	autocmd BufWritePre * %s/\s\+$//e
	"Save folds
	autocmd BufWinLeave *.* mkview
	autocmd BufWinEnter *.* silent loadview
augroup END
"leader guides
inoremap ;g <Esc>0/<++><Enter>c4l
nnoremap ;g <Esc>0/<++><Enter>c4l<Esc>
"ctrl-s
inoremap <C-s> <Esc>:w<Enter>i
nnoremap <C-s> :w<Enter>
"map capital y i.e. Y to act like D and C i.e. yank to eol
nnoremap Y y$
"custom mappings for buffer switching
nnoremap <leader>n :bn<cr>
nnoremap <leader>p :bp<cr>
nnoremap <leader>d :bd<cr>
"map <C-L> (redraw screen) to also turn off search hl until next
nnoremap <C-S-L> :nohl<CR><C-L>
"C-T for new tab
nnoremap <C-t> :tabnew<cr>
"copy selected text to system clipboard
vnoremap <C-c> "cy<esc>:!echo -n '<C-R>c' \|<space>xclip<CR><Enter>
"YCM goto mappings
inoremap <C-F> <Esc>:YcmCompleter GoToDeclaration<Enter>
nnoremap <C-F> <Esc>:YcmCompleter GoToDeclaration<Enter>
inoremap <C-S-F> <Esc>:YcmCompleter GoToDefinition<Enter>
nnoremap <C-S-F> :YcmCompleter GoToDefinition<Enter>
"AutoFormat mappings
nnoremap <F3> :AutoFormat
"Split switching
"nnoremap <C-h> <Esc><C-w>h
"nnoremap <C-j> <Esc><C-w>j
"nnoremap <C-k> <Esc><C-w>k
"nnoremap <C-l> <Esc><C-w>l
"Plugins
"YCM
let g:ycm_global_ycm_extra_conf = '~/.vim/bundle/YouCompleteMe/.ycm_extra_conf.py'
"Vim-Airline
let g:airline#extensions#tabline#enabled = 1
let g:airline#extensions#tabline#left_sep = ' '
let g:airline#extensions#tabline#left_alt_sep = '|'
let g:airline_powerline_fonts = 1
let g:airline_theme = 'kolor'
if !exists('g:airline_symbols')
	let g:airline_symbols = {}
endif
"unicode symbols
let g:airline_left_sep = '»'
let g:airline_left_sep = '▶'
let g:airline_right_sep = '«'
let g:airline_right_sep = '◀'
let g:airline_symbols.linenr = '␊'
let g:airline_symbols.linenr = '␤'
let g:airline_symbols.linenr = '¶'
let g:airline_symbols.branch = '⎇'
let g:airline_symbols.paste = 'ρ'
let g:airline_symbols.paste = 'Þ'
let g:airline_symbols.paste = '∥'
let g:airline_symbols.whitespace = 'Ξ'
"airline symbols
let g:airline_left_sep = ''
let g:airline_left_alt_sep = ''
let g:airline_right_sep = ''
let g:airline_right_alt_sep = ''
let g:airline_symbols.branch = ''
let g:airline_symbols.readonly = ''
let g:airline_symbols.linenr = ''
"C++ Snippets
autocmd FileType cpp,h,hpp inoremap ;fun <NL><++> (<++>)<NL>{<NL><Tab><++><NL><Esc><<i}<NL><NL><++><Esc>6k0i
autocmd FileType cpp,h,hpp inoremap ;tfun <NL>template <typename T<++>><NL><++> (<++>)<NL>{<NL><Tab><++><NL><Esc><<i}<NL><NL><++><Esc>7k0i
autocmd FileType cpp,h,hpp inoremap ;main <NL>int main()<NL>{<NL><++><NL><Esc><<i}<Esc>4k0i
autocmd FileType cpp,h,hpp inoremap { {}<++><Esc>4hi
autocmd FileType cpp,h,hpp inoremap ( ()<++><Esc>4hi
autocmd FileType cpp,h,hpp inoremap ;inc #include <><Esc>i
autocmd FileType cpp,h,hpp inoremap ;io #include <iostream><NL>
autocmd FileType cpp,h,hpp inoremap ;str #include <string><NL>
autocmd FileType cpp,h,hpp inoremap ;vec #include <vector><NL>
autocmd FileType cpp,h,hpp inoremap ;once #pragma once<NL>
autocmd FileType cpp,h,hpp inoremap ;print std::cout << "" << std::endl;<NL><++><Esc>k$14hi
autocmd FileType cpp,h,hpp inoremap ;cerr std::cerr << "" << std::endl;<NL><++><Esc>k$14hi
autocmd FileType cpp,h,hpp inoremap ;fori for(int i = 0; i < <++>; i++) {<NL><++><NL><Esc><<i}<NL><Nl><++><Esc>4k0i
autocmd FileType cpp,h,hpp inoremap ;feach for(const auto & i : <++>) {<NL><++><NL><Esc><<i}<NL><NL><++><Esc>4k0i
autocmd FileType cpp,h,hpp inoremap ;while while(<++>) {<NL><++><NL><Esc><<i}<NL><NL><++><Esc>4k0i
autocmd FileType cpp,h,hpp inoremap ;cout std::cout << <++>;<NL><++><Esc>1k0i
autocmd FileType cpp,h,hpp inoremap ;if if(<++>) <++><Esc>0i
autocmd FileType cpp,h,hpp inoremap ;fte if(<++>) {<NL><++><NL><Esc><<i} else {<NL><++><NL><Esc><<i}<NL><++><Esc>5k0i
"Functions
function! Preserve(command)
	" Preparation: save last search, and cursor position.
	let _s=@/
	let l = line(".")
	let c = col(".")
	" Do the business:
	execute a:command
	" Clean up: restore previous search history, and cursor position
	let @/=_s
	call cursor(l, c)
endfunction
