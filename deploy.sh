#!/bin/sh
set -eu

~/dotfiles/bin/setup_mitamae.sh

function logging(){
    echo "> "$*
    $*
}

DOTFILES=($(ls -pd .!(|.) | grep -v "/"))

for FILE in ${DOTFILES[@]}; do
    if [ ! -f ~/$FILE ]; then
        logging ln -s $PWD/$FILE ~/$FILE
    else
        echo $FILE already exists.
    fi
done
