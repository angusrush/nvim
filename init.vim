" File:   init.vim
" Github: https://github.com/angusrush/nvim

""""""""""""""""""""""""""""""""""""""""""""""""""
" General settings
""""""""""""""""""""""""""""""""""""""""""""""""""

" Load plugins with vim-plug {{{

call plug#begin(stdpath('data').'/plugged')
Plug 'arcticicestudio/nord-vim'
Plug 'sirver/ultisnips'
Plug 'PotatoesMaster/i3-vim-syntax'
Plug 'tpope/vim-dispatch'
Plug 'radenling/vim-dispatch-neovim'
Plug 'ludovicchabant/vim-gutentags'
Plug 'tpope/vim-repeat'
Plug 'tpope/vim-fugitive'
Plug 'justinmk/vim-sneak'
Plug 'tpope/vim-surround'
Plug 'lervag/vimtex'
Plug 'bronson/vim-visual-star-search'
Plug 'tommcdo/vim-lion'
Plug 'prendradjaja/vim-vertigo'
Plug 'vimwiki/vimwiki'
Plug 'nvim-lualine/lualine.nvim'
Plug 'kyazdani42/nvim-web-devicons'
Plug 'ryanoasis/vim-devicons'
Plug 'ms-jpq/chadtree', {'branch': 'chad', 'do': 'python3 -m chadtree deps'}
Plug 'nvim-treesitter/nvim-treesitter', {'do': ':TSUpdate'}
Plug 'Vimjas/vim-python-pep8-indent'

call plug#end()

" }}}

" General settings {{{

set breakindent                " Wrapped text respects indentation
set display=lastline           " Show beginning of a line which ends below the screen
set expandtab                  " Tabs are spaces
set linebreak                  " Intelligent line breaks
set number                     " Enabling both of these...
set relativenumber             "     sets the current number as absolute
set scrolloff=3                " Don't let the cursor get to the bottom of the screen
set spelllang=en               " I speak english
set tabstop=4                  " 4 visual spaces per tab
set undodir=$HOME/.config/nvim/undo    " Where to save undo histories
set undofile                   " Enable persistent undo
set undolevels=1000            " How many undos
set undoreload=10000           " Number of lines to save for undo
set mouse=a                    " Mouse wheel should scroll the buffer
set wildmode=longest,full " Tab completion should behave like in zsh

if has('nvim')
  set inccommand=nosplit         " Show substitute changes live
  set wildoptions=pum
  set pumblend=20
endif

" I can't envision a use case for ex mode
nnoremap Q <nop>

" I often don't let go of shift in time
command! WQ wq
command! Wq wq
command! W w
command! Q q

" }}}

" Appearance {{{

" Nord color scheme (https://github.com/arcticicestudio/nord)
let g:nord_italic = 1
let g:nord_italic_comments = 1
colorscheme nord

" Trying out no statusline
"set noshowmode
"set laststatus=0
"set noshowcmd


" }}}

" Navigation {{{

if has('nvim')
  " Terminal mappings
  au TermOpen * setlocal nonumber norelativenumber
  tnoremap <M-n> <C-\><C-n>
  tnoremap <M-h> <C-\><C-n><C-w>h
  tnoremap <M-j> <C-\><C-n><C-w>j
  tnoremap <M-k> <C-\><C-n><C-w>k
  tnoremap <M-l> <C-\><C-n><C-w>l
  tnoremap <M-H> <C-\><C-n><C-w>H
  tnoremap <M-J> <C-\><C-n><C-w>J
  tnoremap <M-K> <C-\><C-n><C-w>K
  tnoremap <M-L> <C-\><C-n><C-w>L

  " Buffer navigation mappings
  nnoremap <M-h> <C-w>h
  nnoremap <M-j> <C-w>j
  nnoremap <M-k> <C-w>k
  nnoremap <M-l> <C-w>l
  nnoremap <M-H> <C-w>H
  nnoremap <M-J> <C-w>J
  nnoremap <M-K> <C-w>K
  nnoremap <M-L> <C-w>L
endif

" Use <C-p> and <C-n> to cycle through commands
cnoremap <C-p> <Up>
cnoremap <C-n> <Down>

" Move by wrapped lines, but only if no count is provided
noremap <silent> <expr> j (v:count? 'j' : 'gj')
noremap <silent> <expr> k (v:count? 'k' : 'gk')

" }}}

" Shortcuts and keymaps {{{

" Use <Space> as leader
nmap <Space> <NOP>
let mapleader = "\<Space>"

" Switch buffers efficiently
nnoremap <leader>b :ls<CR>:b<Space>

" Search open buffer with vimgrep
nnoremap <leader>Z :vimgrep // %<Left><Left><Left>

" Command to get rid of trailing spaces
nnoremap <leader>s :silent! %s/\s\+$//e \| set nohlsearch<CR>

" Leader map for :find
nnoremap <leader>f :find *

" Toggle relative numbers
function ToggleRelativeNumbers()
  if &relativenumber == 1
    set norelativenumber
  else
    set relativenumber
    set number
  endif
endfunc

