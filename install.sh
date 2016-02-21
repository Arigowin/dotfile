#!/bin/sh
DOTFILE_PATH=$HOME/.dotfiles

function do_ln()
{
    unset SRC DEST
    if [[ -n "$1" ]]; then
        if [[ ${1:0:1} == "/" ]]; then
            SRC=$1
        else
            SRC="$DOTFILE_PATH/$1"
        fi
    fi
    if [[ -n "$2" ]]; then
        if [[ ${2:0:1} == "/" ]]; then
            DEST=$2
        else
            DEST="$HOME/$2"
        fi
    fi
    if [[ -n "$SRC" ]] && [[ -n "$DEST" ]]; then
        if [[ -e "$DEST" ]]; then
            if [[ "$INS_FORCE" == "OK" ]]; then
                rm -rf "$DEST"
            else
                mv "$DEST" "$DEST.back"
            fi
        fi
        ln -sf "$SRC" "$DEST"
        echo "ln -sf $SRC $DEST"
    fi
}

for FILE in `cat "$DOTFILE_PATH/ln"`
do
    IFS=":"
    do_ln $FILE
    IFS=""
done
