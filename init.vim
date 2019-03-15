" General settings {{{

" Pathogen automatically loads plugins
execute pathogen#infect()

set breakindent                " Wrapped text respects indentation
set display=lastline           " Show beginning of a line which ends below the screen
set expandtab                  " Tabs are spaces
set inccommand=nosplit         " Show substitute changes live
set linebreak                  " Intelligent line breaks
set number                     " Enabling both of these...
set relativenumber             "     sets the current number as absolute
set scrolloff=3                " Don't let the cursor get to the bottom of the screen
set spelllang=en               " I speak english
set tabstop=4                  " 4 visual spaces per tab
set undodir=$HOME/.vim/undo    " Where to save undo histories
set undofile                   " Enable persistent undo
set undolevels=1000            " How many undos
set undoreload=10000           " Number of lines to save for undo
set mouse=a                    " Mouse wheel should scroll the buffer
set wildmode=longest:list,full " Tab completion should behave like in the terminal

" Use <Space> as leader
nnoremap <Space> <NOP>
let mapleader = "\<Space>"

" I like this colorscheme
set termguicolors
let g:nord_comment_brightness = 15
let g:nord_italic = 1
let g:nord_italic_comments = 1
colorscheme nord

" Switch buffers efficiently
nnoremap <leader>b :ls<CR>:b<Space>

" Search open buffer with vimgrep
nnoremap <leader>Z :vimgrep // %<Left><Left><Left>

" Trying out no statusline
set noshowmode
set laststatus=0
set noshowcmd

" I can't envision a use case for ex mode
nnoremap Q <nop>

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

" Command to get rid of trailing spaces
nnoremap <leader>s :silent! %s/\s\+$//e \| set nohlsearch<CR>

" I often don't let go of shift in time
command WQ wq
command Wq wq
command W w
command Q q

" Remove highlighting after a search
nnoremap <silent><C-c> :nohls<CR>
inoremap <silent><C-c> <C-o>:nohls<CR>

" Yank should behave like d
map Y y$

" Use <C-p> and <C-n> to cycle through commands
cnoremap <C-p> <Up>
cnoremap <C-n> <Down>

" Allow folding in init.vim
augroup filetype_vim
  autocmd!
  autocmd FileType vim setlocal foldmethod=marker
augroup END

" Move by wrapped lines, but only if no count is provided
noremap <silent> <expr> j (v:count? 'j' : 'gj')
noremap <silent> <expr> k (v:count? 'k' : 'gk')

" Leader map for :find
nnoremap <leader>f :find *

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

" }}}

" Plugin stuff {{{
"
" this makes vim detect the filetype of the file you're editing
" based on the extension
filetype on

" Loads the corresponding ftplugin file
filetype plugin on

" Loads the corresponding indent file
filetype indent on

" {{{ sneak

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

" {{{ gutentags

let g:gutentags_exclude_project_root=["~/.config/nvim"]

" }}}

" {{{ ultisnips

nnoremap <leader>ue :UltiSnipsEdit<CR>
let g:UltisnipsExpandTrigger="<enter>"

" }}}

" Vimtex {{{

" sets grep to always generate a file-name.
set grepprg=grep\ -nH\ $*

" changes the default filetype back to 'tex'
let g:tex_flavor='latex'

" }}}

" }}}
