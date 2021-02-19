
"###############################
"   package management 
"###############################
" requiered for vundle
filetype off
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()


Plugin 'VundleVim/Vundle.vim'           " packet manager

Plugin 'kamykn/spelunker.vim'         " spellcheking 

Plugin 'ctrlpvim/ctrlp.vim'             " fuzzy finder
Plugin 'valloric/youcompleteme'         " Autocomplete vim
Plugin 'scrooloose/syntastic'           " Syntax highlighting 


" Track the engine.
"Plugin 'SirVer/ultisnips'

" Snippets are separated from the engine. Add this if you want them:
"Plugin 'honza/vim-snippets'

"" Git
" Plugin 'airblade/vim-gitgutter'     " Viser pluss og minus i margen på endringer fra siste commit
" Plugin 'tpope/vim-fugitive'
 
"" Visual/ui
"Plugin 'nathanaelkane/vim-indent-guides'    " Shows indent guides 

Plugin 'frazrepo/vim-rainbow'           " rainbow parenthasis

Plugin 'scrooloose/nerdtree'            " File tree plugin
Plugin 'Xuyuanp/nerdtree-git-plugin'    " Adds git symbols to the git nerd tree

Plugin 'vim-airline/vim-airline'        " Status linje nederst
Plugin 'vim-airline/vim-airline-themes'

Plugin 'majutsushi/tagbar'          " Tag bar på siden


Plugin 'ludovicchabant/vim-gutentags'


Plugin 'tpope/vim-surround'         " Surround stuff vim 
Plugin 'tpope/vim-commentary'       " coment stuff out 
Plugin 'vim-scripts/ReplaceWithRegister'       " Gives the possebilety for replacing a word with a register word with gr

"" Actions

Plugin 'wesQ3/vim-windowswap'

" Plugin 'rust-lang/rust.vim'

Plugin 'altercation/vim-colors-solarized'

Plugin 'jiangmiao/auto-pairs'

call vundle#end()        
filetype plugin indent on


  source $HOME/.vimrc_main
try 
  " source $HOME/.vimrc_main
catch
    echom "ERROR READING .vimrc_main"
  " No such file? No problem; just ignore it.
endtry 

"###############################
"  plugin keemaps 
"###############################


" Toggels the undutree
nnoremap <leader>u :UndotreeToggle<cr>


" Toggels the tagBar
nnoremap <leader>t :Tagbar<cr>

" Toggels the undutree
nnoremap <leader>n :NERDTreeToggle<cr>






"###############################
" Plugin Settings
"###############################



" Gutentags
let g:gutentags_cache_dir = "~/.vim/gutentags_tags/"
let g:gutentags_exclude_filetypes = ['*.xml', ]




let g:rainbow_active = 1

" solarized theme
set background=dark
colorscheme solarized


" Spelunker
set spelllang=en
set spellfile=$HOME/Dropbox/Vim/spell/en.utf-8.add

set nospell
let g:spelunker_check_type = 2                              " Sets the spelling chek to only chek words in buffer(open files)


" Airline

if !exists('g:airline_symbols')
  let g:airline_symbols = {}
endif

let g:airline_symbols.space = "\ua0"

let g:airline#extensions#tabline#enabled = 1                " Togles the tab selection at the top of the screen

let g:airline#extensions#tabline#formatter = 'unique_tail'      " The theme to use for the tabs  
let g:airline_powerline_fonts = 1

let g:airline_theme='base16'

" AirlineTheme molokai
" NERDtree
let NERDTreeRespectWildIgnore=1
let NERDTreeShowBookmarks=1             " Shows the bookmarks

" CtrlP
" Set no max file limit
let g:ctrlp_max_files = 0
" Search from current directory instead of project root
let g:ctrlp_working_path_mode = 0
nnoremap <S-@> :CtrlPTag<CR>
" YCME

nnoremap gd :YcmCompleter GoToDeclaration<CR>
nnoremap <leader>gd :YcmCompleter GetDoc<CR>


" let g:ycm_rust_src_path = '/home/trygve/.cargo/bin/rustc'

    

let g:ycm_auto_trigger = 1
let g:ycm_language_server =
\ [
\   {
\     'name': 'rust',
\     'cmdline': ['rust-analyzer'],
\     'filetypes': ['rust'],
\     'project_root_files': ['Cargo.toml']
\   }
\ ]
" syntastic

" set statusline+=%#warningmsg#
" set statusline+=%{SyntasticStatuslineFlag()}
" set statusline+=%*

" let g:syntastic_always_populate_loc_list = 1
" let g:syntastic_auto_loc_list = 1
" let g:syntastic_check_on_open = 1
" let g:syntastic_check_on_wq = 0


" Snippets
let g:UltiSnipsExpandTrigger="<leader>e"
let g:UltiSnipsJumpForwardTrigger="<c-b>"
let g:UltiSnipsJumpBackwardTrigger="<c-z>"


" tagbar
let g:tagbar_position = 'topright'

" trying this 
let g:tagbar_autoclose = 1
let g:tagbar_autofocus = 1



let g:tagbar_singleclick = 1







