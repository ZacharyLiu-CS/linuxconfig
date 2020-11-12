let g:python3_host_prog = '/home/zach/miniconda3/envs/neovim_py/bin/python'
set wildmenu"按TAB键时命令行自动补齐"

set ignorecase"忽略大小写"
set number"显示行号"
set relativenumber"相对行号"
set visualbell"禁止响铃"
set ruler"显示当前光标位置"
set autoread"文件在Vim之外修改过，自动重新读入"
set autowrite"设置自动保存内容"
set autochdir"当前目录随着被编辑文件的改变而改变"
set nocp"使用vim而非vi"
set mouse=a"开启鼠标支持"
set pastetoggle=<F11> "F11来支持切换paste和nopaste状态。"
set cindent "c/c++自动缩进"
set smartindent
set autoindent"参考上一行的缩进方式进行自动缩进"
set expandtab
set tabstop=2
set shiftwidth=2
set softtabstop=2
set smarttab
set hlsearch "开启搜索结果的高亮显示"
set incsearch "边输入边搜索(实时搜索)"
set cursorline
set cursorbind
" TextEdit might fail if hidden is not set.
set hidden
set wildmenu
" Some servers have issues with backup files, see #649.
set nowritebackup
set listchars=tab:»■,trail:■
set list
set autoread

set noswapfile
set nobackup
set undofile
set backupdir=~/.vim/.backup//
set directory=~/.vim/.swp//
set undodir=~/.vim/.undo//


" Give more space for displaying messages.
set cmdheight=1

" Having longer updatetime (default is 4000 ms = 4 s) leads to noticeable
" delays and poor user experience.
set updatetime=300

" Don't pass messages to |ins-completion-menu|.
set shortmess+=c


syn on "开启语法高亮功能"
filetype indent on "根据文件类型进行缩进"
filetype on "启动文件类型检查"
filetype plugin on "运行vim加载文件类型插件"

map <silent>  <C-A>  gg v G "Ctrl-A 选中所有内容"

nnoremap <silent> <C-j> 5j
nnoremap <silent> <C-k> 5k
nnoremap <silent> <C-h> 5h
nnoremap <silent> <C-l> 5l

