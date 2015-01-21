call plug#begin('~/.vim/plugged')

Plug 'kien/ctrlp.vim'
Plug 'tacahiroy/ctrlp-funky'
Plug 'eiginn/netrw', { 'tag': 'a98484b' }
Plug 'Lokaltog/vim-easymotion'
Plug 'tpope/vim-fugitive'
Plug 'tpope/vim-rails'
Plug 'luochen1990/rainbow'
Plug 'derekwyatt/vim-fswitch'
Plug 'junegunn/vim-easy-align'
Plug 'benmills/vimux'
Plug 'drn/vim-turbux'
Plug 'milkypostman/vim-togglelist'
Plug 'rking/ag.vim'
Plug 'mhinz/vim-startify'
Plug 'nanotech/jellybeans.vim'
Plug 'jeffkreeftmeijer/vim-numbertoggle'
Plug 'groenewege/vim-less'
Plug 'tpope/vim-endwise'
Plug 'tpope/vim-commentary'
Plug 'Raimondi/delimitMate'
Plug 'tpope/vim-surround'
Plug 'nathanaelkane/vim-indent-guides'
Plug 'othree/html5.vim'
Plug 'osyo-manga/vim-over'
Plug 'tpope/vim-unimpaired'
Plug 'tpope/vim-vinegar'
Plug 'tpope/vim-eunuch'
Plug 'mattn/gist-vim'
Plug 'mattn/webapi-vim'
Plug 'itchyny/lightline.vim'
Plug 'vim-scripts/matchit.zip'
Plug 'tpope/vim-speeddating'
Plug 'maxbrunsfeld/vim-yankstack'
Plug 'jszakmeister/vim-togglecursor'
Plug 'vim-scripts/indenthtml.vim'
Plug 'tpope/vim-repeat'
Plug 'zaiste/tmux.vim'
Plug 'kchmck/vim-coffee-script'
Plug 'tpope/vim-characterize'
Plug 'jpalardy/vim-slime'
Plug 'tpope/vim-characterize'
Plug 'junegunn/limelight.vim'
Plug 'noprompt/vim-yardoc'
Plug 'ConradIrwin/vim-bracketed-paste'
Plug 'junegunn/vim-pseudocl'
Plug 'junegunn/vim-oblique'

" Lazy-load plugins
Plug 'scrooloose/nerdtree', { 'on': [ 'NERDTreeToggle', 'NERDTreeFind' ] }
Plug 'sjl/gundo.vim', { 'on': 'GundoToggle' }
Plug 'drn/zoomwin-vim', { 'on': 'ZoomWin' }
Plug 'rking/ag.vim', { 'on': 'Ag' }
Plug 'airblade/vim-gitgutter', { 'on': 'GitGutterToggle' }

" Ruby
Plug 'scrooloose/syntastic', { 'for': 'ruby' }
Plug 'vim-ruby/vim-ruby', { 'for': [ 'ruby', 'eruby' ] }
Plug 'kana/vim-textobj-user', { 'for': [ 'ruby', 'eruby' ] }
Plug 'nelstrom/vim-textobj-rubyblock', { 'for': [ 'ruby', 'eruby' ] }

" Swift
Plug 'Keithbsmiley/swift.vim', { 'for': 'swift' }

" Non-neovim plugins
if $MYVIMRC !~ 'nvimrc'

  function! BuildYCM(info)
    " info is a dictionary with 3 fields
    " - name:   name of the plugin
    " - status: 'installed', 'updated', or 'unchanged'
    " - force:  set on PlugInstall! or PlugUpdate!
    if a:info.status == 'installed' || a:info.status == 'updated' || a:info.force
      !./install.sh
    endif
  endfunction
  Plug 'Valloric/YouCompleteMe', { 'do': function('BuildYCM') }

endif

call plug#end()