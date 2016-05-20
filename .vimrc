""""""""""""""" 基础配置 """""""""""""""""""
set number "设置行号
" 设置相对行号 挺好玩的
set relativenumber
" 将自动缩进改为4个空格
" 设置智能缩进
set smartindent
" 设置自动缩进的长度
set shiftwidth=4
set tabstop=4
" 使用空格代替tab
set expandtab            
" 保存光标距离屏幕顶部和底部有3行的距离
set scrolloff=3
" 将被搜索的字符串进行高亮设置
set hlsearch
" 在当前窗口中，如果单行长度过长
" 则能显示多少就显示多少
" 不用将整行全部显示出来
set display=lastline
" 设置高亮光标所在列
set cursorcolumn
" 设置高亮光标所在行
set cursorline
" 配置状态栏
" 总是显示状态拦
set laststatus=2
" 打开文件默认不折叠代码
set foldlevelstart=99
" 编写代码时，换行自动缩进
set autoindent
" 自动匹配括号
set showmatch
" 代码可折叠
set foldmethod=indent
set foldlevel=99
" 设置编码格式
set encoding=utf-8
" 系统剪切板
set clipboard=unnamed
" 解决退格键失效的问题
set backspace=indent,eol,start
set modifiable

" 所有python语法高亮功能生效
let python_highlight_all=1

""""""""""""""""""""" 映射方案 """"""""""""""""""""
" 快速插入时间
map <F8> <c-r>=strftime("%Y-%m-%d %X")<cr>
" 共享NERDTree 
" map <leader>n <plug>NERDTreeTabsOpen<CR>
" 使用jk退出插入模式
inoremap jk <esc>
" 取消<esc>退出编辑的功能
"inoremap <esc> <nop>
" 在插入模式下，将光标所在单词转化为大写
inoremap <C-u> <esc>gUiwea
" 括号自动补全
inoremap ( ()<ESC>i
inoremap ) <c-r>=ClosePair(')')<CR>
inoremap [ []<ESC>i
inoremap ] <c-r>=ClosePair(']')<CR>
inoremap { {}<ESC>i
inoremap } <c-r>=ClosePair('}')<CR>
" 快速打开控制台
nnoremap <leader>sh :shell<CR>
" 按键绑定，将调用函数并执行
"nnoremap <leader>f :call Mydict()<CR>
" 快速编辑vimrc文件
nnoremap <leader>ev :vsplit $MYVIMRC<cr>
" 加载vimrc文件
nnoremap <leader>sv :source $MYVIMRC<cr>
" 将当前行移动到下一行
nnoremap - ddp
" 将当前行移动到上一行
nnoremap _ dd2kp
" 在命令模式下将小写转化为大写
nnoremap <leader>u gUiwe
" 将光标所在单词加上双引号
nnoremap <leader>" viw<esc>a"<esc>hbi"<esc>lel
" 将光标所在单词加上单引号
nnoremap <leader>' viw<esc>a'<esc>hbi'<esc>lel
" 将H映射为到行首
nnoremap H <S-^>
" 将L映射为到行尾
nnoremap L $
" 映射选中当前光标所在单词
nnoremap m #N
" 在窗口之间快速移动
nnoremap <C-J> <C-W>j
nnoremap <C-K> <C-W>k
nnoremap <C-H> <C-W>h
nnoremap <C-L> <C-W>l
" buffer 的快速切换
nnoremap <C-M> :bn<CR>
nnoremap <C-N> :bp<CR>
" 代码折叠快捷键
nnoremap <space> za
" 快速保存
nnoremap <leader>w :w<CR>

" 缩写映射
iabbrev xxzy xinxingzhao@yeah.net
iabbrev xmlv <?xml version="1.0" encoding="utf-8" ?>

" 事件监听
" 自动保存功能
"autocmd InsertLeave * :w
" 自动启动文件浏览目录
autocmd VimEnter * :NERDTreeTabsOpen
" 为python文件自动添加文件头
autocmd BufNewFile *.py execute ":call NewPy()"
function! NewPy()
    "call setline(1,"#!/usr/bin/env python")
    call setline(1,"# -*- encoding: utf-8 -*-")
    call setline(2,"\"\"\" Copyright(c) 2010,Shanghai MJ Intelligent System Co.Ltd<http://www.shmingjiang.com>,All rights reserved.")
    call setline(3,"Author       : Created by Cuishichuan")
    let date_time = strftime("%Y-%m-%d\ %H:%M:%S")
    call setline(4,"Date         : ".date_time)
    call setline(5,"Versions     : 1.0")
    call setline(6,"\"\"\"")
