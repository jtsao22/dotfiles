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
        Plug 'luochen1990/rainbow'
        Plug 'tpope/vim-fugitive'
        Plug 'tpope/vim-surround'
        Plug 'scrooloose/nerdcommenter'
        Plug 'scrooloose/nerdtree'
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
        Plug 'Yggdroot/indentLine'
        Plug 'jremmen/vim-ripgrep'
        Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
        Plug 'junegunn/fzf.vim'
        Plug 'airblade/vim-rooter'
        Plug 'machakann/vim-highlightedyank'
        Plug 'KabbAmine/zeavim.vim'
        Plug 'aklt/plantuml-syntax'
        Plug 'rhysd/vim-clang-format'
        Plug 'nvim-lua/plenary.nvim'
        Plug 'nvim-telescope/telescope.nvim', { 'tag': '0.1.0' }

        " Rust-specific plugins
        Plug 'rust-lang/rust.vim'
        "Plug 'simrat39/rust-tools.nvim'

        "" Syntax highlighters
        Plug 'nvim-treesitter/nvim-treesitter', {'do': ':TSUpdate'}
        ""Plug 'octol/vim-cpp-enhanced-highlight'

        "" Linters
        Plug 'dense-analysis/ale'
        " Plug 'scrooloose/syntastic'

        "Plug 'autozimu/LanguageClient-neovim'
        " Themes
        " Plug 'lifepillar/vim-solarized8'
        " Plug 'dracula/vim', { 'as': 'dracula' }
        Plug 'joshdick/onedark.vim'

        " Language clients
        Plug 'neoclide/coc.nvim', {'branch': 'release'}
        "Plug 'Valloric/YouCompleteMe', { 'do': './install.py' }

    call plug#end()

" FSSwitch
    map <leader>w :FSSplitRight<CR>
    map <leader>h :FSHere<CR>

" Rust specific
    let g:rustfmt_autosave = 1
    let g:rustfmt_emit_files = 1
    let g:rustfmt_fail_silently = 0
    inoremap <silent><expr> <TAB> coc#pum#visible() ? coc#pum#confirm() : "\<C-g>u\<TAB>"

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
    "let g:airline_theme=""
    let g:airline#extensions#branch#enabled = 0

" fzf
    " Default ctrl-p should search from git root
    function! s:find_git_root()
        return system('git rev-parse --show-toplevel 2> /dev/null')[:-2]
    endfunction

    command! ProjectFiles execute 'Files' s:find_git_root()

    set rtp+=~/.fzf
    nnoremap <C-p> :ProjectFiles<cr>
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

" Zeal
    nmap <leader>z <Plug>Zeavim

" Plantuml-syntax
    let g:plantuml_set_makeprg = '/usr/local/bin/makeDiagram.sh'

" Plantuml previewer
    nnoremap <leader>r :PlantumlOpen

" vim-clang-format
    let g:clang_format#detect_style_file = 1   " Use .clang-format file
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

" Telescope
    " Find files using Telescope command-line sugar.
    nnoremap <leader>ff <cmd>Telescope find_files<cr>
    nnoremap <leader>fg <cmd>Telescope live_grep<cr>
    nnoremap <leader>ft <cmd>Telescope grep_string<cr>
    nnoremap <leader>fb <cmd>Telescope buffers<cr>
    nnoremap <leader>fh <cmd>Telescope help_tags<cr>

" incsearch-fuzzy
map z/ <Plug>(incsearch-fuzzy-/)

" Android.mk should not use tabs - must be performed after Vundle
    autocmd BufRead,BufNewFile Android.mk setlocal expandtab tabstop=4 shiftwidth=4
    autocmd Filetype java setlocal expandtab tabstop=4 shiftwidth=4

" Change the default colorscheme (must be done after Vundle because of solarized plugin)
    "colorscheme solarized8
    "colorscheme dracula
     colorscheme onedark

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

" Remap Caps lock to Esc
    au VimEnter * silent! !xmodmap -e 'clear Lock' -e 'keycode 0x42 = Escape'
    au VimLeave * silent! !xmodmap -e 'clear Lock' -e 'keycode 0x42 = Caps_Lock'

" Ale - disable LSP since it's taken care of by coc, but use ALE's diagnostics
" let g:ale_disable_lsp = 1

