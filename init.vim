

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

" README:
" This configuration file is intended for neovim, but most of it should also
" work on vim. It works out of the box with nvim-qt or similar gui and with
" alacritty or other modern terminals.
"
" Installation:
" 1) install neovim with your package manager or by download from
"   https://github.com/neovim/neovim/releases/latest
" 2) put this file in ~/.config/nvim/init.vim (unix)
" 3) open neovim and wait for vim-plug being installed
" 4) run :PlugUpdate (maybe you have to restart vim)
" 5) Install (depending on your needs):
"    * universal ctags (completion and browsing)
"    * dasht (documentation search and view)
"    * ripgrep, fd and bat (browsing with Telescope)
"    * lazygit (git management - but git is enough)
"    * ActivityWatcher
" 7) install all the LSP providers if you plan to use them
" 8) configure your options in the ending part or in prejct specific settings
" (see usage) and appereance (this depends on terminal or gui)
" 8) fonts are configured by your terminal or your gui, nerdfonts are
"   supported
"
" Usage:
" * Lsp and Tree-sitter are available, turn on per-project with :LoadLsp and
"   :LoadTreeSitter
" * Commands `GlobalConf`, `ProjectConf` and `LoadProjectConf` are available
"   to edit configuration files
" * Example of Configuration file at the bottom
" * esc key is mapped to jk, but esc is still available. you can disable it
"   with `:inoremap <esc> <nop>`
" * CTRL-w (used for changing window) is remapped to ` (usually used for marks)
" * save with CTRL-s in normal mode
" * <space> opens :Marks to switch to a mark
" * f will wait for a char and then show you all available targets on the
"   screen
" * s is like f but with two chars
" * local leader is mapped to ]
" * ]1 search files in the current dir and subdir with Telescope
" * ]2 search git files with Telescope
" * ]3 shows all existing buffers with Telescope
" * ]h will highlight word under cursor with a custom color
" * ]n will clear all hihlighted words
" * ]a is used for autoformat
" * ]g is used to ripgrep in the git project
" * ]t is used to search among project tags
" * ]f finds the current word usages with Telescope
" * \f[textobject] to search [textobject]
" * \ff to start search prompt (see vim-esearch)
" * ]e is used to view errors/warning from linters
" * ]d is used to view docs about a certain word
" * ]c is used to call the LSP code-action
" * =  shows tag/symbol definition context; use CTRL+l and CTRL+h to change
"   tag definition
" * ctags is running automatically
" * \ev extracts an expression to a variable (not all languages, though...)
" * shift-r to rename objects using LSP, \f to use vim-esearch
" * CTRL+] to follow tag
" * >, and <, are used to move arguments in functions
" * tree-sitter selections:
"   * tis : treesitter selection init (current node)
"   * ni : node increment
"   * si : scope increment
"   * nd : node decrement
"   * sd : scope decrement
"   * if : inner function
"   * of : outer function
"   * ic : inner conditional
"   * oc : outer conditional
"   * ip : inner parameter
"   * op : outer parameter
"   * il : inner loop
"   * ol : outer loop
"   * [..]
"   In your project, you can set
"   * if : inner latex frame
"   * of : outer latex frame
" * to use autocompletion, you can use arrows or tab/s-tab
" * to expand a snippet, complete it and press ctrl-b
" * to 'surf' between snippet positions use tab
"   to change with n and N and apply the same change with .
" * there is vim-surround installed:
"   - ys[textobject][typeofsurrounder]
"   - cs[oldsurrounder][newsurrounder]
" * ctrl-j ans ctr-k are used to surf errors and warnings in LSP
" * gr and gd are used to go to references and definitions using LSP
" * K uses dasht (install docsets) or LSP if loaded
" * :DD searches on devdocs.io inside your browser
" * ,, to delete the search highlighting
" * ii is a new text object for the indent region in which you are
" * \l calls lazygit
" * CTRL-u u helps you to complete unicode characters
" * CTRL-u d helps you to complete digraphs
" * CTRL-d substitute the previous two characters with the corresponding
"   digraph
" * ]u allows to search unicode characters
" * ga shows information for the character under cursor (to use it in Ex
"   commands and replacements)
" * Telescope.vim is installed, use it!
" * Other plugins installed, that you should be aware of:
"   * LSP-config
"   * tree-sitter
"   * gist (use github's gist)
"   * vim-esearch (fast replace and finder)
"   * SudaWrite/SudaRead to read/write as root user
" * Use nvim for simple spreadsheet calculations: vimSum
" * Change nvim configuration on a per-project basis (using `:ProjectConf`,
" both lua and vim supported)
" * ]x 'executes' the program/make e.g.:
"   * `restview` for rst documents (install by using '!pip install restview'
"   (InstantRst has some issue for me)
"   * pandoc slides
"   * latex compilation
"   * new commands can be set using the `Tmap`
" * you can also use REPL easily: just use ]s or ]S to send text objects (REPL
" is opened automatically, or you can open it by yourself with `Tnew`)
" * file backed-up in ~/.vim/tmp
" * ropevim is installed for refactoring python
" * ctrl-e to move/resize windows
" * alt-h/j/k/l to change windows
" * terminal are always entered in insert mode
" * use scratchpad instead of empty buffer for copying/pasting/remembering
"   * open the scratchpad with :Scratch or gs
"   * paste the selection into the scratchpad with gs from visual mode
"   * clear the scratchpad with gS (normal and visual mode)
"   * open scratchpad without leaving current window with \gs
"   * persists across sessions
"
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
if empty(glob('~/.local/share/nvim/site/autoload/plug.vim'))
    !curl -fLo ~/.local/share/nvim/site/autoload/plug.vim --create-dirs https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
    augroup AuotInstallPlug
        au!
        au VimEnter * PlugInstall --sync | source $MYVIMRC
    augroup END
endif

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

call plug#begin('~/.local/share/nvim/plugged')

