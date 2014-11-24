source ~/.zsh-syntax-highlighting/zsh-syntax-highlighting.zsh
source ~/.zshuery/zshuery.sh
load_defaults
load_aliases
load_completion ~/.zshuery/completion
load_correction

bindkey '^R' history-incremental-search-backward

prompts '%{$fg_bold[green]%}$DIR%{$reset_color%}$(virtualenv_info) %{$fg[yellow]%}$(prompt_char)%{$reset_color%} '

zstyle ':completion:*' menu select

export EDITOR='vim'

chpwd() {
    update_terminal_cwd
}

export LS_OPTIONS="--color=auto -hF"

export LD_LIBRARY_PATH=/usr/local/lib
alias ls="ls $LS_OPTIONS"
alias pgrep="pgrep -lf"

[ -z "$PS1" ] && return

export PATH=$PATH:~/scripts
alias scp='scp -r'
xmodmap -e 'clear Lock' -e 'keycode 0x42 = Escape'
synclient VertHysteresis=100
