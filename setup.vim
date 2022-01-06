" vim-setup
" my vim setup for development

set re=0
set ar
set encoding=utf-8
set hidden
set nobackup
set nowritebackup
set cmdheight=2
set updatetime=300
set shortmess+=c

call plug#begin()

Plug 'fatih/vim-go'

Plug 'scrooloose/nerdtree', { 'on':  'NERDTreeToggle' }
" Exit Vim if NERDTree is the only window remaining in the only tab.
autocmd BufEnter * if tabpagenr('$') == 1 && winnr('$') == 1 && exists('b:NERDTree') && b:NERDTree.isTabTree() | quit | endif
nmap TT :NERDTreeToggle<CR>

Plug 'junegunn/fzf'

Plug 'MaskRay/ccls'

Plug 'tpope/vim-fugitive'

Plug 'instant-markdown/vim-instant-markdown', {'for': 'markdown', 'do': 'yarn install'}

Plug 'neoclide/coc.nvim', {'branch': 'release'}

Plug 'vim-airline/vim-airline'
let g:airline#extensions#tabline#enabled = 1

Plug 'pantharshit00/vim-prisma'

nmap <silent> gd <Plug>(coc-definition)
nmap <silent> gy <Plug>(coc-type-definition)
nmap <silent> gi <Plug>(coc-implementation)
nmap <silent> gr <Plug>(coc-references)

nmap <leader>ac <Plug>(coc-codeaction)
nmap <leader>qf <Plug>(coc-fix-current)

" Remap keys for applying codeAction to the current buffer.
nmap <leader>ac  <Plug>(coc-codeaction)
" Apply AutoFix to problem on the current line.
nmap <leader>qf  <Plug>(coc-fix-current)

let g:coc_global_extensions = ['coc-tsserver','coc-json','coc-go']

Plug 'sheerun/vim-polyglot'

call plug#end()

" Prettier configs
command! -nargs=0 Prettier :CocCommand prettier.formatFile
vmap <leader>f  <Plug>(coc-format-selected)
nmap <leader>f  <Plug>(coc-format-selected)
" map FZF to gf
nnoremap <silent> gf :FZF<CR>

let g:fzf_layout = { 'up': '~10%' }

" Error, Warning text color custom specs and highlight the word under cursor
highlight CocWarningFloat ctermfg=black guifg=black
highlight CocErrorFloat ctermfg=black guifg=black
highlight CocInfoFloat ctermfg=black guifg=black
highlight CocHintFloat ctermfg=black guifg=black