endfunction

colorscheme desert
syntax enable
" 状态栏配置
" 显示buffer标签
let g:airline#extensions#tabline#enabled=1
let g:airline_theme='tomorrow'
let g:airline_powerline_fonts=1

" 高亮行列的配色方
highlight CursorLine   cterm=NONE ctermbg=black ctermfg=green guibg=NONE guifg=NONE
highlight CursorColumn cterm=NONE ctermbg=black ctermfg=green guibg=NONE guifg=NONE
" 修改高亮的背景色
highlight SyntasticErrorSign guifg=white guibg=black

"自动补全结束函数
function! ClosePair(char)
	if getline('.')[col('.') - 1] == a:char
		return "\<Right>"
	else
		return a:char
	endif
endfunction

" 获得vi启动路径
function! CurDir()
    let curdir = substitute(getcwd(),$HOME,"~","g")
    return curdir
endfunction

" 配置markdown转化html
nnoremap <leader>md :call Header() <CR>

function! Header()
    ":execute ':%!/usr/local/bin/Markdown.pl --html4tags'
    :execute ':%!python /usr/local/lib/python2.7/dist-packages/markdown2.py -x tables'
    :execute 'normal! Go'
    r ~/mail/mutt/signature.html
endfunction

"插件管理
"""""""""""""""""""""""""""""""""""""""""""""""""""
set nocompatible
filetype off

set rtp+=~/.vim/bundle/Vundle.vim
"set rtp+=/usr/local/lib/python2.7/dist-packages/powerline/bindings/vim

call vundle#begin()

" 插件管理
Plugin 'xinxingzhao/Vundle.vim'
" 文件管理
Plugin 'scrooloose/nerdtree'
" python 插件
"Plugin 'python.vim'
" 标签共享nerdtree
Plugin 'jistr/vim-nerdtree-tabs'
" Plugin 'Xuyuanp/git-nerdtree'
" 在nerdtree中显示git信息
Plugin 'Xuyuanp/nerdtree-git-plugin'
" 语法检查
Plugin 'scrooloose/syntastic'
" 滚屏插件，使滚屏看起来好看一下
Plugin 'yonchu/accelerated-smooth-scroll'
" 标签编写插件
Plugin 'mattn/emmet-vim'
" 代码折叠
Plugin 'tmhedberg/SimpylFold'
" 缩进插件
Plugin 'indentpython.vim'
" 自动补全插件
Plugin 'Valloric/YouCompleteMe'
" 语法高亮插件
Plugin 'nvie/vim-flake8'
" 主题插件
Plugin 'jnurmine/Zenburn'
Plugin 'altercation/vim-colors-solarized'
" 文件搜索插件
Plugin 'ctrlpvim/ctrlp.vim'
" git支持
Plugin 'tpope/vim-fugitive'
" 状态栏插件
Plugin 'vim-airline/vim-airline'
Plugin 'vim-airline/vim-airline-themes'
" Python 模块
"Plugin 'klen/python-mode'
" outline插件
Plugin 'majutsushi/tagbar'
" 单词搜索
Plugin 'mileszs/ack.vim'
" python 语法检查
" Plugin 'kevinw/pyflakes-vim'
" 对齐线
Plugin 'nathanaelkane/vim-indent-guides'
" 快速注释
Plugin 'scrooloose/nerdcommenter'
" 日历插件
Plugin 'itchyny/calendar.vim'
" 导入插件
"Plugin 'python-rope/ropevim'
" 在vim中使用shell
Plugin 'Shougo/vimshell.vim'
Plugin 'Shougo/vimproc.vim'
" buffer 管理插件
Plugin 'fholgado/minibufexpl.vim'

Plugin 'reedes/vim-one'

call vundle#end()

filetype plugin indent on

"插件配置
"""""""""""""""""""""""""""""""""""""""""""""""""""
"文件浏览快捷键
" 关闭NERDTree快捷键
map <leader>t :NERDTreeToggle<CR>
" 显示行号
let NERDTreeShowLineNumbers=1
" let NERDChristmasTree=1
let NERDTreeAutoCenter=1
" 是否显示隐藏文件
let NERDTreeShowHidden=1
" 设置宽度
let NERDTreeWinSize=31
" 在终端启动vim时，共享NERDTree
let g:nerdtree_tabs_open_on_console_startup=1
"let g:nerdtree_tabs_focus_on_files=1
"let g:nerdtree_tabs_smart_startup_focus=2
" 忽略一下文件的显示
let NERDTreeIgnore=['\.pyc','\~$','\.swp']

