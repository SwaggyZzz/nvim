" ███╗   ██╗ ███████╗ ██████╗  ██╗   ██╗ ██╗ ███╗   ███╗
" ████╗  ██║ ██╔════╝██╔═══██╗ ██║   ██║ ██║ ████╗ ████║
" ██╔██╗ ██║ █████╗  ██║   ██║ ██║   ██║ ██║ ██╔████╔██║
" ██║╚██╗██║ ██╔══╝  ██║   ██║ ╚██╗ ██╔╝ ██║ ██║╚██╔╝██║
" ██║ ╚████║ ███████╗╚██████╔╝  ╚████╔╝  ██║ ██║ ╚═╝ ██║
" ╚═╝  ╚═══╝ ╚══════╝ ╚═════╝    ╚═══╝   ╚═╝ ╚═╝     ╚═╝

" Author: @swaggyz

" ===
" === Auto load for first time uses
" ===
if empty(glob('~/.config/nvim/autoload/plug.vim'))
	silent !curl -fLo ~/.config/nvim/autoload/plug.vim --create-dirs
				\ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
	autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
endif

" ======================================================================
" == 通用设置
" ======================================================================
let mapleader=','        " 定义<leader>键
let g:mapleader=','
set nocompatible         " 设置不兼容原始vi模式
filetype on              " 设置开启文件类型侦测
filetype plugin on       " 设置加载对应文件类型的插件
set noeb                 " 关闭错误的提示
syntax enable            " 开启语法高亮功能
syntax on                " 自动语法高亮
set t_Co=256             " 开启256色支持
set termguicolors
set cmdheight=2          " 设置命令行的高度
set showcmd              " select模式下显示选中的行数
set ruler                " 总是显示光标位置
set laststatus=2         " 总是显示状态栏
set number               " 开启行号显示
set cursorline           " 高亮显示当前行
set whichwrap+=<,>,h,l   " 设置光标键跨行
set virtualedit=block,onemore   " 允许光标出现在最后一个字符的后面
" set mouse=v              " 设置使用鼠标模式
set laststatus=2    " 启动显示状态行(1),总是显示状态行(2)
set scrolloff=5
set clipboard=unnamed  "vim和系统剪贴板互用
set autochdir
set lazyredraw "should make scrolling faster
set ttyfast "same as above
" 不同模式下的光标样式
" vim
let &t_SI = "\<Esc>]50;CursorShape=1\x7"
let &t_SR = "\<Esc>]50;CursorShape=2\x7"
let &t_EI = "\<Esc>]50;CursorShape=0\x7"
" tmux
" let &t_SI = "\<Esc>Ptmux;\<Esc>\<Esc>]50;CursorShape=1\x7\<Esc>\\"
" let &t_SR = "\<Esc>Ptmux;\<Esc>\<Esc>]50;CursorShape=2\x7\<Esc>\\"
" let &t_EI = "\<Esc>Ptmux;\<Esc>\<Esc>]50;CursorShape=0\x7\<Esc>\\"

