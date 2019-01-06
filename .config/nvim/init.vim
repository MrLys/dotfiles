syntax on
set encoding=utf-8
""set spell
set number " show line numbers in Vim Vim
set relativenumber " show relative line numbers
set tw=79
let mapleader = "\<Space>"
let vim_markdown_preview_github=1
nnoremap <leader>f z=
nnoremap <leader>s :set spell!<CR>
nnoremap <C-J> <C-W><C-J>
nnoremap <C-K> <C-W><C-K>
nnoremap <C-L> <C-W><C-L>
nnoremap <C-H> <C-W><C-H>
" Go back and fix last misspelled word.
inoremap <C-L> <C-G>u<Esc>[s1z=`]a<C-G>u
" Select last misspelled word.
inoremap <C-K> <Esc>[s<C-G>
" ----- TAB NAVIGATION -----
nnoremap th  :tabfirst<CR>
nnoremap tk  :tabnext<CR>
nnoremap tj  :tabprev<CR>
nnoremap tl  :tablast<CR>
nnoremap tt  :tabedit<Space>
nnoremap tn  :tabnext<Space>
nnoremap tm  :tabm<Space>
nnoremap td  :tabclose<CR>
" Alternatively use
"nnoremap th :tabnext<CR>
"nnoremap tl :tabprev<CR>
"nnoremap tn :tabnew<CR>

augroup numbertoggle
  autocmd!
  autocmd BufEnter,FocusGained,InsertLeave * set relativenumber
  autocmd BufLeave,FocusLost,InsertEnter   * set norelativenumber
augroup END


" automatically remove trailing whitespace before write
function! StripTrailingWhitespace()
  normal mZ
  %s/\s\+$//e
  if line("'Z") != line(".")
    echo "Stripped whitespace\n"
  endif
  normal `Z
endfunction
autocmd BufWritePre *.{cpp,hpp,i,py,java,c,md,yml,vim} :call StripTrailingWhitespace()


set expandtab
set shiftwidth=4
set softtabstop=4
set wrap linebreak nolist
filetype plugin indent on

call plug#begin('~/.vim/plugged')
Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
Plug 'junegunn/fzf.vim' " Fuzzy finder.
Plug 'vimwiki/vimwiki'
Plug 'leafgarland/typescript-vim' " Typescript syntax.
Plug 'JamshedVesuna/vim-markdown-preview'
Plug 'beigebrucewayne/Turtles' " color scheme
Plug 'kien/rainbow_parentheses.vim'
Plug 'rakr/vim-one' " Color scheme
Plug 'tpope/vim-surround'
Plug 'tpope/vim-commentary' " Comment out things.
Plug 'tpope/vim-fugitive'   " git Gstatus, GEdit, Gdiff.
Plug 'tpope/vim-airline'
Plug 'tpope/vim-fireplace'  " clojure nREPL
Plug 'clojure-emacs/cider-nrepl' " for clojure nREPL
Plug 'guns/vim-clojure-static'
call plug#end()
highlight ColorColumn ctermbg=magenta
colorscheme turtles

let g:rbpt_colorpairs = [
    \ ['brown',       'RoyalBlue3'],
    \ ['Darkblue',    'SeaGreen3'],
    \ ['darkgray',    'DarkOrchid3'],
    \ ['darkgreen',   'firebrick3'],
    \ ['darkcyan',    'RoyalBlue3'],
    \ ['darkred',     'SeaGreen3'],
    \ ['darkmagenta', 'DarkOrchid3'],
    \ ['brown',       'firebrick3'],
    \ ['gray',        'RoyalBlue3'],
    \ ['darkmagenta', 'DarkOrchid3'],
    \ ['Darkblue',    'firebrick3'],
    \ ['darkgreen',   'RoyalBlue3'],
    \ ['darkcyan',    'SeaGreen3'],
    \ ['darkred',     'DarkOrchid3'],
    \ ['red',         'firebrick3'],
    \ ]

let g:rbpt_max = 16
let g:rbpt_loadcmd_toggle = 0

augroup RainbowParens
 au!
 au VimEnter * RainbowParenthesesToggle
 au Syntax * RainbowParenthesesLoadRound
 au Syntax * RainbowParenthesesLoadSquare
 au Syntax * RainbowParenthesesLoadBraces
augroup END

" Uncomment the following to have Vim jump to the last position when
" reopening a file
if has("autocmd")
  au BufReadPost * if line("'\"") > 1 && line("'\"") <= line("$") | exe "normal! g'\"" | endif
endif
