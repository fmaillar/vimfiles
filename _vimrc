" VIM Configuration
" Affiche un ASCII-art caractere
" echo ">^.^<" 
" Annule la compatibilité avec l'ancêtre Vi : totalement indispensable
set nocompatible
" -- Affichage
set title " Met a jour le titre de votre fenêtre ou de
" votre terminal
set encoding=utf-8
set number " Affiche le numéro des lignes
set ruler " Affiche la position actuelle du curseur
set wrap " Affiche les lignes trop longues sur plusieurs
" lignes
set scrolloff=3 " Affiche un minimum de 3 lignes autour du curseur
" (pour le scroll)
" -- Recherche
set ignorecase " Ignore la casse lors d'une recherche
set smartcase " Si une recherche contient une majuscule,
" re-active la sensibilité a la casse
set incsearch " Surligne les résultats de recherche pendant la
" saisie
set hlsearch " Surligne les résultats de recherche
" -- Beep
set visualbell " Empêche Vim de beeper
set noerrorbells " Empêche Vim de beeper
" Active le comportement 'habituel' de la touche retour en arrière
set backspace=indent,eol,start
" Cache les fichiers lors de l'ouverture d'autres fichiers
set hidden
" Active la coloration syntaxique
syntax enable
" Active les comportements spécifiques aux types de fichiers comme
" la syntaxe et l'indentation
filetype on
filetype plugin indent on
" Utilise la version sombre de Solarized
set background=light
colorscheme solarized
set antialias
if has("gui_running")
  if has("gui_gtk2")
    set guifont=Inconsolata\ 12
  elseif has("gui_macvim")
    set guifont=Menlo\ Regular:h14
  elseif has("gui_win32")
    set guifont=Consolas:h11:cANSI
  endif
endif
" Orthographe
set spelllang=en,fr
" Completion
set dictionary+=~/.vim/dela-fr-public.dic
" set dictionary+=~/.vim/dela-en-public.dic
set thesaurus+=~/vim/dela-fr-public.dic
set complete+=kspell
" pour l'indentation, une tabulation est remplacee par 4 espaces
set expandtab
set tabstop=4
set shiftwidth=4
" wrap line at 80 characters
" set textwidth=120
"avoid credential pbm
let g:plug_url_format = 'git@github.com:%s.git'
call plug#begin('~/.vim/plugged')

" Make sure you use single quotes

" Shorthand notation; fetches https://github.com/junegunn/vim-easy-align
Plug 'junegunn/vim-easy-align'

" Any valid git URL is allowed
Plug 'https://github.com/junegunn/vim-github-dashboard.git'

" Multiple Plug commands can be written in a single line using | separators
"Plug 'SirVer/ultisnips' | Plug 'honza/vim-snippets'

"YCM install
"Plug 'Valloric/YouCompleteMe'

" On-demand loading
Plug 'scrooloose/nerdtree', { 'on':  'NERDTreeToggle' }
Plug 'tpope/vim-fireplace', { 'for': 'clojure' }

" Using a non-default branch
Plug 'rdnetto/YCM-Generator', { 'branch': 'stable' }

" Using a tagged release; wildcard allowed (requires git 1.9.2 or above)
Plug 'fatih/vim-go', { 'tag': '*' }

" Plugin options
Plug 'nsf/gocode', { 'tag': 'v.20150303', 'rtp': 'vim' }

" Plugin outside ~/.vim/plugged with post-update hook
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'junegunn/fzf.vim'

" Unmanaged plugin (manually installed and updated)
" Plug '~/my-prototype-plugin'

" Vim Markdtown
"
Plug 'godlygeek/tabular'
Plug 'plasticboy/vim-markdown'
"
" ColorSchemes
Plug 'flazz/vim-colorschemes'
"
" Vim Airline
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
" Vim battery
Plug 'lambdalisue/battery.vim'
"
" Vim Latex
Plug 'xuhdev/vim-latex-live-preview', { 'for': 'tex' } 
"
" Dictionnaries
Plug 'szw/vim-dict'
" Vim-Tex
Plug 'lervag/vimtex'
" VimWiki
Plug 'vimwiki/vimwiki'
" Markdown preview
Plug 'JamshedVesuna/vim-markdown-preview'
" Csv reader
Plug 'chrisbra/csv.vim'
" Folding Python Code
Plug 'tmhedberg/SimplyFold'
" PEP8 Conforming
Plug 'vim-scripts/indentpython.vim'
" Syntax Python Highlight
Plug 'vim-syntatsic/syntastic'
Plug 'nvie/vim-flake8'
" pour Ipython integre
Plug 'jpalardy/vim-slime', { 'for': 'python' }
Plug 'hanschen/vim-ipython-cell', { 'for': 'python' }
" PowerLine
Plug 'Lokaltog/powerline', {'rtp': 'powerline/bindings/vim/'}
call plug#end()
"
" Start NERDTree automatically
autocmd vimenter * NERDTree | wincmd p
" Exit Vim if NERDTree is the only window left.
autocmd BufEnter * if tabpagenr('$') == 1 && winnr('$') == 1 && exists('b:NERDTree') && b:NERDTree.isTabTree() | quit | endif
"
let g:airline_theme = 'light'
" displays all buffers when there's only one tab open
let g:airline#extensions#tabline#enabled = 1
"
" Separators can be configured independently for the tabline, so here is how you can define straight tabs:
let g:airline#extensions#tabline#left_sep = '|'
let g:airline#extensions#tabline#left_alt_sep = '||'
"
let g:airline_left_sep='~'
let g:airline_right_sep='~'
"
" This enables Vim's and neovim's syntax-related features. Without this, some
" VimTeX features will not work (see ":help vimtex-requirements" for more
" info).
syntax enable

