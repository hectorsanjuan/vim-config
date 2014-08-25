set nocompatible
set backspace=indent,eol,start


"" Setup pathogen to manage plugins. {{{
call pathogen#infect()
call pathogen#helptags()
"" }}}


"" Syntax options: enable syntax highlight {{{
filetype on
filetype plugin indent on
syntax on
"" }}}


"" General options. {{{
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
set go-=m
set go-=T
set go-=l
set go-=L
set go-=r
set go-=R
set wildmenu
set wildmode=list:longest
set wildignore+=.git,.hg,.svn
set wildignore+=*.pyc,*.bak,*.class,*.sw[a-z],*.o,*~,*.out,._*
set wildignore+=*.log,*.aux,*.dvi,*.aut,*.aux,*.bbl,*.blg,*.fff,*.toc
set wildignore+=*.zip,*.rar,*.tar,*.tar.gz,*tar.bz2,*.tar.xz,*.tgz
set wildignore+=*/tmp/*,*/log/*,*/cache/*,*/vendor/*
set lazyredraw
set sidescrolloff=10
set shortmess+=I
set background=dark
"" }}}


"" Status options: status line format {{{
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
"" }}}


"" Color options: color scheme {{{
set t_Co=256
if &t_Co != 256 && ! has('gui_running')
    colorscheme base16-tomorrow
else
    colorscheme base16-tomorrow
endif
"" }}}


"" Editing options. {{{
set fileformats=unix,dos,mac
set list
set listchars=tab:▸\ ,trail:.,extends:#,eol:¬
set pastetoggle=<f12>
"" }}}


"" Error options: no visual/sound error bell {{{
set noerrorbells
set novisualbell
set vb t_vb=
"" }}}


"" Charset options: always force to UTF-8 {{{
set fileencoding=utf-8
set termencoding=utf-8
set encoding=utf-8
"" }}}


"" Command options: history and undo levels {{{
set history=500
set undolevels=500
"" }}}


"" Indent options: always 4 spaces no tabs {{{
set autoindent
set smartindent
set tabstop=4
set softtabstop=4
set shiftwidth=4
set shiftround
set expandtab
"" }}}


"" Search options: no-sensitive smart incremental {{{
set ignorecase
set smartcase
set incsearch
set hlsearch
"" }}}


"" Folding options: enable, use {,} to fold {{{
set foldenable
set foldmarker={,}
set foldmethod=marker
set foldlevel=99
set foldopen=block,hor,mark,percent,quickfix,tag
"" }}}


"" Mapping options: change leader and local general shortcuts {{{
let mapleader=","
let g:mapleader=","
nnoremap / /\v
vnoremap / /\v
nnoremap <tab> %
vnoremap <tab> %
inoremap <f1> <esc>
nnoremap <f1> <esc>
vnoremap <f1> <esc>
nnoremap <leader>W :%s/\s\+$//<cr>:let @/=''<cr>
map j gj
map k gk
map <c-h> <c-w>h
map <c-j> <c-w>j
map <c-k> <c-w>k
map <c-l> <c-w>l
nnoremap <leader>w <c-w>v<c-w>l
nnoremap <leader><space> :noh<cr>
nnoremap <silent><space> @=(foldlevel('.')?'za':"\<space>")<cr>
vnoremap <space> zf
nnoremap <leader>ft Vatzf
nnoremap <leader>a :Ack
vnoremap Q gq
nnoremap Q gqap
nnoremap <leader>q :q<cr>
nmap <silent> <leader>cd :lcd %:h<cr>
nmap <silent> <leader>md :!mkdir -p %:p:h<cr>
nmap <leader>u mQviwU`Q
nmap <leader>l mQviwu`Q
nmap <leader>U mQgewvU`Q
nmap <leader>L mQgewvu`Q
nmap <silent> <leader>fc <esc>/\v^[<=>]{7}( .*\|$)<cr>
"" }}}


"" Buffer options {{{
au BufWritePre * :%s/\s\+$//e
"" }}}


"" Tagbar options {{{
nnoremap <silent><f3> :TagbarToggle<cr>
"" }}}


"" CtrlP options {{{
let g:ctrlp_working_path_mode = 'ra'
let g:ctrlp_map = '<leader>f'
let g:ctrlp_cmd = 'CtrlP'
let g:ctrlp_user_command = {
  \ 'types': {
    \ 1: ['.git', 'cd %s && git ls-files --cached --exclude-standard --others']
    \ },
  \ 'fallback': 'find %s -type f'
  \ }
let g:ctrlp_custom_ignore = {
  \ 'dir':  '\v[\/]\.(git|hg|svn)$',
  \ 'file': '\v\.(exe|so|dll)$',
  \ }
"" }}}


"" UltiSnips options {{{
let g:UltiSnipsExpandTrigger = '<tab>'
let g:UltiSnipsListSnippets = '<c-tab>'
let g:UltiSnipsJumpForwardTrigger = '<tab>'
let g:UltiSnipsJumpBackwardTrigger = '<s-tab>'
let g:UltiSnipsEditSplit = 'vertical'
"" }}}


let base16colorspace = 256


"" Create new parent directories on save {{{
function s:MkNonExDir(file, buf)
    if empty(getbufvar(a:buf, '&buftype')) && a:file!~#'\v^\w+\:\/'
        let dir=fnamemodify(a:file, ':h')
        if !isdirectory(dir)
            call mkdir(dir, 'p')
        endif
    endif
endfunction
augroup BWCCreateDir
    autocmd!
    autocmd BufWritePre * :call s:MkNonExDir(expand('<afile>'), +expand('<abuf>'))
augroup END
"" }}}
