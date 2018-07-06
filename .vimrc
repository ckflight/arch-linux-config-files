" allow vim shell to source bashrc
set shell=bash\ --login

" Enable mouse support
if has("mouse")
	set mouse=a
endif

" Enable line numbers
set nu
set relativenumber

" Don't let lines wrap text
set nowrap

" Allow :WQ to function like :wq, etc
command WQ wq
command W w
command Q q

"<ctrl-l> redraws the screen and removes any search highlighting.
noremap <silent> <C-l> :nohl<CR><C-l>

"make whitespace characters visible 
"eventually I want this to only happen when I'm working on a whitespace dependent language
set listchars=eol:$,tab:>-,trail:~,extends:>,precedes:<
set tabstop=8 expandtab shiftwidth=4 softtabstop=4

"set colorscheme to dark.
"colorscheme darkblue

"make copy pasting NORMAL
vnoremap <C-c> "+y
map <C-p> "+P


syntax on

