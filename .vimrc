" window下的gvim带有图形界面，所以字体什么的都得调整。
" 然后还需要关闭上方的图形界面上面的工具栏，并且这些
" 工具栏的默认编码不是utf-8，所以会冲突。

" 不怎么在其他平台使用vim的gui版本，所以这里只判断是平台
" if has("gui_running")
if has("win32") || has("win64") || has("win95")
    au GUIEnter * simalt ~x                                         " 设置窗口启动时自动最大化
    set guioptions-=m                                               " 设置隐藏菜单栏
    set guioptions-=T                                               " 设置隐藏工具栏
    set guioptions-=L                                               " 设置隐藏左侧滚动条
    set guioptions-=r                                               " 设置隐藏右侧滚动条
    set guioptions-=b                                               " 设置隐藏底部滚动条
    set showtabline=0                                               " 设置隐藏Tab栏

    set guifont=DejaVu\ Sans\ Mono\ for\ Powerline:h12              " 设置gui界面的字体，如果想手动选择则执行set guifont=*
    set pythondll=python27.dll                                      " 设置python动态库，因为gvim不是python编译的，所以主动
    " 加载python链接库。
endif


syntax on                                                           " 设置语法高亮
set list                                                            " 设置显示所有的空白符
set ruler                                                           " 设置显示ruler
set number                                                          " 设置显示行号
set cindent                                                         " 设置自动缩进
set t_Co=256                                                        " 设置告知终端支持256
set nobackup                                                        " 设置取消备份文件
set incsearch                                                       " 设置一边输入一遍匹配
set tabstop=4                                                       " 设置tabstop的值为4
set expandtab                                                       " 设置展开tab
set noswapfile                                                      " 设置取消交换文件
set noundofile                                                      " 设置取消undo文件
set cursorline                                                      " 设置光标下显示横线
set splitright                                                      " 设置垂直分割窗口时，窗口将在右边
set backspace=2                                                     " 设置允许删除键可以回退到上一行，可以产生新的行
set cmdheight=2                                                     " 设置控制台高度为2
set scrolloff=8                                                     " 设置光标下预留8行
set nocompatible                                                    " 设置不开启兼容
set autowriteall                                                    " 设置自动保存
set shiftwidth=4                                                    " 设置tab宽度时需要
set showtabline=2                                                   " 设置总是显示窗口表现
set encoding=utf-8                                                  " 设置编码格式
set fileformat=unix                                                 " 设置文件格式为unix
set fileencoding=utf-8                                              " 设置文件编码
set termencoding=utf-8                                              " 设置控制台


set hlsearch                                                        " 设置搜索高亮，搜索完不需要高亮时
" 输入命令 :nohlsearch
set wildmenu                                                        " 设置增强模式的命令行补全,这种补全会在命令行
" 上方显示所有可能的匹配项
set foldmethod=manual                                               " 设置折叠方式为手工折叠，所以可以指定折叠方向、大小
" zf折叠，这些是需要指定折叠方向、大小，默认是上一行或下一行。
" zd打开折叠，就打开一层，zD开打折叠中的所有折叠

runtime! ftplugin/man.vim                                           " 设置开启:Man命令，它会在新窗口还中打开manpage

filetype indent on                                                  "设置开启filetype和indent使其读取$VIMRUNTIME下的文件
"set showcmd                                                        " 设置输入命令回显，但是vim-airline没有集成

"""""""""设置vim-plug"""""""""""""""""

let g:plug_url_format='https://hub.fastgit.org/%s.git'

" Specify a directory for plugins
" - For Neovim: stdpath('data') . '/plugged'
" - Avoid using standard Vim directory names like 'plugin'
call plug#begin('~/vimfiles/vim_plug_plugins')

" Make sure you use single quotes

Plug 'vim-airline/vim-airline'                                      " 安装airline
Plug 'vim-airline/vim-airline-themes'                               " 安装airline提供的主题
Plug 'ayu-theme/ayu-vim'                                            " 安装ayu主题
Plug 'Yggdroot/indentLine'                                          " 安装indentLine提供缩进时的提示虚线

