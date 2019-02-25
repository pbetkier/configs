#!/bin/bash
# Applies this configuration by creating symlinks to config files. 
# Previous configuration files are saved in backups directory.

CONFIGS_DIR=$( cd "$( dirname "$0" )" && pwd )
OLDFILE=$CONFIGS_DIR/`date +"%d-%m-%Y_%s"`.old

echo "Installing configs, old contents backed up to $OLDFILE ..."
touch $OLDFILE

cd files
FILES=$(find . -type f -print | sed "s|^\./||")

for f in $FILES; do
    echo " $f ..."
    echo "--- $f:" >> $OLDFILE
    cat ~/$f >> $OLDFILE
    echo >> $OLDFILE
done


exit
#`cp -RLt $CONFIGS_DIR/backups/$BACKUP_DIR $HOME/.{vim,vimrc,gitconfig,gitignore_global,config/fish/config.fish}`

echo " Creating symlinks ..."
`ln -sTf $CONFIGS_DIR/vim/vim $HOME/.vim`
`ln -sTf $CONFIGS_DIR/vim/vimrc $HOME/.vimrc`

`ln -sTf $CONFIGS_DIR/git/gitconfig $HOME/.gitconfig`
`ln -sTf $CONFIGS_DIR/git/gitignore_global $HOME/.gitignore_global`

`ln -sTf $CONFIGS_DIR/fish/config.fish $HOME/.config/fish/config.fish`
`ln -sft $HOME/.config/fish/functions $CONFIGS_DIR/fish/functions/*`

echo "Done installing config."
