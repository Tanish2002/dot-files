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
Plug 'rrethy/vim-hexokinase', { 'do': 'make hexokinase' }
Plug 'itchyny/lightline.vim'

" Comfort
Plug 'tpope/vim-sleuth'
Plug 'jiangmiao/auto-pairs'

" Languages
Plug 'sheerun/vim-polyglot'
Plug 'tmhedberg/SimpylFold'
Plug 'xuhdev/vim-latex-live-preview', { 'for': 'tex' }
Plug 'neoclide/coc.nvim', {'branch': 'release'}

call plug#end()



setlocal spell
set spelllang=en_us
inoremap <C-l> <c-g>u<Esc>[s1z=`]a<c-g>u

set termguicolors

colorscheme palenight
"set background=dark
"set notermguicolors t_Co=256

syntax on

set nowrap
set noshowmode
set autoindent
set number relativenumber
set mouse=a

"COC <tab> completion
" Use tab for trigger completion with characters ahead and navigate.
" NOTE: Use command ':verbose imap <tab>' to make sure tab is not mapped by
" other plugin before putting this into your config.
inoremap <silent><expr> <TAB>
      \ pumvisible() ? "\<C-n>" :
      \ <SID>check_back_space() ? "\<TAB>" :
      \ coc#refresh()
inoremap <expr><S-TAB> pumvisible() ? "\<C-p>" : "\<C-h>"

function! s:check_back_space() abort
  let col = col('.') - 1
  return !col || getline('.')[col - 1]  =~# '\s'
endfunction


" Code Folding
set foldenable
set foldmethod=syntax
set foldlevel=99

" Copy to System Clipboard
vnoremap <C-c> "*y :let @+=@*<CR>

" Custom Statusline
" source ~/.config/nvim/statusline.vim

let g:Hexokinase_highlighters = ['backgroundfull']

"Lightline Config
let g:lightline = {
      \ 'colorscheme': 'palenight',
      \ 'active': {
      \   'right': [ [ 'lineinfo' ],
      \              [ 'percent' ],
      \              [ 'fileformat', 'fileencoding', 'filetype', 'charvaluehex' ] ]
      \ },
      \ 'component': {
      \   'charvaluehex': '0x%B'
      \ },
      \ }
autocmd VimEnter * call SetupLightlineColors()
function SetupLightlineColors() abort
  " transparent background in statusbar
  let l:palette = lightline#palette()

  let l:palette.normal.middle = [ [ 'NONE', 'NONE', 'NONE', 'NONE' ] ]
  let l:palette.inactive.middle = l:palette.normal.middle
  let l:palette.tabline.middle = l:palette.normal.middle

  call lightline#colorscheme()
endfunction
hi! Normal ctermbg=NONE guibg=NONE

