filetype plugin indent on
set background=dark
syntax enable

set encoding=utf8
set title
set nu
set relativenumber
set nowrap
set ignorecase
set smartcase
set incsearch
set tabstop=4
set softtabstop=4
set expandtab
set smarttab
set autoindent
set wildmenu
set noswapfile
set undofile
set undodir=~/.config/nvim/undodir
set clipboard=unnamedplus
set noshowmode
set tags=./tags;/

let mapleader = " " " map leader to Space

nnoremap <C-c> yy
inoremap <C-c> yy
vnoremap <C-c> yy

nnoremap J <NOP>

noremap <Up> <NOP>
noremap <Down> <NOP>
noremap <Left> <NOP>
noremap <Right> <NOP>
"inoremap <Up> <NOP>
"inoremap <Down> <NOP>
inoremap <Left> <NOP>
inoremap <Right> <NOP>

inoremap {<CR> {<CR>}<Esc>ko
inoremap < <><Esc>i

" nnoremap <C-t> :NERDTree<CR>
nnoremap <C-n> :NERDTreeFocus<CR>
nnoremap <C-t> :NERDTreeToggle<CR>
nnoremap <C-f> :Rg<CR>

"fzf
map <C-p> :Files<CR>
nmap <leader>; :Buffers<CR>

"quick save
nmap <leader>w :W<CR>

"coc autocomplete navigation
inoremap <expr> <Tab> pumvisible() ? "\<C-n>" : "\<Tab>"
inoremap <expr> <S-Tab> pumvisible() ? "\<C-p>" : "\<S-Tab>"
inoremap <expr> <cr> pumvisible() ? "\<C-y>" : "\<C-g>u\<CR>"

"search item must appear in the middle of the screen
nnoremap <silent> n nzz
nnoremap <silent> N Nzz
nnoremap <silent> * *zz
nnoremap <silent> # #zz
nnoremap <silent> g* g*zz

command W w
command Wq wq

call plug#begin()

Plug 'base16-project/base16-vim'

Plug 'dense-analysis/ale'
Plug 'rust-lang/rust.vim'
Plug 'neoclide/coc.nvim', {'branch': 'release'}

Plug 'preservim/nerdtree'
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'ryanoasis/vim-devicons'

Plug 'airblade/vim-rooter'
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'junegunn/fzf.vim'

Plug 'nvim-treesitter/nvim-treesitter', {'do': ':TSUpdate'}

Plug 'mbbill/undotree'

Plug 'machakann/vim-highlightedyank'

call plug#end()

lua << END
require 'nvim-treesitter.configs'.setup {
  ensure_installed = { "help", "javascript", "c", "cpp", "lua", "rust" },

  sync_install = false,

  auto_install = true,

  highlight = {
    enable = true,

    additional_vim_regex_highlighting = false,
  },
}
END

nnoremap <F5> :UndotreeToggle<CR>

" let g:ale_rust_cargo_use_clippy = 1
let g:rustfmt_autosave = 1

let g:NERDTreeWinSize=25
" let g:NERDTreeDirArrowExpandable = '+'
" let g:NERDTreeDirArrowCollapsible = '-'
let g:NERDTreeHighlightFolders = 1 " enables folder icon highlighting using exact match
let g:NERDTreeHighlightFoldersFullName = 1 " highlights the folder name



let g:airline_powerline_fonts = 1
" let g:airline#extensions#tabline#enabled = 1
let g:airline#extensions#hunks#enabled=0
let g:airline#extensions#branch#enabled=1
let g:airline_theme='base16_gruvbox_dark_hard'

" for normal alacritty sessions
let &t_8f = "\<Esc>[38:2:%lu:%lu:%lum"
let &t_8b = "\<Esc>[48:2:%lu:%lu:%lum"
set t_Co=256
let base16colorspace=256  " Access colors present in 256 colorspace
colorscheme base16-gruvbox-dark-hard
set termguicolors

" for tmux sessions
if &term =~ '256color'
  " Enable true (24-bit) colors instead of (8-bit) 256 colors.
  " :h true-color
  if has('termguicolors')
    let &t_8f = "\<Esc>[38;2;%lu;%lu;%lum"
    let &t_8b = "\<Esc>[48;2;%lu;%lu;%lum"
    set termguicolors
  endif
  colorscheme base16-gruvbox-dark-hard
endif

let g:highlightedyank_highlight_duration = 1000
