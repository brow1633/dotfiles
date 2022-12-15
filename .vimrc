set nocompatible
syntax on
filetype plugin indent on
set ts=4 sts=4 sw=4 et ai si
set nu rnu

set so=15
set undofile
set undodir=~/.vim/undodir

" coc.nvim
set encoding=utf-8
set nobackup
set nowritebackup
set updatetime=300
set signcolumn=yes
" GoTo code navigation.
nmap <silent> gd <Plug>(coc-definition)
nmap <silent> gy <Plug>(coc-type-definition)
nmap <silent> gi <Plug>(coc-implementation)
nmap <silent> gr <Plug>(coc-references)
nnoremap <silent> K :call ShowDocumentation()<CR>
nnoremap <F2> <Plug>(coc-rename)
nmap <leader>Qf <Plug>(coc-fix-current)

function! ShowDocumentation()
  if CocAction('hasProvider', 'hover')
    call CocActionAsync('doHover')
  else
    call feedkeys('K', 'in')
  endif
endfunction

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

let mapleader = ","

call plug#begin()

Plug 'neoclide/coc.nvim', {'branch': 'release'}
"Plug 'jiangmiao/auto-pairs'
Plug 'gruvbox-community/gruvbox'
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'preservim/nerdtree'
Plug 'sheerun/vim-polyglot' "Syntax Highlighting
Plug 'gauteh/vim-cppman'
Plug 'derekwyatt/vim-fswitch'
Plug 'mbbill/undotree'
Plug 'MarcWeber/vim-addon-mw-utils'
Plug 'tomtom/tlib_vim'
Plug 'garbas/vim-snipmate'
Plug 'honza/vim-snippets'
Plug 'xuhdev/vim-latex-live-preview'
Plug 'vimwiki/vimwiki'

call plug#end()

inoremap <expr> <cr> coc#pum#visible() ? coc#pum#confirm() : "\<CR>"

set termguicolors
colo gruvbox

" Nerd tree
inoremap <c-b> <Esc>:NERDTreeToggle<cr>
nnoremap <c-b> <Esc>:NERDTreeToggle<cr>
nnoremap <c-n> <Esc>:NERDTreeFocus<cr>

" UndoTree
noremap <F5> <Esc>:UndotreeToggle<cr>

" Window navigation with Ctrl-[hjkl]
noremap <C-J> <C-W>j
noremap <C-k> <C-W>k
noremap <C-h> <C-W>h
noremap <C-l> <C-W>l

"Tab navigation
nnoremap <S-H>  :tabprevious<CR>
nnoremap <S-L>  :tabnext<CR>
" Highlight extra whitespace
highlight ExtraWhitespace ctermbg=red guibg=red
match ExtraWhitespace /\s\+$/
au BufWinEnter * match ExtraWhitespace /\s\+$/
au InsertEnter * match ExtraWhitespace /\s\+\%#\@<!$/
au InsertLeave * match ExtraWhitespace /\s\+$/
au BufWinLeave * call clearmatches()

"Remove extra whitespace ",rs"
nnoremap <silent> <leader>rs :let _s=@/ <Bar> :%s/\s\+$//e <Bar> :let @/=_s <Bar> :nohl <Bar> :unlet _s <CR>

"Easy switch between h/cpp

au BufEnter *.h let b:fswitchdst = "c,cpp,cc,m"
au BufEnter *.cc let b:fswitchdst = "h,hpp"

nnoremap <silent> <A-o> :FSHere<cr>

nnoremap <silent> <leader>oh :FSSplitLeft<cr>
nnoremap <silent> <leader>oj :FSSplitBelow<cr>
nnoremap <silent> <leader>ok :FSSplitAbove<cr>
nnoremap <silent> <leader>ol :FSSplitRight<cr>

" SnipMate
let g:snipMate = { 'snippet_version' : 1 }

:command CX !texliveonfly --compiler=latexmk --arguments="-pvc -pdf -synctex=1" %:t &
