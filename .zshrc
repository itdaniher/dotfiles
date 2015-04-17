source ~/.zsh-syntax-highlighting/zsh-syntax-highlighting.zsh
source ~/.zshuery/zshuery.sh
load_defaults
load_aliases
load_completion ~/.zshuery/completion
load_correction

bindkey '^R' history-incremental-search-backward

prompts '%{$fg_bold[green]%}$DIR%{$reset_color%}$(virtualenv_info) %{$fg[yellow]%}$(prompt_char)%{$reset_color%} '

zstyle ':completion:*' menu select

chpwd() {
    update_terminal_cwd
}


alias ls="ls $LS_OPTIONS"
alias pgrep="pgrep -lf"
alias scp='scp -r'

[ -z "$PS1" ] && return

export LD_LIBRARY_PATH=$LD_LIBRARY_PATH:/usr/local/lib
export PATH=$PATH:~/scripts:/opt/Qt5.4.0/5.4/gcc_64/bin/

export XAUTHORITY=~/.Xauthority
export LS_OPTIONS="--color=auto -hF"
export EDITOR='vim'

export ANDROID_HOME=/opt/android-sdk-linux
export PATH=${PATH}:$ANDROID_HOME/tools:$ANDROID_HOME/platform-tools:$ANDROID_HOME/build-tools
