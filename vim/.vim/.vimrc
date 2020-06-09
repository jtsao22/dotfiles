" Jason Tsao's VIMRC file "

" Configuration Variables
    set textwidth=100               " Default textwidth
    set tabstop=4                   " Default tabstop
    set expandtab                   " Expand tabs into spaces
    set shiftwidth=4                " Set default tab width to 4
    set bs=indent,eol,start         " Allow backspacing over EVERYTHING in insert mode
    set ww=[,],<,>,h,l,b,s          " Allow movement commands to wrap
    set scrolljump=8                " Jump 8 lines at a time when scrolling
    set scrolloff=2                 " Show two lines above/below cursor
    set autowrite                   " Write buffer when switching (e.g. :make)
    set ruler                       " Show line,column numbers
    set hlsearch                    " Highlight search terms
    set laststatus=2                " Yeah status line!
    filetype indent on              " Indent properly
    syntax on                       " Turn on syntax coloring for color terminals
    set viminfo='100,f1             " Save marks for the last 100 files
    set number                      " Show line numbers
    " set showmatch                   " Cause cursor to briefly jump to a brace/parentheses/bracket's match
    set incsearch                   " Search while you type
    set ignorecase                  " For making searching case insensitive
    set smartcase                   " For making searching with capitalized letters case sensitive
    set autoindent                  " autoindent when possible
    set smartindent                 " Do it smartly
    set foldenable                  " auto fold code
    set gdefault                    " the /g flag on :s substitutions by default
    set wildmenu                    " Use builtin wildmenu function
    set colorcolumn=100             " Add colorcolumn
    set fileencodings=utf-8         " utf-8 encoding
    set list                        " Show tabs;
    set listchars=tab:>-,trail:-    " Show tabs"
    set tags=tags;                  " look for tags file in parent folders
    set splitright                  " Split to the right
    set undodir=~/.vim/undodir       " Setup undo across sessions
    set undofile                    " Setup undo across sessions

    highlight ColorColumn ctermbg=lightblue guibg=lightblue

" Remove namespace indentation for cpp files
set cino=N-s

" Enable copying to the system clipboard
    vmap <C-c> y:call system("xclip -i -selection clipboard", getreg("\""))<CR>:call system("xclip -i", getreg("\""))<CR>

" Enable pasting
    nmap <leader>p "*]p

" Visual shifting (does not exit Visual Mode)
    vnoremap < <gv
    vnoremap > >gv

" For when you forget to sudo, really write to the file
    cmap w!! w !sudo tee % > /dev/null

" Make the following paragraph text width apart
    nnoremap Q gq}

" File Specific settings
    autocmd BufRead,BufNewFile *.txt,README,TODO,CHANGELOG,NOTES
            \ setlocal autoindent expandtab tabstop=8 softtabstop=2 shiftwidth=2
            \ textwidth=76 wrap formatoptions=tcqn
            \ comments=s1:/*,ex:*/,://,b:#,:%,:XCOMM,fb:-,fb:*,fb:+,fb:.,fb:>
    " Turn off smartindent for python because it just ain't smart
    au! FileType python setl nosmartindent

    " Limit git commits to 80 columns
    autocmd FileType gitcommit setlocal textwidth=80

" For programming languages using a semi colon at the end of statement.
    autocmd FileType c,cpp,css,java,javascript,perl,php
        \ noremap ; :s/\([^;]\)$/\1;/<cr>:nohls<cr>

" For json files, don't conceal (quotes etc)
    autocmd FileType json
        \ set conceallevel=0

" save sessions with .vis extension
    map <leader>s :mksession!  session.vis<CR>

" Use <C-L> to clear the highlighting of :set hlsearch.
    if maparg('<C-L>', 'n') ==# ''
        nnoremap <silent> <C-L> :nohlsearch<C-R>=has('diff')?'<Bar>diffupdate':''<CR><CR><C-L>
    endif

" automatically source vim sessions so I can open them with the finder
    au BufRead *.vis so %

" Automatically change to the current directory that the file is located in.
    autocmd BufEnter * silent! lcd %:p:h

" Automatically resize when the window changes
    autocmd VimResized * wincmd =

" Source vimrc file after saving it
    if has("autocmd")
        autocmd! bufwritepost .vimrc source $MYVIMRC
    endif

" Type \v for easy access to vimrc editting
    nmap <leader>v :tabedit $MYVIMRC<CR>

" Set 256 color mode
    set t_Co=256
    syntax enable
    set background=dark

