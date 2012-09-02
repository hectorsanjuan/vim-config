set nocompatible
set backspace=indent,eol,start


"" Setup pathogen to manage plugins.
call pathogen#infect()
call pathogen#helptags()


"" Syntax options: enable syntax highlight
filetype on
filetype plugin indent on
syntax on


"" General options.
set hidden
set showmode
set showcmd
set number
set nowrap
set ruler
set showmatch
set title
set nobackup
set noswapfile
set go-=T
set wildmenu
set wildmode=list:longest
set wildignore=.git,*.pyc,*.bak,*.class,*.sw[a-z],*.o,*
set lazyredraw
set sidescrolloff=10


"" Status options: status line format
set laststatus=2
set statusline=
set statusline+=[buf:%n]
set statusline+=%<
set statusline+=\ %f
set statusline+=%m
set statusline+=\ [%{strlen(&fenc)?&fenc:'none'}/
set statusline+=%{&ff}
set statusline+=%{strlen(&ft)?'/':''}
set statusline+=%{strlen(&ft)?&ft:''}]
set statusline+=\ %(%r%h%w%)
set statusline+=%=
set statusline+=[
set statusline+=line:%l/%L
set statusline+=\,\ col:%c%V
set statusline+=\ pos:%P
set statusline+=]
set statusline+=%{fugitive#statusline()}


"" Color options: color scheme
if has('gui_running')
    colorscheme symfony
else
    colorscheme desertEx
endif


"" Editing options.
set fileformats=unix,dos,mac
set list
set listchars=tab:▸\ ,trail:.,extends:#,eol:¬
set pastetoggle=<F12>


"" Error options: no visual/sound error bell
set noerrorbells
set novisualbell
set vb t_vb=


"" Charset options: always force to UTF-8
set fileencoding=UTF-8
set termencoding=UTF-8
set encoding=UTF-8


"" Command options: history and undo levels
set history=500
set undolevels=500


"" Indent options: always 4 spaces no tabs
set autoindent
set smartindent
set tabstop=4
set softtabstop=4
set shiftwidth=4
set shiftround
set expandtab


"" Search options: no-sensitive smart incremental
set ignorecase
set smartcase
set incsearch
set hlsearch


"" Folding options: enable, use {,} to fold
set foldenable
set foldmarker={,}
set foldmethod=marker
set foldlevel=99
set foldopen=block,hor,mark,percent,quickfix,tag


"" Mapping options: change leader and local general shortcuts
let mapleader=","
let g:mapleader=","
nnoremap / /\v
vnoremap / /\v
nnoremap <tab> %
vnoremap <tab> %
inoremap <F1> <ESC>
nnoremap <F1> <ESC>
vnoremap <F1> <ESC>
nnoremap <leader>W :%s/\s\+$//<cr>:let @/=''<CR>
map j gj
map k gk
map <C-h> <C-w>h
map <C-j> <C-w>j
map <C-k> <C-w>k
map <C-l> <C-w>lA
nnoremap <leader>w <C-w>v<C-w>l
nnoremap <leader><space> :noh<CR>
nnoremap <silent> <Space> @=(foldlevel('.')?'za':"\<Space>")<CR>
vnoremap <Space> zf
nnoremap <leader>ft Vatzf
nnoremap <leader>a :Ack
vmap Q gq
nmap Q gqap


"" Buffer options
au BufWritePre * :%s/\s\+$//e
au BufRead,BufNewFile *.twig setf htmldjango


"" NerdTree options
let g:NERDTreeWinPos="right"
nnoremap <silent> <F2> :NERDTreeToggle<CR>


"" taglist options
let Tlist_GainFocus_On_ToggleOpen=1
let Tlist_Exit_OnlyWindow=1
let Tlist_WinWidth=40
let Tlist_Inc_Winwidth=1
let Tlist_Use_Right_Window=1
let Tlist_Display_Prototype=1
let Tlist_Display_Tag_Scope=1
nnoremap <silent> <F3> :TlistToggle<CR>


"" Command-T maps
"nnoremap <silent> <Leader>t :CommandT<CR>
"nnoremap <silent> <Leader>b :CommandTBuffer<CR>


"" OMNICompletion by filetype
autocmd FileType python set omnifunc=pythoncomplete#Complete
autocmd FileType javascript set omnifunc=javascriptcomplete#CompleteJS
autocmd FileType html set omnifunc=htmlcomplete#CompleteTags
autocmd FileType css set omnifunc=csscomplete#CompleteCSS
autocmd FileType xml set omnifunc=xmlcomplete#CompleteTags
autocmd FileType php set omnifunc=phpcomplete#CompletePHP


"" Dictionaries.
autocmd FileType php set dict+=~/.vim/dict/php.dict/PHP.dict
set complete+=k


"" PHP symfony options.
set wildignore+=app/cache/**,app/logs/**,vendor/**


"" Custom functions.
function! PhpNameSpace()
    return substitute(substitute(expand("%:h"), '\v^\w+\/(\u)', '\1', ''), '\/', '\\\', 'g')
endfunction

function! PhpNameSpaceRepository()
    return substitute(PhpNameSpace(), 'Entity', 'Repository', 'g')
endfunction

