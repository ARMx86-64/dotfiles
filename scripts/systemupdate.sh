#!/usr/bin/env bash

# script path
ScrDir=$(dirname "$(realpath "$0")")
source $ScrDir/globals.sh

# check aur helper
get_aurhelper

# run update
kitty --title systemupdate sh -c "${aurhlpr} -Syu && pkill -SIGRTMIN+8 waybar"
