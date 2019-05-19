" set indent to 2 spaces
set sw=2

" maplocalleader is also space
let maplocalleader = "\<Space>"

"Search in multi-file project
nnoremap <leader>z :vimgrep // *.tex<Left><Left><Left><Left><Left><Left><Left>

" Zathura settings
let g:vimtex_view_general_viewer = 'zathura'
let g:vimtex_view_method='zathura'
let g:vimtex_compiler_progname = 'nvr'

" Set path and wildignore for easy file opening using :find
set path=~/rc,~/latex/**
set wildignore+=*.aux,*.fdb_latexmk,*.fls,*.log,*.out,*.synctex.gz,*.pdf,tags,*.bcf,*.bbl,*.blg*,*.toc,*.run.xml,core,*.dvi,*.orig,*.tkzparfct.gnuplot,*.png,*.jpg,*_region_*
set wildignorecase

" Change separate line math to inline math
nnoremap <leader>im kk$JDJi$A$JD
nnoremap <leader>dm F$ilcl\begin{equation*}f$xo\end{equation*}k

" Tweak a few compiler settings
let g:vimtex_compiler_latexmk = {
      \ 'backend' : 'nvim',
      \ 'background' : 1,
      \ 'build_dir' : '',
      \ 'callback' : 1,
      \ 'continuous' : 1,
      \ 'executable' : 'latexmk',
      \ 'options' : [
      \   '-verbose',
      \   '-file-line-error',
      \   '-synctex=1',
      \   '-pdf',
      \   '-interaction=nonstopmode',
      \ ],
      \}

" Set tab to space conversion as low as possible
set tabstop=1

" Disable overfull/underfull \hbox and all package warnings
let g:vimtex_quickfix_latexlog = {
      \ 'overfull' : 0,
      \ 'underfull' : 0,
      \}
" one-shot compilation
nnoremap <leader>ls :call vimtex#compiler#compile_ss()<CR>

" augment surround.vim for latex commands
let g:surround_{char2nr('c')} = "\\\1command\1{\r}"
let g:surround_{char2nr('q')} = "`\r'"
let g:surround_{char2nr('Q')} = "``\r''"

" sometimes I don't want to move using visual lines
nnoremap gj j
nnoremap gk k

" compile current document on angus-server; the variable
" b:dispatch is defined in ../after/ftplugin/tex.vim
nnoremap <leader>lr :Dispatch<CR>

" Command for :VimtexToggleMain
nnoremap <leader>tm :VimtexToggleMain<CR>

" Make latex highlighting a bit more interesting
highlight link texBeginEndModifier texDocTypeArgs
highlight link texBeginEndName String
highlight link texInputFile String
highlight link texInputFileOpt Number
highlight link texMathMatcher String
highlight link texMatcher String
highlight link texMatcherNM String
highlight link texOnlyMath healthError
