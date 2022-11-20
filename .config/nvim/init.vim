set nocompatible                      " disable compatibility to old-time vi
set showmatch                         " show matching brackets.
set ignorecase                        " case insensitive matching
"set mouse=a                          " middle-click paste with mouse
set nohlsearch                        " no highlighting on searching

"Tabs and spaces here
set expandtab                         " convert tabs to spaces
set tabstop=2                         " number of columns occupied by a tab character
set softtabstop=2                     " see multiple spaces as tabstops so <BS> does the right thing
set shiftwidth=2                      " width for autoindents
set autoindent                        " indent a new line the same amount as the line just typed
set number                            " add line numbers
set wildmode=longest,list,full        " get bash-like tab completions
filetype plugin indent on             " allows auto-indenting depending on file type
syntax enable                             " syntax highlighting
set shortmess+=I                      " Avoiding the 'Hit ENTER to continue' prompts
set relativenumber                    " Set relative line number
set smartcase                         " match different cases while searching
colorscheme torte 

set splitbelow splitright             " split in a good manner

set formatoptions-=cro                " Don't follow comment on next line

let mapleader = ","                   "Map leader

"Easy window navigation
map <C-h> <C-w>h
map <C-j> <C-w>j
map <C-k> <C-w>k
map <C-l> <C-w>l

"for saving and quitting
nnoremap <leader><leader> :w<CR>
nnoremap <leader>q :q!<CR>

"for panes split
nnoremap <leader>\ :vsplit 
nnoremap <leader>- :horizontal split


" Give more height for displaying messages.
set cmdheight=1

" Having longer updatetime (default is 4000 ms = 4 s) leads to noticeable
" delays and poor user experience.
set updatetime=300


"Theme
colorscheme monokai
