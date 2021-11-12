source ~/zsh-snap/znap.zsh
hiscopy() {
    echo `history | fzf --tac | awk '{$1="";print $0;}'` | cmd.exe
}
hisdo() {
    hisdo_cmd=`history | fzf --tac | awk '{$1="";print $0;}'`
    echo ${hisdo_cmd}
    eval ${hisdo_cmd}
}

alias tmuxg="tmux attach -d || tmux new-session \; source-file ~/.tmux/session_conf"

#sshの設定
#https://docs.google.com/spreadsheets/d/1DzNuz4jAywoI3mXEnUdy9O8pikGlPSH0WU75oTgF-es/edit#gid=0

# alias open="/mnt/c/Windows/explorer.exe"
# alias open='"/mnt/c/Program Files/te210322/TE64.exe"'

alias pip="pip3"
alias python="python3"
alias arp='/mnt/c/Windows/System32/arp.exe'
alias cmd='/mnt/c/Windows/System32/cmd.exe'
alias clip='clip.exe'
alias pbcopy='clip.exe'
# alias g='git'
alias ga='git add'
alias gd='git diff'
alias gs='git status'
alias gp='git push'
alias gb='git branch'
alias gst='git status'
alias gco='git checkout'
alias gf='git fetch'
alias gc='git commit'
alias bashrc='vim ~/.bashrc'
alias vimrc='vim ~/.vimrc'

# 単語移動のキーバインド設定 
bindkey "^[[1;5C" forward-word
bindkey ";5C" forward-word
bindkey ";5D" backward-word
bindkey "^[[1;5D" backward-word

# コマンド履歴検索
autoload history-search-end
zle -N history-beginning-search-backward-end history-search-end
zle -N history-beginning-search-forward-end history-search-end
bindkey '^R' history-incremental-search-backward
bindkey '^S' history-incremental-search-forward
bindkey '^P' history-beginning-search-backward
bindkey '^N' history-beginning-search-forward
setopt auto_list
stty -ixon
setopt no_flow_control
# prompt
PROMPT='%m:%c %n$ '

. $HOME/plugins/z/z.sh
#if [ $SHLVL = 1 ]; then
#    tmux
# 履歴ファイルの保存先
# 履歴をインクリメンタルに追加
# インクリメンタルからの検索
#
# zplugの設定
## zplug
source ~/.zplug/init.zsh
zplug 'zplug/zplug', hook-build:'zplug --self-manage'
# 非同期処理できるようになる
zplug "mafredri/zsh-async"
# テーマ(ここは好みで。調べた感じpureが人気)
zplug "sindresorhus/pure"
# 構文のハイライト(https://github.com/zsh-users/zsh-syntax-highlighting)
zplug "zsh-users/zsh-syntax-highlighting"
# コマンド入力途中で上下キー押したときの過去履歴がいい感じに出るようになる
# zplug "zsh-users/zsh-history-substring-search"
# 過去に入力したコマンドの履歴が灰色のサジェストで出る
zplug "zsh-users/zsh-autosuggestions"
# 補完強化
zplug "zsh-users/zsh-completions"
# 256色表示にする
zplug "chrissicool/zsh-256color"
# コマンドライン上の文字リテラルの絵文字を emoji 化する
# zplug "mrowa44/emojify", as:command
# Install plugins if there are plugins that have not been installed
if ! zplug check --verbose; then
  printf "Install? [y/N]: "
  if read -q; then
    echo; zplug install
  fi
fi
# コマンドの履歴機能
# 履歴ファイルの保存先
HISTFILE=$HOME/.zsh_history
# メモリに保存される履歴の件数
HISTSIZE=10000
# HISTFILE で指定したファイルに保存される履歴の件数
SAVEHIST=10000
# Then, source plugins and add commands to $PATH
zplug load

source /home/$USER/.config/broot/launcher/bash/br
# PS1="%{$fg[cyan]%}[${USER}@${HOST%%.*} %1~]%(!.#.$)${reset_color} "

# zoxide
eval "$(zoxide init zsh)"

# Windows Terminalで使用，分割の際に同じパスを持つペインを作成する
function _windows_terminal_osc_9_9 {
    # Inform Terminal about shell current working directory
    # see: https://github.com/microsoft/terminal/issues/8166
    printf '\e]9;9;%s\e\' "$(wslpath -w "$(pwd)")"
}
precmd_functions+=(_windows_terminal_osc_9_9)

znap source marlonrichert/zsh-autocomplete