" ======================================================================
" == 代码缩进和排版
" ======================================================================
set autoindent           " 设置自动缩进
set cindent              " 设置使用C/C++语言的自动缩进方式
set cinoptions=g0,:0,N-s,(0    " 设置C/C++语言的具体缩进方式
set smartindent          " 智能的选择对其方式
filetype indent on       " 自适应不同语言的智能缩进
set expandtab            " 将制表符扩展为空格
set tabstop=2            " 设置编辑时制表符占用空格数
set shiftwidth=2         " 设置格式化时制表符占用空格数
set softtabstop=2        " 设置2个空格为制表符
set smarttab             " 在行和段开始处使用制表符
set nowrap               " 禁止折行
set backspace=indent,eol,start  "退格键不生效解决办法
set list                 " 展示行尾的空格

" ======================================================================
" == 代码补全
" ======================================================================
set wildmenu             " vim自身命名行模式智能补全
set completeopt-=preview " 补全时不显示窗口，只显示补全列表

" ======================================================================
" == 搜索设置
" ======================================================================
set hlsearch            " 高亮显示搜索结果
exec 'nohlsearch'
set incsearch           " 开启实时搜索功能
set ignorecase          " 搜索时大小写不敏感
" CtrlP忽略查找文件类型
set wildignore+=*.un~,*.pyc,*.zip,*.rar,*.dll,*.dmg
set wildignore+=*.jpg,*.png,*.jpeg,*.gif,*.svg,*.ico
set wildignore+=*/.git/*,*/.hg/*,*/.svn/*,*/node_modules/*,*/bower_components/*,*/tmp/*,*.so,*.swp,*.zip

" ======================================================================
" == 代码折叠
" ======================================================================
"set foldmethod=syntax   " 设置基于语法进行代码折叠
set foldmethod=indent
set nofoldenable        " 关闭折叠代码

" ======================================================================
" == 缓存设置
" ======================================================================
set nobackup            " 设置不备份
set noswapfile          " 禁止生成临时文件
set autoread            " 文件在vim之外修改过，自动重新读入
"set autowrite           " 设置自动保存
set confirm             " 在处理未保存或只读文件的时候，弹出确认
set undofile
set undodir=~/.nvim/undodir

" ======================================================================
" == 编码设置
" ======================================================================
set langmenu=zh_CN.UTF-8
set helplang=cn
set termencoding=utf-8
set encoding=utf8
set fileencodings=utf8,ucs-bom,gbk,cp936,gb2312,gb18030

" ======================================================================
" == 行号
" ======================================================================
" 相对行号
set relativenumber number
" 当前窗口用相对行号，其他窗口绝对行号
autocmd WinEnter * if &number | execute("setlocal number relativenumber") | endif
autocmd WinLeave * if &number | execute("setlocal number norelativenumber") | endif
" 插入模式下用绝对行号, 普通模式下用相对
autocmd InsertEnter * :setlocal norelativenumber number
autocmd InsertLeave * :setlocal relativenumber number

" ======================================================================
" == 通用键位映射
" ======================================================================
inoremap jj <Esc>`^
inoremap <leader>w <Esc>:w<cr>
nnoremap <leader>w :w<cr>
nnoremap <leader>q :q<cr>

nnoremap <leader><cr> :noh<cr>

nnoremap <leader><leader>e :vsplit ~/.vimrc<cr>
nnoremap <leader><leader>r :source ~/.vimrc<cr>
nnoremap <leader><leader>i :PlugInstall<cr>
nnoremap <leader><leader>u :PlugUpdate<cr>
nnoremap <leader><leader>c :PlugClean<cr>
" nnoremap <leader>p :PrettierAsync<Bar>:w<cr> "格式化并保存

" vim分屏切换当前屏幕
nnoremap <C-h> <C-w>h
nnoremap <C-j> <C-w>j
nnoremap <C-k> <C-w>k
nnoremap <C-l> <C-w>l

" Buffer Navigation
noremap <A-q> :bw<cr>
noremap <A-S-q> :bw!<cr>

" Keep selection after shift
vnoremap < <gv
vnoremap > >gv

nnoremap <leader>cv <c-w>c  "关闭窗口
nnoremap <c-b> <c-b>zz<cr> "向上滚动一屏并居中
nnoremap <c-f> <c-f>zz<cr> "向下滚动一屏并居中
nnoremap <c-u> <c-u>zz<cr> "向上滚动半屏并居中
nnoremap <c-d> <c-d>zz<cr> "向下滚动半屏并居中
nnoremap <c-x> <c-w>x "转换窗口

" 上下左右分屏
map <C-s>h :set nosplitright<cr>:vsplit<cr>
map <C-s>j :set splitbelow<cr>:split<cr>
map <C-s>k :set nosplitbelow<cr>:split<cr>
map <C-s>l :set splitright<cr>:vsplit<cr>

map sv <C-w>t<C-w>H " 上下分屏 => 左右
map sh <C-w>t<C-w>K " 左右分屏 => 上下

" map <up> :res +5<CR>
" map <down> :res -5<CR>
" map <left> :vertical resize-5<CR>
" map <right> :vertical resize+5<CR>

" tab操作
map tc :tabe<cr>        " 新建tab
map tp :-tabnext<cr>    " 上个tab
map tn :+tabnext<cr>    " 下个tab

nnoremap <space> viw

" 关闭当前buf外的其他buf
nnoremap <Leader>bc :%bd \| e # \| bd #<CR>

" 搜索关键词居中
nnoremap <silent> n nzz
nnoremap <silent> N Nzz
" 返回上一次编辑的光标位置
nnoremap <silent> <C-o> <C-o>zz
nnoremap <silent> <C-i> <C-i>zz

"使j和k基于屏幕行向下或向上移动，而gj和gk基于实际行向下或向上移动
nnoremap k gk
nnoremap gk k
nnoremap j gj
nnoremap gj j

" K/J keys for 5 times k/j (faster navigation)
noremap <silent> K 5gk
noremap <silent> J 5gj
noremap H ^
noremap L $
" noremap ; :
nnoremap Q :qa<CR>
nnoremap <leader>x :x<CR>
nnoremap U <C-r>
nnoremap <tab> %
vnoremap <tab> %
inoremap <C-tab> <c-x><c-o>

" SymbolsOutline
nmap <leader>t :SymbolsOutline<cr>

" Spell-check set to <leader>o, 'o' for 'orthography':
" nmap <leader>o :setlocal spell! spelllang=en_us<cr>

" Buffer Navigation
noremap <A-q> :bw<cr>
noremap <A-S-q> :bw!<cr>

" Keep selection after shift
vnoremap < <gv
vnoremap > >gv

" Accelerated J/K
" nmap j <Plug>(accelerated_jk_gj)
" nmap k <Plug>(accelerated_jk_gk)

" Tab Ident with |
set list lcs=tab:\|\ ""

" Telescope
nnoremap <leader>ff <cmd>Telescope find_files<cr>
nnoremap <leader>fg <cmd>Telescope live_grep<cr>
nnoremap <leader>fb <cmd>Telescope buffers<cr>
nnoremap <leader>fh <cmd>Telescope help_tags<cr>

" vim-slash
noremap <plug>(slash-after) zz

" vim-sneak
let g:sneak#label = 1
map f <Plug>Sneak_s
map F <Plug>Sneak_S
map t <Plug>Sneak_t
map T <Plug>Sneak_T

" Split-vim
noremap <F5> :Term<CR>
noremap <C-w>t :Term<CR>
noremap <C-w>T :VTerm<CR>

" easy-align
xmap ga <Plug>(EasyAlign)
nmap ga <Plug>(EasyAlign)

" compe
inoremap <silent><expr> <C-Space> compe#complete()
inoremap <silent><expr> <C-e>     compe#close('<C-e>')
inoremap <silent><expr> <C-f>     compe#scroll({ 'delta': +4 })
inoremap <silent><expr> <C-d>     compe#scroll({ 'delta': -4 })

" Bufferline
noremap <A-j> :BufferLineCycleNext<cr>
noremap <A-k> :BufferLineCyclePrev<cr>

" These commands will move the current buffer backwards or forwards in the bufferline
nnoremap <silent><mymap> :BufferLineMoveNext<CR>
nnoremap <silent><mymap> :BufferLineMovePrev<CR>

" These commands will sort buffers by directory, language, or a custom criteria
nnoremap <silent><leader>be :BufferLineSortByExtension<CR>
nnoremap <silent><leader>bd :BufferLineSortByDirectory<CR>
nnoremap <silent><mymap> :lua require'bufferline'.sort_buffers_by(function (buf_a, buf_b) return buf_a.id < buf_b.id end)<CR>

" lspsaga
nnoremap <silent> gh :Lspsaga lsp_finder<CR>
nnoremap <silent><leader>ca :Lspsaga code_action<CR>
vnoremap <silent><leader>ca :<C-U>Lspsaga range_code_action<CR>
nnoremap <silent>D :Lspsaga hover_doc<CR>
nnoremap <silent> <C-f> <cmd>lua require('lspsaga.action').smart_scroll_with_saga(1)<CR>
nnoremap <silent> <C-b> <cmd>lua require('lspsaga.action').smart_scroll_with_saga(-1)<CR>
nnoremap <silent> gs :Lspsaga signature_help<CR>
nnoremap <silent>gr :Lspsaga rename<CR>
nnoremap <silent> gd :Lspsaga preview_definition<CR>
autocmd CursorHold * Lspsaga show_line_diagnostics
nnoremap <silent> g[ :Lspsaga diagnostic_jump_prev<CR>
nnoremap <silent> g] :Lspsaga diagnostic_jump_next<CR>
nnoremap <silent> <A-d> :Lspsaga open_floaterm<CR>
tnoremap <silent> <A-d> <C-\><C-n>:Lspsaga close_floaterm<CR>
highlight link LspSagaFinderSelection Search

" Ultisnip
let g:UltiSnipsExpandTrigger="<NUL>"
let g:UltiSnipsJumpForwardTrigger="<C-l>"
let g:UltiSnipsJumpBackwardTrigger="<C-h>"
let g:UltiSnipsEditSplit="vertical"

" ===
" === Install Plugins with Vim-Plug
" ===

call plug#begin('~/.config/nvim/plugged')

" ==== UI Beautification ====
" Plug 'ajmwagar/vim-deus'
Plug 'morhetz/gruvbox'
Plug 'sonph/onehalf', {'rtp': 'vim/'}
Plug 'arcticicestudio/nord-vim'
Plug 'kyazdani42/nvim-web-devicons'
Plug 'glepnir/galaxyline.nvim' , {'branch': 'main'}
Plug 'glepnir/dashboard-nvim'
Plug 'kyazdani42/nvim-tree.lua'
Plug 'akinsho/nvim-bufferline.lua'

" ==== File Jump ====
Plug 'nvim-lua/popup.nvim'
Plug 'nvim-lua/plenary.nvim'
Plug 'nvim-telescope/telescope.nvim'
Plug 'nvim-telescope/telescope-project.nvim'

" ==== Editor Enhancement ====
Plug 'junegunn/vim-easy-align'
Plug 'itchyny/vim-cursorword'
Plug 'lukas-reineke/indent-blankline.nvim'
Plug 'tpope/vim-commentary'
Plug 'simrat39/symbols-outline.nvim'
Plug 'nvim-treesitter/nvim-treesitter', {'do': ':TSUpdate'}
Plug 'p00f/nvim-ts-rainbow'
Plug 'sbdchd/neoformat'
Plug 'airblade/vim-gitgutter'
Plug 'windwp/nvim-autopairs'
Plug 'windwp/nvim-ts-autotag'
Plug 'rhysd/accelerated-jk'
Plug 'justinmk/vim-sneak'
Plug 'junegunn/vim-slash'
Plug 'vimlab/split-term.vim'
" Plug 'thinca/vim-quickrun'

Plug 'neovim/nvim-lspconfig'
Plug 'kabouzeid/nvim-lspinstall'
Plug 'onsails/lspkind-nvim'
Plug 'glepnir/lspsaga.nvim'

Plug 'hrsh7th/nvim-compe'
Plug 'ray-x/lsp_signature.nvim'
Plug 'nvim-lua/lsp_extensions.nvim'
Plug 'tzachar/compe-tabnine', { 'do': './install.sh' }
Plug 'hrsh7th/vim-vsnip'
Plug 'hrsh7th/vim-vsnip-integ'
Plug 'rafamadriz/friendly-snippets'
Plug 'SirVer/ultisnips'
Plug 'honza/vim-snippets'

Plug 'fatih/vim-go', { 'do': ':GoInstallBinaries' }

Plug 'norcalli/nvim-colorizer.lua'
Plug 'honza/vim-snippets'

call plug#end()

colorscheme gruvbox

" ===
" === Necessary Commands to Execute
" ===
exec "nohlsearch"

" Edit Setting
autocmd BufReadPost * if line("'\"") > 1 && line("'\"") <= line("$") | execute "normal! g'\"" | endif
autocmd! bufwritepost $MYVIMRC source $MYVIMRC

augroup fmt
	autocmd!
	let blacklist = ['org', 'cat']
	autocmd BufWritePre * if index(blacklist, &ft) < 0 | undojoin | Neoformat
augroup END

augroup RELOAD
	autocmd!
	" Disables automatic commenting on newline:
	autocmd FileType * setlocal formatoptions-=c formatoptions-=r formatoptions-=o

	" Automatically deletes all trailing whitespace on save.
	autocmd BufWritePre * %s/\s\+$//e
augroup END

" Automatically change work directory
autocmd BufEnter * silent! lcd %:p:h
