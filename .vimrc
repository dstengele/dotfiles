set nocompatible
filetype off

set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

Plugin 'VundleVim/Vundle.vim'
Plugin 'airblade/vim-gitgutter'
Plugin 'godlygeek/tabular'
Plugin 'ervandew/supertab'
Plugin 'mhinz/vim-startify'
Plugin 'vim-airline/vim-airline'
Plugin 'sophacles/vim-bundle-mako'
Plugin 'Townk/vim-autoclose'
Plugin 'nvie/vim-flake8'
Plugin 'hynek/vim-python-pep8-indent'
Plugin 'vim-scripts/mako.vim'
Plugin 'dracula/vim', { 'name': 'dracula' }
Plugin 'LnL7/vim-nix'
Plugin 'dense-analysis/ale'
Plugin 'lepture/vim-jinja'

call vundle#end()

filetype plugin indent on

let g:one_allow_italics = 1
silent! colorscheme dracula
hi Normal guibg=NONE ctermbg=NONE

set laststatus=2
set mouse=a
set number
set termencoding=utf-8
set encoding=utf-8

set cursorline
set cursorcolumn
set colorcolumn=80

syntax enable
set background=dark

scriptencoding=utf-8
set virtualedit=onemore
highlight clear LineNr

set backspace=indent,eol,start  " Backspace for dummies
set linespace=0                 " No extra spaces between rows
set nu                          " Line numbers on
set showmatch                   " Show matching brackets/parenthesis
set incsearch                   " Find as you type search
set hlsearch                    " Highlight search terms
set winminheight=0              " Windows can be 0 line high
set ignorecase                  " Case insensitive search
set smartcase                   " Case sensitive when uc present
set wildmenu                    " Show list instead of just completing
set wildmode=list:longest,full  " Command <Tab> completion, list matches, then longest common part, then all.
set whichwrap=b,s,h,l,<,>,[,]   " Backspace and cursor keys wrap too
set scrolljump=5                " Lines to scroll when cursor leaves screen
set scrolloff=3                 " Minimum lines to keep above and below cursor
set foldenable                  " Auto fold code
set modeline
set list

set listchars=tab:›\ ,trail:•,extends:#,nbsp:. " Highlight problematic whitespace"

set nowrap                      " Do not wrap long lines
set autoindent                  " Indent at the same level of the previous line
set expandtab                   " No spaces as tabs
set shiftwidth=4                " Use indents of 4 spaces
set tabstop=4                   " An indentation every four columns
set softtabstop=4               " Let backspace delete indent
set nojoinspaces                " Prevents inserting two spaces after punctuation on a join (J)
set splitright                  " Puts new vsplit windows to the right of the current
set splitbelow                  " Puts new split windows to the bottom of the current
set pastetoggle=<F12>           " pastetoggle (sane indentation on pastes)

set backupdir=/tmp
set directory=/tmp

" Leader
let mapleader = "^"
let maplocalleader = "^"

cmap w!! w !sudo tee > /dev/null %

function! AppendModeline()
  let l:modeline = printf(" vim: set ts=%d sw=%d tw=%d %set :",
        \ &tabstop, &shiftwidth, &textwidth, &expandtab ? '' : 'no')
  let l:modeline = substitute(&commentstring, "%s", l:modeline, "")
  call append(line("$"), l:modeline)
endfunction
nnoremap <silent> <Leader>ml :call AppendModeline()<CR>