Plug 'preservim/nerdtree'                                           " 安装NERDTree
Plug 'preservim/nerdcommenter'                                      " 安装NERDComment插件用于注释操作

Plug 'Valloric/YouCompleteMe'                                     " 安装YouCompleteMe插件
Plug 'Shougo/echodoc.vim'                                         " 安装echodoc插件用于参数提示

Plug 'skywind3000/asyncrun.vim'                                   " 安装Asyncrun插件，用于编译

Plug 'derekwyatt/vim-protodef'                                    " 安装vim-protodef插件，用于根据头文件生产定义
Plug 'derekwyatt/vim-fswitch'                                     " 安装FSwitch插件，用于在头文件和实现文件中跳转，
" 也是上面插件的前置插件

Plug 'majutsushi/tagbar'                                            " 安装tagbar插件

Plug 'ntpeters/vim-better-whitespace'                               " 安装增强版行尾空白处理

Plug 'Yggdroot/LeaderF', { 'do': ':LeaderfInstallCExtension' }

" Plugin 'bronson/vim-trailing-whitespace'                          " 安装插件显示末尾空白，并可以删除
" Plugin 'SirVer/ultisnips'                                         " 安装Ultisnips插件，用于快速生成代码模板

" Initialize plugin system
call plug#end()
""""""""""""""""""""""""""""""""""""


""""""""""设置Airline""""""""""""""""
set termguicolors

let ayucolor='mirage'                                               " 设置主题
colorscheme ayu
let g:airline_theme='ayu_mirage'
hi CursorLine term=bold cterm=bold guibg=DarkCyan                   " 设置光标当前行高亮并且加粗

"let ayucolor='light'
"colorscheme ayu
"let g:airline_theme='ayu_light'
"hi CursorLine term=bold cterm=bold guibg=LightGreen

let g:airline_section_c="%t%m"
let g:airline_section_y="%{&fileencoding}\ /\ %{&fileformat}\ /\ [#%B]"
let g:airline_section_z="%p%%\ line:\ %l\ /\ %L\ column:\ %v"
let g:airline_section_error=""                                      " 关闭section
let g:airline_section_warning=""

let g:airline#extensions#tabline#enabled = 1                        " 启动tabline插件，并设置插件显示格式
let g:airline#extensions#tabline#left_sep = ''
let g:airline#extensions#tabline#right_sep = ''
let g:airline#extensions#tabline#formatter = 'unique_tail'

let g:airline_powerline_fonts=1                                     " 在安装airline时会出现颜色不显示和乱码问题，
" 所以需要powerline。
if !exists('g:airline_symbols')
    let g:airline_symbols = {}
endif

" powerline symbols
let g:airline_left_sep = ''
let g:airline_right_sep = ''
let g:airline_symbols.linenr = ' line: '
let g:airline_symbols.maxlinenr = ' colum '
let g:airline_symbols.dirty='⚡'
"""""""""""""""""""""""""""""""""""


""""""""配置NERDTree""""""""""""""""
let g:NERDTreeDirArrowExpandable = '▸'                              " 设置文件显示的图标
let g:NERDTreeDirArrowCollapsible = '▾'

let g:NERDTreeWinSize=25                                            " 设置宽度
let g:NERDTreeMinimalUI=1                                           " 设置不要NERDTree的头提示
let g:NERDTreeShowHidden=1                                          " 设置默认显示隐藏文件
let g:NERDTreeQuitOnOpen=3                                          " 设置打开文件时关闭NERDTree
let g:NERDTreeWinPos='left'                                         " 设置窗口位置
let g:NERDTreeAutoDeleteBuffer=1                                    " 设置再删除或修改缓冲区名时删除无用的缓冲区
let g:NERDTreeCascadeSingleChildDir=1                               " 设置在目录只有一个目录项时不折叠显示

" 设置打开NERDTree快捷键
nnoremap <leader>nd :NERDTreeToggle<CR>

