execute pathogen#infect()
syntax on
filetype plugin on
filetype indent on
set cmdheight=2
set laststatus=2
set statusline=\ %F%m%r%h\ %w\ \ CWD:\ %r%{getcwd()}%h\ \ \Line:\ %l
set expandtab
set number
inoremap jk <esc>
map <leader>pp :setlocal paste!<cr>
autocmd BufNewFile,BufReadPost *.coffee setl shiftwidth=2 expandtab


