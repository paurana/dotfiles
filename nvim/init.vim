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
set shiftwidth=4
set expandtab
set smarttab
set autoindent
set cindent
set wildmenu
set noswapfile
set undofile
set undodir=~/.config/nvim/undodir
set clipboard=unnamedplus
set noshowmode
set tags=./tags;/

let mapleader = " " " map leader to Space

"works as intended
function! AutoFormatCurly()
    execute "normal! $o}"
    execute "normal! %a\<CR>\<Esc>"
    execute "normal! k$=%j"
endfunction

inoremap { {<Esc>:call AutoFormatCurly()<CR>i
" inoremap {<CR> {<CR>}<Esc>ko

autocmd filetype cpp nnoremap <F9> :w <bar> !g++ -Wall -Wno-unused-result -std=c++17 -O2 % -o %:r<CR>
command! InsertCppTemplate execute '0r ~/codeforces/template.cpp'

"doesn't work atm
tnoremap <Esc> <C-\><C-n>

noremap <C-n> :NvimTreeToggle<CR>
nnoremap <C-f> :Rg<CR>

nmap <leader>; :Buffers<CR>

"quick save
nmap <leader>w :W<CR>

"ctrl + / to clear search highlight
noremap <silent> <c-_> :let @/ = ""<CR>

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

"jump cursor to //++ placeholder
nnoremap <Space><Tab> <Esc>/\/\/++<Enter>"_c4l

nnoremap <F3> :UndotreeToggle<CR>

command Q q
command W w
command Wq wq

call plug#begin()

Plug 'base16-project/base16-vim'
Plug 'dense-analysis/ale'
Plug 'rust-lang/rust.vim'
Plug 'neoclide/coc.nvim', {'branch': 'release'}
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'airblade/vim-rooter'
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'junegunn/fzf.vim'
Plug 'nvim-treesitter/nvim-treesitter', {'do': ':TSUpdate'}
Plug 'nvim-tree/nvim-web-devicons'
Plug 'nvim-tree/nvim-tree.lua'
Plug 'mbbill/undotree'
Plug 'machakann/vim-highlightedyank'
Plug 'blazkowolf/gruber-darker.nvim'

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

require("nvim-tree").setup({
  sort_by = "case_sensitive",
  view = {
    width = 30,
  },
  renderer = {
    group_empty = true,
  },
})
END

let g:loaded_netrw = 1
let g:loaded_netrwPlugin = 1

let g:rustfmt_autosave = 1

let g:airline_powerline_fonts = 1
let g:airline#extensions#hunks#enabled=0
let g:airline#extensions#branch#enabled=1
let g:airline_theme='base16_gruvbox_dark_hard'

" for normal alacritty sessions
let &t_8f = "\<Esc>[38:2:%lu:%lu:%lum"
let &t_8b = "\<Esc>[48:2:%lu:%lu:%lum"
set t_Co=256
let base16colorspace=256  " Access colors present in 256 colorspace
" colorscheme gruber-darker
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
