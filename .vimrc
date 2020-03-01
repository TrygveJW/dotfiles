" Trygve Woldseth
" Brukt guide > https://dougblack.io/words/a-good-vimrc.html
""""""""""""""
"   Farger 
"""""""""""""" 

syntax enable
"╭──────╮
"│ FARGER│
"╰──────╯
"╓──────╖
"║ ABC     ║
"╙──────╜



"   Tab og space
set tabstop=4           " Antall visuelle space for hver tab
set softtabstop=4       " Antall space som en tab blir byttet ut med
set expandtab           " Tab blir til space

"   UI
set number              " Vis linje nummer
set relativenumber      " viser det relative linjenummeret
set showcmd             " Vis siste command i nedre jørne
set cursorline          " Highlight current line
filetype indent on      " Laster inn filtype spesifikke indent ie. .vim/indent/python.vim blir lastet når en *.py fil blir åpnet
set wildmenu            " Visuel autocomplete for command menyen
set lazyredraw          " Tegn kunn sjermen på nytt når det trengs (ikke midt i macros ol)
set showmatch           " Marker matchende ({[]})

"   Søk
set incsearch           " Søk fortøpende mens karekterer blir lakt till
set hlsearch            " Highlight matcer i søk

" binner avmarkering fra søk til space
"nnoremap <leader><space> :nohlsearch<CR>  

"   Folding
" Når man kan 'klappe' sammen en fungsjon og ikke se den
" Tenke ikke æ har så super mye bruk for det egentlig


"   Movement
nnoremap j gj
nnoremap k gk
