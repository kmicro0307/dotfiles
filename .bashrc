hiscopy() {
    echo `history | fzf --tac | awk '{$1="";print $0;}'` | cmd.exe
}
hisdo() {
    hisdo_cmd=`history | fzf --tac | awk '{$1="";print $0;}'`
    echo ${hisdo_cmd}
    eval ${hisdo_cmd}
}

export PATH="$PATH:/mnt/c/Program Files/AutoHotkey"

export PATH="$PATH:/home/$USER/.cargo/bin"
alias tmuxg="tmux attach -d || tmux new-session \; source-file ~/.tmux/session_conf"

#sshの設定
#https://docs.google.com/spreadsheets/d/1DzNuz4jAywoI3mXEnUdy9O8pikGlPSH0WU75oTgF-es/edit#gid=0

if grep -q Microsoft /proc/version; then
    # WSL2 クリップボード連携用にDISPLAYを設定
    LOCAL_IP=$(cat /etc/resolv.conf | grep nameserver | cut -d' ' -f2)
    export DISPLAY=$LOCAL_IP:0.0
    alias open="/mnt/c/Windows/explorer.exe"

    alias pip="pip3"
    alias python="python3"
    alias arp='/mnt/c/Windows/System32/arp.exe'
    alias cmd='/mnt/c/Windows/System32/cmd.exe'
    alias clip='clip.exe'
    alias pbcopy='clip.exe'
fi 

alias g='git'
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

. $HOME/plugins/z/z.sh
#if [ $SHLVL = 1 ]; then
#    tmux

source /home/$USER/.config/broot/launcher/bash/br

# Generated for envman. Do not edit.
[ -s "$HOME/.config/envman/load.sh" ] && source "$HOME/.config/envman/load.sh"

source /home/yoshi/.config/broot/launcher/bash/br
