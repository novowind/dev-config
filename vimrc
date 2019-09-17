""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" 显示和格式相关
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" 显示行号
set number
" 显示标尺
set ruler
" Turn on the WiLd menu
set wildmenu
" 去掉有关vi一致性模式，避免以前版本的一些bug和局限，解决backspace不能使用的问题
set nocompatible
" 使回格键（backspace）正常处理indent, eol, start等
set backspace=2
" 允许backspace和光标键跨越行边界
set whichwrap+=<,>,h,l,b,s,[,]
" 输入的命令显示出来，看的清楚些
set showcmd
" 历史纪录
set history=200
" 启用自动对齐功能，把上一行的对齐格式应用到下一行
set autoindent
" 依据上面的格式，智能的选择对齐方式，对于类似 语言编写很有用处
set smartindent
" 高亮显示匹配的括号
set showmatch
" 匹配括号高亮的时间（单位是十分之一秒）
set matchtime=5
" 让<>可以使用%跳转 
set mps+=<:>
" 搜索逐字符高亮
set hlsearch
set incsearch
" 查找时候忽略大小写
set ignorecase
" 检测文件的类型
filetype plugin indent on
" 智能补全。打开文件类型检测, 加了这句才可以用智能补全
set completeopt=longest,menu
" C风格缩进
set cindent
set cinoptions=h1,l1,g1,t0,i4,+4,(0,w1,W4
" set cino=:0g0t0(susj1
" 不使用 selectmode
set selectmode=
" 不使用“Shift + 方向键”选择文本，“Shift + 方向键”代表向指定方向跳一个单词。如果你喜欢这项功能的话，可以使用“set keymodel=startsel,stopsel”打开它
set keymodel=
" 指定在选择文本时，光标所在位置也属于被选中的范围。如果指定 selection=exclusive 的话，可能会出现某些文本无法被选中的情况
set selection=inclusive
" 去掉输入错误提示声音
set noeb
" 自动保存
set autowrite
" 突出显示当前行
set cursorline
" 突出显示当前列
" set cursorcolumn
"共享剪贴板  
set clipboard+=unnamed
" 文件被改动时自动载入
set autoread
" 顶部底部保持3行距离
set scrolloff=3
" 带有如下符号的单词不要被换行分割
set iskeyword+=_,$,@,%,#,-
" 显示宽字符显示
set ambiwidth=double
" 插入模式粘贴不会自动缩进避免混乱
set pastetoggle=<F9>
" 启动显示状态行(1),总是显示状态行(2)
set laststatus=2    
" 命令行（在状态行下）的高度，设置为1
" set cmdheight=1
" 设置光标超过 78 列的时候折行
" set tw=78
" 不在单词中间断行
" set lbr
" 打开断行模块对亚洲语言支持。m 表示允许在两个汉字之间断行，即使汉字之间没有出现空格。B 表示将两行合并为一行的时候，汉字与汉字之间不要补空格
" set fo+=mB
" 在被分割的窗口间显示空白，便于阅读
set fillchars=vert:\ ,stl:\ ,stlnc:\


""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" 最后一次停留位置
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
if has("autocmd")
  " When editing a file, always jump to the last known cursor position.
  " Don't do it when the position is invalid or when inside an event handler
  " (happens when dropping a file on gvim).
  " Also don't do it when the mark is in the first line, that is the default
  " position when opening a file.
  autocmd BufReadPost *
    \ if line("'\"") > 1 && line("'\"") <= line("$") |
    \   exe "normal! g`\"" |
    \ endif
endif


""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" 折叠相关
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" 使用折叠
set foldenable
" 设置语法折叠
set foldmethod=syntax
" 折叠区域的宽度 0-12
set foldcolumn=1
" 折叠层数
set foldlevel=1
" 打开文件默认是不折叠代码
set foldlevelstart=99
" 用空格键来开关折叠
nnoremap <space> @=((foldclosed(line('.')) < 0) ? 'zc' : 'zo')<CR>


""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" tab 相关
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" 用空格代替tab
set expandtab
" 统一缩进为 ，方便在开启了et后使用退格(backspace)键，每次退格将删除 个空格
set softtabstop=2
" 设定自动缩进为 个字符，程序中自动缩进所使用的空白长度
set shiftwidth=2
" 设置显示制表符的空格字符个数 改进ta 缩进值
set tabstop=2
" 在行和段开始处使用制表符
set smarttab
" 文件缩进及tab个数
au FileType html,python,vim,javascript,java,php setl shiftwidth=4
au FileType html,python,vim,javascript,java,php setl tabstop=4


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" 编码设置
" " fileformats(ffs)(vim才有)可指定多个，会依载入的档案形式来调整ff。
" " 例如:set ffs=unix, dos ff=unix则预设为unix格式，但如读入的是dos格式的
" " 档案，会自动调整为dos格式，这样存档时就会以dos格式存档。设置即为:
" " set fileformats=unix
" " set fileformat=unix并不会依据载入的档案形式来调整ff，并且只用unix形式
" " 所以，可以解决windows下的^M问题。
" " :set ff 可以查看当前文件fileformat
" " :set ffs 查看vim设置
" " 其实fileformats可以这样调整
" " set fileformats=unix,dos       这样也应该是可以解决^M问题的，让vim自动
" " 去选择是用dos，还是unix的，这应该是vim的默认设置，
" " 当然也可以选择全局替换:%s/^M//g
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
set fileencodings=utf-8,gb2312,gbk,cp936,latin-1
set fileencoding=utf-8
set termencoding=utf-8
set encoding=utf-8
set fileformat=unix


""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" 显示颜色相关
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" 语法高亮显示
syntax enable
syntax on
" 配色方案
colorscheme desert
" 指定配色方案是256色
set t_Co=256



""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" 插件相关
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
call plug#begin('~/.vim/plugged')

Plug 'universal-ctags/ctags'

Plug 'ludovicchabant/vim-gutentags'                                                                                                                                                          
" gutentags 搜索工程目录的标志，碰到这些文件/目录名就停止向上一级目录递归
let g:gutentags_project_root = ['.root', '.svn', '.git', '.hg', '.project']
" 所生成的数据文件的名称
let g:gutentags_ctags_tagfile = '.tags'
" 将自动生成的 tags 文件全部放入 ~/.cache/tags 目录中，避免污染工程目录
let s:vim_tags = expand('~/.cache/tags')
let g:gutentags_cache_dir = s:vim_tags
" 配置 ctags 的参数
let g:gutentags_ctags_extra_args = ['--fields=+niazS', '--extra=+q']
let g:gutentags_ctags_extra_args += ['--c++-kinds=+px']
let g:gutentags_ctags_extra_args += ['--c-kinds=+px']
" 检测 ~/.cache/tags 不存在就新建
if !isdirectory(s:vim_tags)
   silent! call mkdir(s:vim_tags, 'p')
endif

Plug 'Yggdroot/LeaderF', { 'do': './install.sh' }
let g:Lf_ShortcutF = '<c-p>'
let g:Lf_ShortcutB = '<c-n>'
" noremap <c-m> :LeaderfMru<cr>
noremap <c-f> :LeaderfFunction!<cr>
noremap <c-t> :LeaderfTag<cr>
noremap <c-b> :LeaderfBuffer<cr>
let g:Lf_StlSeparator = { 'left': '', 'right': '', 'font': '' }
let g:Lf_RootMarkers = ['.project', '.root', '.svn', '.git']
let g:Lf_WorkingDirectoryMode = 'Ac'
let g:Lf_WindowHeight = 0.30
let g:Lf_CacheDirectory = expand('~/.vim/cache')
let g:Lf_ShowRelativePath = 0
let g:Lf_HideHelp = 1
let g:Lf_StlColorscheme = 'powerline'
let g:Lf_PreviewResult = {'Function':0, 'BufTag':0}

Plug 'vim-scripts/google.vim'
Plug 'vim-scripts/a.vim'

Plug 'octol/vim-cpp-enhanced-highlight'
let c_no_curly_error = 1

" - 号直接显示当前目录文件， 回车键 进入当前目录
Plug 'justinmk/vim-dirvish'

Plug 'scrooloose/nerdtree'
" 使用 NERDTree 插件查看工程文件。设置快捷键，速记：file list
nmap fl :NERDTreeToggle<cr>
" 设置NERDTree子窗口宽度
let NERDTreeWinSize=32
" 设置NERDTree子窗口位置
let NERDTreeWinPos="right"
" 显示隐藏文件
let NERDTreeShowHidden=1
" NERDTree 子窗口中不显示冗余帮助信息
" let NERDTreeMinimalUI=1
" 删除文件时自动删除文件对应 buffer
let NERDTreeAutoDeleteBuffer=1
let NERDTreeChDirMode=1
let NERDTreeDirArrows=1

Plug 'Valloric/YouCompleteMe', { 'do': 'YCM_CORES=1 python3 ./install.py --clang-completer' }
let g:ycm_global_ycm_extra_conf='~/.vim/plugged/YouCompleteMe/third_party/ycmd/examples/.ycm_extra_conf.py'
let g:ycm_add_preview_to_completeopt = 0 " 开启实时错误或者warning的检测
let g:ycm_show_diagnostics_ui=0
let g:ycm_server_log_level = 'info'
let g:ycm_min_num_identifier_candidate_chars=2
let g:ycm_min_num_of_chars_for_completion=1
let g:ycm_collect_identifiers_from_comments_and_strings=2

" 开启 YCM 标签引擎
let g:ycm_collect_identifiers_from_tags_files=1
" 补全功能在注释中同样有效
let g:ycm_complete_in_comments=1
let g:ycm_complete_in_strings=1
let g:ycm_key_invoke_completion = '<c-z>' " 使用 Ctrl+Z 主动触发语义补全
" YCM 集成 OmniCppComplete 补全引擎，设置其快捷键
" inoremap <leader>; <C-x><C-o>
" 语法关键字补全
let g:ycm_seed_identifiers_with_syntax=1

noremap <c-z> <NOP>
set completeopt=menu,menuone

" 错误标记
let g:ycm_error_symbol = '✗'  "set error or warning signs
" warning标记
let g:ycm_warning_symbol = '⚠'

" 只能是 #include 或已打开的文件
nnoremap <leader>jd :YcmCompleter GoToDeclaration<CR>
nnoremap <leader>je :YcmCompleter GoToDefinition<CR>

" 修改补全列表配色
highlight PMenu ctermfg=0 ctermbg=242 guifg=black guibg=darkgrey
highlight PMenuSel ctermfg=242 ctermbg=8 guifg=darkgrey guibg=black

" 对指定源文件，输入两个字母后即触发语义补全
let g:ycm_semantic_triggers =  {
           \ 'c,cpp,python,java,go,erlang,perl': ['re!\w{2}'],
           \ 'cs,lua,javascript': ['re!\w{2}'],
           \ }

let g:ycm_filetype_whitelist = { 
            \ "c":1,
            \ "cpp":1, 
            \ "go":1,
            \ "python":1,
            \ "sh":1,
            \ "zsh":1,
            \ }

let g:ycm_filetype_blacklist = {
        \ 'markdown' : 1,
        \ 'text' : 1,
        \ 'pandoc' : 1,
        \ 'infolog' : 1,
        \}

call plug#end()