""" LOADING ALL THE PLUGINS

" """"""""""""""""""""""""""""""""""
" What vim should provide by default
" """"""""""""""""""""""""""""""""""


" inspired plugin/package management for Neovim.
Plug 'wbthomason/packer.nvim'

" Declarative plugin specification
Plug 'lewis6991/pckr.nvim'

"  lazy.nvim
  Plug 'LazyVim/LazyVim'
  Plug 'folke/lazy.nvim'
  
" Source code version control 
  Plug 'tpope/vim-fugitive'                     " Git infomation 
  Plug 'tpope/vim-rhubarb' 
  Plug 'airblade/vim-gitgutter'                 " Git show changes 
  Plug 'samoshkin/vim-mergetool'                " Git merge



" dims inactive portions of the code you're editing
  Plug 'folke/twilight.nvim'

"  Smart and Powerful commenting plugin for neovim
  Plug 'numToStr/Comment.nvim'

" style git blame visualizer for Neovim.
  Plug 'FabijanZulj/blame.nvim'


" save the nvim-dap's checkpoints to file and automatically load them when you open neovim
Plug 'Weissle/persistent-breakpoints.nvim'


" This tiny plugin adds vscode-like pictograms to neovim built-in lsp
Plug 'onsails/lspkind.nvim'

" none-ls.nvim
Plug 'nvimtools/none-ls.nvim'



" Extensible UI for Neovim notifications and LSP progress messages.
Plug 'j-hui/fidget.nvim'

" asynchronous linter plugin 
Plug 'mfussenegger/nvim-lint'


" Snippy
Plug 'dcampos/nvim-snippy'


" preview code with LSP code actions applied
Plug 'aznhe21/actions-preview.nvim'

" provide immediate navigation to important files
Plug 'cbochs/grapple.nvim'

" provides a command for LSP renaming with immediate visual feedback thanks to Neovim's command preview feature
Plug 'smjonas/inc-rename.nvim'


" Neovim HTTP client
Plug 'rest-nvim/rest.nvim'

" Preview markdown code directly in your neovim terminal
Plug 'ellisonleao/glow.nvim'


" interacting with and manipulating Vim marks
Plug 'chentoast/marks.nvim'

" reimagine organization as you know it. Grab some coffee, start writing some notes, let your editor handle the rest
Plug 'nvim-neorg/neorg'

" A Lua Gui and util library for nvim plugins
Plug 'ray-x/guihua.lua', {'do': 'cd lua/fzy && make' }


" Tabs, as understood by any other editor
Plug 'romgrk/barbar.nvim'


" A tree like view for symbols in Neovim using the Language Server Protocol. Supports all your favourite languages
Plug 'simrat39/symbols-outline.nvim'


" Use Neovim as a language server to inject LSP diagnostics, code actions, and more via Lua
Plug 'jose-elias-alvarez/null-ls.nvim'


" Zen Mode
Plug 'folke/zen-mode.nvim'


" generate ready to go rr dap configurations
Plug 'jonboh/nvim-dap-rr'

" a color scheme for neo vim inspired by the woods
Plug 'xero/miasma.nvim'



" Image Preview for Neovim
Plug 'adelarsq/image_preview.nvim'


" maintaining project history and providing quick access to saved sessions via Telescope.
Plug 'coffebar/neovim-project'


" generate ready to go rr dap configurations
Plug 'olimorris/codecompanion.nvim'


" Open remote git repositories in the comfort of Neovim
Plug 'moyiz/git-dev.nvim'

" get LSP context from your language server
Plug 'utilyre/barbecue.nvim'

" Text editing in Neovim with immediate visual feedback: view the effects of any command on your buffer contents live
Plug 'smjonas/live-command.nvim'


" Display a character as the colorcolumn
Plug 'lukas-reineke/virt-column.nvim'




" Code_Runner
Plug 'CRAG666/code_runner.nvim'


" display references, definitions, and implementations of document symbols with a view like JetBrains Idea
Plug 'Wansmer/symbol-usage.nvim'



" Smoothly navigate between neovim and multiplexer
Plug 'numToStr/Navigator.nvim'


" previewing native LSP's goto definition, type definition, implementation, declaration and references calls in floating windows
Plug 'rmagatti/goto-preview'


" simplifies debugging for those who prefer a low-tech approach
Plug 'andrewferrier/debugprint.nvim'


" Formatter.nvim
Plug 'mhartington/formatter.nvim'

" collection for a set of different programming languages.
Plug 'rafamadriz/friendly-snippets'

" vim-vsnip
Plug 'hrsh7th/vim-vsnip'
Plug 'hrsh7th/vim-vsnip-integ'


" Automagical editing and creation of snippets.
Plug 'chrisgrieser/nvim-scissors'

" Lion.vim 
Plug 'tommcdo/vim-lion'




" Auto Session takes advantage of Neovim's existing session management capabilities to provide seamless automatic session management
Plug 'rmagatti/auto-session'



" Tabular
Plug 'godlygeek/tabular'

" 'mini.nvim' library
Plug 'echasnovski/mini.nvim'
Plug 'echasnovski/mini.nvim', { 'branch': 'stable' }

" vim-easy-align 
Plug 'junegunn/vim-easy-align'

" Create beautiful code snippets directly from your neovim terminal
Plug 'ellisonleao/carbon-now.nvim'


" shows a lightbulb in the sign column whenever a textDocument/codeAction is available at the current cursor position
Plug 'kosayoda/nvim-lightbulb'

" auto-pairing plugins lack: multiline support, treesitter-node filtering and treesitter-filetype detection
Plug 'altermo/ultimate-autopair.nvim'


" SQL
Plug 'kkharji/sqlite.lua'


" visualise and resolve conflicts in neovim
Plug 'akinsho/git-conflict.nvim', { 'branch': 'latest' }



" Dark and Light Themes for neovim
Plug 'navarasu/onedark.nvim'



" DFancy and Blazing Fast start screen plugin of neovim
Plug 'nvimdev/dashboard-nvim'


" A Neovim plugin for writing and navigating Obsidian vaults
Plug 'epwalsh/obsidian.nvim', { 'branch': 'release'  }


" An extremely lightweight plugin (~ 120loc) that hightlights ranges you have entered in commandline
Plug 'winston0410/range-highlight.nvim'


" aesthetically pleasing and feature-rich neovim config that is extensible and easy to use with a great set of plugins
Plug 'AstroNvim/AstroNvim'



" Search your git history by commit message, content and author in Neovim
Plug 'aaronhallaert/advanced-git-search.nvim'


" Database Client for NeoVim!
Plug 'kndndrj/nvim-dbee'


" Open alternative files for the current buffer
Plug 'rgroli/other.nvim'


" ChatGPT
Plug 'jackMort/ChatGPT.nvim'


" Structural search and replace for Neovim
Plug 'cshuaimin/ssr.nvim'

Plug 'akinsho/bufferline.nvim', { 'tag': '*' }
" Plug 'karb94/neoscroll.nvim'
Plug 'brenoprata10/nvim-highlight-colors'

Plug 'JoosepAlviste/nvim-ts-context-commentstring'

" Debug Adapter Protocol/ UI for nvim-dap 
Plug 'mfussenegger/nvim-dap'
Plug 'nvim-neotest/nvim-nio'
Plug 'rcarriga/nvim-dap-ui'
Plug 'theHamsta/nvim-dap-virtual-text'



" Async formatting and linting utility for neovim
Plug 'nvimdev/guard.nvim'

" leverages Neovim's built-in RPC functionality to simplify opening 
" files from within Neovim's terminal emulator without nesting sessions
Plug 'samjwill/nvim-unception'



" A simple OOP library for Lua. It has inheritance, metamethods (operators), class variables and weak mixin support
Plug 'anuvyklack/middleclass'


" An OOP library to create animations in Neovim (as far as terminal 
" application with unstable timer allows creating animations)
Plug 'anuvyklack/animation.nvim'

" Neovim compiler for building and running your code without having to configure anything.
Plug 'Zeioth/compiler.nvim'


" implementation of the famous Emacs Hydra package
Plug 'nvimtools/hydra.nvim'


" manage workspace directories in neovim
Plug 'natecraddock/workspaces.nvim'



" explorer 
Plug 'stevearc/oil.nvim'

Plug 'morhetz/gruvbox'
Plug 'ellisonleao/gruvbox.nvim'

" A dark beautiful Neovim theme
Plug 'eddyekofo94/gruvbox-flat.nvim'

" File search
  Plug 'junegunn/fzf', 
    \ { 'do': { -> fzf#install() } }            " Fuzzy finder 
  Plug 'junegunn/fzf.vim'

" Language Support
  Plug 'davidhalter/jedi-vim'

" Neovim setup for init.lua and plugin development
Plug 'folke/neodev.nvim'

 
" UI Component Library 
  Plug 'MunifTanjim/nui.nvim'

" A simple popup display that provides breadcrumbs like navigation feature 
" but in keyboard centric manner inspired by ranger file manager.
  Plug 'SmiteshP/nvim-navbuddy'



"  utilize to expose remote resources 
  Plug 'miversen33/netman.nvim'

" Lightweight yet powerful formatter plugin for Neovim
Plug 'stevearc/conform.nvim'


" edit remote files from the comfort of their local environment 
Plug 'chipsenkbeil/distant.nvim', {
\ 'branch': 'v0.3'}
"\ 'do': ':lua require("distant"):setup()'
"\ }


" Visualize your undo tree and fuzzy-search changes in it
  Plug 'debugloop/telescope-undo.nvim'
 
 
" Rosé Pine for Neovim
  Plug 'rose-pine/neovim'

" A highly customizable theme for vim and neovim with support for lsp, treesitter and a variety of plugins
Plug 'EdenEast/nightfox.nvim' 


" IDE-like breadcrumbs, out of the box
Plug 'Bekaboo/dropbar.nvim'


" improve lsp experences in neovim
  Plug 'uga-rosa/ccc.nvim'

" Create annotations with one keybind, and jump your cursor in the inserted annotation
  Plug 'danymat/neogen'

 
" improve lsp experences in neovim
  Plug 'nvimdev/lspsaga.nvim'
 

" Fast and feature-rich surround actions
  Plug 'echasnovski/mini.surround', { 'branch': 'stable' }
 
 
" A git interface for Neovim, inspired by Magit
  Plug 'NeogitOrg/neogit'
 

" Preview Markdown in your modern browser with synchronised scrolling and flexible configuration.
  Plug 'iamcco/markdown-preview.nvim', { 'do': { -> mkdp#util#install() }, 'for': ['markdown', 'vim-plug']} 
 
 
 
 
" Status bar
  Plug 'vim-airline/vim-airline'
  Plug 'vim-airline/vim-airline-themes'

" Terminal
  Plug 'voldikss/vim-floaterm'                  " Float terminal

" Code intellisense
  Plug 'neoclide/coc.nvim', 
    \ {'branch': 'release'}                     " Language server protocol (LSP) 
  Plug 'jiangmiao/auto-pairs'                   " Parenthesis auto 
  Plug 'alvan/vim-closetag'
  Plug 'mattn/emmet-vim' 
  Plug 'preservim/nerdcommenter'                " Comment code 
  " Plug 'liuchengxu/vista.vim'                   " Function tag bar
  Plug 'alvan/vim-closetag'                     " Auto close HTML/XML tag 
    \ { 
      \ 'do': 'yarn install '
              \ .'--frozen-lockfile '
              \ .'&& yarn build',
      \ 'branch': 'main' 
    \ }

" Code syntax highlight
  " Plug 'yuezk/vim-js'                           " Javascript
  " Plug 'MaxMEllon/vim-jsx-pretty'               " JSX/React
  " Plug 'jackguo380/vim-lsp-cxx-highlight'       " C/C++
  " Plug 'uiiaoo/java-syntax.vim'                 " Java
  Plug 'sheerun/vim-polyglot'
  
" Debugging
  Plug 'puremourning/vimspector'                " Vimspector

" glance at matched information, seamlessly jump between matched instances
  Plug 'kevinhwang91/nvim-hlslens'


" improved * motions
  Plug 'haya14busa/vim-asterisk'


" Extensible Neovim Scrollbar
  Plug 'petertriho/nvim-scrollbar'




" Fold 
  Plug 'tmhedberg/SimpylFold'
  
" Autocompletion
Plug 'hrsh7th/nvim-cmp'
Plug 'hrsh7th/cmp-nvim-lsp'
Plug 'L3MON4D3/LuaSnip', {'tag': 'v2.*', 'do': 'make install_jsregexp'} " Replace <CurrentMajor> by the latest released major (first number of latest release)

Plug 'saadparwaiz1/cmp_luasnip'
Plug 'onsails/lspkind-nvim'


" Lightline
Plug 'itchyny/lightline.vim'


Plug 'gruvbox-community/gruvbox'

Plug 'vim-scripts/a.vim'

" Code formatting (for c++)
" Plug 'google/vim-maktaba'
" Plug 'google/vim-codefmt'
" Plug 'google/vim-glaive'

" scnvim
Plug 'davidgranstrom/scnvim'
Plug 'davidgranstrom/nvim-markdown-preview'

Plug 'windwp/nvim-projectconfig'

" Find cursor on move
Plug 'danilamihailov/beacon.nvim'

" Mark pattern
" needed by vim-mark
Plug 'inkarkat/vim-ingo-library'
Plug 'inkarkat/vim-mark'

" Jinja syntax highlighting
" https://github.com/lepture/vim-jinja
Plug 'lepture/vim-jinja'


" File explorer
Plug 'nvim-tree/nvim-web-devicons' " for file icons
Plug 'nvim-tree/nvim-tree.lua'

" Format on save
" https://github.com/vim-autoformat/vim-autoformat
Plug 'Chiel92/vim-autoformat'


" colour schemes
" http://neovimcraft.com/plugin/marko-cerovac/material.nvim/index.html
Plug 'marko-cerovac/material.nvim'


" navigate your code with search labels, enhanced character motions, and Treesitter integration
Plug 'folke/flash.nvim'


" navigate your code with search labels, enhanced character motions, and Treesitter integration
Plug 'nvim-neo-tree/neo-tree.nvim'


" A high-contrast, futuristic & vibrant theme for neovim
Plug 'scottmckendry/cyberdream.nvim'


" Snapshot plugin with rich features that can make pretty code snapshots for Neovim
Plug 'mistricky/codesnap.nvim', { 'do': 'make' }


" TailwindCSS Colorizer CMP
Plug 'roobert/tailwindcss-colorizer-cmp.nvim'


" Edit and review GitHub issues and pull requests from the comfort of your favorite editor.
Plug 'pwntester/octo.nvim'



" A framework for interacting with tests within NeoVim.
Plug 'antoinemadec/FixCursorHold.nvim'
Plug 'nvim-neotest/nvim-nio'
Plug 'nvim-neotest/neotest'


" A high-performance color highlighter for Neovim which has no external dependencies
Plug 'NvChad/nvim-colorizer.lua'

" A neovim plugin to persist and toggle multiple terminals during an editing session
Plug 'akinsho/toggleterm.nvim', {'tag' : '*'}


" Catppuccin 
Plug 'catppuccin/nvim', { 'as': 'catppuccin' }


" Single tabpage interface for easily cycling through diffs for all modified files for any git rev
Plug 'sindrets/diffview.nvim'

" Highly experimental plugin that completely replaces the UI for messages, cmdline and the popupmenu
Plug 'folke/noice.nvim'


" A super powerful autopair plugin for Neovim that supports multiple characters 
 Plug 'windwp/nvim-autopairs' 


" Explore, edit, and develop on a remote machine via SSHFS with Neovim
Plug 'nosduco/remote-sshfs.nvim'


" add image support to Neovim
Plug '3rd/image.nvim'



" Getting you where you want with the fewest keystrokes.
" Plug 'ThePrimeagen/harpoon/tree/harpoon2'


" allow plugin authors to override them with improvements upon the default behavior
Plug 'stevearc/dressing.nvim'

" Build flutter and dart applications in neovim using the native LSP
Plug 'akinsho/flutter-tools.nvim'


" highlight and search for todo comments like TODO, HACK, BUG in your code base.
Plug 'folke/todo-comments.nvim'

" A fancy, configurable, notification manager for NeoVim
Plug 'rcarriga/nvim-notify'


" add image support to Neovim
Plug 'NStefan002/screenkey.nvim'



" Explore, edit, and develop on a remote machine via SSHFS with Neovim
Plug 'MeanderingProgrammer/markdown.nvim'


" Copilot Chat for Neovim
Plug 'zbirenbaum/copilot.lua'
Plug 'CopilotC-Nvim/CopilotChat.nvim', { 'branch': 'canary' }



" vim-angry-reviewer
Plug 'anufrievroman/vim-angry-reviewer'

" criticmarkup support for vim
Plug 'vim-pandoc/vim-criticmarkup'


" Telescope
Plug 'nvim-lua/popup.nvim'
Plug 'nvim-lua/plenary.nvim'
Plug 'nvim-telescope/telescope.nvim', { 'tag': '0.1.6' }
Plug 'nvim-telescope/telescope-fzf-native.nvim', { 'do': 'cmake -S. -Bbuild -DCMAKE_BUILD_TYPE=Release && cmake --build build --config Release && cmake --install build --prefix build' }


Plug 'autozimu/LanguageClient-neovim', {
            \ 'branch': 'next',
            \ 'do': 'bash install.sh',
            \ } 
Plug 'Shougo/deoplete.nvim', { 'do': ':UpdateRemotePlugins' }


" Cheatsheet
Plug 'sudormrfbin/cheatsheet.nvim'

" Minimal and fast autopairs
Plug 'echasnovski/mini.pairs', { 'branch': 'stable' }

" adds indentation guides to Neovim
Plug 'lukas-reineke/indent-blankline.nvim'




" Faster search and replace
Plug 'eugen0329/vim-esearch'

" Accelerated jk
Plug 'rhysd/accelerated-jk'

" repeat plugin commands
Plug 'tpope/vim-repeat'

" Indent text object
Plug 'michaeljsmith/vim-indent-object'

" SudaWrite and SudaRead
Plug 'lambdalisue/suda.vim'

" History tree
Plug 'simnalamburt/vim-mundo'

" highlight target
Plug 'phaazon/hop.nvim'

" Unicode characters
Plug 'chrisbra/unicode.vim'

" popup available commands
Plug 'folke/which-key.nvim'

" """"""""""""""""""""""""""
" Language engines and hints
" """"""""""""""""""""""""""

" Let's set traditional stuffs and then overwrite them
Plug 'sheerun/vim-polyglot'

" Tags
Plug 'ludovicchabant/vim-gutentags'

" Documentation search
Plug 'sunaku/vim-dasht'

Plug 'romainl/vim-devdocs'

" match syntactic start/end
Plug 'andymass/vim-matchup'


" Smarter and more intuitive split pane management that uses a mental model 
" of left/right/up/down instead of wider/narrower/taller/shorter for resizing
Plug 'mrjones2014/smart-splits.nvim'


" Swap Function Arguments
Plug 'PeterRincker/vim-argumentative'

" Tree-sitter support
Plug 'nvim-treesitter/nvim-treesitter', {'on': [], 'do': ':TSUpdate'}

" Tree-sitter text-object
Plug 'nvim-treesitter/nvim-treesitter-textobjects', {'on': []}

" Rainbow parenthesis using tree-sitter
Plug 'p00f/nvim-ts-rainbow', {'on': []}

" Floating preview for tags
Plug 'weilbith/nvim-floating-tag-preview'

" Neovim LSP
Plug 'neovim/nvim-lspconfig', {'on': []}

" A simple statusline/winbar component that uses LSP to show your current code context
Plug 'SmiteshP/nvim-navic'

" Diagnostics
Plug 'folke/trouble.nvim'


" Portable package manager for Neovim that runs everywhere Neovim runs.
Plug 'williamboman/mason.nvim'



" Show light bulb when there are code-actions
Plug 'kosayoda/nvim-lightbulb', {'on': []}

" Make tag stuffs work for LSP (e.g. nvim-floating-tag-preview)
" Plug 'weilbith/nvim-lsp-smag', {'on': []} " breaks floating-tag-preview

" better signature help
Plug 'Shougo/echodoc.vim'

" Completion plugins
Plug 'hrsh7th/nvim-compe'

" auto close parenthesis
Plug 'Raimondi/delimitMate'

" Plug '00sapo/vim-endwise', {'branch': 'patch-1'}

" autoformat
Plug 'sbdchd/neoformat'

" Comments
Plug 'tpope/vim-commentary'

" Snippets engine
Plug 'SirVer/ultisnips'

" Snippets are separated from the engine. Add this if you want them:
Plug 'honza/vim-snippets'

" Run commands in the background (Asyncrun breaks vim-surround)
Plug 'tpope/vim-dispatch'

" surround with
Plug 'tpope/vim-surround'

" html tags
Plug 'alvan/vim-closetag'

" extract variable
Plug 'fvictorio/vim-extract-variable'

" grammar
Plug 'rhysd/vim-grammarous'

" Thesaurus
Plug 'Ron89/thesaurus_query.vim'

" """""""""""""""""""
" Buffers and windows
" """""""""""""""""""

" win resizer
Plug 'simeji/winresizer'

" Startify
Plug 'mhinz/vim-startify'

" Better terminal and repls
Plug 'kassio/neoterm'

" Open a scratchpad
Plug 'mtth/scratch.vim'

" Grey out inactive buffers (shade.nvim looks better, but is buggy)
" Plug 'TaDaa/vimade'

" status bar
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'

" vim diff
Plug 'lambdalisue/vim-unified-diff'
Plug 'rickhowe/diffchar.vim'
Plug 'lambdalisue/vim-improve-diff'

" Preview window to floating window
Plug 'ncm2/float-preview.nvim'

" """
" Git
" """