" 进入Vim是打开nerdtree，并且光标移动到另外一个窗口
autocmd VimEnter * NERDTree | wincmd p

" 当只有NERDTree最后一个窗口时将自动关闭NERDTree
autocmd BufEnter * call CloseVimWithLastWindow()
function CloseVimWithLastWindow()
    if tabpagenr('$') == 1 && winnr('$') == 1 && exists('b:NERDTree') && b:NERDTree.isTabTree()
        execute "quit"
    endif
endfunction

" 设置防止NERDTree被替换，即在NERDTree中
" 使用buffer命令不会被替换
autocmd BufEnter * call NotReplaceNERDTree()
function NotReplaceNERDTree()
    if bufname('#') =~ 'NERD_tree_\d\+' && bufname('%') !~ 'NERD_tree_\d\+' && winnr('$') > 1
        let buf=bufnr()
        execute "buffer#"
        execute "normal! \<C-W>w"
        execute 'buffer'.buf
    endif
endfunction

" 1. shift+i不显示隐藏文件
" 2. i会创建一个新的window，o在之前的window中
" 3. u打开上一级目录
"""""""""""""""""""'""""""""""""""""""


"""""""""设置NERDComment""""""""""""
let g:NERDCreateDefaultMappings=1                                   " 设置使用NERDTComment默认的映射
let g:NERDDefaultAlign='left'                                       " 设置多行注释时的默认对其方式为左对齐
let g:NERDSpaceDelims=1                                             " 设置注释标记和待注释文本间有一个空格
let g:NERDTrimTrailingWhitespace=1                                  " 设置取消注释时会删除尾部空白
let g:NERDCustomDelimiters = {
            \   'c': { 'left': '/**', 'right': '*/' },
            \   'cpp': { 'left': '/**', 'right':'*/' }
            \   }

" 1. \cs 默认注释一行，可视模式下为多行
" 2. \c<space> 取消注释，它是toggle动作，但是它的注释很丑
""""""""""""""""""""""""""""""""""""


"""""""""配置tagbar"""""""""""""""""
let g:tagbar_width=30                                               " 设置tagbar宽度
let g:tagbar_show_data_type=1                                       " 设置数据类型，函数返回值

" 设置进入C\C++文件或者要进入tagbar时打开tagbar，其他情况则不打开tagbar
" 这里不要用BufEnter，因为当从nerdtree打开文件时会关闭nerdtree，如果此时
" 使用BufEnter那么就会出现要打开tagbar的情况，关闭和打开不能同时做，因此报错。
autocmd BufWinEnter * :call WetherToClose()
function WetherToClose()
    " 当进入一个buffer时首先获取buffer的名字，然后和tagbar会产生的buffer名称
    " 比对，如果不符合tagbar产生的buffer名称规则，且tagbar时打开状态就关闭它
    if bufname('%') !~ '__Tagbar__\.\d\+' && tagbar#IsOpen() == 1
        execute "TagbarClose"
    endif

    " 如果当前的文件类型时C或C++并且没有打开tagbar，则打开tagbar
    if &filetype == "c" || &filetype == "cpp" || &filetype == "h"
        if tagbar#IsOpen() == 0
            execute "TagbarOpen"
        endif
    endif
    " 这里使用autocmd有一个问题就是：它会比上面的判断语句先运行
    " 所以这里不使用
    " autocmd FileType c,cpp,h,hpp,cxx if tagbar#IsOpen() == 0 | execute "TagbarToggle"  | endif
endfunction

