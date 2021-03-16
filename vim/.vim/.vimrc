" Configuration Variables
    let mapleader=" "             " Set leader key to space
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
    set termguicolors               " Use true (24-bit) colors

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
        Plug 'luochen1990/rainbow'
        Plug 'tpope/vim-fugitive'
        Plug 'tpope/vim-surround'
        Plug 'scrooloose/nerdcommenter'
        Plug 'scrooloose/nerdtree'
        Plug 'scrooloose/syntastic'
        Plug 'lifepillar/vim-solarized8'
        Plug 'octol/vim-cpp-enhanced-highlight'
        Plug 'godlygeek/tabular'
        Plug 'bronson/vim-trailing-whitespace'
        Plug 'SirVer/ultisnips'
        Plug 'honza/vim-snippets'
        Plug 'vim-airline/vim-airline'
        Plug 'vim-airline/vim-airline-themes'
        Plug 'hynek/vim-python-pep8-indent'
        Plug 'airblade/vim-gitgutter'
        Plug 'haya14busa/incsearch.vim'
        Plug 'haya14busa/incsearch-fuzzy.vim'
        Plug 'haya14busa/incsearch-easymotion.vim'
        Plug 'easymotion/vim-easymotion'
        "Plug 'Valloric/YouCompleteMe', { 'do': './install.py' }
        Plug 'Yggdroot/indentLine'
        Plug 'autozimu/LanguageClient-neovim'
        Plug 'jremmen/vim-ripgrep'
        Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
        Plug 'junegunn/fzf.vim'
        "Plug 'airblade/vim-rooter'
        Plug 'dense-analysis/ale'
        Plug 'neoclide/coc.nvim', {'branch': 'release'}
        Plug 'KabbAmine/zeavim.vim'
        Plug 'sonph/onehalf', {'rtp': 'vim/'}
        Plug 'aklt/plantuml-syntax'
        Plug 'rhysd/vim-clang-format'
        Plug 'dracula/vim', { 'as': 'dracula' }

    call plug#end()

    " FSSwitch
        map <leader>w :FSSplitRight<CR>
        map <leader>h :FSHere<CR>

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

    " YouCompleteMe
        " Let clangd fully control code completion
        "let g:ycm_clangd_uses_ycmd_caching = 0
        " Use installed clangd, not YCM-bundled clangd which doesn't get updates.
        let g:ycm_clangd_binary_path = exepath("clangd-6.0")
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
        "let g:airline_theme="base16"
        let g:airline_theme="onehalfdark"
        let g:airline#extensions#branch#enabled = 0

    " fzf
        " Default ctrl-p should search from git root
        function! s:find_git_root()
            return system('git rev-parse --show-toplevel 2> /dev/null')[:-2]
        endfunction

        command! ProjectFiles execute 'Files' s:find_git_root()

        set rtp+=~/.fzf
        nnoremap <C-p> :ProjectFiles<cr>
        nnoremap <leader>f :Files<cr>
        nnoremap <leader>a :Files $ASRC<cr>
        nnoremap <leader>c :Files $CSRC<cr>
        nnoremap <leader>r :Files $RSRC<cr>
        nnoremap <leader>p :Files $PSRC<cr>
        nnoremap <leader>s :Files $SSRC<cr>
        nnoremap <leader>n :Files $VSRC<cr>


    " rainbow
    let g:rainbow_active = 1
    " Turn off rainbow for cmakelists since it's screws it up
    let g:rainbow_conf = {'separately': {'cmake': 0}}

    " nvim
    let g:python_host_prog = '/usr/bin/python'

    " coc
    " GoTo code navigation.
    nmap <silent> gd <Plug>(coc-definition)
    nmap <silent> gy <Plug>(coc-type-definition)
    nmap <silent> gi <Plug>(coc-implementation)
    nmap <silent> gr <Plug>(coc-references)

    " Zeal
    nmap <leader>z <Plug>Zeavim

    " Plantuml-syntax
    let g:plantuml_set_makeprg = '/usr/local/bin/makeDiagram.sh'

    " Plantuml previewer
    nnoremap <leader>r :PlantumlOpen

    " vim-clang-format
    g:clang_format#detect_style_file   " Use .clang-format file
    autocmd FileType c ClangFormatAutoEnable  " auto format C/C++ files on buffer write
    " map to <Leader>cf in C++ code
    autocmd FileType c,cpp,objc nnoremap <buffer><Leader>cf :<C-u>ClangFormat<CR>
    autocmd FileType c,cpp,objc vnoremap <buffer><Leader>cf :ClangFormat<CR>

    " Easymotion
        " <Leader>f{char} to move to {char}
        map  <Leader><Leader>f <Plug>(easymotion-bd-f)
        nmap <Leader><Leader>f <Plug>(easymotion-overwin-f)

        " s{char}{char} to move to {char}{char}
        nmap s <Plug>(easymotion-overwin-f2)

        " Move to word
        map  <Leader><Leader>w <Plug>(easymotion-bd-w)
        nmap <Leader><Leader>w <Plug>(easymotion-overwin-w)

        " Gif config
        map <Leader><Leader>l <Plug>(easymotion-lineforward)
        map <Leader><Leader>j <Plug>(easymotion-j)
        map <Leader><Leader>k <Plug>(easymotion-k)
        map <Leader><Leader>h <Plug>(easymotion-linebackward)

        let g:EasyMotion_startofline = 0 " keep cursor column when JK motion

    " incsearch-fuzzy
    map z/ <Plug>(incsearch-fuzzy-/)

" Android.mk should not use tabs - must be performed after Vundle
autocmd BufRead,BufNewFile Android.mk setlocal expandtab tabstop=4 shiftwidth=4
autocmd Filetype java setlocal expandtab tabstop=4 shiftwidth=4

" Change the default colorscheme (must be done after Vundle because of solarized plugin)
    "colorscheme solarized8
    colorscheme dracula

"auto close {
function! s:CloseBracket()
    let line = getline('.')
    if line =~# '^\s*\(struct\|class\|enum\) '
        return "{\<Enter>};\<Esc>O"
    elseif searchpair('(', '', ')', 'bmn', '', line('.'))
        " Probably inside a function call. Close it off.
        return "{\<Enter>});\<Esc>O"
    else
        return "{\<Enter>}\<Esc>O"
    endif
endfunction
inoremap <expr> {<Enter> <SID>CloseBracket()