nnoremap <silent> <leader>r :call ToggleRelativeNumbers()<CR>

" Change directory to that of current file
nnoremap <leader>cd :cd %:p:h<CR>:pwd<CR>

" print highlight group under cursor
nmap <leader>sp :call <SID>SynStack()<CR>
function! <SID>SynStack()
  if !exists("*synstack")
    return
  endif
  echo map(synstack(line('.'), col('.')), 'synIDattr(v:val, "name")')
endfunc

" Remove highlighting after a search
nnoremap <silent><C-c> :nohls<CR>
inoremap <silent><C-c> <C-o>:nohls<CR>

" Yank should behave like d
map Y y$

nnoremap <leader>co :copen<CR>
nnoremap <leader>cc :cclose<CR>


" }}}

" Folding {{{

" Allow folding in init.vim
augroup filetype_vim
  autocmd!
  autocmd FileType vim setlocal foldmethod=marker
augroup END

" }}}

" Abbreviations {{{

iabbrev chian chain
iabbrev categoires categories
iabbrev abelina abelian
iabbrev taht that
iabbrev htat that
iabbrev inforamtion information
iabbrev funtcion function
iabbrev funtcions functions
iabbrev scuh such

" }}}

""""""""""""""""""""""""""""""""""""""""""""""""""
" Plugin stuff
""""""""""""""""""""""""""""""""""""""""""""""""""

" General settings {{{
filetype on         " detect the filetype of the file you're editing
filetype plugin on  " Load the corresponding ftplugin file
filetype indent on  " Load the corresponding indent file
" }}}

" {{{ Sneak

" 1-character enhanced 'f'
nmap f <Plug>Sneak_f
nmap F <Plug>Sneak_F
" visual-mode
xmap f <Plug>Sneak_f
xmap F <Plug>Sneak_F
" operator-pending-mode
omap f <Plug>Sneak_f
omap F <Plug>Sneak_F

" 1-character enhanced 't'
nmap t <Plug>Sneak_t
nmap T <Plug>Sneak_T
" visual-mode
xmap t <Plug>Sneak_t
xmap T <Plug>Sneak_T
" operator-pending-mode
omap t <Plug>Sneak_t
omap T <Plug>Sneak_T

" change highlight to something less hideous
autocmd ColorScheme * hi! link Sneak Search
" }}}

" {{{ Lualine

lua << END
require('lualine').setup {
  options = {
    icons_enabled = true,
    theme = 'auto',
    component_separators = { left = '', right = ''},
    section_separators = { left = '', right = ''},
    disabled_filetypes = {},
    always_divide_middle = true,
    globalstatus = false,
  },
  sections = {
    lualine_a = {'mode'},
    lualine_b = {'branch', 'diff', 'diagnostics'},
    lualine_c = {'filename'},
    lualine_x = {'encoding', 'fileformat', 'filetype'},
    lualine_y = {'progress'},
    lualine_z = {'location'}
  },
  inactive_sections = {
    lualine_a = {},
    lualine_b = {},
    lualine_c = {'filename'},
    lualine_x = {'location'},
    lualine_y = {},
    lualine_z = {}
  },
  tabline = {},
  extensions = {}
}

END

" }}}

" {{{ Fugitive

nnoremap <leader>v <cmd>CHADopen<cr>
nnoremap <leader>l <cmd>call setqflist([])<cr>

" }}}

" {{{ Gutentags

let g:gutentags_exclude_project_root=["~/.config/nvim"]

if !has('nvim')
  let g:gutentags_enabled = 0
endif

" }}}

" {{{ Fugitive

nnoremap <leader>ca :Gcommit -am ""<Left>

" }}}

" {{{ HardTime

let g:list_of_insert_keys = ["<UP>", "<DOWN>", "<LEFT>", "<RIGHT>", "<BS><BS>"]

" }}} 

" {{{ Treesitter

lua <<EOF
require'nvim-treesitter.configs'.setup {
  highlight = {
  enable = true,
  disable = {"latex"}},

  incremental_selection = {
  enable = true,
  keymaps = {
    init_selection = "gnn",
    node_incremental = "grn",
    scope_incremental = "grc",
    node_decremental = "grm"}},

  indent = {enable = true}
}
EOF
"lua require("testing")

" }}}

" {{{ UltiSnips

nnoremap <leader>ue :UltiSnipsEdit<CR>
let g:UltisnipsExpandTrigger="<C-j>"

" }}}

" Vimtex {{{

" sets grep to always generate a file-name.
set grepprg=grep\ -nH\ $*

" }}}

" Vertigo {{{

nnoremap <silent> <Space>j :<C-U>VertigoDown n<CR>
vnoremap <silent> <Space>j :<C-U>VertigoDown v<CR>
onoremap <silent> <Space>j :<C-U>VertigoDown o<CR>
nnoremap <silent> <Space>k :<C-U>VertigoUp n<CR>
vnoremap <silent> <Space>k :<C-U>VertigoUp v<CR>
onoremap <silent> <Space>k :<C-U>VertigoUp o<CR>

" }}}