" 代码概况配置
" 需要安装ctags
" sudo apt-get install ctags
nnoremap <leader>p :TagbarToggle<CR><C-W><C-L>
" 显示行号
let g:tagbar_show_linenumbers=-1

" 语法检查配置
" 当打开一个buffer的时候，会进行语法检查
let g:syntastic_check_on_open=1
" 当保存编辑的时候会进行语法检查
let g:syntastic_check_on_wq=0
" 错误符号
let g:syntastic_error_symbol='>>'
" 警告符号
let g:syntastic_warning_symbol='>'
let g:syntastic_enable_highlighting=1
" 使用pyfakes进行语法检查，速度比pylint快
let g:syntastic_python_checkers=['pyflakes']
" js 语法检查
let g:syntastic_javascript_checkers = ['jsl', 'jshint']
" html 语法检查
let g:syntastic_html_checkers=['tidy', 'jshint']
let g:syntastic_always_populate_loc_list = 0
let g:syntastic_auto_loc_list = 0
let g:syntastic_loc_list_height = 5

" 代码折叠配置
let g:SimpylFold_docstring_preview=1

" 自动补全配置
let g:ycm_autoclose_preview_window_after_completion=1
map <leader>g :YcmCompleter GoToDefintionElseDeclaration<CR>

" python语法检查配置
let g:pyflakes_use_quickfix=0

" 对齐线设置
let g:indent_guides_guide_size=1

" 日历插件配置
" 日期格式：year-month-day
let g:calendar_date_endian="big"
" 日期分割符
let g:calendar_date_separator="-"
" 打开日历时的视图
let g:calendar_view="week"
" 设置view布局
let g:calendar_views=['year','day','month','week','clock','day']
" 配置快捷键
nnoremap ca :Calendar<cr>

" 配置RopeVim
"let ropevim_codeassist_maxfixes=10
"let ropevim_guess_project=1
"let ropevim_vim_completion=1
"let ropevim_enable_autoimport=1
"let ropevim_extended_complete=1

" MiniBufExpl Colors
hi MBENormal               guifg=#808080 guibg=fg
hi MBEChanged              guifg=#CD5907 guibg=fg
hi MBEVisibleNormal        guifg=#5DC2D6 guibg=fg
hi MBEVisibleChanged       guifg=#F1266F guibg=fg
hi MBEVisibleActiveNormal  guifg=#A6DB29 guibg=fg
hi MBEVisibleActiveChanged guifg=#F1266F guibg=fg

function! CustomCodeAssistInsertMode()
    call RopeCodeAssistInsertMode()
    if pumvisible()
        return "\<C-L>\<Down>"
    else
        return ''
    endif
endfunction

function! TabWrapperComplete()
    let cursyn = synID(line('.'), col('.') - 1, 1)
    if pumvisible()
        return "\<C-Y>"
    endif
    if strpart(getline('.'), 0, col('.')-1) =~ '^\s*$' || cursyn != 0
        return "\<Tab>"
    else
        return "\<C-R>=CustomCodeAssistInsertMode()\<CR>"
    endif
endfunction

inoremap <buffer><silent><expr> <Tab> TabWrapperComplete()

" python 的虚拟环境支持
"py << EOF
"import os
"import sys
"if 'VIRTUAL_ENV' in os.environ:
"    project_base_dir = os.environ['VIRTUAL_ENV']
"    activate_this = os.path.join(project_base_dir,'bin/activate_this.py')
"    execfile(activate_this,dict(__file__=activate_this))
"EOF

function! Mydict()
  "执行sdcv命令查询单词的含义,返回的值保存在expl变量中
  let expl=system('sdcv -n ' . expand("<cword>"))
  "在每个窗口中执行命令，判断窗口中的文件名是否是dict-tmp，如果是，强制关闭
  windo if expand("%")=="dict-tmp" |q!|endif	
  "纵向分割窗口，宽度为25，新窗口的内容为dict-tmp文件的内容
  35vsp dict-tmp
  "设置查询结果窗口的属性，不缓存，不保留交换文件
  setlocal buftype=nofile bufhidden=hide noswapfile
  "将expl的内容显示到查询结果窗口
  1s/^/\=expl/
  "跳转回文本窗口
  "wincmd p
endfunction


"PowerLine{
"set guifont=Source \ Code\ Pro\ for\ Powerline:h15
set nocompatible
"set t_Co=256
let g:Powerline_symbols = 'fancy'
"}