" Web API (needed for Gist
Plug 'mattn/webapi-vim'

" Gist
Plug 'mattn/gist-vim'

" LazyGit
Plug 'kdheepak/lazygit.nvim'
"
" Git show line changed and stage hunks
Plug 'lewis6991/gitsigns.nvim'

" Easier diff/merge and git management
Plug 'tpope/vim-fugitive'

" """"""""""""""""""
" Language specifics
" """"""""""""""""""

" python (mostly for refactoring until it is not provided by a good
" language server)
Plug 'python-rope/ropevim'

" Better autormat for Julia
Plug 'kdheepak/JuliaFormatter.vim'

" LATEX
Plug 'lervag/vimtex'

" """"""""""
" Appearance
" """"""""""

" Semantic Highlight
Plug 'jaxbot/semantic-highlight.vim'

" Nerd Fonts
Plug 'ryanoasis/vim-devicons'

" File browser
  Plug 'preservim/nerdTree'                     " File browser  
  Plug 'Xuyuanp/nerdtree-git-plugin'            " Git status
  " Plug 'ryanoasis/vim-devicons'                 " Icon
  Plug 'unkiwii/vim-nerdtree-sync'              " Sync current file 
  Plug 'jcharum/vim-nerdtree-syntax-highlight',
    \ {'branch': 'escape-keys'}
	
" Some more colorschemes, use `:Colors`
Plug 'rafi/awesome-vim-colorschemes'

" Indent guideline
Plug 'lukas-reineke/indent-blankline.nvim'

" """""
" Other
" """""

" edit with externallly if firenvim is too much slow
Plug 'raghur/vim-ghost', {'do': ':GhostInstall'}

" ActivityWatcher
" Plug 'ActivityWatch/aw-watcher-vim'

" configure Neovim statusline
Plug 'nvim-lualine/lualine.nvim'
" If you want to have icons in your statusline choose one of these
Plug 'nvim-tree/nvim-web-devicons'


" VimSum
Plug 'wgurecky/vimSum'

" Drawing boxes and lines
Plug 'gyim/vim-boxdraw'

" Material Theme
Plug 'marko-cerovac/material.nvim'


" APM (nvim > 0.5)
" until update
" Plug 'polarmutex/vim-apm', {'branch': 'neovim-api-fixes'}

call plug#end()

let maplocalleader = ']'

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

" Beacon
let g:beacon_minimal_jump = 1

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""




""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Tree-sitter
function! LoadTreeSitterSetup()
    call plug#load('nvim-treesitter', 'nvim-treesitter-textobjects', 'nvim-ts-rainbow')
    lua <<EOF
require'nvim-treesitter.configs'.setup {
    ensure_installed = "maintained", -- one of "all", "maintained" (parsers with maintainers), or a list of languages
    highlight = {
        enable = true,              -- false will disable the whole extension
    },
    indent = { enable = false },
    incremental_selection = {
        enable = true,
        keymaps = {
            init_selection = "tis",
            node_incremental = "ni",
            scope_incremental = "si",
            node_decremental = "nd",
            scope_decremental = "sd",
        },
    },
    rainbow = {
        enable = true,
        extended_mode = true, -- Highlight also non-parentheses delimiters, boolean or table: lang -> boolean
        max_file_lines = 2000, -- Do not enable for files with more than 2000 lines, int
    },
    textobjects = {
        select = {
          enable = true,
          keymaps = {
            -- You can use the capture groups defined in textobjects.scm
            ["of"] = "@function.outer",
            ["if"] = "@function.inner",
            ["oc"] = "@class.outer",
            ["ic"] = "@class.inner",
            ["ob"] = "@block.outer",
            ["ib"] = "@block.inner",
            -- ["of"] = "@frame.outer",
            -- ["if"] = "@frame.inner",
            ["ol"] = "@loop.outer",
            ["il"] = "@loop.inner",
            ["oc"] = "@conditional.outer",
            ["ic"] = "@conditional.inner",
            ["op"] = "@parameter.outer",
            ["ip"] = "@parameter.inner",
          },
        },
    },
    matchup = {
        enable = true,              -- mandatory, false will disable the whole extension
    },
}
EOF

    set foldmethod=expr
    set foldexpr=nvim_treesitter#foldexpr()

    nnoremap <localleader>= :TSBufToggle highlight<CR>

    let g:indent_blankline_use_treesitter = v:true

endfunction

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" LSP
function! LoadLspSetup()
    call plug#load('nvim-lspconfig', 'nvim-lightbulb')
    " call plug#load('nvim-lspconfig', 'nvim-lightbulb', 'nvim-lsp-smag')
    nnoremap <silent>gD             <cmd>lua vim.lsp.buf.declaration()<CR>
    nnoremap <silent>gd             <Cmd>lua vim.lsp.buf.definition()<CR>
    nnoremap <silent>gdt            <cmd>lua vim.lsp.buf.type_definition()<CR>
    nnoremap <silent>K              <Cmd>lua vim.lsp.buf.hover()<CR>
    nnoremap <silent>gi             <cmd>lua vim.lsp.buf.implementation()<CR>
    nnoremap <silent>gr             <cmd>lua vim.lsp.buf.references()<CR>
    nnoremap <silent>H              <cmd>lua vim.lsp.buf.signature_help()<CR>
    nnoremap <silent>R              <cmd>lua vim.lsp.buf.rename()<CR>
    nnoremap <silent><C-k>          <cmd>lua vim.lsp.diagnostic.goto_prev()<CR>
    nnoremap <silent><C-j>          <cmd>lua vim.lsp.diagnostic.goto_next()<CR>
    nnoremap <silent><localleader>c <cmd>lua vim.lsp.buf.code_action()<CR>
    nnoremap <silent><localleader>e <cmd>lua vim.lsp.diagnostic.show_line_diagnostics()<CR>
    nnoremap <silent><localleader>q <cmd>lua vim.lsp.diagnostic.set_loclist()<CR>
    nnoremap <silent><leader>a      <cmd>lua vim.lsp.buf.formatting()<CR>

    augroup LightBulb
        au!
        au CursorHold,CursorHoldI * lua require'nvim-lightbulb'.update_lightbulb()
    augroup END
endfunction

" nnoremap <silent>, l        ocalleader>wa, <cmd>lua vim.lsp.buf.add_workspace_folder()<CR>'
" nnoremap <silent>, l        ocalleader>wr, <cmd>lua vim.lsp.buf.remove_workspace_folder()<CR>'
" nnoremap <silent>, l        ocalleader>wl, <cmd>lua print(vim.inspect(vim.lsp.buf.list_workspace_folders()))<CR>'

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

" ProjectConfig
command! -bar GlobalConf vs $MYVIMRC
command! -bar ProjectConf lua require("nvim-projectconfig").edit_project_config()
command! -bar LoadProjectConf lua require('nvim-projectconfig').load_project_config()
command! -bar LoadLsp call LoadLspSetup()
command! -bar LoadTreeSitter call LoadTreeSitterSetup()

augroup NvimProjectConfig
 autocmd!
 autocmd DirChanged,VimEnter * LoadProjectConf
augroup end

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

" Accelerated jk
nmap j <Plug>(accelerated_jk_gj)
nmap k <Plug>(accelerated_jk_gk)
let g:accelerated_jk_acceleration_table = [4, 8, 12, 16, 20, 24]

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""


""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Blank line
let g:indent_blankline_show_current_context = v:false
let g:indent_blankline_context_patterns = ['^for', '^while', '^if', '^module', '^mutable', '^quote', 'struct', 'macro', 'function', 'method', 'class']
let g:indent_blankline_filetype_exclude = ['help']
let g:indent_blankline_buftype_exclude = ['terminal']

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Completion
set completeopt=menuone,noselect
let g:compe = {}
let g:compe.enabled = v:true
let g:compe.autocomplete = v:true
let g:compe.debug = v:false
let g:compe.min_length = 1
let g:compe.preselect = 'enable'
let g:compe.throttle_time = 80
let g:compe.source_timeout = 200
let g:compe.resolve_timeout = 800
let g:compe.incomplete_delay = 400
let g:compe.max_abbr_width = 100
let g:compe.max_kind_width = 100
let g:compe.max_menu_width = 100
let g:compe.documentation = v:true

" see :h compe-source
let g:compe.source = {
    \ 'omni': {
    \  'filetypes': ['tex'],
    \ }
    \}
let g:compe.source.path = v:true
let g:compe.source.tags = v:true
let g:compe.source.buffer = v:true
let g:compe.source.nvim_lsp = v:true
let g:compe.source.ultisnips = v:true
let g:compe.source.emoji = v:true
call compe#setup(g:compe)
function! s:solve_complete_endwise_conflict()
    if pumvisible()
        if complete_info()["selected"] >= 0
            return "\<C-\>"
        else
            return "\<C-e>\<CR>"
        endif
    else
        return "\<CR>"
    endif
endfunction
inoremap <expr><CR>  s:solve_complete_endwise_conflict()
inoremap <silent><expr><C-Space> compe#complete()
inoremap <silent><expr><C-e>     compe#close('<C-e>')
inoremap <expr><TAB>  pumvisible() ? "\<C-n>" : "\<TAB>"
inoremap <expr><S-TAB>  pumvisible() ? "\<C-p>" : "\<TAB>"

" Floating preview for docs
let g:float_preview#docked = 0

" Snippets
let g:UltiSnipsExpandTrigger='<c-b>'
let g:UltiSnipsJumpForwardTrigger='<tab>'
let g:UltiSnipsJumpBackwardTrigger='<s-tab>'

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

" echodoc
let g:echodoc#enable_at_startup = 1
let g:echodoc#type = 'virtual'

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Dasht

nnoremap <silent>K  :Dasht <C-r><C-w><CR>

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Preview tag on hold
let g:floating_tag_preview_highlight_tag_word = v:false
let g:floating_tag_preview_auto_closing_events = [
    \ 'InsertEnter', 'WinNew', 'WinEnter', 'BufEnter', 'BufNew', 'CursorMoved', 'WinScrolled']
nnoremap <C-l> :Ptnext<CR>
nnoremap <C-h> :Ptprevious<CR>
nnoremap = :Ptag <C-r><C-w><CR>

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Indentation
let g:indentLine_char = '▏'

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

" Autoformat

vmap <localleader>a :Neoformat<CR>
nmap <localleader>a :Neoformat<CR>
" Enable alignment
let g:neoformat_basic_format_align = 1
" Enable tab to spaces conversion
let g:neoformat_basic_format_retab = 1
" Enable trimmming of trailing whitespace
let g:neoformat_basic_format_trim = 1

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

" Unicode Characters
nnoremap <localleader>u :call unicode#Fuzzy()<CR>
inoremap <C-d> <esc>vh:<C-U>call unicode#GetDigraph(visualmode(), 1)<CR>a
nnoremap ga :UnicodeName<CR>
imap <C-u>u <Plug>(UnicodeComplete)
imap <C-u>d <Plug>(DigraphComplete)

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

" Gutentags
" ignore hidden files or directory when creating tags
let g:gutentags_ctags_exclude = ['.venv', '.mypy_cache', '.git']
let g:gutentags_project_root = ['.gutentags']
let g:gutentags_modules = ['ctags']
" let g:gutentags_cache_dir = expand('~/.cache/nvim/ctags/')
let g:gutentags_generate_on_new = 1
let g:gutentags_generate_on_missing = 1
let g:gutentags_generate_on_write = 1
let g:gutentags_generate_on_empty_buffer = 0
let g:gutentags_ctags_extra_args = [
      \ '--fields=+ailmnS',
      \ ]

      " \ '--tag-relative=yes',

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Semantic Highlight

" the enables semantic highlight on the keys filetypes and cursorhold update
" on the corresponding extensions
let g:semanticEnableFileTypes = { 
            \ 'javascript': 'js',
            \ 'vim': 'vim', 
            \ 'python': 'py',
            \ 'c': 'c',
            \ 'cpp': 'cpp',
            \ 'java': 'java',
            \ 'julia': 'jl',
            \ 'r': 'r',
            \ 'matlab': 'm',
            \ 'lua': 'lua'
            \ }
let g:semanticUseCache=1
let g:semanticPersistCache=1
" let g:semanticEnableBlacklist=0

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

" Telescope

" mappings
nnoremap <localleader>1 <cmd>Telescope file_browser<cr>
nnoremap <localleader>2 <cmd>Telescope git_files<cr>
nnoremap <localleader>3 <cmd>Telescope buffers<cr>
nnoremap <localleader>f <cmd>Telescope grep_string<cr>
nnoremap <localleader>g <cmd>Telescope live_grep<cr>
nnoremap <localleader>t <cmd>Telescope tags<cr>
nnoremap <localleader>r <cmd>Telescope registers<cr>
nnoremap <localleader>q <cmd>Telescope quickfix<cr>
nnoremap <localleader>l <cmd>Telescope loclist<cr>
nnoremap <space> <cmd>Telescope marks<cr>

lua << EOF
require("telescope").setup {
    pickers = {
        git_files = {
            show_untracked=false,
            recurse_submodules=true
        },
        tags = {
            show_line = true
        },
        buffers = {
            show_all_buffers = true,
            sort_lastused = false,
            -- theme = "dropdown",
            -- previewer = true,
            mappings = {
                i = {
                    ["<c-d>"] = require("telescope.actions").delete_buffer,
                },
                n = {
                    ["<c-d>"] = require("telescope.actions").delete_buffer,
                }
            }
        }
    }
}
EOF

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

" vim-esearch
let g:esearch = {}

" Start the search only when the enter is hit instead of updating the pattern while you're typing.
let g:esearch.live_update = 0

" Open the search window in a vertical split and reuse it for all further searches.
let g:esearch.name = '[esearch]'
let g:esearch.win_new = {esearch -> esearch#buf#goto_or_open(esearch.name, 'tabnew')}

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

" Vimtex
function RemoteCompiler()
    if empty(v:servername) && exists('*remote_startserver')
        call remote_startserver('VIM')
    endif
endfunction

augroup VimTex
    au!
    au FIleType tex setlocal spell spelllang=en_us
    au FIleType tex set tw=80
    au FIleType tex :call RemoteCompiler()
    au FIleType tex :VimtexTocOpen
augroup END
let g:tex_flavor = 'latex'
let g:vimtex_fold_enabled = 1
let g:vimtex_view_general_viewer = 'okular'
let g:vimtex_view_general_options = '--unique file:@pdf\#src:@line@tex'
let g:vimtex_view_general_options_latexmk = '--unique'
let g:vimtex_quickfix_open_on_warning = 0
let g:vimtex_compiler_latexmk = {'build_dir': 'build'}

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" LanguageTool / spell checcker

let g:grammarous#default_comments_only_filetypes = {
            \ '*' : 1, 'help' : 0, 'markdown' : 0,
            \ }

let g:grammarous#use_vim_spelllang = 1

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

" status bar
let g:airline_powerline_fonts = 1
let g:airline#parts#ffenc#skip_expected_string='utf-8[unix]'

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

" Mark pattern
vmap <localleader>h <Plug>MarkSet
vmap <localleader>n <Plug>MarkClear
nmap <localleader>h <Plug>MarkSet
nmap <localleader>n <Plug>MarkClear


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

" Neoterm
nmap <localleader>ss <Plug>(neoterm-repl-send-line)
nmap <localleader>s <Plug>(neoterm-repl-send)
vmap <localleader>s <Plug>(neoterm-repl-send)
nmap <localleader>S s$

" Executes commands in a terminal
let g:neoterm_automap_keys = '<localleader>x'

set scrollback=10000

autocmd WinEnter term://* startinsert
autocmd WinLeave term://* stopinsert

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" open NERDTree automatically
autocmd StdinReadPre * let s:std_in=1
autocmd VimEnter * NERDTree

let g:NERDTreeGitStatusWithFlags = 1
"let g:WebDevIconsUnicodeDecorateFolderNodes = 1
"let g:NERDTreeGitStatusNodeColorization = 1
"let g:NERDTreeColorMapCustom = {
    "\ "Staged"    : "#0ee375",  
    "\ "Modified"  : "#d9bf91",  
    "\ "Renamed"   : "#51C9FC",  
    "\ "Untracked" : "#FCE77C",  
    "\ "Unmerged"  : "#FC51E6",  
    "\ "Dirty"     : "#FFBD61",  
    "\ "Clean"     : "#87939A",   
    "\ "Ignored"   : "#808080"   
    "\ } 

let g:NERDTreeIgnore = ['^node_modules$']

nmap <silent> gd <Plug>(coc-definition)
nmap <silent> gy <Plug>(coc-type-definition)
nmap <silent> gr <Plug>(coc-references)

nmap <silent> [g <Plug>(coc-diagnostic-prev)
nmap <silent> ]g <Plug>(coc-diagnostic-next)
nnoremap <silent> <space>s :<C-u>CocList -I symbols<cr>

nnoremap <silent> <space>d :<C-u>CocList diagnostics<cr>

nmap <leader>do <Plug>(coc-codeaction)

nmap <leader>rn <Plug>(coc-rename)

let g:coc_global_extensions = [
  \ 'coc-tsserver',
  \ 'coc-json',
  \ 'coc-css',
  \  'coc-eslint',
  \  'coc-prettier'
  \ ]
  
set laststatus=2
let g:airline#extensions#tabline#enabled = 1
let g:airline_powerline_fonts = 1
let g:airline_statusline_ontop=0
let g:airline_theme='ayu_light'
let g:airline#extensions#tabline#formatter = 'default'

" navigation between buffers
nnoremap <M-Right> :bn<cr>
nnoremap <M-Left> :bp<cr>
nnoremap <c-x> :bp \|bd #<cr>

  
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

" Startify

let g:startify_change_to_dir = 1
let g:startify_change_to_vcs_root = 1
let g:startify_change_cmd = 'cd'

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

" Gitsigns
lua require'gitsigns'.setup()

" Scratchpad
let g:scratch_autohide = 1
let g:scratch_insert_autohide = 0
map <leader>gs :ScratchPreview<CR>

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

" " Vimade (fade out inactive windows)
" let g:vimade = {
"     \ "fadelevel": 0.5,
"     \ }
" nnoremap <leader>s :VimadeToggle<CR>
" nnoremap <C-Up> :let g:vimade.fadelevel += 0.1<CR>
" nnoremap <C-Down> :let g:vimade.fadelevel -= 0.1<CR>

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

" LazyGit
nmap <Leader>l :LazyGit<CR>

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

" ActivityWatcher

augroup ActivityWatcher
    au!
    au VimEnter * :AWStart
augroup END

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" LANGUAGE SPECIFIC SETTINGS
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

" Julia
" formatting
let g:JuliaFormatter_always_launch_server = 1
let g:JuliaFormatter_options = {'style' : 'blue'}
" use precompiled package: go to the plugin directory and run
" julia -project scripts/packagecompiler.jl
let g:JuliaFormatter_use_sysimage=1
augroup Julia
    au!
    au FIleType julia set tw=80

    " formatting
    au FIleType julia nnoremap <buffer> <localleader>a :JuliaFormatterFormat<CR>
    au FIleType julia vnoremap <buffer> <localleader>a :JuliaFormatterFormat<CR>

augroup END

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

" MATLAB
let g:matlab_vimlab_vertical=1


""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" GENERIC

" case insensitive search by default
set ignorecase

" changing escape to jk
inoremap jk <esc>
tnoremap jk <C-\><C-n>

" clear highlighting on press jk or ,,
noremap ,, <esc>:noh<return>jk
inoremap jk <esc>:noh<return>jk

set backspace=indent,eol,start

" ctrl-w -> `
noremap ` <C-w>
" ctrl-w changes window even in insert mode
imap <C-w> <C-o><C-w>
" <alt-h/j/k/l> changes windows
nmap <silent> <A-k> :wincmd k<CR>
nmap <silent> <A-j> :wincmd j<CR>
nmap <silent> <A-h> :wincmd h<CR>
nmap <silent> <A-l> :wincmd l<CR>
imap <silent> <A-k> jk:wincmd k<CR>
imap <silent> <A-j> jk:wincmd j<CR>
imap <silent> <A-h> jk:wincmd h<CR>
imap <silent> <A-l> jk:wincmd l<CR>
" tmap <silent> <A-k> jk:wincmd k<CR>
" tmap <silent> <A-j> jk:wincmd j<CR>
" tmap <silent> <A-h> jk:wincmd h<CR>
" tmap <silent> <A-l> jk:wincmd l<CR>

" save with ctrl-s
nnoremap <C-s> :w<CR>
inoremap <C-s> <esc>:w<CR>

" Live substituting
set inccommand=nosplit

set wildmenu
set wildmode=longest,list
" set nocompatible
set relativenumber
filetype plugin indent on
" show existing tab with 4 spaces width
set tabstop=4
" when indenting with '>', use 4 spaces width
set shiftwidth=4
" On pressing tab, insert 4 spaces
set expandtab

" enable folding
set foldlevel=99

" The following is to use from eviroment clipboard
set clipboard=unnamedplus

" set modeline to use first line to detect filetype
set modeline

" cursor configuration
let &t_SI = "\<Esc>[6 q"
let &t_SR = "\<Esc>[4 q"
let &t_EI = "\<Esc>[2 q"

" Remember history
set undodir=~/.vim/undodir
set undofile
set backupdir=$HOME/.vim/tmp
set backup

set encoding=utf8

" Highlight yanked regions
 augroup HighlightYank
     autocmd!
     au TextYankPost * silent! lua vim.highlight.on_yank{timeout=250}
 augroup END

" cursors
augroup Cursors
    au!
    " au VimEnter,WinEnter,BufWinEnter * setlocal cursorcolumn
    " au WinLeave * setlocal nocursorcolumn
    au VimEnter,WinEnter,BufWinEnter * setlocal cursorline
    au WinLeave * setlocal nocursorline
augroup END

" split bar (remove it)
augroup SplitLine
    au!
    au WinNew * :hi VertSplit guibg=bg guifg=bg
augroup END

augroup Terminal
    au!
    autocmd TermOpen * set bufhidden=hide
augroup END

command! -bar -bang Marks call Telescope#vim#marks(<bang>0)

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" CUSTOM OPTIONS

" Font
" the font (for gui)
"set guifont=DejavuSansMono\ Nerd\ Font\ Mono:h14:b

"""""""""""""""""

