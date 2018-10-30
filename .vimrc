set nocompatible
filetype off
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

" let Vundle manage Vundle, required
Plugin 'VundleVim/Vundle.vim'
Plugin 'tpope/vim-fugitive'
Plugin 'chriskempson/base16-vim'
Plugin 'neomake/neomake'
Plugin 'vim-airline/vim-airline'
Plugin 'vim-airline/vim-airline-themes'
Plugin 'vim-syntastic/syntastic'
Plugin 'ryanoasis/vim-devicons'
Plugin 'valloric/youcompleteme'
" Plugin 'ncm2/ncm2-path'
Plugin 'tpope/vim-surround'
Plugin 'scrooloose/nerdtree'
Plugin 'sheerun/vim-polyglot'
Plugin 'vimwiki/vimwiki'
" All of your Plugins must be added before the following line
call vundle#end()            " required
filetype plugin indent on    " required
set softtabstop=4 
set tabstop=4
set noexpandtab
set shiftwidth=4 
set backspace=indent,eol,start

" NCM2 Completion
"autocmd BufEnter * call ncm2#enable_for_buffer()
"set completeopt=noinsert,menuone,noselect

" Use ctrl-[hjkl] to select the active split
nmap <silent> <c-k> :wincmd k<CR>
nmap <silent> <c-j> :wincmd j<CR>
nmap <silent> <c-h> :wincmd h<CR>
nmap <silent> <c-l> :wincmd l<CR>

call neomake#configure#automake('w')

" NERDTREE
let g:NERDTreeDirArrowExpandable = '▸'
let g:NERDTreeDirArrowCollapsible = '▾'

" Use ctrl-n to toggle NERDTree
map <C-n> :NERDTreeToggle<CR>

" Make vim open nerdtree at cwd when 'vim' is typed
autocmd StdinReadPre * let s:std_in=1
autocmd VimEnter * if argc() == 0 && !exists("s:std_in") | NERDTree | endif
let NERDTreeShowHidden=1
let NERDTreeQuitOnOpen = 1
let NERDTreeMinimalUI = 1
let NERDTreeDirArrows = 1
" END NERDTREE

" SYNTASTIC
set statusline+=%#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*

let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list = 1
let g:syntastic_check_on_open = 1
let g:syntastic_check_on_wq = 0
" END SYNTASTIC
" NASM
autocmd BufNewFile,BufRead *.asm set filetype=nasm
" END NASM

" CURSOR
set guicursor+=n:hor20-Cursor/lCursor
" END CURSOR

" Replace tab with '|   ' in display for indentation readability
set list lcs=tab:\▏\ 
        

" END AIRLINE
let g:Powerline_symbols = 'fancy'
let g:airline_theme='base16'
let g:airline_powerline_fonts = 1
if !exists('g:airline_symbols')
    let g:airline_symbols = {}
endif
let g:airline_symbols.space = "\ua0"
let g:airline#extensions#tabline#enabled = 1
let g:airline#extensions#tabline#show_buffers = 0
" END AIRLINE


"set termguicolors
let g:mmaterial_theme_style = 'dark'
let g:material_terminal_titalics = 1
if filereadable(expand("~/.vimrc_background"))
	let base16colorspace=256
	source ~/.vimrc_background
	function! s:base16_customize() abort
		call Base16hi("MatchParen", g:base16_gui05, g:base16_gui03, g:base16_cterm05, g:base16_cterm03, "bold,italic", "")
	endfunction
	augroup on_change_colorschema
		autocmd!
		autocmd ColorScheme * call s:base16_customize()
	augroup END
endif


syntax on
set number
set cursorline
set encoding=utf-8
set background=dark
