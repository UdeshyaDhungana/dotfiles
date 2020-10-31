""""""""""""""""Imported from MIT""""""""""""""""""""""""""""""""""""""""""""
set nocompatible            " disable compatibility to old-time vi
set showmatch               " show matching brackets.
set ignorecase              " case insensitive matching
"set mouse=a                 " middle-click paste with mouse
set nohlsearch              " no highlighting on searching

"Tabs and spaces here
set expandtab               " convert tabs to spaces
set tabstop=2               " number of columns occupied by a tab character
set softtabstop=2           " see multiple spaces as tabstops so <BS> does the right thing
set shiftwidth=2            " width for autoindents
set autoindent              " indent a new line the same amount as the line just typed
set number                  " add line numbers
set wildmode=longest,list,full   " get bash-like tab completions
set cc=70                   " set an 70 column border for good coding style
filetype plugin indent on   " allows auto-indenting depending on file type
syntax on                   " syntax highlighting
set shortmess+=I            " Avoiding the 'Hit ENTER to continue' prompts
set relativenumber          " Set relative line number
set smartcase               " match different cases while searching
colorscheme torte 

"Luke
"Split in non retarded manner
set splitbelow splitright

let mapleader = ","         "Map leader

""""""""""""""""""""""" Personal Configuration """""""""""""""""""""""""""""""
"""""""""""LEADERS MAPPINGS

"Easy window navigation
map <C-h> <C-w>h
map <C-j> <C-w>j
map <C-k> <C-w>k
map <C-l> <C-w>l

"for saving
nnoremap <leader><leader> :w<CR>
nnoremap <leader>q :q!<CR>

let g:netrw_liststyle = 3
let g:netrw_banner = 0
let g:netrw_winsize = 20

""""""""""""""""""""""""""""
"swap A and a, because I move to append too frequently,
"nnoremap a A
"nnoremap A a
"I don't use it anymore, it feels un-vim-y

"for vertical split: I use most often
nnoremap <leader>v :vsplit 
nnoremap <leader>e :e 
nnoremap <leader>s :Lexplore<CR>

"""""""""""""""""""""""""""""'PLUGINS"""""""""""""""""""""""""""""""""""""""""
call plug#begin() 

"""""""""  ESSENTIAL PLUGINS  """""""""

"conquerer: autocompletion = ✔️
Plug 'neoclide/coc.nvim', {'branch':'release'}

"Status line
Plug 'itchyny/lightline.vim'

"Brackets matching = ✔️
Plug 'jiangmiao/auto-pairs'

"highlights yanked line = ✔️
Plug 'machakann/vim-highlightedyank'

"surround for vim = ✔️
Plug 'tpope/vim-surround'

"Polyglot = ✔️ 
Plug 'sheerun/vim-polyglot'

"--> Language packs for polyglot
Plug 'rust-lang/rust.vim'
Plug 'vim-python/python-syntax'


"I don't use these anymore
"Plug 'HerringtonDarkholme/yats.vim'
"Plug 'othree/html5.vim'
"Plug 'plasticboy/vim-markdown'
"Plug 'pangloss/vim-javascript'
"Plug 'elzr/vim-json'
"Plug 'MaxMEllon/vim-jsx-pretty'

call plug#end()

"""""""""""""""""""""""""PLUGINS SETTINGS"""""""""""""""""""""""""""""""""""""

"Status line
let g:lightline = {
      \   'active': {
      \   'left': [ [ 'paste' ],
      \             [ 'readonly', 'filename', 'modified', 'cocstatus' ] ]
      \ },
      \ 'component_function': {
      \   'cocstatus': 'coc#status'
      \ },
      \ }

"------------------------------------------------------------------------------
"CONQUERER OF AUTOCOMPLETION
"------

" Use tab for trigger completion with characters ahead and navigate.
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
" position.
if exists('*complete_info')
  inoremap <expr> <cr> complete_info()["selected"] != "-1" ? "\<C-y>" : "\<C-g>u\<CR>"
else
  inoremap <expr> <cr> pumvisible() ? "\<C-y>" : "\<C-g>u\<CR>"
endif

" Use `[g` and `]g` to navigate diagnostics
" Use `:CocDiagnostics` to get all diagnostics of current buffer in location list.
nmap <silent> [g <Plug>(coc-diagnostic-prev)
nmap <silent> ]g <Plug>(coc-diagnostic-next)

" Add `:Format` command to format current buffer.
command! -nargs=0 Format :call CocAction('format')

"Neovim's native status line support
"set statusline^=%{coc#status()}%{get(b:,'coc_current_function','')}

"----------------- NATIVE -------------------------
" Give more height for displaying messages.
set cmdheight=1

" Having longer updatetime (default is 4000 ms = 4 s) leads to noticeable
" delays and poor user experience.
set updatetime=300
"--------------------------------------------------

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

" GoTo code navigation.
nmap <silent> gd <Plug>(coc-definition)
nmap <silent> gy <Plug>(coc-type-definition)
nmap <silent> gi <Plug>(coc-implementation)
nmap <silent> gr <Plug>(coc-references)

"""""""""""""""""""""""""""""""""FUZZY FILE FINDER""""""""""""""""""""""""""""
" Ctrl-f for file finding
nnoremap <silent> <c-i> :FZF<CR>