" enables syntax highlighting
syntax on

" Better colors
set termguicolors

" number of spaces in a <Tab>
set tabstop=4
set softtabstop=4
set expandtab

" enable autoindents
set smartindent

" number of spaces used for autoindents
set shiftwidth=4

" adds line numbers
set number

" columns used for the line number
set numberwidth=4

" highlights the matched text pattern when searching
set incsearch
set nohlsearch

" open splits intuitively
set splitbelow
set splitright

" navigate buffers without losing unsaved work
set hidden

" start scrolling when 8 lines from top or bottom
set scrolloff=8

" Save undo history
set undofile

" Enable mouse support
set mouse=a

" case insensitive search unless capital letters are used
set ignorecase
set smartcase

" declare your color scheme
colorscheme gruvbox
" Use this for dark color schemes
set background=dark

"""""""""""""""""

" COLOR SCHEME
set t_Co=256   " This is may or may not needed.
set termguicolors     " enable true colors support

function! SetTheme(use_dark)
    if !a:use_dark
        """""""""""""""""
        " LIGHT THEME
        colorscheme onehalflight

        " SemanticHighLight light colors
        let g:semanticGUIColors = ['#632708', '#0A05E2', '#06839A', '#CA2D80', '#148A29', '#1A2E7F', '#76680A', '#2B625A', '#8013CA', '#094DDC', '#4B0E3C', '#6648CF', '#0983E4', '#C53941', '#15500E', '#2165B1', '#441578', '#110F92', '#704D8D', '#155B7E', '#0A7551', '#7F4F64', '#A21799', '#4A5A3A', '#775219', '#B25542', '#122AD7', '#05944D', '#B80D2B', '#0B8079', '#D12700', '#471FE3', '#3A5ED8', '#8B44B9', '#2C790E', '#682029', '#4E5690', '#99448A', '#6855B6', '#1078B5', '#B7120F', '#3F51AF', '#765549', '#282E14', '#A1476B', '#A80F53', '#4A50E4', '#485A0F', '#741D76', '#2C7539', '#37119C', '#1263C9', '#7A45A0', '#62158B', '#7A3AD2', '#BF481A', '#115C3D', '#831649', '#7313A7', '#275993', '#AE3FC4', '#3B319B', '#BA19B7', '#B23EA1', '#9C5A0C', '#157399', '#2D2BC1', '#1A4317', '#1B4834', '#4F6D0B', '#BB3A73', '#2E1667', '#891B0D', '#1E6C6D', '#571A5B', '#406029', '#173DA4', '#A70A69', '#945153', '#6B3D6E', '#810E24', '#1729A3', '#5815C7', '#2C751F', '#130BAC', '#A32747', '#494094', '#411E0E', '#4E2BC1', '#141884', '#7B5A32', '#301085', '#5C3AA8', '#1B44CB', '#134EAE', '#42360D', '#A14F16', '#1F689B', '#641C37', '#4C5223', '#4D53C9', '#3732B0', '#386850', '#2324D9', '#4357A1', '#1B6A5A', '#0C8247', '#8F3F4E', '#A51282', '#1B6B7D', '#755E0F', '#4C1211', '#2511CB', '#1429B9', '#135D2D', '#5F5819', '#C1402C', '#3F6740', '#0E77D1', '#884020', '#804038', '#2B6AE0', '#5A3F2F', '#476D21', '#0734CE', '#8A2F26', '#595F4B', '#15671B', '#0C7419', '#237C5B']
        let g:semanticTermColors = ['52', '20', '30', '162', '28', '18', '94', '239', '92', '26', '53', '62', '32', '167', '22', '25', '54', '18', '60', '24', '29', '95', '126', '239', '94', '131', '20', '29', '124', '30', '160', '56', '62', '97', '28', '52', '60', '96', '61', '31', '124', '61', '95', '235', '131', '125', '62', '58', '90', '238', '55', '26', '97', '54', '98', '130', '23', '89', '55', '24', '134', '60', '127', '133', '130', '24', '19', '235', '236', '58', '131', '17', '88', '23', '53', '238', '25', '125', '95', '59', '88', '19', '56', '28', '19', '125', '60', '235', '55', '18', '95', '54', '61', '26', '25', '236', '130', '24', '53', '238', '62', '61', '239', '20', '61', '23', '29', '95', '126', '24', '94', '52', '20', '19', '22', '58', '130', '239', '32', '94', '95', '26', '238', '58', '26', '88', '240', '22', '28', '29']

        " Bat theme for Telescope preview
        let $BAT_THEME = "Monokai Extended Light"
        let g:airline_theme='sol'

        " change cursor colors
        " hi CursorLine guibg=#f2f2f2 guifg=None
        hi ColorColumn guibg=#f2f2f2 guifg=None
    else

        """""""""""""""""
        " DARK THEME
        colorscheme one
        " then: LazyGitConfig -> change theme
        " then: LazyGitConfig -> change theme
        let g:airline_theme='onedark'
    endif
endfunction

"""""""""""""""""

