" let mapleader = ' '

" set nu
" set rnu

" set showmode
" set showcmd


" set scrolloff=5
" set backspace=indent,eol,start
nnoremap <Up> g<Up>
nnoremap <Down> g<Down>
vnoremap <C-d> <C-d>zz
vnoremap <C-u> <C-u>zz

" Unfold region when searching
nnoremap 'n', 'nzv'
nnoremap 'N', 'Nzv'
" Move selected lines up/down, like alt-up/down in vscode
vnoremap 'J' ":m '>+1<CR>gv=gv"
vnoremap 'K' ":m '<-2<CR>gv=gv"
" Keep cursor in same spot when combining lines
nnoremap 'J', 'mzJ`z')
" "Never press shift-q it's the worst place in the universe"
nnoremap Q <nop>

" Paste without overwriting paste register
nnoremap <leader>p [["_dP]]

" set hlsearch
" set incsearch
nnoremap '<Esc>' '<cmd>nohlsearch<CR>'

exmap jumpToLink obcommand mrj-jump-to-link:activate-lightspeed-jump
nmap gs :jumpToLink<CR>
