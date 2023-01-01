#!/bin/bash

ROOT_UID=0

#COLORS
CDEF="\033[0m"      # default color
b_CCIN="\033[1;36m" # bold info color
b_CGSC="\033[1;32m" # bold success color
b_CRER="\033[1;31m" # bold error color
b_CWAR="\033[1;33m" # bold warning color

# echo like ...  with  flag type  and display message  colors
prompt() {
    case ${1} in
    "-s" | "--success")
        echo -e "${b_CGSC}${@/-s/}${CDEF}"
        ;; # print success message
    "-e" | "--error")
        echo -e "${b_CRER}${@/-e/}${CDEF}"
        ;; # print error message
    "-w" | "--warning")
        echo -e "${b_CWAR}${@/-w/}${CDEF}"
        ;; # print warning message
    "-i" | "--info")
        echo -e "${b_CCIN}${@/-i/}${CDEF}"
        ;; # print info message
    *)
        echo -e "$@"
        ;;
    esac
}

# Checking for root access and proceed if it is present
if [ "$UID" != "$ROOT_UID" ]; then
    # Error message
    prompt -e "This script should be run as root.\n"
    prompt -e "Operation canceled."
    exit 1
fi

prompt -i "\nUninstalling Neovim.\n"

apt purge -y neovim

# Removing nvim config direectory
rm -rf ${XDG_CONFIG_HOME:-~/.config}/nvim
rm -rf ~/.local/share/nvim/

prompt -i "\nSuccessfully uninstalled Neovim.\n"
