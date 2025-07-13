" === Базовая конфигурация для macOS Terminal ===

" System Clipboard
set clipboard=unnamed

" Включаем номер строки
set number

" Используем фиксированную ширину табулятора и авто-отступы
set tabstop=4
set shiftwidth=4
set expandtab
set autoindent

" Синхронизируем положение курсора при повторном открытии файла
autocmd BufReadPost *
  \ if line("'\"") > 1 && line("'\"") <= line("$") |
  \   exe "normal! g'\"" |
  \ endif

" Устанавливаем удобную комбинацию клавиш для выхода
nnoremap <Leader>q :quit<CR>

" Улучшаем внешний вид и удобство навигации
set cursorline              " Подчеркиваем активную строку
set scrolloff=7             " Всегда оставляем запас пространства сверху и снизу активного блока текста
set showmatch               " Показываем парные скобки и цитаты
set showmode                " Покажем статус режима (Normal, Insert и т.п.)

" Улучшаем опыт работы с поиском
set hlsearch                " Подсвечиваем найденные символы
set incsearch               " Инкрементальный поиск
set ignorecase              " Регистр игнорируется при поиске
set smartcase               " Исключение регистра при поиске прописных букв

" Цветовая схема

" Этот код отключает фон, установленный Jellybeans, и использует фон терминала
let g:jellybeans_overrides = {
\    'background': { 'ctermbg': 'none', '256ctermbg': 'none' },
\}
if has('termguicolors') && &termguicolors
    let g:jellybeans_overrides['background']['guibg'] = 'none'
endif

colorscheme jellybeans

let python_highlight_all=1
syntax on

" Настройки терминала
set notermguicolors
set t_Co=256

" === Настройка плагинов через vim-plug ===
call plug#begin('~/.vim/plugged')  " Инициализация менеджера плагинов

" Цветовые схемы (256-цветные)
Plug 'nanotech/jellybeans.vim'     " Яркая тема с поддержкой 256 цветов

" Комментирование
Plug 'tpope/vim-commentary' 


call plug#end()                    " Завершение настройки плагинов

" Vundle setup

set nocompatible              " be iMproved, required
filetype off                  " required

" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
" alternatively, pass a path where Vundle should install plugins
"call vundle#begin('~/some/path/here')

" let Vundle manage Vundle, required
Plugin 'VundleVim/Vundle.vim'
Plugin 'vim-syntastic/syntastic'

" File Browsing
Plugin 'scrooloose/nerdtree'

" Search
Plugin 'kien/ctrlp.vim'

Plugin 'jnurmine/Zenburn'

" Auto-Indentation
Plugin 'vim-scripts/indentpython.vim'

call vundle#end()            " required
filetype plugin indent on    " required
" To ignore plugin indent changes, instead use:
"filetype plugin on
"
" Brief help
" :PluginList       - lists configured plugins
" :PluginInstall    - installs plugins; append `!` to update or just :PluginUpdate
" :PluginSearch foo - searches for foo; append `!` to refresh local cache
" :PluginClean      - confirms removal of unused plugins; append `!` to auto-approve removal
"
" see :h vundle for more details or wiki for FAQ
" Put your non-Plugin stuff after this line

" Remove trailing whitespace
autocmd BufWritePre *.py :%s/\s\+$//e
