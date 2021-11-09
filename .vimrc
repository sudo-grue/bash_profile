set nocompatible              " be iMproved, required
filetype off                  " required

" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
" alternatively, pass a path where Vundle should install plugins
"call vundle#begin('~/some/path/here')

" let Vundle manage Vundle, required
Plugin 'VundleVim/Vundle.vim'
"Plugin 'scrooloose/nerdtree'
Plugin 'c.vim'
Plugin 'shougo/vimshell.vim'
Plugin 'shougo/vimproc.vim'

call vundle#end()            " required
filetype plugin indent on    " required
" To ignore plugin indent changes, instead use:
"filetype plugin on
"
" Brief help
" :PluginList       - lists configured plugins
" :PluginInstall    - installs plugins; append `!` to update or just :PluginUpdate
" :PluginSearch foo - searches for foo; append `!` to refresh local cache
" :PluginClean      - confirms removal of unused plugins; append `!` to auto-approve removal
"
" see :h vundle for more details or wiki for FAQ
" Put your non-Plugin stuff after this line
"autocmd vimenter * NERDTree
"autocmd BufWinEnter * NERDTreeMirror
"autocmd vimenter * wincmd p
"autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif

"let g:NERDTreeHighlightFolders = 1 " enables folder icon highlighting using exact match
"let g:NERDTreeHighlightFoldersFullName = 1 " highlights the folder name

"let g:NERDTreeLimitedSyntax = 1

"let g:C_UseTool_doxygen = 'yes'

colorscheme badwolf

"syntax enable must be after if loop
filetype on
filetype plugin indent on
set title
set wildmenu
set wildmode=full
"set number		"shows line numbers
"set showcmd		"show command in bottom bar
set cursorline		"highlight current line
"set colorcolumn=79
"This both turns on filetype detection and allows loading of language specific indentation files based on that detection. For me, this means the python indentation file that lives at ~/.vim/indent/python.vim gets loaded every time I open a *.py file.
"filetype indent on 	"load filetype-specific indent files

set wildmenu		"visual autocomplete for command menu
set lazyredraw		"redraw only when we need to
set showmatch		"highlight matching [{()}]
set colorcolumn=80

set incsearch		"search as characters are entered
set hlsearch		"highlight matches
"function to shut off highlights with ,<space>
"nnoremap <leader><space> :nohlsearch<CR>
set foldenable		"enable folding
"set foldlevelstart=2	"open most folds by default
"set foldnestmax=10	"10 nested fold max
"space open/closes folds
"nnoremap <space> za	"uses za to open/closes
"set foldmethod=indent	"fold based on indent level
"set foldlevel=4

if has("autocmd")
    augroup templates
        autocmd BufNewFile *.py 0r ~/.vim/Templates/skeleton.py
        autocmd BufNewFile *.md 0r ~/.vim/Templates/skeleton.md
	autocmd BufNewFile *.c 0r ~/.vim/Templates/skeleton.c
    augroup END
    augroup filetype_py
	    autocmd FileType *.py expandtab colorcolumn=79 shiftwidth=4 tabstop=4 softtabstop=4 smartindent cinwords=if,elif,else,for,while,try,except,finally,def,class,with syntax=python.vim
    augroup END
    augroup filetype_c
	    autocmd FileType *.c noexpandtab colorcolumn=80 shiftwidth=8 tabstop=8 softtabstop=8 smartindent syntax=linuxsty.vim
	    autocmd FileType *.h noexpandtab colorcolumn=80 shiftwidth=8 tabstop=8 softtabstop=8 smartindent syntax=linuxsty.vim 
    augroup END
    " vim -b : edit binary using xxd-format!
    augroup Binary
      au!
      au BufReadPre  *.pcap let &bin=1
      au BufReadPost *.pcap if &bin | %!xxd
      au BufReadPost *.pcap set ft=xxd | endif
      au BufWritePre *.pcap if &bin | %!xxd -r
      au BufWritePre *.pcap endif
      au BufWritePost *.pcap if &bin | %!xxd
      au BufWritePost *.pcap set nomod | endif
    augroup END
endif

"Remove all trailing whitespace by pressing F5
nnoremap <F5> :let _s=@/<Bar>:%s/\s\+$//e<Bar>:let @/=_s<Bar><CR>
syntax enable		"enable syntax processing


