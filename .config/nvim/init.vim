let g:python3_host_prog = '/home/kvgroup/miniconda3/envs/neovim_py/bin/python'

set wildmenu "auto completion while tapping tab
set ignorecase "ignore case
set number "show line number
set relativenumber "relative number
set visualbell "disable dell
set ruler "show the ruler of the cursor
set autoread "auto read while file is modified outside
set autowrite "set auto save content
set autochdir "make the dir change according to the file
set nocp "use vim instead of vi
set mouse=a "open mouse support
set smartindent "c/c++ auto indent"
set autoindent "auto indent refet to the indentation of the previous line
set expandtab "repace <tab> with space
set tabstop=2
set shiftwidth=2
set softtabstop=2
set smarttab
set hlsearch "highlight search result
set incsearch "real time search
set cursorline
" TextEdit might fail if hidden is not set.
set hidden
" Some servers have issues with backup files, see #649.
set nowritebackup
set listchars=tab:»■,trail:■
set list
set autoread
set scrolloff=10
set noswapfile
set nobackup
set undofile
if empty(glob('~/.nvim/undo'))
  silent !mkdir -p ~/.nvim/undo
endif
set undodir=~/.nvim/.undo/
set cc=100
"
" Give more space for displaying messages.
set cmdheight=1

" Having longer updatetime (default is 4000 ms = 4 s) leads to noticeable
" delays and poor user experience.
set updatetime=300

" Don't pass messages to |ins-completion-menu|.
set shortmess+=c

" set <LEADER> as <SPACE>
let mapleader=" "
" make ; works as :
noremap ; :
"make tab work as / in noremal mode
noremap <TAB> /

" cursor movement between window
noremap <LEADER>w <C-w>w
noremap <LEADER>k <C-w>k
noremap <LEADER>j <C-w>j
noremap <LEADER>h <C-w>h
noremap <LEADER>l <C-w>l

" Disable the default s key
noremap s <nop>

" split the screens to up (horizontal), down (horizontal), left (vertical), right (vertical)
noremap sj :set nosplitbelow<CR>:split<CR>:set splitbelow<CR>
noremap sk :set splitbelow<CR>:split<CR>
noremap sh :set nosplitright<CR>:vsplit<CR>:set splitright<CR>
noremap sl :set splitright<CR>:vsplit<CR>


noremap <leader><up> :res +5<CR>
noremap <leader><down> :res -5<CR>
noremap <leader><left> :vertical resize-5<CR>
noremap <leader><right> :vertical resize+5<CR>


syn on "开启语法高亮功能"
filetype indent on "根据文件类型进行缩进"
filetype on "启动文件类型检查"
filetype plugin on "运行vim加载文件类型插件"

nnoremap <silent> U 5j
nnoremap <silent> I 5k
vnoremap <silent> U 5j
vnoremap <silent> I 5k



" Compile function
noremap <leader>r :call CompileAndRun()<CR>
func! CompileAndRun()
  exec "w"
  if &filetype == 'c'
    exec "!gcc % -o %<"
    exec "!time ./%<"
  elseif &filetype == 'cpp'
    set splitbelow
    exec "!g++ -std=c++11 % -Wall -o %<"
    :sp
    :res -15
    :term ./%<
  elseif &filetype == 'java'
    exec "!javac %"
    exec "!time java %<"
  elseif &filetype == 'sh'
    :!time bash %
  elseif &filetype == 'python'
    set splitbelow
    :sp
    :term python3 %
  elseif &filetype == 'html'
    silent! exec "!".g:mkdp_browser." % &"
  elseif &filetype == 'markdown'
    exec "InstantMarkdownPreview"
  endif
endfunc


call plug#begin('~/.vim/plugged')
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'

Plug 'neoclide/coc.nvim', {'branch': 'release'}

" show indent level such as for and while loop
Plug 'Yggdroot/indentLine'
" Autoformat
Plug 'Chiel92/vim-autoformat'

"Auto Save
Plug 'vim-scripts/vim-auto-save'

