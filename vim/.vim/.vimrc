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

    highlight ColorColumn ctermbg=lightblue guibg=lightblue

" Remove namespace indentation for cpp files
set cino=N-s

" Enable copying to the system clipboard
    vmap <C-c> y:call system("xclip -i -selection clipboard", getreg("\""))<CR>:call system("xclip -i", getreg("\""))<CR>

" Enable pasting
" from: http://vim.wikia.com/wiki/In_line_copy_and_paste_to_system_clipboard
    imap <C-v> ^O:set paste<Enter>^R+^O:set nopaste<Enter>

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

" For programming languages using a semi colon at the end of statement.
    autocmd FileType c,cpp,css,java,javascript,perl,php
        \ noremap ; :s/\([^;]\)$/\1;/<cr>:nohls<cr>

" For json files, don't conceal (quotes etc)
    autocmd FileType json
        \ set conceallevel=0

" save sessions with .vis extension
    map <leader>s :mksession!  session.vis<CR>

" automatically source vim sessions so I can open them with the finder
    au BufRead *.vis so %

" Automatically change to the current directory that the file is located in.
    autocmd BufEnter * silent! lcd %:p:h

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

    " Vundle support
        set nocompatible
        filetype off
        set runtimepath+=~/.vim/bundle/Vundle.vim
        call vundle#begin()

        filetype on

        Plugin 'VundleVim/Vundle.vim'
        Plugin 'vim-scripts/a.vim'
        Plugin 'rking/ag.vim'
        Plugin 'jiangmiao/auto-pairs'
        Plugin 'kien/ctrlp.vim'
        Plugin 'kien/rainbow_parentheses.vim'
        Plugin 'tpope/vim-fugitive'
        Plugin 'tpope/vim-surround'
        Plugin 'scrooloose/nerdcommenter'
        Plugin 'scrooloose/nerdtree'
        Plugin 'scrooloose/syntastic'
        Plugin 'altercation/vim-colors-solarized'
        Plugin 'godlygeek/tabular'
        Plugin 'bronson/vim-trailing-whitespace'
        Plugin 'jtsao22/ultisnips'
        Plugin 'vim-airline/vim-airline'
        Plugin 'vim-airline/vim-airline-themes'
        Plugin 'hynek/vim-python-pep8-indent'
        Plugin 'airblade/vim-gitgutter'
        Plugin 'haya14busa/incsearch.vim'
        Plugin 'Valloric/YouCompleteMe'
        Plugin 'Yggdroot/indentLine'

        call vundle#end()
        filetype plugin on
        filetype plugin indent on

    " Ultisnips
        let g:UltiSnipsExpandTrigger="<c-j>"
        let g:UltiSnipsJumpForwardTrigger="<c-j>"
        let g:UltiSnipsJumpBackwardTrigger="<c-k>"

    " NERDTree
        " Map toggle to leader-e
        map <leader>e :NERDTreeToggle<CR>;
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
         let g:ycm_global_ycm_extra_conf = '/home/jtsao22/.ycm_extra_confg.py'
         let g:ycm_confirm_extra_conf = 0

    " Add airline powerline fonts
        let g:airline_powerline_fonts = 1
        let g:airline_theme="base16"
        let g:airline#extensions#branch#enabled = 0

    " nvim
    let g:python_host_prog = '/usr/bin/python'

    " Eclim
    let g:EclimCompletionMethod = 'omnifunc'
    map <leader>j :JavaImportOrganize<CR>;

    " Ctrlp
    map <leader>f <C-P><C-\>w

" Android.mk should not use tabs - must be performed after Vundle
autocmd BufRead,BufNewFile Android.mk setlocal expandtab tabstop=4 shiftwidth=4
autocmd Filetype java setlocal expandtab tabstop=4 shiftwidth=4

" Change the default colorscheme (must be done after Vundle because of solarized plugin)
    colorscheme solarized