" 1. 在tag上点击Enter可以跳转到标签，光标不在tagbar
" 2. 在tag上点击p可以跳转到标签，光标仍在tagbar
" 3. o为折叠一个标签
"""""""""""""""""""""""""""""""""


"""""""""配置YouCompleteMe""""""""""
" YCM调用libclang进行分析，因此需要给libclang传递参数
" YCM选择将所有的参数信息存放在.ycm_extra_conf.py文件
" 中，并且可以根据不同的工程定义创建不同的同名文件。
" YCM会在当前打开的文件目录及其所有上级目录中搜索该文
" 件，找到后将则会执行该Python脚本。
" let g:ycm_global_ycm_extra_conf='~/.vim/bundle/YouCompleteMe/third_party/ycmd/.ycm_extra_conf.py'

set completeopt=menu							" 设置只显示补全列表，而不分割子窗口

let g:ycm_confirm_extra_conf=0						" 设置允许Vim加载.ycm_extra_conf.py文件且不再提示
let g:ycm_show_diagnostics_ui=0						" 设置关闭YCM的错误诊断
let g:ycm_complete_in_comments=1					" 补全功能在注释中仍有效

" 设置使clang完全控制补全，在Cygwin中存在一个问题
" 如果将clangd安装在别的盘符时vim是没有权限启动这
" 个程序的，因此YCM将不会开启clangd的语义补全工具
" 因此需要修改环境变量。
let g:ycm_use_clangd=1
let g:ycm_clangd_use_ycm_caching=0
" let g:ycm_clangd_binary_path='~/.vim/bundle/YouCompleteMe/third_party/ycmd/third_party/clangd/output/bin/clangd'

" 设置语义补全，默认情况下只有在-> . :: 之后才会使用
" 语义补全，其他时候使用的是符号补全，也就是简单的猜
" 测，所以每次罗列了一堆。这里的2表示的是在输入两个字
" 符后就开语义补全。
let g:ycm_semantic_triggers = {
            \ 'c,cpp':['re!\w{2}'],
            \ }


" 对ctrl+y进行新的映射，g:ycm_key_list_stop_completion
" 是关闭不全列表，它的默认映射是ctrl+y。这里将其映射为
" Enter。
" https://github.com/ycm-core/YouCompleteMe/issues/232#issuecomment-299677328
" inoremap <expr><CR> pumvisible() ? "<C-Y>" : "<CR>"
""""""""""""""""""""""""""""""""""""


"""""""""设置echodoc""""""""""""""""
let g:echodoc#enable_at_startup=1					" 设置echodoc在启动时可用
" 1. 默认和YouCompleteMe配合很好
" 2. 因为我设置了"的快速配对，所以会影响
"    这个功能，所以每次删除完了它还是会出来的
""""""""""""""""""""""""""""""""""""


"""""""""设置LeaderF""""""""""""""""
let g:Lf_PreviewInPopup=1                                           " 设置在Popup中显示
let g:Lf_WindowPosition='popup'                                     " 设置显示方式为popup
let g:Lf_ShortcutF="<leader>ff"                                     " 设置打开窗口的快捷键
let g:Lf_PreviewResult={'Function': 0, 'BufTag': 0 }
let g:Lf_StlSeparator={ 'left': "\ue0b0", 'right': "\ue0b2", 'font': "DejaVu Sans Mono for Powerline" }
""""""""""""""""""""""""""""""""""""

"""""""""设置Asyncrn""""""""""""""""
" 设置自动打开Quickfix窗口，高度为6
let g:asyncrun_open=15

" 设置运行前保存所有修改过的文件
let g:asyncrun_save=2

" 设置编译当前文件快捷键为F4，在nomal模式下
" 这里使用的quickfix窗口，因为编译不需要交互
" 所以我这里就没有设置
nnoremap <silent><F4> :AsyncRun -cwd=$(VIM_FILEDIR) make ./bin/$(VIM_FILENOEXT)<CR>

" 设置运行快捷键为<F5>
" 这里使用是内置终端，因为这样可以更好的交互
nnoremap <silent><F5> :AsyncRun -pos=bottom -raw -cwd=$(VIM_FILEDIR) "$(VIM_FILEDIR)/bin/$(VIM_FILENOEXT)" <cr>

" 设置关闭QuickFix窗口的快捷键为<F10>
" nnoremap <F10> :call asyncrun#quickfix_toggle(6)<CR>
""""""""""""""""""""""""""""""""""""


"""""""""设置vim-protodef"""""""""""
" 这里要注意它会调用ctags，所以要保证
" 安装了该程序，在用Ubuntu 20.04时没有
" 没有默认安装
" 设置成员函数的实现顺序和声明顺序一致
let g:disable_protodef_sorting=1

" 设置pullproto.pl脚本路径
let g:protodefprotogetter='~/.vim/plugged/vim-protodef/pullproto.pl'

" 设置给出模板的快捷键
nmap <silent><leader>gv <Esc><leader>PP
""""""""""""""""""""""""""""""""""""


"""""""""设置vim-fswitch""""""""""""
" 设置normal模式下在当前buffer显示文件
nnoremap <silent><leader>tl :FSHere<CR>
""""""""""""""""""""""""""""""""""""