" the color for cursor animation
" put this last otherwise it may not work
hi Beacon guibg=green

augroup TmapExecutes
    au!

    " Pandoc slides
    au BufEnter *.md Tmap pandoc --to revealjs --output %.html --self-contained %; firefox %.html

    " Restview
    au BufEnter *.rst Tmap restview %

    " Latex
    au BufEnter *.tex nmap <buffer> <localleader>x :VimtexCompile<CR>

augroup END

" shell
set shell=/bin/fish

let g:use_dark = v:false
LoadProjectConf
call SetTheme(g:use_dark)

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

" project configuration example

" " enable tree-sitter
" LoadTreeSitter
"
" " enable lsp
" LoadLsp
" lua <<EOF
"     lsp = require('lspconfig')
"     lsp.julials.setup{}
"     lsp.pylsp.setup{}
" EOF
" LspStart
"
" " disable tag-completion
" let g:compe.source.tags = v:false
" call compe#setup(g:compe)
"
" " set light theme
" let g:use_dark = v:false
"
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" .tmux.conf example
"
" unbind-key C-b                                         
" set -g prefix `                                        
" bind-key ` send-prefix                                 
" set-option -sg escape-time 10                          
" set-option -g default-terminal "screen-256color"       
" set-option -sa terminal-overrides ',XXX:RGB'
" bind -n M-h select-pane -L
" bind -n M-j select-pane -D
" bind -n M-k select-pane -U
" bind -n M-l select-pane -R


