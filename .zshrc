source ~/.zshuery/zshuery.sh
load_defaults
load_aliases
load_completion ~/.zshuery/completion
load_correction

bindkey '^R' history-incremental-search-backward

prompts '%{$fg_bold[green]%}$(COLLAPSED_DIR)%{$reset_color%}$(virtualenv_info) %{$fg[yellow]%}$(prompt_char)%{$reset_color%} '

zstyle ':completion:*' menu select

export EDITOR='vim'

chpwd() {
    update_terminal_cwd
}

export LS_OPTIONS="--color=auto -hF"

if [[ $IS_MAC -eq 1 ]]; then
	export PATH=$PATH:~/Library/Haskell/bin
	export PATH=$PATH:/usr/local/CrossPack-AVR/bin
	export PATH=$PATH:/usr/local/sbin
	alias ls="gls $LS_OPTIONS" 
	alias ldd="otool -L"
	alias pgrep="ps -a | grep"
else
	export LD_LIBRARY_PATH=/usr/local/lib
	alias ls="ls $LS_OPTIONS"
	alias pgrep="pgrep -lf"
fi

export PATH=$PATH:~/scripts
alias scp='scp -r'

source .zsh-syntax-highlighting/zsh-syntax-highlighting.zsh
