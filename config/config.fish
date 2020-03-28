set fish_theme agnoster
set fish_plugins theme fzf git tmux

# Path to Oh My Fish install.
set -x OMF_PATH $HOME/.local/share/omf
source $OMF_PATH/init.fish

# tmux
if status --is-interactive
    and not set -q TMUX
    exec tmux
end

set GOPATH $HOME/go
set ANDROID_HOME $HOME/Android/Sdk
set ANDROID_SDK_ROOT $ANDROID_HOME
set DOTNET_SKIP_FIRST_TIME_EXPERIENCE true
set KUBECONFIG $HOME/.kube/config
set PATH $HOME/bin /usr/local/bin /usr/sbin $HOME/.anyenv/bin /home/e_ntyo/.local/bin $GOPATH/bin $ANDROID_HOME/emulator $ANDROID_HOME/tools $ANDROID_HOME/tools/bin $ANDROID_HOME/platform-tools $HOME/.ghq/chromium.googlesource.com/chromium/tools/depot_tools $HOME/.cargo/env $PATH

function fzf_select_history
    if set -q $argv
        history | fzf | read -l line
        and commandline $line
    else
        history | fzf --query $argv | read -l line
        and commandline $line
    end

    commandline -f repaint
end

function fish_user_key_bindings
    bind \cr fzf_select_history
    bind \ce fzf_select_repository
end

function fzf_select_repository
    ghq list -p | fzf --select-1 | read -l line
    and builtin cd $line

    commandline -f repaint
end

set fish_greeting

status --is-interactive
and source (anyenv init -|psub)

set DOTNET_USE_POLLING_FILE_WATCHER true

eval (direnv hook fish)
