"Package manager for installing plugins through vimrc
packadd minpac
call minpac#init({'package_name':'bundle'})
command! PackClean call minpac#clean()
command! PackUpdate call minpac#update()
command! PackStatus call minpac#status()

"Fuzzy finder
call minpac#add('junegunn/fzf')

"NERDTree file tree
call minpac#add('scrooloose/nerdtree')

"MRU - most recently used files
call minpac#add('yegappan/mru')

"Vitality - autosave vim buffer whenever navigating away
call minpac#add('sjl/vitality.vim')

"Vim-tmux-runner - Send commands from vim to tmux
call minpac#add('christoomey/vim-tmux-runner')

"Tmux-Navigator - navigate easily around tmux
call minpac#add('christoomey/vim-tmux-navigator')

"Vim-dispatch - run test process in tmux buffer
call minpac#add('tpope/vim-dispatch')

"Vim-projectionist - easily switch to test files
call minpac#add('tpope/vim-projectionist')

"Vim-obsession - save vim session state
call minpac#add('tpope/vim-obsession')

"Vim-surround - change surrounding quotes etc
call minpac#add('tpope/vim-surround')

"Vim-rails - helpful rails commands
call minpac#add('tpope/vim-rails')

"Vim-test - run your tests at the speed of thought
call minpac#add('janko/vim-test')

"Ale - auto-linting
call minpac#add('w0rp/ale')

"Grepper - project-wide search
call minpac#add('mhinz/vim-grepper')

"Vim-commentary - Easily comment/uncomment lines and blocks
call minpac#add('tpope/vim-commentary')

"NERDTree - git status in file tree
call minpac#add('Xuyuanp/nerdtree-git-plugin')

"Vim-gitgutter - show git changes
call minpac#add('airblade/vim-gitgutter')

"Vim-fugitive
call minpac#add('tpope/vim-fugitive')

call minpac#add('sheerun/vim-polyglot')

call minpac#add('farmergreg/vim-lastplace')

call minpac#add('andymass/vim-matchup')

call minpac#add('honza/vim-snippets')
call minpac#add('epilande/vim-es2015-snippets')
call minpac#add('epilande/vim-react-snippets')
call minpac#add('SirVer/ultisnips')

let g:UltiSnipsExpandTrigger="<C-s>"

syntax on
syntax enable
filetype plugin indent on
set timeoutlen=1000 ttimeoutlen=10
set hlsearch
set number
"set relativenumber
set autoindent
set showcmd
set incsearch
set expandtab
set ts=2
set sw=2
set laststatus=2
set backspace=indent,eol,start
au FocusLost * silent! wa
let mapleader=","

"fuzzy file finder
set path+=**
set wildmenu

"tag jumping
command! MakeTags !ctags -R --exclude=node_modules

"file browsing
nnoremap <C-n> :NERDTreeToggle<CR>
nnoremap f<C-n> :NERDTreeFind<CR>
let NERDTreeQuitOnOpen = 1
let NERDTreeMinimalUI = 1

"Quote all lines in a file
nnoremap <leader>qls :s%/^\(.*\)$/"\1"/g<CR>

nnoremap <C-h> <C-w>h
nnoremap <C-l> <C-w>l
nnoremap <C-j> <C-w>j
nnoremap <C-k> <C-w>k

"VimTest shortcuts
nmap <silent> t<C-n> :w<CR>:TestNearest<CR>
nmap <silent> t<C-f> :w<CR>:TestFile<CR>
nmap <silent> t<C-s> :w<CR>:TestSuite<CR>
nmap <silent> t<C-l> :w<CR>:TestLast<CR>
nmap <silent> t<C-g> :w<CR>:TestVisit<CR>

"Invoke fuzzy file finder
nnoremap <C-p> :<C-u>FZF<CR>
let $FZF_DEFAULT_COMMAND='rg --files'

"Strip trailing whitespace before save on listed filetypes
autocmd BufWritePre *.rb,*.js,*.yml,*.css,*.j2 %s/\s\+$//e

"Highlight trailing whitespace when leaving insert mode
:au InsertEnter * match Error /\s\+\%#\@<!$/
:au InsertLeave * match Error /\s\+$/

nnoremap <leader><leader> <C-^>
nnoremap <leader>m :MRU<CR>

"Share system clipboard
set clipboard=unnamed

"Use %% as a shortcut for current directory
cnoremap %% <C-R>=expand('%:h').'/'<cr>

"Remove delay from escaping
set noesckeys


"Shortcut for opening a file in the current directory
map <leader>e :edit %%

let g:ale_set_highlights = 0

"Load vim-test output into quickfix list
" Run in Tmux in background, then drop output in vim quickfix
"let test#strategy="dispatch"

" Run tests in separate Tmux pane
let test#strategy="vtr"
let g:rspec_command = "VtrSendCommand! bin/rspec {spec}"
nnoremap <leader>t :VtrFocusRunner<CR>

"Use ripgrep over grep in vim
set grepprg=rg\ -H\ --no-heading\ --vimgrep
set grepformat=$f:$l:%c:%m
let g:grepper = {}
let g:grepper.tools = ['rg']

"Search for the current word
nnoremap <Leader>* :Grepper -cword -noprompt<CR>

"Get into search prompt
nmap <Leader>f :GrepperRg<space>

"Search for the current selection
nmap gs <plug>(GrepperOperator)
xmap gs <plug>(GrepperOperator)

"Linting, use `eslint` for JavaScript, use `rubocop` for Ruby
let g:ale_linters = {
\  'javascript': ['eslint'],
\  'ruby': ['rubocop'],
\  }
let g:ale_lint_on_text_changed = 'never'
let g:ale_sign_column_always = 1

nmap <silent> [W <Plug>(ale_first)
nmap <silent> [w <Plug>(ale_previous)
nmap <silent> ]w <Plug>(ale_next)
nmap <silent> ]W <Plug>(ale_last)

" make space toggle comment
nmap <space> gcc
vmap <space> gcc

" putting this at the end fixes the ABCD problemk
nnoremap <C-h> <C-w>h
nnoremap <C-l> <C-w>l
nnoremap <C-j> <C-w>j
nnoremap <C-k> <C-w>k
set nocompatible

" Copy filename
nmap <leader>? :let @*=expand("%:p")<CR>

set ignorecase
set smartcase

" colorscheme monokai-bold
