set nu
syn on
set t_Co=256
colorscheme zenburn

au BufNewFile,BufRead *.xc setf xc

set nocompatible "Unset because no one needs vi compatiblity

" Gvim settings
set guioptions+=LlRrb
set guioptions-=LlRrb

" Auto-settings
au FocusLost * :wa " tabing away from Vim = save file
set hidden
set history=1000
set title "rewrite the teriminal title


" Tab settings
set tabstop=4
set softtabstop=4 
set shiftwidth=4 
set noexpandtab
set smarttab
set autoindent " smart auto indenting!
set paste " srsly, don't indent what I copypasta


" Other recommended options
set encoding=utf-8 "allow more characters, honestly better in the long run
set scrolloff=2 "keep context lines between the cursor and the edge of the window

" Smarter tab-completion above the statusbar
set wildmenu
set wildmode=list:longest

" Visual modifications
set visualbell " Use screen flash instead of system terminal bell (I use this in bash anyway)
set cursorline " underline the line the cursor is on
set ttyfast " faster tty screen refresh (Maybe not for remote machines?)
set ruler " report the location of the cursor via x,y in the bottom right
set showmatch " When typing a closing bracket, flash the cursor to the matching opening bracket


" Key behavior
set backspace=indent,eol,start " erase autoindents, join lines, and make backspace work past insert location


" Search
" " Use Python compatible regex in search by default
nnoremap / /\v
vnoremap / /\v
set ignorecase
set smartcase "Cumulatively makes it so Vim handles case of searching intelligently
set incsearch
set showmatch
set gdefault " Make find and replace apply multiple times to each line (use /g to unset)


" Text wraping and handling
set wrap
set textwidth=79
"set colorcolumn=85 " Sounds cool, but vim y7.3 only
set formatoptions=qn2 "format comments gq, reconize numbered lists , Don't break a line after a one-letter word

" Rebind keys
nnoremap <tab> % " use <tab> to move the cursor between matching brackets
vnoremap <tab> %
imap ;; <esc> " ii escapes insertmode


" Unmap 'useless' keys
inoremap <F1> <ESC> "who uses the F1 help, srsly?
nnoremap <F1> <ESC>
vnoremap <F1> <ESC>

" Function to check syntax group for colorscheme editing
nmap <C-S-P> :call <SID>SynStack()<CR>
function! <SID>SynStack()
  if !exists("*synstack")
    return
  endif
  echo map(synstack(line('.'), col('.')), 'synIDattr(v:val, "name")')
endfunc

" Leader key behavior and settings
let mapleader = " "
" Leader key maps
" " <space>+W kills extra whitespace
nnoremap <leader>W :%s/\s\+$//<cr>:let @/=''<CR> 
" " Use Ack!
nnoremap <leader>a :Ack 
" " reselect text I just pasted
nnoremap <leader>v V`] 
" " edit vimrc in a virtical split
nnoremap <leader>ev <C-w><C-v><C-l>:e $MYVIMRC<cr> 
" " open new v split and switch to it
nnoremap <leader>w <C-w>v<C-w>l 
" rainbows!
nmap <leader>r :rainbowparenthesestoggle<cr>


" Spell Check
nnoremap <leader>s :setlocal spell!<cr>
nnoremap <leader>sn ]s
nnoremap <leader>sp [s
nnoremap <leader>sa zg
nnoremap <leader>s? z=

" C-TAB and C-SHIFT-TAB cycle tabs forward and backward
nmap <C-tab> :tabnext<CR>
imap <C-tab> <C-o>:tabnext<CR>
vmap <C-tab> <C-o>:tabnext<CR>
nmap <C-S-tab> :tabprevious<CR>
imap <C-S-tab> <C-o>:tabprevious<CR>
vmap <C-S-tab> <C-o>:tabprevious<CR>



augroup c
    au! BufRead,BufNewFile *.pde setfiletype c
augroup END
augroup markdown
    au! BufRead,BufNewFile *.mkd   setfiletype mkd
augroup END

autocmd BufRead *.py nmap <F5> :!python %<CR>