"Theme
Plug 'ajmwagar/vim-deus'

"auto pairs
Plug 'jiangmiao/auto-pairs'

" cxx highlight
Plug 'jackguo380/vim-lsp-cxx-highlight'

" comment plugin
Plug 'tomtom/tcomment_vim'

" float terminal
Plug 'voldikss/vim-floaterm'

" vim multiple cursors
Plug 'mg979/vim-visual-multi', {'branch': 'master'}

" vista.vim : tag bar in Vim
Plug 'liuchengxu/vista.vim'

" good tab bar for opened files in Vim
Plug 'mg979/vim-xtabline'

" colorful brackets for better visual effect
Plug 'luochen1990/rainbow'

" Undo Tree
Plug 'mbbill/undotree'

" prepare Code
Plug 'ZacharyLiu-CS/prepare-code'

" preview markdown instantly
Plug 'suan/vim-instant-markdown', {'for': 'markdown'}

" generate table of contents(toc)
Plug 'mzlogin/vim-markdown-toc'

call plug#end()


let g:coc_global_extensions = [
      \ 'coc-explorer',
      \ 'coc-rust-analyzer',
      \ 'coc-json',
      \ 'coc-clangd']
"coc explorer config"
:nmap <space>e :CocCommand explorer --preset floating<CR>

"coc config"

" Use tab for trigger completion with characters ahead and navigate.
" NOTE: Use command ':verbose imap <tab>' to make sure tab is not mapped by
" other plugin before putting this into your config.
inoremap <silent><expr> <TAB>
      \ pumvisible() ? "\<C-n>" :
      \ <SID>check_back_space() ? "\<TAB>" :
      \ coc#refresh()
inoremap <expr><S-TAB> pumvisible() ? "\<C-p>" : "\<C-h>"

function! s:check_back_space() abort
  let col = col('.') - 1
  return !col || getline('.')[col - 1]  =~# '\s'
endfunction

" Use <c-space> to trigger completion.
if has('nvim')
  inoremap <silent><expr> <c-space> coc#refresh()
else
  inoremap <silent><expr> <c-@> coc#refresh()
endif

" Make <CR> auto-select the first completion item and notify coc.nvim to
" format on enter, <cr> could be remapped by other vim plugin
inoremap <silent><expr> <cr> pumvisible() ? coc#_select_confirm()
      \: "\<C-g>u\<CR>\<c-r>=coc#on_enter()\<CR>"

" Use `[g` and `]g` to navigate diagnostics
" Use `:CocDiagnostics` to get all diagnostics of current buffer in location list.

nmap <silent> [g <Plug>(coc-diagnostic-prev)
nmap <silent> ]g <Plug>(coc-diagnostic-next)

" GoTo code navigation.
nmap <silent> gd <Plug>(coc-definition)
nmap <silent> gc <Plug>(coc-declaration)
nmap <silent> gt <Plug>(coc-type-definition)
nmap <silent> gi <Plug>(coc-implementation)
nmap <silent> gr <Plug>(coc-references)

" Use K to show documentation in preview window.
nnoremap <silent> K :call <SID>show_documentation()<CR>

