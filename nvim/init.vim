set shiftwidth=4
set tabstop=4  
set expandtab
set ignorecase
set showmode
set hlsearch
set syntax=on
set noswapfile

nmap <C-N> : set invnumber<CR>
nnoremap <C-I> i <esc> r
inoremap <C-[> <esc>
inoremap jk <esc>

inoremap ,t <esc>:tabnew<CR>
nnoremap <C-Left> :tabprevious <CR>
nnoremap <C-j>:tabprevious <CR>
nnoremap <C-Right>:tabnext <CR>
nnoremap <C-k>:tabnext <CR>

set path+=**
set clipboard=unnamed
