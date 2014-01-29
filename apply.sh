#!/bin/bash
# Applies this configuration by adding source command to .bashrc and creating symlinks to config files. 
# Previous configuration files are saved in backups directory.

CONFIGS_DIR=$( cd "$( dirname "$0" )" && pwd )

echo "Creating backup ..."
BACKUP_DIR=`date +"%d-%m-%Y_%s"`
mkdir -p $CONFIGS_DIR/backups/$BACKUP_DIR
`cp -RLt $CONFIGS_DIR/backups/$BACKUP_DIR $HOME/.{vim,vimrc,gitconfig,gitignore_global,git-completion.bash,bash,config/fish/config.fish}`

echo "Appending source entry to .bashrc ..."
SOURCE_CMD="source $CONFIGS_DIR/bash/additional_conf"

#add entry if it doesn't exist yet
if ! grep -Fxq "$SOURCE_CMD" $HOME/.bashrc; then
    echo -e "#more conf added by configs apply.sh\n$SOURCE_CMD" >> $HOME/.bashrc
fi

echo "Creating symlinks ..."
`ln -sTf $CONFIGS_DIR/vim/vim $HOME/.vim`
`ln -sTf $CONFIGS_DIR/vim/vimrc $HOME/.vimrc`

`ln -sTf $CONFIGS_DIR/git/gitconfig $HOME/.gitconfig`
`ln -sTf $CONFIGS_DIR/git/gitignore_global $HOME/.gitignore_global`
`ln -sTf $CONFIGS_DIR/git/git-completion.bash $HOME/.git-completion.bash`

`ln -sTf $CONFIGS_DIR/bash/bash $HOME/.bash`

`ln -sTf $CONFIGS_DIR/fish/config.fish $HOME/.config/fish/config.fish`
`ln -sft $HOME/.config/fish/functions $CONFIGS_DIR/fish/functions/*`

echo "Done!"
