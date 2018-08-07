#!/bin/bash


rsync .bash* ~
rsync --exclude='.git' .git* ~
rsync .zsh* ~
rsync .tmux.conf ~
cp -r .vim* ~
