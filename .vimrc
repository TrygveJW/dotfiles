":PluginClean Trygve-Woldseth 
" Brukt guide > https://dougblack.io/words/a-good-vimrc.html

" spellcheck in vim add maybe switch to nvim
" http://thejakeharding.com/tutorial/2012/06/13/using-spell-check-in-vim.html

" notes:
" edit over multiple lines 
" ctrl-v to go to visual mode, select lines
        " shift i to go to insert do changes(will not show up everywhere untill done)
" press esc to commit changes
" CarApple 
"###############################
"   General settings
"###############################
set nocompatible
filetype off
let mapleader=","
set smartcase       " makes the / sertch case insensetive
"set wildmenu
"set wildignorecase
"set wildmode=longest:full,full
set mouse=a

set ignorecase
set smartcase

set wildignore+=*.pyc,*.o,*.obj,*.svn,*.swp,*.class,*.hg,*.DS_Store,*.min.*,*.meta
"###############################
"   package management 
"###############################


"###############################
"   Farger 
"###############################
syntax enable

"###############################
"   Tab og space
"###############################
set tabstop=4           " Antall visuelle space for hver tab
set softtabstop=4       " Antall space som en tab blir byttet ut med
set expandtab           " Tab blir til space

"###############################
"   UI
"###############################
set number              " Vis linje nummer
set relativenumber     
" viser det relative linjenummeret
set showcmd             " Vis siste command i nedre jørne
"set cursorline          " Highlight current line
filetype indent on      " Laster inn filtype spesifikke indent ie. .vim/indent/python.vim blir lastet når en *.py fil blir åpnet
set wildmenu            " Visuel autocomplete for command menyen
set lazyredraw          " Tegn kunn sjermen på nytt når det trengs (ikke midt i macros ol)
set showmatch           " Marker matchende ({[]})



"###############################
"   Søk
"###############################
set incsearch           " Søk fortøpende mens karekterer blir lakt till
set hlsearch            " Highlight matcer i søk

" binner avmarkering fra søk til space
nnoremap <leader><space> :nohlsearch<CR>

"   Folding
" Når man kan 'klappe' sammen en fungsjon og ikke se den
" Tenke ikke æ har så super mye bruk for det egentlig


"###############################
" Key Remaps 
"###############################

" beveger seg over visuelle linjer ikke vanlige

" Rebinner gå til start ^ og slutt $ av linje til B(ginning) og E(nd)
nnoremap B ^
nnoremap E $

onoremap B ^
onoremap E $

nmap <A-j> mz:m+<cr>`z
nmap <A-k> mz:m-2<cr>`z
vmap <A-j> :m'>+<cr>`<my`>mzgv`yo`z
vmap <A-k> :m'<-2<cr>`>my`<mzgv`yo`z

imap <A-j> <Esc>ømz:m+<cr>`za
imap <A-k> <Esc>ømz:m-2<cr>`za


" endrer d til delete istedet for cut
"nnoremap p "0p 
"nnoremap <leader>p ""p

"vnoremap p "0p 
"vnoremap <leader>p ""p

" makes /sertch case insensitive
nnoremap / /\C

" remaps the vhange window key to shift w insted of ctrl w
nnoremap W <C-w>

"   Plugin remaps 

" Spelunker
" remaps the correct word key to the default vim

nmap zl Zl
nmap zg Zg
nmap zw Zw

nmap zn ZN
nmap zp ZP








"###############################
" Leader Shortcuts
"###############################
let c='a'
while c <= 'z'
  exec "set <A-".c.">=\e".c
  exec "imap \e".c." <A-".c.">"
  let c = nr2char(1+char2nr(c))
endw

set ttimeout ttimeoutlen=50












"###############################
" Plugin Settings
"###############################