" remaps
let mapleader = ' '

nnoremap <leader>h :wincmd h<Cr>
nnoremap <leader>j :wincmd j<Cr>
nnoremap <leader>k :wincmd k<Cr>
nnoremap <leader>l :wincmd l<Cr>

nnoremap <C-p> :Telescope find_files<Cr>


autocmd FileType python setlocal shiftwidth=4 tabstop=4
autocmd FileType javascript setlocal shiftwidth=2 tabstop=2


let g:ale_fixers = {'javascript': ['eslint']}
let g:ale_linters = {'javascript': ['eslint']}

autocmd BufWritePre *.js Neoformat prettier

" auto-save every five minutes:
" call timer_start(300000, 'AutoSave', {'repeat': -1})

" automatically format a Python file on save
autocmd BufWritePre *.py :Autoformat


" vim-angry-reviewer
let g:AngryReviewerEnglish = 'american'

" Keybindings
augroup c
autocmd!
autocmd FileType c,cpp,h,hpp,glsl call MakeRun()
augroup end

function! MakeRun()
nnoremap :terminal make -j8 && make run
inoremap :terminal make -j8 && make run
endfunction

" Find definition
au FileType cpp nnoremap si :YcmCompleter GoToDefinition

" Reboot Ycm server
au FileType cpp nnoremap sk :YcmRestartServer

