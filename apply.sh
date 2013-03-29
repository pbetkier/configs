#!/bin/bash
# Applies this configuration by appending to .bashrc and creating symlinks to these config files. 
# Previous configuration files are saved in backups directory.

CONFIGS_DIR=$( cd "$( dirname "$0" )" && pwd )

echo "Creating backup ..."
BACKUP_DIR=`date +"%d-%m-%Y_%s"`
mkdir -p $CONFIGS_DIR/backups/$BACKUP_DIR
`cp -t $CONFIGS_DIR/backups/$BACKUP_DIR ~/.bashrc`
mv -t $CONFIGS_DIR/backups/$BACKUP_DIR ~/.vim ~/.vimrc ~/.gitconfig ~/.git-completion.bash

echo "Appending options to .bashrc ..."
echo -e "\n# Below: configuration appended by configs apply.sh script" >> ~/.bashrc
echo "`cat $CONFIGS_DIR/bash/custom`" >> ~/.bashrc
echo "`cat $CONFIGS_DIR/git/bash_config`" >> ~/.bashrc

echo "Creating symlinks ..."
`ln -st ~ $CONFIGS_DIR/vim/.vim`
`ln -st ~ $CONFIGS_DIR/vim/.vimrc`
`ln -st ~ $CONFIGS_DIR/git/.gitconfig`
`ln -st ~ $CONFIGS_DIR/git/.git-completion.bash`

echo "Done!"
