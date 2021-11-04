# vim-setup
my vim setup for development

Turn of old regular expression to avoid TypeScript syntax highlighting
```
set re=0
set ar
```

Set internal encoding of vim, not needed on neovim, since coc.nvim using some
unicode characters in the file autoload/float.vim
```
set encoding=utf-8
```

TextEdit might fail if hidden is not set.
```
set hidden
```

Some servers have issues with backup files, see #649.
```
set nobackup
set nowritebackup
```

Give more space for displaying messages.
```
set cmdheight=2
```

Having longer updatetime (default is 4000 ms = 4 s) leads to noticeable
delays and poor user experience.
```
set updatetime=300
```

Don't pass messages to |ins-completion-menu|.
```
set shortmess+=c
```

Call the all plugins inside <strong>call plug#begin() & call plug#end()</strong>
```
call plug#begin()

" NERDTree configs
Plug 'scrooloose/nerdtree', { 'on':  'NERDTreeToggle' }
" Exit Vim if NERDTree is the only window remaining in the only tab.
autocmd BufEnter * if tabpagenr('$') == 1 && winnr('$') == 1 && exists('b:NERDTree') && b:NERDTree.isTabTree() | quit | endif
nmap TT :NERDTreeToggle<CR>

" FZF
Plug 'junegunn/fzf'

" Conquer of Completon
Plug 'neoclide/coc.nvim', {'branch': 'release'}

" GoTo code navigation.
nmap <silent> gd <Plug>(coc-definition)
nmap <silent> gy <Plug>(coc-type-definition)
nmap <silent> gi <Plug>(coc-implementation)
nmap <silent> gr <Plug>(coc-references)

nmap <leader>ac <Plug>(coc-codeaction)
nmap <leader>qf <Plug>(coc-fix-current)

" Formatting selected code.
xmap <leader>f  <Plug>(coc-format-selected)
nmap <leader>f  <Plug>(coc-format-selected)

" Remap keys for applying codeAction to the current buffer.
nmap <leader>ac  <Plug>(coc-codeaction)
" Apply AutoFix to problem on the current line.
nmap <leader>qf  <Plug>(coc-fix-current)

let g:coc_global_extensions = ['coc-tsserver']

Plug 'sheerun/vim-polyglot'

call plug#end()
```

Prettier configs
command! -nargs=0 Prettier :CocCommand prettier.formatFile
```
vmap <leader>f  <Plug>(coc-format-selected)
nmap <leader>f  <Plug>(coc-format-selected)
```
" map FZF to gf
nnoremap <silent> gf :FZF<CR>
