:syntax on
" Formatting (some of these are for coding in C and C++)
set autoread
set wrap
set list
set ts=2  " Tabs are 2 spaces
set bs=2  " Backspace over everything in insert mode
set shiftwidth=2  " Tabs under smart indent
set softtabstop=2
set expandtab
set nocp incsearch
set showmatch   " Show matching brackets.
set ignorecase   " Do case insensitive matching/search
"set smartcase    " Do smart case matching
set incsearch   " Incremental search
set hlsearch    " Vim will highlight all matches for the pattern with a yellow background.
      "   This gives a quick overview of where the search command will take you.
      "   In program code it can show where a variable is used.
      "   You don't even have to move the cursor to see the matches.
" set cinoptions=:0,p0,t0
" set cinwords=if,else,while,do,for,switch,case
" set formatoptions=tcqr
"set noerrorbells
"set visualbell
set nu  " Line numbers on
set nowrap  " Line wrapping off
"set list  " no longer needed to see white space, now using a vim plugin
set ruler

" enable clipboard if Vim compiled with +clipboard ( as is current version of Vim)
" After doing a 'brew install vim' on 5-19-2015, this sets it as default
" VIM - Vi IMproved 7.4 (2013 Aug 10, compiled May 19 2015 13:11:47)
set clipboard=unnamed

" include file name in statusline
"set statusline+=%t
" %t(file name only i.e tail of filepath)
" %F(Full file path)
" %m(Shows + if modified - if not modifiable)
" %r(Shows RO if readonly)
" %<(Truncate here if necessary)
" \ (Separator)
" %=(Right align)
" %l(Line number)
" %v(Column number)
" %L(Total number of lines)
" %p(How far in file we are percentage wise)
" %%(Percent sign)
set statusline=%t%m%r%<\ %=%l,%v\ [%L]\ %p%%
" always show status line
set laststatus=2

"map leader character as ','
:let mapleader=','

"map Alt-k to <Up> arrow to help with Ctrl-p Vim Plugin,
"do a non-recursive normal mode map, also for insert mode
:nnoremap ˚ <up>
:inoremap ˚ <up>

"map Alt-j to <Down> arrow to help with Ctrl-p Vim Plugin,
"do a non-recursive normal mode map, also for insert mode
:nnoremap ∆ <down>
:inoremap ∆ <down>

"to split vim a buffer(or pane) into 2 horizontal panes
:nnoremap <Leader>- :split<cr>

"to split vim buffer(or pane) into 2 vertical panes
:nnoremap <Leader>\| :vsplit<cr>

"resize Vim panes vertically
:nnoremap <C-J> :resize +1<cr>
:nnoremap <C-K> :resize -1<cr>

"resize Vim panes horizontally
:nnoremap <C-H> :vertical resize -1<cr>
:nnoremap <C-L> :vertical resize +1<cr>

" paste will not override what is being pasted - useful when copy then paste
" in multiple places
" :xnoremap visual mode remap
:vnoremap p pgvy

" set column margin at 120 chars, and line highlighting
"set colorcolumn=80
"set cul

" doing colorcolumn an current line highlighting in the active pane
"augroup BgHighlight
"  autocmd!
"  autocmd WinEnter * set colorcolumn=80
"  autocmd WinLeave * set colorcolumn=0
"  autocmd WinEnter * set cul
"  autocmd WinLeave * set nocul
"augroup END

"
" ==================
" ==================
" Vundle starts here
" ==================
" ==================
set nocompatible              " be iMproved, required
filetype off                  " required

" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
" alternatively, pass a path where Vundle should install plugins
"call vundle#begin('~/some/path/here')

" let Vundle manage Vundle, required
Plugin 'gmarik/Vundle.vim'
Plugin 'ntpeters/vim-better-whitespace'
Plugin 'tmhedberg/matchit'
Plugin 'sickill/vim-pasta'
Plugin 'scrooloose/syntastic'
Plugin 'ervandew/supertab'
"Plugin 'vim-scripts/ZoomWin'
Plugin 'regedarek/ZoomWin'
Plugin 'vim-scripts/tComment'
Plugin 'tpope/vim-fugitive'
Plugin 'tpope/vim-surround'
Plugin 'kien/ctrlp.vim'
Plugin 'rking/ag.vim'
Plugin 'mileszs/ack.vim'
Plugin 'scrooloose/nerdtree'
Plugin 'Xuyuanp/nerdtree-git-plugin'
"Plugin 'NLKNguyen/papercolor-theme'
Plugin 'rking/vim-detailed'
Plugin 'kchmck/vim-coffee-script'
Plugin 'tpope/vim-haml'
Plugin 'slim-template/vim-slim'
Plugin 'puppetlabs/puppet-syntax-vim'
Plugin 'tpope/vim-rails'

" All of your Plugins must be added before the following line
call vundle#end()            " required

" vim +PluginInstall +qall
" use above comand from command line to install new plugins,
" was not successful running it from vim as follows
" :PluginInstall

filetype plugin indent on    " required
" To ignore plugin indent changes, instead use:
"filetype plugin on
"
" Brief help
" :PluginList       - lists configured plugins
" :PluginInstall    - installs plugins; append `!` to update or just :PluginUpdate
" :PluginSearch foo - searches for foo; append `!` to refresh local cache
" :PluginClean      - confirms removal of unused plugins; append `!` to auto-approve removal
"
" see :h vundle for more details or wiki for FAQ
" Put your non-Plugin stuff after this line
" Syntastics initial settings here
set statusline+=%#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*
let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list = 1
let g:syntastic_check_on_open = 0
let g:syntastic_check_on_wq = 1
"let g:syntastic_ruby_checkers = ['mri', 'rubocop'] " rubocop not installed yet
let g:syntastic_ruby_checkers = ['mri']
let g:syntastic_sass_checkers = []
let g:syntastic_scss_checkers = []

" ZoomWin is borked when it comes to revereting from a zoomed state, but :ZoomWin works so remaping it (<Leader>e) or ',e'
nnoremap <silent> <Leader>e :ZoomWin<CR>
" ==================
" ==================
" Vundle ends here
" ==================
" ==================
"
"colorscheme PaperColor-Dark
colorscheme detailed

" Tidy xml and JSON
" select xml text to format and hit ,x
" be very careful, only XML text, no blanks, to extra lines
" just select the XML
vmap <leader>x :!tidy -q -i -xml<CR>
" select json text to format and hit ,j
vmap <leader>j  :!python -m json.tool<CR>
" Yanks current file
vmap <leader>n :let @+ = expand("%")<cr>
" equivalent to a * (or shift 8) for more than one word
vnoremap // y/<C-R>"<CR>
