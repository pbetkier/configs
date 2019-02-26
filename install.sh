#!/bin/bash

# Applies this configuration by creating symlinks to config files. 
# Previous configuration contents are saved in *.old files.

CONFIGS_DIR=$( cd "$( dirname "$0" )" && pwd )
OLDFILE=$CONFIGS_DIR/`date +"%d-%m-%Y_%s"`.old

echo "Installing configs, old contents backed up to $OLDFILE ..."
touch $OLDFILE

cd files
FILES=$(find . -type f -print | sed "s|^\./||")

for f in $FILES; do
    echo " Backing up and symlinking $f ..."

    echo "--- $f:" >> $OLDFILE
    cat ~/$f >> $OLDFILE
    echo >> $OLDFILE

    ln -sfv $CONFIGS_DIR/files/$f $HOME/$f
done

echo "Done installing configs."
