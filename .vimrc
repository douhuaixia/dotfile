set nobackup
set noswapfile
set noundofile
set ignorecase

"tags文件生成位置为~/tags文件夹
"cscope文件也在该文件夹下

nmap<C-n> :cnext<CR>
nmap<C-p> :cprev<CR>


"taglist
let Tlist_Show_One_File=1
let Tlist_Exit_OnlyWindow=1

"解决中文乱码问题
set fileencodings=utf-8,gb2312,gb18030,gbk,ucs-bom,cp936,latin1

" set F3 as the shortcut key to toogle :Tlist  
nnoremap <silent> <F3> :TlistToggle<CR> 

"set F2 as the shortcut key to nerdtree
nnoremap <silent> <F2> :NERDTree<CR>

" 你在此设置运行时路径 
set rtp+=~/.vim/bundle/Vundle.vim  

" vundle初始化 
call vundle#begin()  

" 这应该始终是第一个 
Plugin 'gmarik/Vundle.vim' 

Plugin 'scrooloose/nerdtree'

Plugin 'scrooloose/nerdcommenter'

Plugin 'bling/vim-airline' 

Plugin 'plasticboy/vim-markdown'

Plugin 'vim-airline/vim-airline-themes'

Plugin 'wincent/command-t'

Plugin 'SirVer/ultisnips'

Plugin 'honza/vim-snippets'

Plugin 'wincent/terminus'

Plugin 'vim-dispatch'

Plugin 'Valloric/YouCompleteMe'

Plugin 'kristijanhusak/vim-carbon-now-sh'

Plugin 'vim-scripts/DrawIt'
Plugin 'vim-scripts/taglist.vim'
"每个插件都应该在这一行之前  

call vundle#end()            " required 

filetype plugin  indent on 
set number

syntax on

set shiftwidth=2

set history=1000 

set autoindent 

set smartindent 

set tabstop=4

set ruler 

"set cursorcolumn

set cursorline

set foldmethod=indent

"set expandtab
set smarttab
"==========================================

let g:airline_powerline_fonts = 1
"nnoremap <C-N> :bn<CR>
"nnoremap <C-P> :bp<CR>
let g:airline#extensions#tabline#enabled = 1
"==========================================

let mapleader = "\<Space>"
let maplocalleader="\\"

colorscheme molokai
"let g:rehash256 = 1
let g:airline_theme='lucius'


"map
nnoremap <Leader><Leader> <C-^>
nnoremap <leader>o :only<CR>
"nnoremap <Leader>p :echo expand('%')<CR>
nnoremap <Leader>q :quit<CR>
nnoremap <Leader>w :write<CR>
nnoremap <C-h> <C-w>h
nnoremap <C-k> <C-w>k
nnoremap <C-j> <C-w>j
nnoremap <C-l> <C-w>l
"xclip 选择缓冲区
vnoremap <Leader>y :w !xclip -selection c<CR><CR>   
nnoremap <Leader>p :r!xclip -selection c -o<CR>

"highlight Visual ctermfg=81 guifg=#66D9EF
"highlight Visual term=reverse ctermbg=9 gui=undercurl guisp=Red
"highlight Visual term=bold,reverse ctermfg=240 ctermbg=230 guifg=#455354 guibg=#F8F8F2 guisp=#F8F8F2 

highlight Visual term=bold cterm=bold ctermfg=232 ctermbg=160 gui=bold guifg=#000000 guibg=#990000
highlight Search term=bold cterm=bold ctermfg=232 ctermbg=160 gui=bold guifg=#000000 guibg=#990000


set mouse=a

set completeopt=longest,menu	"让Vim的补全菜单行为与一般IDE一致(参考VimTip1228)
autocmd InsertLeave * if pumvisible() == 0|pclose|endif	"离开插入模式后自动关闭预览窗口
inoremap <expr> <CR>       pumvisible() ? "\<C-y>" : "\<CR>"	"回车即选中当前项
"上下左右键的行为 会显示其他信息
inoremap <expr> <Down>     pumvisible() ? "\<C-n>" : "\<Down>"
inoremap <expr> <Up>       pumvisible() ? "\<C-p>" : "\<Up>"
inoremap <expr> <PageDown> pumvisible() ? "\<PageDown>\<C-p>\<C-n>" : "\<PageDown>"
inoremap <expr> <PageUp>   pumvisible() ? "\<PageUp>\<C-p>\<C-n>" : "\<PageUp>"
" 跳转到定义处
nnoremap <leader>jd :YcmCompleter GoToDefinitionElseDeclaration<CR>
nnoremap <F6> :YcmForceCompileAndDiagnostics<CR>	"force recomile with syntastic
" nnoremap <leader>lo :lopen<CR>	"open locationlist
" nnoremap <leader>lc :lclose<CR>	"close locationlist
"inoremap <leader><leader> <C-x><C-o>

let g:ycm_global_ycm_extra_conf = '~/.vim/bundle/YouCompleteMe/third_party/ycmd/cpp/ycm/.ycm_extra_conf.py'


