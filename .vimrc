syntax on

set mouse=a
set number
set incsearch 
set hlsearch
set ignorecase

call plug#begin()
  Plug 'prabirshrestha/vim-lsp'
  Plug 'mattn/vim-lsp-settings'
  Plug 'prabirshrestha/asyncomplete.vim'
  Plug 'prabirshrestha/asyncomplete-lsp.vim'
  Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
  Plug 'junegunn/fzf.vim'
  Plug 'tpope/vim-sleuth'
  Plug 'preservim/nerdtree'
  Plug 'rhysd/vim-healthcheck'
call plug#end()

" Lsp config
let g:lsp_settings = {
  \"omnisharp-lsp": {
    \"cmd": ["dotnet", "/Users/armiantos/.local/share/vim-lsp-settings/servers/omnisharp-lsp/OmniSharp.dll", "-lsp"]
  \}
\}

" Fzf config
let $FZF_DEFAULT_COMMAND='rg --files'

" Keybindings
let mapleader = "`"

" asyncomplete
inoremap <expr> <Tab>   pumvisible() ? "\<C-n>" : "\<Tab>"
inoremap <expr> <S-Tab> pumvisible() ? "\<C-p>" : "\<S-Tab>"
inoremap <expr> <cr>    pumvisible() ? asyncomplete#close_popup() : "\<cr>"

" NERDtree
nnoremap <leader>p :Files<CR>
nnoremap <leader>c :Commands<CR>
nnoremap <leader>b :NERDTreeToggle<CR>

