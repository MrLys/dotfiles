syntax on
set encoding=utf-8
""set spell
set number " show line numbers in Vim vim 
set relativenumber " show relative line numbers
let mapleader = "\<Space>"
nnoremap <leader>f z=
nnoremap <leader>s :set spell!<CR>

augroup numbertoggle
  autocmd!
  autocmd BufEnter,FocusGained,InsertLeave * set relativenumber
  autocmd BufLeave,FocusLost,InsertEnter   * set norelativenumber
augroup END

set expandtab
set shiftwidth=4
set softtabstop=4
filetype plugin indent on

call plug#begin('~/.vim/plugged')
Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
Plug 'junegunn/fzf.vim'
Plug 'JamshedVesuna/vim-markdown-preview'
Plug 'nanotech/jellybeans.vim', { 'tag': 'v1.6' } 
Plug 'nightsense/vrunchbang'
Plug 'nightsense/nemo'
Plug 'Zabanaa/neuromancer.vim'
Plug 'beigebrucewayne/hacked_ayu.vim'
Plug 'beigebrucewayne/Turtles'
Plug 'kien/rainbow_parentheses.vim'
Plug 'rakr/vim-one'
Plug 'dim13/smyck.vim'
Plug 'NewProggie/NewProggie-Color-Scheme'
call plug#end()
highlight ColorColumn ctermbg=magenta
"colorscheme jellybeans
"
"colorscheme vrunchbang-dark
"
"let g:vrunchbang_dark_CursorLineNr = 'off'
"let g:vrunchbang_dark_LineNr = 'off'

" Nemo-dark
"colorscheme nemo-dark
"let g:nemo_dark_CursorLineNr = 'off'
"let g:nemo_dark_LineNr = 'off'

" Hacked Ayu
"colorscheme hacked_ayu

"  Neuromancer
"colorscheme neuromancer

"colorscheme one
"set background=dark " for the dark version
" set background=light " for the light version

"colorscheme test2
"colorscheme sahara_modified
"colorscheme untanned_anna_final
"colorscheme newproggie
colorscheme turtles
"" set in vimrc/init.vim
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