"避免使用<c-z>
let g:ycm_semantic_triggers =  {
			\ 'c,cpp,python,java,go,erlang,perl': ['re!\w{2}'],
			\ 'cs,lua,javascript': ['re!\w{2}'],
			\ }
"关闭代码自动检查， 不然vim出现奇怪现象
let g:ycm_show_diagnostics_ui = 0

" 不显示开启vim时检查ycm_extra_conf文件的信息  
let g:ycm_confirm_extra_conf=0
" 开启基于tag的补全，可以在这之后添加需要的标签路径  
let g:ycm_collect_identifiers_from_tags_files=1
"注释和字符串中的文字也会被收入补全
let g:ycm_collect_identifiers_from_comments_and_strings = 0
" 输入第2个字符开始补全
let g:ycm_min_num_of_chars_for_completion=2
" 禁止缓存匹配项,每次都重新生成匹配项
let g:ycm_cache_omnifunc=0
" 开启语义补全
let g:ycm_seed_identifiers_with_syntax=1	
"在注释输入中也能补全
let g:ycm_complete_in_comments = 1
"在字符串输入中也能补全
let g:ycm_complete_in_strings = 1
" 设置在下面几种格式的文件上屏蔽ycm
let g:ycm_filetype_blacklist = {
	  \ 'tagbar' : 1,
	  \ 'nerdtree' : 1,
	  \}
"youcompleteme  默认tab  s-tab 和 ultisnips 冲突
let g:ycm_key_list_select_completion = ['<Down>']
let g:ycm_key_list_previous_completion = ['<Up>']
" 修改对C函数的补全快捷键，默认是CTRL + space，修改为ALT + ;
let g:ycm_key_invoke_completion = '<c-z>'

" SirVer/ultisnips 代码片断
" Trigger configuration. Do not use <tab> if you use https://github.com/Valloric/YouCompleteMe.
let g:UltiSnipsExpandTrigger="<tab>"
let g:UltiSnipsJumpForwardTrigger="<tab>"
let g:UltiSnipsJumpBackwardTrigger="<s-tab>"
let g:UltiSnipsListSnippets="<c-e>"
"定义存放代码片段的文件夹，使用自定义和默认的，将会的到全局，有冲突的会提示
let g:UltiSnipsSnippetDirectories=["bundle/vim-snippets/UltiSnips"]

" 参考https://github.com/Valloric/YouCompleteMe/issues/36#issuecomment-62941322
" 解决ultisnips和ycm tab冲突，如果不使用下面的办法解决可以参考
" https://github.com/Valloric/YouCompleteMe/issues/36#issuecomment-63205056的配置
" begin
" let g:ycm_key_list_select_completion=['<C-n>', '<Down>']
" let g:ycm_key_list_previous_completion=['<C-p>', '<Up>']
" let g:UltiSnipsExpandTrigger="<Tab>"
" let g:UltiSnipsJumpForwardTrigger="<Tab>"                                           
" let g:UltiSnipsJumpBackwardTrigger="<S-Tab>"
" end
" UltiSnips completion function that tries to expand a snippet. If there's no
" snippet for expanding, it checks for completion window and if it's
" shown, selects first element. If there's no completion window it tries to
" jump to next placeholder. If there's no placeholder it just returns TAB key 
function! g:UltiSnips_Complete()
	call UltiSnips#ExpandSnippet()
	if g:ulti_expand_res == 0
		if pumvisible()
			return "\<C-n>"
		else
			call UltiSnips#JumpForwards()
			if g:ulti_jump_forwards_res == 0
			   return "\<TAB>"
			endif
		endif
	endif
	return ""
endfunction

au BufEnter * exec "inoremap <silent> " . g:UltiSnipsExpandTrigger . " <C-R>=g:UltiSnips_Complete()<cr>"

" Expand snippet or return
let g:ulti_expand_res = 1
function! Ulti_ExpandOrEnter()
	call UltiSnips#ExpandSnippet()
	if g:ulti_expand_res
		return ''
	else
		return "\<return>"
endfunction

" Set <space> as primary trigger
"inoremap <return> <C-R>=Ulti_ExpandOrEnter()<CR>

nnoremap <leader>y :let g:ycm_auto_trigger=0<CR>                " turn off YCM
nnoremap <leader>Y :let g:ycm_auto_trigger=1<CR>                "turn on YCM
set foldlevelstart=99  
"刚打开文件不设置折叠


nmap <leader>s :cs find s <C-R>=expand("<cword>")<CR><CR>

nmap <leader>g :cs find g <C-R>=expand("<cword>")<CR><CR>

nmap <leader>c :cs find c <C-R>=expand("<cword>")<CR><CR>

"nmap <leader>t :cs find t <C-R>=expand("<cword>")<CR><CR>

nmap <leader>e :cs find e <C-R>=expand("<cword>")<CR><CR>

nmap <leader>f :cs find f <C-R>=expand("<cfile>")<CR><CR>

nmap <leader>i :cs find i <C-R>=expand("<cfile>")<CR><CR>

nmap <leader>d :cs find d <C-R>=expand("<cword>")<CR><CR>

"使用quickfix窗口来显示cscope结果
set cscopequickfix=s-,c-,d-,i-,t-,e-