function! s:show_documentation()
  if (index(['vim','help'], &filetype) >= 0)
    execute 'h '.expand('<cword>')
  elseif (coc#rpc#ready())
    call CocActionAsync('doHover')
  else
    execute '!' . &keywordprg . " " . expand('<cword>')
  endif
endfunction

" Highlight the symbol and its references when holding the cursor.
autocmd CursorHold * silent call CocActionAsync('highlight')

" Symbol renaming.
nmap <leader>rn <Plug>(coc-rename)

" Formatting selected code.
" xmap <leader>f  <Plug>(coc-format-selected)
" nmap <leader>f  <Plug>(coc-format-selected)

augroup mygroup
  autocmd!
  " Setup formatexpr specified filetype(s).
  autocmd FileType typescript,json setl formatexpr=CocAction('formatSelected')
  " Update signature help on jump placeholder.
  autocmd User CocJumpPlaceholder call CocActionAsync('showSignatureHelp')
augroup end

" Applying codeAction to the selected region.
" Example: `<leader>aap` for current paragraph
xmap <leader>a  <Plug>(coc-codeaction-selected)
nmap <leader>a  <Plug>(coc-codeaction-selected)

" Remap keys for applying codeAction to the current buffer.
nmap <leader>ac  <Plug>(coc-codeaction)
" Apply AutoFix to problem on the current line.
nmap <leader>qf  <Plug>(coc-fix-current)

" Map function and class text objects
" NOTE: Requires 'textDocument.documentSymbol' support from the language server.
xmap if <Plug>(coc-funcobj-i)
omap if <Plug>(coc-funcobj-i)
xmap af <Plug>(coc-funcobj-a)
omap af <Plug>(coc-funcobj-a)
xmap ic <Plug>(coc-classobj-i)
omap ic <Plug>(coc-classobj-i)
xmap ac <Plug>(coc-classobj-a)
omap ac <Plug>(coc-classobj-a)

" Remap <C-f> and <C-b> for scroll float windows/popups.
" Note coc#float#scroll works on neovim >= 0.4.3 or vim >= 8.2.0750
nnoremap <nowait><expr> <C-f> coc#float#has_scroll() ? coc#float#scroll(1) : "\<C-f>"
nnoremap <nowait><expr> <C-b> coc#float#has_scroll() ? coc#float#scroll(0) : "\<C-b>"
inoremap <nowait><expr> <C-f> coc#float#has_scroll() ? "\<c-r>=coc#float#scroll(1)\<cr>" : "\<Right>"
inoremap <nowait><expr> <C-b> coc#float#has_scroll() ? "\<c-r>=coc#float#scroll(0)\<cr>" : "\<Left>"

" Use CTRL-S for selections ranges.
" Requires 'textDocument/selectionRange' support of language server.
nmap <silent> <C-s> <Plug>(coc-range-select)
xmap <silent> <C-s> <Plug>(coc-range-select)

" Add `:Format` command to format current buffer.
command! -nargs=0 Format :call CocAction('format')

" Add `:Fold` command to fold current buffer.
command! -nargs=? Fold :call     CocAction('fold', <f-args>)

" Add `:OR` command for organize imports of the current buffer.
command! -nargs=0 OR   :call     CocAction('runCommand', 'editor.action.organizeImport')

" Add (Neo)Vim's native statusline support.
" NOTE: Please see `:h coc-status` for integrations with external plugins that
" provide custom statusline: lightline.vim, vim-airline.
set statusline^=%{coc#status()}%{get(b:,'coc_current_function','')}
let g:indent_guides_guide_size            = 1  " 指定对齐线的尺寸
let g:indent_guides_start_level           = 2  " 从第二层开始可视化显示缩进


"start to configure the plugs managed by vim-plug
"vim-auto-save configuration"
let g:auto_save_silent = 1
autocmd FileType markdown let g:auto_save = 1

"Deue theme configuration
set t_Co=256
set termguicolors

let &t_8f = "\<Esc>[38;2;%lu;%lu;%lum"
let &t_8b = "\<Esc>[48;2;%lu;%lu;%lum"

set background=dark    " Setting dark mode
colorscheme deus
let g:deus_termcolors=256


"auto pairs configuration
let g:AutoPairs = {'(':')', '[':']', '{':'}', '<':'>',"'":"'",'"':'"' ,"<<":""}


"autoformat configuration
nnoremap <LEADER>f :Autoformat<CR>
xnoremap <LEADER>f :Autoformat<CR>
"tcomment vim configuration
let g:tcomment_textobject_inlinecomment = ''
nmap <LEADER>cn g>c
vmap <LEADER>cn g>
nmap <LEADER>cu g<c
vmap <LEADER>cu g<

" float terminal configuration
nnoremap <LEADER>st :FloatermNew --height=0.6 --width=0.6 --wintype=floating --name=floaterm1 --autoclose=2<CR>
nnoremap <LEADER>zf :FloatermNew --height=0.6 --width=0.6 --wintype=floating --name=floaterm2 --autoclose=2 fzf --preview 'cat {}'<CR>
nnoremap <LEADER>lg :FloatermNew --height=0.6 --width=0.6 --wintype=floating --name=floaterm3 --autoclose=2 lazygit<CR>
nnoremap <LEADER>ra :FloatermNew --height=0.6 --width=0.6 --wintype=floating --name=floaterm4 --autoclose=2 ranger <CR>

"vim-visual-multi
let g:VM_maps                       = {}
let g:VM_maps['Find Under']         = '<C-k>'
let g:VM_maps['Find Subword Under'] = '<C-k>'
let g:VM_maps['Find Next']          = 'n'
let g:VM_maps['Find Prev']          = 'N'
let g:VM_maps['Remove Region']      = 'q'
let g:VM_maps['Skip Region']        = '<C-n>'
let g:VM_maps["Undo"]               = 'u'
let g:VM_maps["Redo"]               = '<C-r>'

" vista.vim
noremap <LEADER>v :Vista!!<CR>
noremap <c-t> :silent! Vista finder coc<CR>
let g:vista_icon_indent = ["╰─▸ ", "├─▸ "]
let g:vista_default_executive = 'coc'
let g:vista_fzf_preview = ['right:50%']
let g:vista#renderer#enable_icon = 1
let g:vista#renderer#icons = {
      \   "function": "\uf794",
      \   "variable": "\uf71b",
      \  }


" Tab management
" Create a new tab with tu
noremap tu :tabe<CR>
" Move around tabs with tn and ti
noremap tn :+tabnext<CR>
noremap ti :-tabnext<CR>
" Move the tabs with tmn and tmi
noremap tmn :+tabmove<CR>
noremap tmi :-tabmove<CR>

" xtabline
let g:xtabline_settings = {}
let g:xtabline_settings.enable_mappings = 0
let g:xtabline_settings.tabline_modes = ['tabs', 'buffers']
let g:xtabline_settings.enable_persistance = 0
let g:xtabline_settings.last_open_first = 1
noremap to :XTabCycleMode<CR>
" noremap \p :echo expand('%:p')<CR>

" config for rainbow
let g:rainbow_active = 1

" Undo tree configuration
" ===
" === Undotree
" ===
noremap L :UndotreeToggle<CR>
let g:undotree_DiffAutoOpen = 1
let g:undotree_SetFocusWhenToggle = 1
let g:undotree_ShortIndicators = 1
let g:undotree_WindowLayout = 2
let g:undotree_DiffpanelHeight = 8
let g:undotree_SplitWidth = 24
function g:Undotree_CustomMap()
  nmap <buffer> u <plug>UndotreeNextState
  nmap <buffer> r <plug>UndotreePreviousState
  nmap <buffer> U 5<plug>UndotreeNextState
  nmap <buffer> R 5<plug>UndotreePreviousState
endfunc

let g:prepare_code_name="zhenliu"
let g:prepare_code_email_address="liuzhenm@mail.ustc.edu.cn"

" vim-instant-markdown configuration
let g:instant_markdown_autostart = 0
let g:instant_markdown_slow = 1

" vim-markdown-toc command
let g:vmt_auto_update_on_save = 1
let g:vmt_cycle_list_item_markers = 1
" the vim-markdown-toc command is listed below
" 1. :GenTocGFM
" Generate table of contents in GFM link style.
" This command is suitable for Markdown files in GitHub repositories, like README.md, and Markdown files for GitBook.
"
" 2. :GenTocRedcarpet
" Generate table of contents in Redcarpet link style.
" This command is suitable for Jekyll or anywhere else use Redcarpet as its Markdown parser.
"
" 3. :GenTocGitLab
"
" Generate table of contents in GitLab link style.
" This command is suitable for GitLab repository and wiki.
"
" 4. :GenTocMarked
" Generate table of contents for iamcco/markdown-preview.vim which use Marked markdown parser.