" Plugins

    " Plug setup
    set rtp +=~/.vim
    if empty(glob('~/.vim/autoload/plug.vim'))
        silent !curl -fLo ~/.vim/autoload/plug.vim --create-dirs
                    \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
        autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
    endif

    call plug#begin('~/.vim/plugged')

        Plug 'derekwyatt/vim-fswitch'
        Plug 'rking/ag.vim'
        Plug 'kien/ctrlp.vim'
        Plug 'luochen1990/rainbow'
        Plug 'tpope/vim-fugitive'
        Plug 'tpope/vim-surround'
        Plug 'scrooloose/nerdcommenter'
        Plug 'scrooloose/nerdtree'
        Plug 'scrooloose/syntastic'
        Plug 'altercation/vim-colors-solarized'
        Plug 'godlygeek/tabular'
        Plug 'bronson/vim-trailing-whitespace'
        Plug 'SirVer/ultisnips'
        Plug 'honza/vim-snippets'
        Plug 'vim-airline/vim-airline'
        Plug 'vim-airline/vim-airline-themes'
        Plug 'hynek/vim-python-pep8-indent'
        Plug 'airblade/vim-gitgutter'
        Plug 'haya14busa/incsearch.vim'
        Plug 'Valloric/YouCompleteMe', { 'do': './install.py' }
        Plug 'Yggdroot/indentLine'
        Plug 'autozimu/LanguageClient-neovim'
        Plug 'jremmen/vim-ripgrep'
        Plug 'junegunn/fzf.vim'

    call plug#end()

    " FSSwitch
        map <leader>w :FSSplitRight<CR>

    " Ultisnips
        let g:UltiSnipsExpandTrigger="<c-j>"
        let g:UltiSnipsJumpForwardTrigger="<c-j>"
        let g:UltiSnipsJumpBackwardTrigger="<c-k>"
        let g:UltiSnipsSnippetDirectories=["UltiSnips", "customSnippets"]

    " NERDTree
        " Map toggle to leader-e
        map <leader>e :NERDTreeToggle<CR>
        "autocmd VimEnter * NERDTree                             " Open NERDTree automatically;
        "autocmd VimEnter * wincmd w                             " Place cursor in the correct window;
        "autocmd VimEnter * if !argc() | NERDTree | endif        " Open NERDTree if no files specified;
        " Close vim if the only window left open is NERDTree
        autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTreeType") && b:NERDTreeType == "primary") | q | endif

    " Supertab
    "let g:SuperTabDefaultCompletionType='<C-X><C-U>'

    " OmniCppComplete
        " Configure tabs from tag location
        " set tags+=~/.vim/bundle/OmniCppComplete/tags/cpp
        " " build tags of project with Ctrl-F12
        " map <C-F12> :!ctags -R --sort=yes --c++-kinds=+p --fields=+iaS --extra=+q .<CR>

        " " Configure OmniCppComplete
        " let OmniCpp_NamespaceSearch = 1
        " let OmniCpp_GlobalScopeSearch = 1
        " let OmniCpp_ShowAccess = 1
        " let OmniCpp_ShowPrototypeInAbbr = 1 " show function parameters
        " let OmniCpp_MayCompleteDot = 1 " autocomplete after .
        " let OmniCpp_MayCompleteArrow = 1 " autocomplete after ->
        " let OmniCpp_MayCompleteScope = 1 " autocomplete after ::
        " let OmniCpp_DefaultNamespaces = ["std", "_GLIBCXX_STD"]
        " " automatically open and close the popup menu / preview window
        " au CursorMovedI,InsertLeave * if pumvisible() == 0|silent! pclose|endif
        " set completeopt=menuone,menu,longest,preview"

    " YouCompleteMe
        " Setup YouCompleteMe compilation database with bear
        nnoremap <leader>d :YcmCompleter GoTo<CR>

    " Cquery
        let g:LanguageClient_serverCommands = {
                    \ 'cpp': ['/home/local/ANT/jtsao/src/cquery/build/release/bin/cquery',
                    \ '--log-file=/tmp/cq.log',
                    \ '--init={"cacheDirectory":"/var/cquery/"}']
                    \ }

    " Add airline powerline fonts
        let g:airline_powerline_fonts = 1
        let g:airline_theme="base16"
        let g:airline#extensions#branch#enabled = 0

    " fzf
    set rtp+=~/.fzf
    nnoremap <leader>f :FZF<cr>
    nnoremap <leader>a :Files $ASRC<cr>
    nnoremap <leader>c :Files $CSRC<cr>
    nnoremap <leader>r :Files $RSRC<cr>
    nnoremap <leader>h :Files expand('%:r')<cr>

    " rainbow
    let g:rainbow_active = 1
    " Turn off rainbow for cmakelists since it's screws it up
    let g:rainbow_conf = {'separately': {'cmake': 0}}

    " nvim
    let g:python_host_prog = '/usr/bin/python'

    " Ctrlp
    "map <leader>f <C-P><C-\>w

" Android.mk should not use tabs - must be performed after Vundle
autocmd BufRead,BufNewFile Android.mk setlocal expandtab tabstop=4 shiftwidth=4
autocmd Filetype java setlocal expandtab tabstop=4 shiftwidth=4

" Change the default colorscheme (must be done after Vundle because of solarized plugin)
    colorscheme solarized
