# Install dein
# https://github.com/Shougo/dein.vim#unixlinux-or-mac-os-x
run_command("curl https://raw.githubusercontent.com/Shougo/dein.vim/master/bin/installer.sh > installer.sh && ./installer.sh ~/.cache/dein", error: false)
ln '.vimrc'
