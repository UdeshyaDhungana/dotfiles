""""""""""""""""Imported from MIT""""""""""""""""""""""""""""""""""""""""""""
set nocompatible            " disable compatibility to old-time vi
set showmatch               " show matching brackets.
set ignorecase              " case insensitive matching
set mouse=v                 " middle-click paste with mouse
set hlsearch                " highlight search results
"Tabs and spaces her
set expandtab
set tabstop=2               " number of columns occupied by a tab character
set softtabstop=2           " see multiple spaces as tabstops so <BS> does the right thing
set shiftwidth=2            " width for autoindents
set autoindent              " indent a new line the same amount as the line just typed
set number                  " add line numbers
set wildmode=longest,list   " get bash-like tab completions
set cc=80                   " set an 80 column border for good coding style
filetype plugin indent on   " allows auto-indenting depending on file type
syntax on                   " syntax highlighting
set shortmess+=I
set relativenumber
set laststatus=2
set smartcase
set showtabline=2
set termguicolors

"COLOR_SCHEME
set background=light
colorscheme monokai_pro 
"colorscheme solarized

"Map leader
let mapleader = ","

""""""""""""""""""""""" Personal Configuration """""""""""""""""""""""""""""""

"Tab switching keystrokes
ca tn tabnew

" move to the previous/next tabpage.
nnoremap <C-j> gT
nnoremap <C-k> gt

" " Go to last active tab 
au TabLeave * let g:lasttab = tabpagenr()
nnoremap <silent> <c-l> :exe "tabn ".g:lasttab<cr>
vnoremap <silent> <c-l> :exe "tabn ".g:lasttab<cr>

"AUTO BRACKET CLOSE

"One liners
inoremap [ []<left>
inoremap { {}<left>
inoremap ( ()<left>

"multi line without terminator
inoremap {<CR> {<CR>}<ESC>O
inoremap (<CR> (<CR>)<ESC>O
inoremap [<CR> [<CR>]<ESC>O

"multi line terminating with semicolon
inoremap {;<CR> {<CR>};<ESC>O
inoremap (;<CR> (<CR>);<ESC>O
inoremap [;<CR> [<CR>];<ESC>O

"multi line terminating with comma
inoremap {,<CR> {<CR>},<ESC>O
inoremap (,<CR> (<CR>),<ESC>O
inoremap [,<CR> [<CR>],<ESC>O

"especially for dart
inoremap ({<CR> (){<CR>}<ESC>O

"for saving, :wq, :w, :x aren't productive
nnoremap <leader>w :w<CR>
nnoremap <leader>x :x<CR>
nnoremap <leader>q :q!<CR>

"no highlighting
nnoremap <leader>n :noh<CR>

"""""""""""""""""""""""""""""'PLUGINS"""""""""""""""""""""""""""""""""""""""""
call plug#begin()
"conquerer: autocompletion = ✔️
Plug 'neoclide/coc.nvim', {'branch':'release'}

"Polyglot = ✔️ 
Plug 'sheerun/vim-polyglot'

"status bar = ✔️
Plug 'itchyny/lightline.vim'

"highlights yanked line = ✔️
Plug 'machakann/vim-highlightedyank'

"nerdtree = ✔️
Plug 'preservim/nerdtree'

"dart and flutter plugins = ✔️
Plug 'dart-lang/dart-vim-plugin'

"multiple cursors = ✔️
Plug 'terryma/vim-multiple-cursors'

"surround for vim = ✔️
Plug 'tpope/vim-surround'

"fzf file finder = ✔️
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'junegunn/fzf.vim'

call plug#end()

"""""""""""""""""""""""""PLUGINS SETTINGS"""""""""""""""""""""""""""""""""""""

"NERDTREE
let g:NERDTreeWinPos = "right"
autocmd VimEnter * NERDTree | wincmd p
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif

:map <leader>l <C-w>l
:map <leader>k <C-w>k
:map <leader>j <C-w>j
:map <leader>h <C-w>h

"CONQUERER OF AUTOCOMPLETION
"------
" Use tab for trigger completion with characters ahead and navigate.
" NOTE: Use command ':verbose imap <tab>' to make sure tab is not mapped by
" other plugin before putting this into your config.
inoremap <silent><expr> <TAB>
			\ pumvisible() ? "\<C-n>" :
			\ <SID>check_back_space() ? "\<TAB>" :
			\ coc#refresh()
inoremap <expr><S-TAB> pumvisible() ? "\<C-p>" : "\<C-h>"

function! s:check_back_space() abort
	let col = col('.') - 1
	return !col || getline('.')[col - 1]  =~# '\s'
endfunction

" Use <cr> to confirm completion, `<C-g>u` means break undo chain at current
" position. Coc only does snippet and additional edit on confirm.
" <cr> could be remapped by other vim plugin, try `:verbose imap <CR>`.
if exists('*complete_info')
  inoremap <expr> <cr> complete_info()["selected"] != "-1" ? "\<C-y>" : "\<C-g>u\<CR>"
else
  inoremap <expr> <cr> pumvisible() ? "\<C-y>" : "\<C-g>u\<CR>"
endif

" Give more height for displaying messages.
set cmdheight=2

" Having longer updatetime (default is 4000 ms = 4 s) leads to noticeable
" delays and poor user experience.
set updatetime=300

" Applying codeAction to the selected region.
" Example: `<leader>aap` for current paragraph
xmap <leader>a  <Plug>(coc-codeaction-selected)
nmap <leader>a  <Plug>(coc-codeaction-selected)

" Use K to show documentation in preview window.
nnoremap <silent> K :call <SID>show_documentation()<CR>
function! s:show_documentation()
	if (index(['vim','help'], &filetype) >= 0)
		execute 'h '.expand('<cword>')
	else
		call CocAction('doHover')
	endif
endfunction

" Formatting selected code.
xmap <leader>f  <Plug>(coc-format-selected)
nmap <leader>f  <Plug>(coc-format-selected)

" Show commands: LIFE SAVER
nnoremap <silent><nowait> <leader>c  :<C-u>CocList commands<cr>
"""""""""""""""""""""""""""""""""FUZZY FILE FINDER""""""""""""""""""""""""""""
" Ctrl-f for file finding
nnoremap <silent> <C-f> :Files<CR>
