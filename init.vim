" pecify a directory for plugins temp.cpp
" - For Neovim: ~/.local/share/nvim/plugged
" - Avoid using standard Vim directory names like 'plugin'
call plug#begin('~/.local/share/nvim/plugged')

" Highlight and colorscheme
Plug 'flazz/vim-colorschemes'
Plug 'octol/vim-cpp-enhanced-highlight'
Plug 'Yggdroot/indentLine'

" Airline
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'

" Deoplete
Plug 'Shougo/deoplete.nvim', { 'do': ':UpdateRemotePlugins' }
Plug 'zchee/deoplete-clang'
Plug 'zchee/deoplete-jedi'
Plug 'zchee/deoplete-go', { 'do': 'make'}
Plug 'Shougo/neco-vim'
Plug 'rust-lang/rust.vim'
Plug 'sebastianmarkow/deoplete-rust'
Plug 'tenfyzhong/CompleteParameter.vim'
Plug 'fatih/vim-go', { 'do': ':GoInstallBinaries' }
Plug 'Blackrush/vim-gocode'
Plug 'jiangmiao/auto-pairs'

" Haskell
Plug 'alx741/vim-stylishask'
Plug 'Twinside/vim-syntax-haskell-cabal'
Plug 'neovimhaskell/haskell-vim'
Plug 'eagletmt/neco-ghc'

" C++
Plug 'majutsushi/tagbar'
Plug 'derekwyatt/vim-fswitch'

" Others
"Plug 'yianwillis/vimcdoc'
Plug 'scrooloose/nerdtree'
Plug 'mhinz/vim-startify'

" Initialize plugin system
call plug#end()

" Cpp highlight
let g:cpp_class_scope_highlight = 1
let g:cpp_member_variable_highlight = 1
let g:cpp_class_decl_highlight = 1
let g:cpp_experimental_simple_template_highlight = 1
let g:cpp_experimental_template_highlight = 1
let g:cpp_concepts_highlight = 1

" Airline
let g:airline#extensions#tabline#enabled = 1
let g:airline#extensions#tabline#buffer_idx_mode = 1
let g:airline#extensions#tabline#formatter = 'unique_tail'
let g:airline_powerline_fonts = 1
if !exists('g:airline_symbols')
    let g:airline_symbols = {}
endif

" Deoplete
let g:deoplete#enable_at_startup = 1
let g:deoplete#sources#clang#libclang_path = '/usr/lib/x86_64-linux-gnu/libclang-6.0.so'
let g:deoplete#sources#clang#clang_header = '/usr/include/clang'

" Tagbar
let g:tagbar_autofocus = 1 
" 设置标签子窗口的宽度 
let tagbar_width=32 
" tagbar 子窗口中不显示冗余帮助信息 
let g:tagbar_compact=1
" 设置 ctags 对哪些代码标识符生成标签
let g:tagbar_type_cpp = {
    \ 'kinds' : [
         \ 'c:classes:0:1',
         \ 'd:macros:0:1',
         \ 'e:enumerators:0:0', 
         \ 'f:functions:0:1',
         \ 'g:enumeration:0:1',
         \ 'm:members:0:1',
         \ 'n:namespaces:0:1',
         \ 'p:functions_prototypes:0:1',
         \ 's:structs:0:1',
         \ 't:typedefs:0:1',
         \ 'u:unions:0:1',
         \ 'v:global:0:1',
         \ 'x:external:0:1'
     \ ],
     \ 'sro'        : '::',
     \ 'kind2scope' : {
         \ 'g' : 'enum',
         \ 'n' : 'namespace',
         \ 'c' : 'class',
         \ 's' : 'struct',
         \ 'u' : 'union'
     \ },
     \ 'scope2kind' : {
         \ 'enum'      : 'g',
         \ 'namespace' : 'n',
         \ 'class'     : 'c',
         \ 'struct'    : 's',
         \ 'union'     : 'u'
     \ }
     \ }
let g:tagbar_type_go = {
    \ 'ctagstype' : 'go',
    \ 'kinds'     : [
        \ 'p:package',
        \ 'i:imports:1',
        \ 'c:constants',
        \ 'v:variables',
        \ 't:types',
        \ 'n:interfaces',
        \ 'w:fields',
        \ 'e:embedded',
        \ 'm:methods',
        \ 'r:constructor',
        \ 'f:functions'
    \ ],
    \ 'sro' : '.',
    \ 'kind2scope' : {
        \ 't' : 'ctype',
        \ 'n' : 'ntype'
    \ },
    \ 'scope2kind' : {
        \ 'ctype' : 't',
        \ 'ntype' : 'n'
    \ },
    \ 'ctagsbin'  : 'gotags',
    \ 'ctagsargs' : '-sort -silent'
    \ }

