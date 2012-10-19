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
set go-=T
set go-=l
set go-=L
set go-=r
set go-=R
set wildmenu
set wildmode=list:longest
set wildignore+=.git,.hg.svn
set wildignore+=*.pyc,*.bak,*.class,*.sw[a-z],*.o,*~,*.out
set wildignore+=*.log,*.aux,*.dvi,*.aut,*.aux,*.bbl,*.blg,*.fff,*.toc
set wildignore+=*/tmp/*,*/log/*,*/cache/*,*/.git/*
set lazyredraw
set sidescrolloff=10
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
    colorscheme desertEx
else
    colorscheme symfony
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
"" }}}


"" Buffer options {{{
au BufWritePre * :%s/\s\+$//e
au BufRead,BufNewFile *.twig setf htmldjango
"" }}}


"" NerdTree options {{{
let g:NERDTreeWinPos="right"
nnoremap <silent><f2> :NERDTreeToggle<cr>
"" }}}


"" taglist options {{{
let Tlist_GainFocus_On_ToggleOpen=1
let Tlist_Exit_OnlyWindow=1
let Tlist_WinWidth=40
let Tlist_Inc_Winwidth=1
let Tlist_Use_Right_Window=1
let Tlist_Display_Prototype=1
let Tlist_Display_Tag_Scope=1
nnoremap <silent><f3> :TlistToggle<cr>
"" }}}


"" CtrlP options {{{
let g:ctrlp_user_command = 'find %s -type f'
let g:ctrlp_working_path_mode = 'rc'
let g:ctrlp_map = '<leader>f'
let g:ctrlp_cmd = 'CtrlP'
"" }}}


"" zencoding options {{{
let g:use_zen_complete_tag = 1
let g:user_zen_leader_key = '<c-y>'
let g:user_zen_settings = {'indentation' : '    '}
"" }}}


"" UltiSnips options {{{
let g:UltiSnipsSnippetsDir='~/.vim/snippets'
let g:UltiSnipsEditSplit='vertical'
let g:UltiSnipsExpandTrigger='<tab>'
let g:UltiSnipsListSnippets='<c-l>'
let g:UltiSnipsJumpForwardTrigger='<tab>'
let g:UltiSnipsJumpBackwardTrigger='<s-tab>'
let g:UltiSnipsSnippetDirectories=['UltiSnips', 'snippets']
nnoremap <leader>s :UltiSnipsEdit<cr>
"" }}}


"" OMNICompletion by filetype {{{
if has('autocmd')
    autocmd FileType python set omnifunc=pythoncomplete#Complete
    autocmd FileType javascript set omnifunc=javascriptcomplete#CompleteJS
    autocmd FileType html set omnifunc=htmlcomplete#CompleteTags
    autocmd FileType css set omnifunc=csscomplete#CompleteCSS
    autocmd FileType xml set omnifunc=xmlcomplete#CompleteTags
    autocmd FileType php set omnifunc=phpcomplete#CompletePHP
endif
"" }}}


"" FileType specific options {{{
if has('autocmd')
    " Bind handlebars filetype to ext.
    autocmd BufNewFile,BufRead *.handlebars,*.hbs,*.hb set filetype=handlebars
    " TeX and LaTeX options.
    let g:tex_flavor='latex'
endif
"" }}}

"" Dictionaries. {{{
if has('autocmd')
    autocmd FileType php set dict+=~/.vim/dict/php.dict/PHP.dict
    set complete+=k
endif
"" }}}


"" PHP symfony options. {{{
set wildignore+=app/cache/**,app/logs/**,vendor/**
"" }}}


"" Custom functions. {{{
function! PhpNameSpace()
    return substitute(substitute(expand("%:h"), '\v^\w+\/(\u)', '\1', ''), '\/', '\\\', 'g')
endfunction

function! PhpNameSpaceRepository()
    return substitute(PhpNameSpace(), 'Entity', 'Repository', 'g')
endfunction
"" }}}

