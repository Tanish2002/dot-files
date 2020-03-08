call plug#begin()

" Themes
Plug 'drewtempelmeyer/palenight.vim'
Plug 'morhetz/gruvbox'
Plug 'challenger-deep-theme/vim', { 'as': 'challenger-deep' }
Plug 'sainnhe/vim-color-forest-night'
Plug 'arzg/vim-colors-xcode'
Plug 'dracula/vim', { 'as': 'dracula' }
Plug 'dylanaraps/wal.vim'
" Enhancements

Plug 'junegunn/limelight.vim'
Plug 'ryanoasis/vim-devicons'
Plug 'scrooloose/nerdtree'

" Comfort
Plug 'tpope/vim-sleuth'
Plug 'jiangmiao/auto-pairs'

 
" Languages
Plug 'sheerun/vim-polyglot'
Plug 'tmhedberg/SimpylFold'
Plug 'xuhdev/vim-latex-live-preview', { 'for': 'tex' }

call plug#end()



setlocal spell
set spelllang=en_us
inoremap <C-l> <c-g>u<Esc>[s1z=`]a<c-g>u

set termguicolors

colorscheme wal
"set background=dark
set notermguicolors t_Co=256

syntax on

set nowrap
set noshowmode
set autoindent
set number relativenumber
set mouse=a

" Code Folding
set foldenable
set foldmethod=syntax
set foldlevel=99

source ~/.config/nvim/statusline.vim
hi! Normal ctermbg=NONE guibg=NONE