" Haskell
let g:haskell_enable_quantification = 1   " to enable highlighting of `forall`
let g:haskell_enable_recursivedo = 1      " to enable highlighting of `mdo` and `rec`
let g:haskell_enable_arrowsyntax = 1      " to enable highlighting of `proc`
let g:haskell_enable_pattern_synonyms = 1 " to enable highlighting of `pattern`
let g:haskell_enable_typeroles = 1        " to enable highlighting of type roles
let g:haskell_enable_static_pointers = 1  " to enable highlighting of `static`
let g:haskell_backpack = 1                " to enable highlighting of backpack keywords
" Disable haskell-vim omnifunc
"let g:haskellmode_completion_ghc = 0
"autocmd FileType haskell setlocal omnifunc=necoghc#omnifunc
let g:necoghc_enable_detailed_browse = 1

" Common settings
autocmd BufWritePost $MYVIMRC source $MYVIMRC
set fileencoding=utf-8
set fileencodings=ucs-bom,utf-8,gbk,cp936,latin-1
set fileformat=unix
set fileformats=unix,dos,mac
filetype on
filetype plugin on
filetype plugin indent on
syntax enable
syntax on
set smartindent
set expandtab         "tab to spaces
set tabstop=4         "the width of a tab
set shiftwidth=4      "the width for indent
set foldenable
set foldmethod=indent "folding by indent
set foldlevel=99
set ignorecase        "ignore the case when search texts
set smartcase         "if searching text contains uppercase case will not be ignored
set number            "line number
set relativenumber
set mouse=a
set hidden " 避免必须保存修改才可以跳转buffer
" 基于缩进或语法进行代码折叠
"set foldmethod=indent
set foldmethod=syntax
" 启动 vim 时关闭折叠代码
set nofoldenable
colorscheme adam
set t_Co=256

" key map settings
let mapleader=";"
" 定义快捷键到行首和行尾
nmap <leader>b 0
nmap <leader>e $
nmap <leader>ps gg
nmap <leader>po G
" 设置快捷键将选中文本块复制至系统剪贴板
vnoremap <leader>y "+y
" 定义快捷键关闭当前分割窗口
nmap <leader>q :q!<CR>
" 定义快捷键保存当前窗口内容
nmap <leader>w :w<CR>
" 定义快捷键在结对符之间跳转
nmap <leader>m %

" buffers
nnoremap <leader>bn :call OpenNewBuffer()<CR>
nmap <leader>b1 <Plug>AirlineSelectTab1
nmap <leader>b2 <Plug>AirlineSelectTab2
nmap <leader>b3 <Plug>AirlineSelectTab3
nmap <leader>b4 <Plug>AirlineSelectTab4
nmap <leader>b5 <Plug>AirlineSelectTab5
nmap <leader>b6 <Plug>AirlineSelectTab6
nmap <leader>b7 <Plug>AirlineSelectTab7
nmap <leader>b8 <Plug>AirlineSelectTab8
nmap <leader>b9 <Plug>AirlineSelectTab9
nmap <leader>bc :bdelete<CR>

function! OpenNewBuffer()
    call inputsave()
    let buffername = input("Please input the file to open in the new buffer:", "", "file")
    call inputrestore()
    exe "edit" buffername
endfunction

" windows
nnoremap <leader>in :call OpenNewWindow()<CR>
" 依次遍历子窗口
nnoremap <leader>ii <C-W><C-W>
" 跳转至右方的窗口
nnoremap <leader>il <C-W>l
noremap <C-Right> <C-W>l
" 跳转至左方的窗口
nnoremap <leader>ih <C-W>h
noremap <C-Left> <C-W>h
" 跳转至上方的子窗口
nnoremap <leader>ik <C-W>k
noremap <C-Up> <C-W>k
" 跳转至下方的子窗口
nnoremap <leader>ij <C-W>j
noremap <C-Down> <C-W>j
nnoremap <leader>in :call OpenNewWindow()<CR>

