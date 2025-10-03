" NERDTree config
" Start NERDTree. If a file is specified, move the cursor to its window.
" autocmd StdinReadPre * let s:std_in=1
" autocmd VimEnter * NERDTree | if argc() > 0 || exists("s:std_in") | wincmd p | endif

function! s:SmartNERDTree()
  if argc() > 0
    let l:file = argv(0)
    if filereadable(l:file)
      let l:dir = fnamemodify(l:file, ':p:h')

      " Close the default buffer and start fresh
      execute 'enew'
      execute 'NERDTree' fnameescape(l:dir)

      " Move to the right window (file window)
      wincmd l

      " Edit the target file
      execute 'edit' fnameescape(l:file)
    else
      " If not a valid file, fallback
      NERDTree
    endif
  else
    " No arguments, just open NERDTree in current directory
    NERDTree
  endif
endfunction

" Run this when Vim starts
autocmd VimEnter * call s:SmartNERDTree()

" disable terminal colorscheme propagation
set termguicolors

" disable vi compatibility
set nocompatible

" unmap Ex mode command
map Q <Nop>

" enable language specific config and highlight
filetype on
filetype indent on
syntax on

" show line numbers
set number

" set tabs config and use spaces instead of tab
set tabstop=4
set shiftwidth=4
set softtabstop=4


" highlight searched word
set hlsearch

" allow to create new files
set modifiable

" NERDTree other config
let NERDTreeShowHidden=1
let NERDTreeMinimalUI=1
let NERDTreeDirArrows=1


" set vim theme
colorscheme desert
