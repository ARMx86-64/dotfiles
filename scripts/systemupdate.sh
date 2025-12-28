#!/usr/bin/env bash

# check arch release
if [ ! -f /etc/arch-release ] ; then
    exit 0
fi

# script path
ScrDir=$(dirname "$(realpath "$0")")
source $ScrDir/globals.sh

# check for updates (packages)
get_aurhelper

ofc=`${aurhlpr} -Qua | wc -l`
aur=`checkupdates | wc -l`

# TODO: flatpaks

# total updates
all=$(( ofc + aur ))

# tooltip
if [ $all -eq 0 ] ; then
    echo "{\"text\":\"$all \", \"tooltip\":\" 󰚰  All packages are up to date\"}"
else
    echo "{\"text\":\"$all \", \"tooltip\":\" 󰚰  Official: $ofc | AUR: $aur\"}"
fi

# run update
if [ $1 == "up" ] ; then
    kitty --title systemupdate sh -c "${aurhlpr} -Syu"
fi