"""""""""设置vim-better-whitespace""""
let g:strip_whitelines_at_eof=1						" 设置删除文件尾部的空白行
let g:strip_whitespace_on_save=1					" 设置保存文件时删除空白
let g:strip_whitespace_confirm=0					" 设置保存时不需要手动确认
let g:better_whitespace_enabled=1					" 设置高亮显示行尾空白
let g:show_spaces_that_precede_tabs=1					" 设置显示tab前后或之间的空白
""""""""""""""""""""""""""""""""""""""


""""""""设置indentLine""""""""""""""""
let g:indentLine_setColors=0						" 设置高亮显示，不要灰色
""""""""""""""""""""""""""""""""""""""


"""""""""设置按键映射"""""""""""""""
if has("win32") || has("win64")
    inoremap <M-h> <Left>
    inoremap <M-j> <Down>
    inoremap <M-k> <Up>
    inoremap <M-l> <Right>
    inoremap <M-d> <Del>

    " 设置airline中向后和向前切换buffer
    nnoremap <M-n> <ESC>:bn<CR>
    nnoremap <M-N> <ESC>:bp<CR>

    nnoremap <M-c> <ESC>:call BufferUnLoad()<CR>
else
    " 设置插入模式下上下左右移动
    inoremap h <Left>
    inoremap j <Down>
    inoremap k <Up>
    inoremap l <Right>
    inoremap d <Del>

    " 设置airline中向后和向前切换buffer
    nnoremap n <ESC>:bn<CR>
    nnoremap N <ESC>:bp<CR>

    " 关闭缓冲区，这里因为和NERDTree的最后一个窗口关闭
    " 存在冲突，所以不能直接使用bdelete。
    nnoremap c <ESC>:call BufferUnLoad()<CR>
endif

function BufferUnLoad()
    " 如果当前的buffer不是NERDTree，首先保存当前buffer的
    " 的编号，然后切换到下一个buffer然后删除之前保存的buffer
    if bufname("%") !~ 'NERD_tree_\d\+'
        let bnr = bufnr("%")
        execute "normal :bn"
        execute "bdelete " . bnr
    endif

    " 如果新的buffer是没有名称的，那么就代表没有缓冲区
    " 这时就需要打开NERDTree
    if bufname("%") ==? ""
        execute "NERDTreeToggle"
    endif
endfunction

" 设置进入vimrc时一行的宽度为120
autocmd FileType vim setlocal textwidth=120

" 设置{自动配对
" inoremap { {<CR>}<Esc>O

" 设置"自动配对
inoremap " ""<Esc>i

" 设置文件自动对齐
nnoremap <leader>= <ESC>:call FixMyCode()<CR>
function FixMyCode()
    let startLine = line(".")
    execute "normal gg=G"
    execute "normal ". startLine ."G"
endfunction

""""""""""""""""""""""""""""""""""""

"""""""""""额外操作""""""""""""""""
" 1. K跳转到manpage，<leader>K也可以跳转到manpage。*跳转到自定义函数
" 2. 使用Alt键而不是ctl的组合，默认的是Ctrl组合。
"    这里不用<A->这种方式是因为存在问题，解决方案是
"    在编辑模式下使用ctrl+v然后在按住alt加上需要的键
" 3. retab可以使用tabstop替换当前文件中所有的tab