function! OpenNewWindow()
    call inputsave()
    let winname = input("Please input the file to open in the new window:", "", "file")
    call inputrestore()
    let pos = confirm("Where to put the window?", "&Right\n&Left\n&Up\n&Down", 1)
    if pos == 1
        exe "rightb" "vs" winname
    elseif pos == 2
        exe "lefta" "vs" winname
    elseif pos == 3
        exe "abo" "sp" winname
    else
        exe "bel" "sp" winname
    endif
endfunction

" tabs
nnoremap <leader>tn :call OpenNewTab()<CR>
nnoremap <leader>tr :tabn<CR>
nnoremap <leader>tl :tabp<CR>
nnoremap <leader>tc :tabc<CR>
nmap <leader>t1 <Plug>AirlineSelectTab1
nmap <leader>t2 <Plug>AirlineSelectTab2
nmap <leader>t3 <Plug>AirlineSelectTab3
nmap <leader>t4 <Plug>AirlineSelectTab4
nmap <leader>t5 <Plug>AirlineSelectTab5
nmap <leader>t6 <Plug>AirlineSelectTab6
nmap <leader>t7 <Plug>AirlineSelectTab7
nmap <leader>t8 <Plug>AirlineSelectTab8
nmap <leader>t9 <Plug>AirlineSelectTab9

function! OpenNewTab()
    call inputsave()
    let tabname = input("Please input the name of the new tab, or file name for opening file:", "", "file")
    call inputrestore()
    let pos = confirm("Where to put the tab?", "&Right\n&Left", 1)
    if pos == 1
        exe "tabnew" tabname
    else
        exe "-tabnew" tabname
    endif
endfunction

" plugin
nmap <leader>pi :PlugInstall<CR>
nmap <leader>pu :PlugUpdate<CR>
nmap <leader>pc :PlugClean<CR>
nmap <leader>pg :PlugUpgrade<CR>

" CompleteParameter
inoremap <silent><expr> ( complete_parameter#pre_complete("()")
smap <c-j> <Plug>(complete_parameter#goto_next_parameter)
imap <c-j> <Plug>(complete_parameter#goto_next_parameter)
smap <c-k> <Plug>(complete_parameter#goto_previous_parameter)
imap <c-k> <Plug>(complete_parameter#goto_previous_parameter)
let g:AutoPairs = {'[':']', '{':'}',"'":"'",'"':'"', '`':'`'}
inoremap <buffer><silent> ) <C-R>=AutoPairsInsert(')')<CR>

" fold
nmap <Space> za

" Find and Replace
nmap <leader>fi :call Find()<CR>
nmap <leader>fn n
nmap <leader>fp N
nmap <leader>r :call Replace()<CR>

function! Find()
    call inputsave()
    let found = input("Please input the word to find:")
    call inputrestore()
    exe "/" found
endfunction

function! Replace()
    call inputsave()
    let from = input("Please input the word to be changed:")
    let to = input("Please input the word change to:")
    let wherepos = confirm("Where to replace?", "&This line\n&All text\n&Given lines", 2)
    if wherepos == 2
        let where = "%"
    elseif wherepos == 1
        while type(frompos) != 0
            let frompos = input("Please input the line to change from:")
        endwhile
        while type(topos) != 0
            let topos = input("Please input the line to change from:")
        endwhile
        let where = frompos . "," . topos
    else
        let where = ""
    endif
    if confirm("Is global replace?", "&True\n&False", 1) == 1
        let global = "g"
    else
        let global = ""
    endif
    if confirm("Is case insensitivity?", "&True\n&False", 1) == 2
        let case = "i"
    else
        let case = ""
    endif
    if confirm("Needed confirm?", "&True\n&False", 2) == 1
        let confirm = "c"
    else
        let confirm = ""
    endif
    exec where . "s/" . from . "/" . to . "/" . global . case . confirm
    call inputrestore()
endfunction
    
" Go
nnoremap <leader>gr :GoRun<CR>

" NERDTree config
autocmd VimEnter *
            \   if !argc()
            \ |   Startify
            \ |   NERDTree
            \ |   wincmd w
            \ | endif
map <leader>ts :NERDTreeToggle<CR>
" 将 NERDTree 的窗口设置在 vim 窗口的右侧（默认为左侧）
let NERDTreeWinPos="right"
" 当打开 NERDTree 窗口时，自动显示 Bookmarks
let NERDTreeShowBookmarks=1
