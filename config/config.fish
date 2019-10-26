set fish_theme agnoster
set fish_plugins theme peco git tmux

# Path to Oh My Fish install.
set -x OMF_PATH $HOME/.local/share/omf
source $OMF_PATH/init.fish

# tmux
status --is-interactive
and not set -q TMUX
and exec tmux
end

# Java
set -x JAVA_HOME (/usr/libexec/java_home -v "1.8")

# Android
set -x ANDROID_HOME $HOME/Library/Android/sdk


set GOPATH $HOME/go
set PATH $HOME/bin /usr/local/bin /usr/sbin $HOME/.anyenv/bin /home/e_ntyo/.local/bin $GOPATH/bin $JAVA_HOME/bin $ANDROID_HOME/emulator $ANDROID_HOME/tools $ANDROID_HOME/tools/bin $ANDROID_HOME/platform-tools $PATH

function peco_select_history
    if set -q $argv
        history | peco | read -l line
        and commandline $line
    else
        history | peco --query $argv | read -l line
        and commandline $line
    end

    commandline -f repaint
end

function fish_user_key_bindings
    bind \cr peco_select_history
    bind \ce peco_select_repository
end

function peco_select_repository
    ghq list -p | peco --select-1 | read -l line
    and builtin cd $line

    commandline -f repaint
end

set fish_greeting

status --is-interactive
and source (anyenv init -|psub)
