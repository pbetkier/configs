#!/bin/bash
# Applies this configuration by adding source command to .bashrc and creating symlinks to config files. 
# Previous configuration files are saved in backups directory.

CONFIGS_DIR=$( cd "$( dirname "$0" )" && pwd )

echo "Installing config ..."

echo " Creating backup ..."
BACKUP_DIR=`date +"%d-%m-%Y_%s"`
mkdir -p $CONFIGS_DIR/backups/$BACKUP_DIR
`cp -RLt $CONFIGS_DIR/backups/$BACKUP_DIR $HOME/.{vim,vimrc,gitconfig,gitignore_global,config/fish/config.fish}`

echo " Creating symlinks ..."
`ln -sTf $CONFIGS_DIR/vim/vim $HOME/.vim`
`ln -sTf $CONFIGS_DIR/vim/vimrc $HOME/.vimrc`

`ln -sTf $CONFIGS_DIR/git/gitconfig $HOME/.gitconfig`
`ln -sTf $CONFIGS_DIR/git/gitignore_global $HOME/.gitignore_global`
`ln -sTf $CONFIGS_DIR/git/git-completion.bash $HOME/.git-completion.bash`

`ln -sTf $CONFIGS_DIR/fish/config.fish $HOME/.config/fish/config.fish`
`ln -sft $HOME/.config/fish/functions $CONFIGS_DIR/fish/functions/*`

echo " Updating gitconfig with user data ..."
read -p "  Enter your git user name: " GIT_USER_NAME
read -p "  Enter your git user email: " GIT_USER_EMAIL
`git config --global user.name "$GIT_USER_NAME"`
`git config --global user.email "$GIT_USER_EMAIL"`

echo "Done installing config."