" Fix thing under cursor
au FileType cpp nnoremap :YcmCompleter FixIt

" Regenerate tags file
au FileType cpp nnoremap :!compiledb -n make

" Go to documentation
au FileType cpp nnoremap K :YcmCompleter GetDoc

" Echo the type/arguments of class
au FileType cpp nnoremap ; :YcmCompleter GetType

" new split with alternate file
nnoremap mv :AV
" switch in same window
nnoremap ma :A


" Default configuration
lua << END
require('lualine').setup()
END

" colorscheme gruvbox-flat

set termguicolors
lua << EOF
require("bufferline").setup{}
EOF



" fidget
lua << EOF
require("fidget").setup {}
EOF


" nvim-dap-virtual-text
lua <<EOF
require("nvim-dap-virtual-text").setup()
EOF



" Neoformat
let g:neoformat_enabled_python = ['autopep8', 'yapf', 'docformatter']

" Enable alignment
let g:neoformat_basic_format_align = 1

" Enable tab to spaces conversion
let g:neoformat_basic_format_retab = 1

" Enable trimmming of trailing whitespace
let g:neoformat_basic_format_trim = 1

let g:neoformat_verbose = 1 " only affects the verbosity of Neoformat
" Or
let &verbose            = 1 " also increases verbosity of the editor as a whole

" Start interactive EasyAlign in visual mode (e.g. vipga)
xmap ga <Plug>(EasyAlign)

" Start interactive EasyAlign for a motion/text object (e.g. gaip)
nmap ga <Plug>(EasyAlign)



" press <Tab> to expand or jump in a snippet. These can also be mapped separately
" via <Plug>luasnip-expand-snippet and <Plug>luasnip-jump-next.
imap <silent><expr> <Tab> luasnip#expand_or_jumpable() ? '<Plug>luasnip-expand-or-jump' : '<Tab>' 
" -1 for jumping backwards.
inoremap <silent> <S-Tab> <cmd>lua require'luasnip'.jump(-1)<Cr>

snoremap <silent> <Tab> <cmd>lua require('luasnip').jump(1)<Cr>
snoremap <silent> <S-Tab> <cmd>lua require('luasnip').jump(-1)<Cr>

" For changing choices in choiceNodes (not strictly necessary for a basic setup).
imap <silent><expr> <C-E> luasnip#choice_active() ? '<Plug>luasnip-next-choice' : '<C-E>'
smap <silent><expr> <C-E> luasnip#choice_active() ? '<Plug>luasnip-next-choice' : '<C-E>'


imap <expr> <Tab> snippy#can_expand_or_advance() ? '<Plug>(snippy-expand-or-advance)' : '<Tab>'
imap <expr> <S-Tab> snippy#can_jump(-1) ? '<Plug>(snippy-previous)' : '<S-Tab>'
smap <expr> <Tab> snippy#can_jump(1) ? '<Plug>(snippy-next)' : '<Tab>'
smap <expr> <S-Tab> snippy#can_jump(-1) ? '<Plug>(snippy-previous)' : '<S-Tab>'
xmap <Tab> <Plug>(snippy-cut-text)



" MarkdownPreview
" set to 1, nvim will open the preview window after entering the Markdown buffer
" default: 0
let g:mkdp_auto_start = 0

" set to 1, the nvim will auto close current preview window when changing
" from Markdown buffer to another buffer
" default: 1
let g:mkdp_auto_close = 1

" set to 1, Vim will refresh Markdown when saving the buffer or
" when leaving insert mode. Default 0 is auto-refresh Markdown as you edit or
" move the cursor
" default: 0
let g:mkdp_refresh_slow = 0

" set to 1, the MarkdownPreview command can be used for all files,
" by default it can be use in Markdown files only
" default: 0
let g:mkdp_command_for_global = 0

