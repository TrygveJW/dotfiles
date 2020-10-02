

"###############################
"   package management 
"###############################
" requiered for vundle
filetype off
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

Plugin 'VundleVim/Vundle.vim'       " requiered for vundle

"Plugin 'kamykn/spelunker.vim'         " spellcheking 
Plugin 'mbbill/undotree'

" Coding stuff
Plugin 'ctrlpvim/ctrlp.vim'
Plugin 'valloric/youcompleteme'     " Autocomplete vim
Plugin 'scrooloose/syntastic'       " Syntax highlighting 


" Track the engine.
"Plugin 'SirVer/ultisnips'

" Snippets are separated from the engine. Add this if you want them:
"Plugin 'honza/vim-snippets'

"" Git
Plugin 'airblade/vim-gitgutter'     " Viser pluss og minus i margen på endringer fra siste commit
Plugin 'tpope/vim-fugitive'
 
"" Visual/ui
"Plugin 'nathanaelkane/vim-indent-guides'    " Shows indent guides 
"
Plugin 'scrooloose/nerdtree'        " File tree plugin
Plugin 'Xuyuanp/nerdtree-git-plugin'    " Adds git symbols to the git nerd tree
Plugin 'vim-airline/vim-airline'    " Status linje nederst
Plugin 'vim-airline/vim-airline-themes'

Plugin 'majutsushi/tagbar'          " Tag bar på siden
"
"" Motions
Plugin 'tpope/vim-surround'         " Surround stuff vim 

"Plugin 'preservim/nerdcommenter'    " Comment out lines 
Plugin 'tpope/vim-commentary'       " coment stuff out 
"
"" Actions
Plugin 'vim-scripts/ReplaceWithRegister'       " Gives the possebilety for replacing a word with a register word with gr

Plugin 'rust-lang/rust.vim'
call vundle#end()        
filetype plugin indent on


try 
  source ~/.vimrc_main
catch
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
let g:ycm_rust_src_path = '/home/trygve/.cargo/bin/rustc'
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

" NERDtree
let NERDTreeRespectWildIgnore=1
let NERDTreeShowBookmarks=1             " Shows the bookmarks

" CtrlP
" Set no max file limit
let g:ctrlp_max_files = 0
" Search from current directory instead of project root
let g:ctrlp_working_path_mode = 0

" YCME
nnoremap <leader>gd :YcmCompleter GetDoc<CR>


" Snippets
let g:UltiSnipsExpandTrigger="<leader>e"
let g:UltiSnipsJumpForwardTrigger="<c-b>"
let g:UltiSnipsJumpBackwardTrigger="<c-z>"




