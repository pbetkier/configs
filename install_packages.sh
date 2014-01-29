#!/bin/bash

packages=`cat packages`

echo "Installing essential packages: $packages ..."

sudo apt-get install $packages

echo "Done installing packages."