" set to 1, the preview server is available to others in your network.
" By default, the server listens on localhost (127.0.0.1)
" default: 0
let g:mkdp_open_to_the_world = 0

" use custom IP to open preview page.
" Useful when you work in remote Vim and preview on local browser.
" For more details see: https://github.com/iamcco/markdown-preview.nvim/pull/9
" default empty
let g:mkdp_open_ip = ''

" specify browser to open preview page
" for path with space
" valid: `/path/with\ space/xxx`
" invalid: `/path/with\\ space/xxx`
" default: ''
let g:mkdp_browser = ''

" set to 1, echo preview page URL in command line when opening preview page
" default is 0
let g:mkdp_echo_preview_url = 0

" a custom Vim function name to open preview page
" this function will receive URL as param
" default is empty
let g:mkdp_browserfunc = ''

" options for Markdown rendering
" mkit: markdown-it options for rendering
" katex: KaTeX options for math
" uml: markdown-it-plantuml options
" maid: mermaid options
" disable_sync_scroll: whether to disable sync scroll, default 0
" sync_scroll_type: 'middle', 'top' or 'relative', default value is 'middle'
"   middle: means the cursor position is always at the middle of the preview page
"   top: means the Vim top viewport always shows up at the top of the preview page
"   relative: means the cursor position is always at relative positon of the preview page
" hide_yaml_meta: whether to hide YAML metadata, default is 1
" sequence_diagrams: js-sequence-diagrams options
" content_editable: if enable content editable for preview page, default: v:false
" disable_filename: if disable filename header for preview page, default: 0
let g:mkdp_preview_options = {
    \ 'mkit': {},
    \ 'katex': {},
    \ 'uml': {},
    \ 'maid': {},
    \ 'disable_sync_scroll': 0,
    \ 'sync_scroll_type': 'middle',
    \ 'hide_yaml_meta': 1,
    \ 'sequence_diagrams': {},
    \ 'flowchart_diagrams': {},
    \ 'content_editable': v:false,
    \ 'disable_filename': 0,
    \ 'toc': {}
    \ }

" use a custom Markdown style. Must be an absolute path
" like '/Users/username/markdown.css' or expand('~/markdown.css')
let g:mkdp_markdown_css = ''

" use a custom highlight style. Must be an absolute path
" like '/Users/username/highlight.css' or expand('~/highlight.css')
let g:mkdp_highlight_css = ''

" use a custom port to start server or empty for random
let g:mkdp_port = ''

" preview page title
" ${name} will be replace with the file name
let g:mkdp_page_title = '「${name}」'

" use a custom location for images
let g:mkdp_images_path = "C:\Users\Hai\Pictures\markdown_images"

" recognized filetypes
" these filetypes will have MarkdownPreview... commands
let g:mkdp_filetypes = ['markdown']

" set default theme (dark or light)
" By default the theme is defined according to the preferences of the system
let g:mkdp_theme = 'dark'

" combine preview window
" default: 0
" if enable it will reuse previous opened preview window when you preview markdown file.
" ensure to set let g:mkdp_auto_close = 0 if you have enable this option
let g:mkdp_combine_preview = 0

" auto refetch combine preview contents when change markdown buffer
" only when g:mkdp_combine_preview is 1
let g:mkdp_combine_preview_auto_refresh = 1

"" ---------------------

nmap <C-s> <Plug>MarkdownPreview
nmap <M-s> <Plug>MarkdownPreviewStop
nmap <C-p> <Plug>MarkdownPreviewToggle

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

lua << EOF
require("CopilotChat").setup {
  debug = true, -- Enable debugging
  -- See Configuration section for rest
}
EOF

""""""""""""""""""""""""""	-----------------------------	""""""""""""""""""""""""""""""""""""

" press <Tab> to expand or jump in a snippet. These can also be mapped separately
" via <Plug>luasnip-expand-snippet and <Plug>luasnip-jump-next.
imap <silent><expr> <Tab> luasnip#expand_or_jumpable() ? '<Plug>luasnip-expand-or-jump' : '<Tab>' 
" -1 for jumping backwards.
inoremap <silent> <S-Tab> <cmd>lua require'luasnip'.jump(-1)<Cr>

snoremap <silent> <Tab> <cmd>lua require('luasnip').jump(1)<Cr>
snoremap <silent> <S-Tab> <cmd>lua require('luasnip').jump(-1)<Cr>

" For changing choices in choiceNodes (not strictly necessary for a basic setup).
imap <silent><expr> <C-E> luasnip#choice_active() ? '<Plug>luasnip-next-choice' : '<C-E>'
smap <silent><expr> <C-E> luasnip#choice_active() ? '<Plug>luasnip-next-choice' : '<C-E>'

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

nnoremap gpd <cmd>lua require('goto-preview').goto_preview_definition()<CR>
nnoremap gpt <cmd>lua require('goto-preview').goto_preview_type_definition()<CR>
nnoremap gpi <cmd>lua require('goto-preview').goto_preview_implementation()<CR>
nnoremap gpD <cmd>lua require('goto-preview').goto_preview_declaration()<CR>
nnoremap gP <cmd>lua require('goto-preview').close_all_win()<CR>
nnoremap gpr <cmd>lua require('goto-preview').goto_preview_references()<CR>

""""""""""""""""""""""""""""""""""""""""""""""""""""""""

" Move to previous/next
nnoremap <silent>    <A-,> <Cmd>BufferPrevious<CR>
nnoremap <silent>    <A-.> <Cmd>BufferNext<CR>

" Re-order to previous/next
nnoremap <silent>    <A-<> <Cmd>BufferMovePrevious<CR>
nnoremap <silent>    <A->> <Cmd>BufferMoveNext<CR>

" Goto buffer in position...
nnoremap <silent>    <A-1> <Cmd>BufferGoto 1<CR>
nnoremap <silent>    <A-2> <Cmd>BufferGoto 2<CR>
nnoremap <silent>    <A-3> <Cmd>BufferGoto 3<CR>
nnoremap <silent>    <A-4> <Cmd>BufferGoto 4<CR>
nnoremap <silent>    <A-5> <Cmd>BufferGoto 5<CR>
nnoremap <silent>    <A-6> <Cmd>BufferGoto 6<CR>
nnoremap <silent>    <A-7> <Cmd>BufferGoto 7<CR>
nnoremap <silent>    <A-8> <Cmd>BufferGoto 8<CR>
nnoremap <silent>    <A-9> <Cmd>BufferGoto 9<CR>
nnoremap <silent>    <A-0> <Cmd>BufferLast<CR>

" Pin/unpin buffer
nnoremap <silent>    <A-p> <Cmd>BufferPin<CR>

" Close buffer
nnoremap <silent>    <A-c> <Cmd>BufferClose<CR>
" Restore buffer
nnoremap <silent>    <A-s-c> <Cmd>BufferRestore<CR>

" Wipeout buffer
"                          :BufferWipeout
" Close commands
"                          :BufferCloseAllButCurrent
"                          :BufferCloseAllButVisible
"                          :BufferCloseAllButPinned
"                          :BufferCloseAllButCurrentOrPinned
"                          :BufferCloseBuffersLeft
"                          :BufferCloseBuffersRight

" Magic buffer-picking mode
nnoremap <silent> <C-p>    <Cmd>BufferPick<CR>
nnoremap <silent> <C-p>    <Cmd>BufferPickDelete<CR>

" Sort automatically by...
nnoremap <silent> <Space>bb <Cmd>BufferOrderByBufferNumber<CR>
nnoremap <silent> <Space>bn <Cmd>BufferOrderByName<CR>
nnoremap <silent> <Space>bd <Cmd>BufferOrderByDirectory<CR>
nnoremap <silent> <Space>bl <Cmd>BufferOrderByLanguage<CR>
nnoremap <silent> <Space>bw <Cmd>BufferOrderByWindowNumber<CR>

" Other:
" :BarbarEnable - enables barbar (enabled by default)
" :BarbarDisable - very bad command, should never be used

""""""""""""""""""""""""""""""

let g:asterisk#keeppos = 1

map *   <Plug>(asterisk-*)
map #   <Plug>(asterisk-#)
map g*  <Plug>(asterisk-g*)
map g#  <Plug>(asterisk-g#)
map z*  <Plug>(asterisk-z*)
map gz* <Plug>(asterisk-gz*)
map z#  <Plug>(asterisk-z#)
map gz# <Plug>(asterisk-gz#)


""""""""""""""""""""""""""""""""""""""

lua << EOF
require('hlslens').setup{}
EOF

""""""""""""""""""""""""""""""""""""""

lua << EOF
require("image_preview").setup({})
EOF

"""""""""""""""""""""""""""""

colorscheme miasma

colorscheme gruvbox-flat

"""""""""""""""""""""""""""""

lua << EOF
  require("flutter-tools").setup {}
EOF
