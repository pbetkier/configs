#!/bin/bash

packages=`cat packages`

echo "Installing essential packages: $packages ..."
echo 

sudo apt-get install $packages

echo
echo "Done."
