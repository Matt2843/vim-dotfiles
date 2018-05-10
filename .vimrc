"~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~"
"			      				Matt's VIMRC							"
"~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~"
"								PATHOGEN								"
"~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~"
execute pathogen#infect()
execute pathogen#helptags()
"~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~"
"								SET THE LEADER							"
"~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~"
let mapleader=" "
"~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~"
"  								SETTINGS								"
"~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~"
"  set nocompatible to disable vi defaults.
set nocompatible
"  filetype plugin on, make vim determine filetype
filetype plugin indent on
"  syntax on enable language syntax detection
syntax on
"  set the encoding to be UTF-8
set encoding=utf-8
"  do sane view splitting
set splitbelow
set splitright
"  line numbers, and relative line numbers
set number
set relativenumber
"  hidden to keep undo history for multiple files when re-using the same
"  window
set hidden
"  Better command-line completion
set wildmenu
"  highlight searched by default
set hlsearch
"  use case insensitive search, except when using capital letters
set ignorecase
set smartcase
"  allow backspacing over autoindent, line breaks and start of insert actions
set backspace=indent,eol,start
"  always display the cursor position on the last line of the screen or in the
"  status bar
set ruler
"  instead of failing a command beacuse of unsaved changes, instead raise a
"  dialogue asking if you wish to save changed files.
set confirm
"  use visual bell instead of beeping..
set visualbell
"  reset the terminal code for the visual bell.
set t_vb=
"  enable the use of the mouse for all modes.
set mouse=a
"  set the command window heifght to 2 lines, to avoid many cases of having to
"  press enter to continue..
set cmdheight=2
"  quickle time out on keycodes but never time out on mappings
set notimeout ttimeout ttimeoutlen=200
"  use <F11> to toggle between paste and no paste
set pastetoggle=<F11>
"  set tabs to 4 spaces
set tabstop=4
set shiftwidth=4
set autoindent
"~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~"
"  								AESTHETICS								"
"~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~"
"  dracula is awesome
colorscheme dracula
"  disable GB to inherit from term.
hi Normal guibg=NONE ctermbg=NONE
"~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~"
"  								MAPPINGS								"
"~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~"
inoremap ;g <Esc>0/<++><Enter>c4l
nnoremap <leader>g <Esc>0/<++><Enter>c4l
nnoremap <leader>, a<++><NL><Esc>$
"  map capital y i.e. Y to act like D and C i.e. yank to eol
nnoremap Y y$
"  custom mappings for buffer switching
nnoremap <leader>n :bn<cr>
nnoremap <leader>p :bp<cr>
nnoremap <leader>d :bd<cr>
"  map <C-L> (redraw screen) to also turn off search hl until next
nnoremap <C-L> :nohl<CR><C-L>
"  C-T for new tab
nnoremap <C-t> :tabnew<cr>
"  copy selected text to system clipboard
vnoremap <C-c> "cy<esc>:!echo -n '<C-R>c' \|<space>xclip<CR><Enter>
"  YCM goto mappings
inoremap <C-f> <Esc>:YcmCompleter GoToDeclaration<Enter>
nnoremap <C-f> <Esc>:YcmCompleter GoToDeclaration<Enter>
"~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~"
"  								PLUGINS					  				"
"~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~"
"  YCM
let g:ycm_global_ycm_extra_conf = '~/.vim/bundle/YouCompleteMe/.ycm_extra_conf.py'
"  Vim-Airline
let g:airline#extensions#tabline#enabled = 1
let g:airline#extensions#tabline#left_sep = ' '
let g:airline#extensions#tabline#left_alt_sep = '|'
let g:airline_powerline_fonts = 1
let g:airline_theme = 'aurora'
if !exists('g:airline_symbols')
    let g:airline_symbols = {}
endif
" unicode symbols
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
" airline symbols
let g:airline_left_sep = ''
let g:airline_left_alt_sep = ''
let g:airline_right_sep = ''
let g:airline_right_alt_sep = ''
let g:airline_symbols.branch = ''
let g:airline_symbols.readonly = ''
let g:airline_symbols.linenr = ''
"~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~"
"  								CPP-SNIPPETS			  				"
"~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~"
autocmd FileType cpp,h,hpp inoremap ;fun <NL><++> (<++>)<NL>{<NL><Tab><++><NL><Esc><<i}<NL><NL><++><Esc>6k0i
autocmd FileType cpp,h,hpp inoremap ;tfun <NL>template <typename T><NL><++> (<++>)<NL>{<NL><Tab><++><NL><Esc><<i}<NL><NL><++><Esc>7k0i
autocmd FileType cpp,h,hpp inoremap ;main <NL>int main()<NL>{<NL><++><NL><Esc><<i}<Esc>4k0i
autocmd FileType cpp,h,hpp inoremap { {}<++><Esc>4hi
autocmd FileType cpp,h,hpp inoremap ( ()<++><Esc>4hi
autocmd FileType cpp,h,hpp inoremap ;io #include <iostream><NL>
autocmd FileType cpp,h,hpp inoremap ;str #include <string><NL>
autocmd FileType cpp,h,hpp inoremap ;cout std::cout << "" << std::endl;<NL><++><Esc>k$14hi
autocmd FileType cpp,h,hpp inoremap ;for for(int i = 0; i < <++>; i++) {<NL><++><NL><Esc><<i}<NL><Nl><++><Esc>5k0i
autocmd FileType cpp,h,hpp inoremap ;feach for(const auto & i : <++>) {<NL><++><NL><Esc><<i}<NL><NL><++><Esc>5k0i
