set fish_theme agnoster
set fish_plugins theme peco git tmux
# Path to Oh My Fish install.
set -gx OMF_PATH $HOME/.local/share/omf

# tmux
if status --is-interactive
    and not set -q TMUX
    exec tmux
end

set GOPATH $HOME/go
set PATH $HOME/bin /usr/local/bin /usr/sbin $HOME/.anyenv/bin /home/e_ntyo/.local/bin $GOPATH/bin $PATH

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

set -gx SHELL /usr/bin/fish
set fish_greeting

status --is-interactive
and source (anyenv init -|psub)
