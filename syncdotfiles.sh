#!/bin/bash

DEST="/vagrant/files/default/"
cp ~/.vimrc $DEST
cp ~/.vimrc.d/.vimrc.* $DEST
cp ~/.zshrc $DEST
cp ~/.zshrc.d/* $DEST