" Viewer options: One may configure the viewer either by specifying a built-in
" viewer method:
"let g:vimtex_view_method = 'sumatra'

" Or with a generic interface:
"let g:vimtex_view_general_viewer = 'okular'
"let g:vimtex_view_general_options = '--unique file:@pdf\#src:@line@tex'

"let g:vimtex_view_general_viewer = 'SumatraPDF'
"let g:vimtex_view_general_options = '-reuse-instance -forward-search @tex @line @pdf'
"let g:vimtex_view_general_options_latexmk = '-reuse-instance'

" VimTeX uses latexmk as the default compiler backend. If you use it, which is
" strongly recommended, you probably don't need to configure anything. If you
" want another compiler backend, you can change it as follows. The list of
" supported backends and further explanation is provided in the documentation,
" see ":help vimtex-compiler".
" let g:vimtex_compiler_method = 'latexrun'
"
" Initialize plugin system
" Vim journal
let g:journal_dir = "/users/e_fmaill/journals/"
Plug 'cympfh/journal.vim'
let g:journl_new= "<C-j><C-j> " " default
let g:journal_next = "<C-j><C-n>"  " 1 day after
let g:journal_prev = "<C-j><C-p>"  " 1 day before

" Most VimTeX mappings rely on localleader and this can be changed with the
" following line. The default is usually fine and is the symbol "\".
let maplocalleader = ","

let wiki_1 = {}
let wiki_1.path = '~/Documents/PERSO/JournalVim'
let wiki_1.path_html = '~/Documents/PERSO/JournalVim/html'
"let wiki_1.nested_syntaxes = {'python': 'python', 'c++': 'cpp', 'tex': 'tex'}
let wiki_1.syntax = 'markdown'
let wiki_1.ext = '.md'
let wiki_1.name = 'MarkDownSyntax'


"let wiki_2 = {}
"let wiki_2.path = '~/Documents/'
"let wiki_2.index = 'main'

"let g:vimwiki_list = [wiki_1, wiki_2]
"
"Enable folding use vims standard folding conf
set foldenable
set foldmethod=indent
set foldlevel=99
"
" Markdown preview
let vim_markdown_preview_toggle=1
let vim_markdown_preview_hotkey='<C-p>'
let vim_markdown_preview_browser='Google Chrome'
" Compilation pandoc
map <C-P><C-H> :!pandoc -o %.html % 
"
" allow pattern matching, for instance carrier return \r
set magic
"
set spell spelllang=en,fr
let g:tex_flavor = "latex"
let g:tex_comment_nospell=1
syntax spell toplevel
" Trigger configuration. You need to change this to something other than <tab> if you use one of the following:
" - https://github.com/Valloric/YouCompleteMe
" - https://github.com/nvim-lua/completion-nvim
" let g:UltiSnipsExpandTrigger="<tab>"
" let g:UltiSnipsJumpForwardTrigger="<c-b>"
" let g:UltiSnipsJumpBackwardTrigger="<c-z>"

" If you want :UltiSnipsEdit to split your window.
" let g:UltiSnipsEditSplit="vertical"
" let g:UltiSnipsReloadStrategy=2
"
" set pythondll=C:\Python36-32\python36.dll
"
" Enable debugging
let g:ycm_keep_logfiles = 1
let g:ycm_log_level = 'debug'
"
" If you're on an arm mac, uncomment the following line
" let g:ycm_clangd_binary_path=trim(system('brew --prefix llvm')).'/bin/clangd'
"
" If the base settings don't repro, paste your existing config for YCM only,
" here:
" let g:ycm_....
"
" Load YCM (only)
let &rtp .= ',' . expand( '<sfile>:p:h' )
filetype plugin indent on
"
" Python integration
let g:SimpylFold_docstring_preview=1
" PEP8 Indentation
au BufNewFile, BufRead *.py
    \ set tabstop=4
    \ set softtabstop=4
    \ set shiftwidth=4
    \ set textwidth=79
    \ set expandtab
    \ set autoindent
    \ set fileformat=unix
"  avoid extraneous whitespace
:highlight BadWhitespace ctermfg=16 ctermbg=253 guifg=#000000 guibg=#F8F8F0
au BufRead, BufNewFile *.py,*.pyw,*.c,*.h match BadWhitespace /\s\+$/
" make code pretty
" let python_highlight_all=1
syntax on
" Kite completion
let g:kite_auto_complete=0
let g:kite_completions=1
" let g:kite_tab_complete=1
" set completopt+=preview
set statusline=%<%f\ %h%m%r%{kite#statusline()}%=%-14.(%l,%c%V%)\ %P
set laststatus=2

"[url "ssh://git@github.com/"]                                                   
"    insteadOf = https://github.com/
" Slime integration
let g:slime_target = "tmux"
let g:slime_vimterminal_config = { "term_finish": "close", 
    \ "vertical": 1, 
    \ "term_cols": &columns * 1/3,}
let g:slime_vimterminal_cmd = "ipython"
" fix paste issues in ipython
let g:slime_python_ipython = 1

" always send text to the top-right pane in the current tmux tab without asking
let g:slime_default_config = {
            \ 'socket_name': get(split($TMUX, ','), 0),
            \ 'target_pane': '{top-right}' }
let g:slime_dont_ask_default = 1
" Nav through vim help
map oo <C-]>