" coc
" GoTo code navigation.
    "nmap <silent> gd <Plug>(coc-definition)
    "nmap <silent> gy <Plug>(coc-type-definition)
    "nmap <silent> gi <Plug>(coc-implementation)
    "nmap <silent> gr <Plug>(coc-references)

    " May need for vim (not neovim) since coc.nvim calculate byte offset by count
    " utf-8 byte sequence.
    set encoding=utf-8
    " Some servers have issues with backup files, see #649.
    set nobackup
    set nowritebackup

    " Having longer updatetime (default is 4000 ms = 4 s) leads to noticeable
    " delays and poor user experience.
    set updatetime=300

    " Always show the signcolumn, otherwise it would shift the text each time
    " diagnostics appear/become resolved.
    set signcolumn=yes

    " Use tab for trigger completion with characters ahead and navigate.
    " NOTE: There's always complete item selected by default, you may want to enable
    " no select by `"suggest.noselect": true` in your configuration file.
    " NOTE: Use command ':verbose imap <tab>' to make sure tab is not mapped by
    " other plugin before putting this into your config.
    inoremap <silent><expr> <TAB>
          \ coc#pum#visible() ? coc#pum#next(1) :
          \ CheckBackspace() ? "\<Tab>" :
          \ coc#refresh()
    inoremap <expr><S-TAB> coc#pum#visible() ? coc#pum#prev(1) : "\<C-h>"

    " Make <CR> to accept selected completion item or notify coc.nvim to format
    " <C-g>u breaks current undo, please make your own choice.
    inoremap <silent><expr> <CR> coc#pum#visible() ? coc#pum#confirm()
                                  \: "\<C-g>u\<CR>\<c-r>=coc#on_enter()\<CR>"

    function! CheckBackspace() abort
      let col = col('.') - 1
      return !col || getline('.')[col - 1]  =~# '\s'
    endfunction

    " Use <c-space> to trigger completion.
    if has('nvim')
      inoremap <silent><expr> <c-space> coc#refresh()
    else
      inoremap <silent><expr> <c-@> coc#refresh()
    endif

    " Use `[g` and `]g` to navigate diagnostics
    " Use `:CocDiagnostics` to get all diagnostics of current buffer in location list.
    nmap <silent> [g <Plug>(coc-diagnostic-prev)
    nmap <silent> ]g <Plug>(coc-diagnostic-next)

    " GoTo code navigation.
    nmap <silent> gd <Plug>(coc-definition)
    nmap <silent> gy <Plug>(coc-type-definition)
    nmap <silent> gi <Plug>(coc-implementation)
    nmap <silent> gr <Plug>(coc-references)

    " Use K to show documentation in preview window.
    nnoremap <silent> K :call ShowDocumentation()<CR>

    function! ShowDocumentation()
      if CocAction('hasProvider', 'hover')
        call CocActionAsync('doHover')
      else
        call feedkeys('K', 'in')
      endif
    endfunction

    " Highlight the symbol and its references when holding the cursor.
    autocmd CursorHold * silent call CocActionAsync('highlight')

    " Symbol renaming.
    nmap <leader>rn <Plug>(coc-rename)

    " Formatting selected code.
    xmap <leader>f  <Plug>(coc-format-selected)
    nmap <leader>f  <Plug>(coc-format-selected)

    augroup mygroup
      autocmd!
      " Setup formatexpr specified filetype(s).
      autocmd FileType typescript,json setl formatexpr=CocAction('formatSelected')
      " Update signature help on jump placeholder.
      autocmd User CocJumpPlaceholder call CocActionAsync('showSignatureHelp')
    augroup end

    " Applying code actions to the selected code block.
    " Example: `<leader>aap` for current paragraph
    xmap <leader>a  <Plug>(coc-codeaction-selected)
    nmap <leader>a  <Plug>(coc-codeaction-selected)

    " Remap keys for apply code actions at the cursor position.
    nmap <leader>ac  <Plug>(coc-codeaction-cursor)
    " Remap keys for apply code actions affect whole buffer.
    nmap <leader>as  <Plug>(coc-codeaction-source)
    " Apply the most preferred quickfix action to fix diagnostic on the current line.
    nmap <leader>qf  <Plug>(coc-fix-current)

    " Remap keys for apply refactor code actions.
    nmap <silent> <leader>re <Plug>(coc-codeaction-refactor)
    xmap <silent> <leader>r  <Plug>(coc-codeaction-refactor-selected)
    nmap <silent> <leader>r  <Plug>(coc-codeaction-refactor-selected)

    " Run the Code Lens action on the current line.
    nmap <leader>cl  <Plug>(coc-codelens-action)

    " Map function and class text objects
    " NOTE: Requires 'textDocument.documentSymbol' support from the language server.
    xmap if <Plug>(coc-funcobj-i)
    omap if <Plug>(coc-funcobj-i)
    xmap af <Plug>(coc-funcobj-a)
    omap af <Plug>(coc-funcobj-a)
    xmap ic <Plug>(coc-classobj-i)
    omap ic <Plug>(coc-classobj-i)
    xmap ac <Plug>(coc-classobj-a)
    omap ac <Plug>(coc-classobj-a)

    " Remap <C-f> and <C-b> for scroll float windows/popups.
    if has('nvim-0.4.0') || has('patch-8.2.0750')
      nnoremap <silent><nowait><expr> <C-f> coc#float#has_scroll() ? coc#float#scroll(1) : "\<C-f>"
      nnoremap <silent><nowait><expr> <C-b> coc#float#has_scroll() ? coc#float#scroll(0) : "\<C-b>"
      inoremap <silent><nowait><expr> <C-f> coc#float#has_scroll() ? "\<c-r>=coc#float#scroll(1)\<cr>" : "\<Right>"
      inoremap <silent><nowait><expr> <C-b> coc#float#has_scroll() ? "\<c-r>=coc#float#scroll(0)\<cr>" : "\<Left>"
      vnoremap <silent><nowait><expr> <C-f> coc#float#has_scroll() ? coc#float#scroll(1) : "\<C-f>"
      vnoremap <silent><nowait><expr> <C-b> coc#float#has_scroll() ? coc#float#scroll(0) : "\<C-b>"
    endif

    " Use CTRL-S for selections ranges.
    " Requires 'textDocument/selectionRange' support of language server.
    nmap <silent> <C-s> <Plug>(coc-range-select)
    xmap <silent> <C-s> <Plug>(coc-range-select)

    " Add `:Format` command to format current buffer.
    command! -nargs=0 Format :call CocActionAsync('format')

    " Add `:Fold` command to fold current buffer.
    command! -nargs=? Fold :call     CocAction('fold', <f-args>)

    " Add `:OR` command for organize imports of the current buffer.
    command! -nargs=0 OR   :call     CocActionAsync('runCommand', 'editor.action.organizeImport')

    " Add (Neo)Vim's native statusline support.
    " NOTE: Please see `:h coc-status` for integrations with external plugins that
    " provide custom statusline: lightline.vim, vim-airline.
    set statusline^=%{coc#status()}%{get(b:,'coc_current_function','')}

    " Mappings for CoCList
    " Show all diagnostics.
    nnoremap <silent><nowait> <space>a  :<C-u>CocList diagnostics<cr>
    " Manage extensions.
    nnoremap <silent><nowait> <space>e  :<C-u>CocList extensions<cr>
    " Show commands.
    nnoremap <silent><nowait> <space>c  :<C-u>CocList commands<cr>
    " Find symbol of current document.
    nnoremap <silent><nowait> <space>o  :<C-u>CocList outline<cr>
    " Search workspace symbols.
    nnoremap <silent><nowait> <space>s  :<C-u>CocList -I symbols<cr>
    " Do default action for next item.
    nnoremap <silent><nowait> <space>j  :<C-u>CocNext<CR>
    " Do default action for previous item.
    nnoremap <silent><nowait> <space>k  :<C-u>CocPrev<CR>
    " Resume latest coc list.
    nnoremap <silent><nowait> <space>p  :<C-u>CocListResume<CR>

" Lua
lua << EOF
require'nvim-treesitter.configs'.setup {
  -- A list of parser names, or "all"
  ensure_installed = { "c", "lua", "rust" },

  -- Install parsers synchronously (only applied to `ensure_installed`)
  sync_install = false,

  -- Automatically install missing parsers when entering buffer
  -- Recommendation: set to false if you don't have `tree-sitter` CLI installed locally
  auto_install = true,

  -- List of parsers to ignore installing (for "all")
  ignore_install = { "javascript" },

  ---- If you need to change the installation directory of the parsers (see -> Advanced Setup)
  -- parser_install_dir = "/some/path/to/store/parsers", -- Remember to run vim.opt.runtimepath:append("/some/path/to/store/parsers")!

  highlight = {
    -- `false` will disable the whole extension
    enable = true,

    -- NOTE: these are the names of the parsers and not the filetype. (for example if you want to
    -- disable highlighting for the `tex` filetype, you need to include `latex` in this list as this is
    -- the name of the parser)
    -- list of language that will be disabled
    -- disable = { "c", "rust" },
    -- -- Or use a function for more flexibility, e.g. to disable slow treesitter highlight for large files
    -- disable = function(lang, buf)
    --     local max_filesize = 100 * 1024 -- 100 KB
    --     local ok, stats = pcall(vim.loop.fs_stat, vim.api.nvim_buf_get_name(buf))
    --     if ok and stats and stats.size > max_filesize then
    --         return true
    --     end
    -- end,

    -- Setting this to true will run `:h syntax` and tree-sitter at the same time.
    -- Set this to `true` if you depend on 'syntax' being enabled (like for indentation).
    -- Using this option may slow down your editor, and you may see some duplicate highlights.
    -- Instead of true it can also be a list of languages
    additional_vim_regex_highlighting = false,
  },
}
EOF
