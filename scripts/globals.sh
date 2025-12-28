#!/usr/bin/env bash

# check if package installed
function check_pkg() {
    local Pkg=$1

    if pacman -Qi $Pkg &> /dev/null
        then
            #echo "${Pkg} is installed..."
            return 0
        else
            #echo "${Pkg} is not installed...}"
            return 1
    fi  
}

# check aur helper
function get_aurhelper() {
    if check_pkg yay
        then aurhlpr="yay"
    elif check_pkg paru
        then aurhlpr="paru"
    fi   
}
