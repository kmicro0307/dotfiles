export PATH="$PATH:/mnt/c/Program Files/Microsoft VS Code/bin"
export PATH="$PATH:/mnt/c/Windows"
export PATH="$PATH:/mnt/c/Windows/system32"

# export DISPLAY=$(cat /etc/resolv.conf | grep nameserver | awk '{print $2}'):0
export DISPLAY=192.168.0.210:0.0

if [ $SHLVL = 1 ]; then
      alias tmuxg="tmux attach -d || tmux new-session \; source-file ~/.tmux/session_conf"
fi

if [ -f ~/.bashrc ]; then
. ~/.bashrc
fi
#if [ $SHLVL = 1 ]; then
#    tmux
#    fi

source /home/$USER/.config/broot/launcher/bash/br
