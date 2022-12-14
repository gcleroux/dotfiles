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

# Installing neovim bin from source
nvim_install() {
    # Installing neovim from bin
    NVIM_VERSION=$(curl -s "https://api.github.com/repos/neovim/neovim/releases/latest" | grep '"tag_name":' | sed -E 's/.*"v*([^"]+)".*/\1/')
    curl -LO "https://github.com/neovim/neovim/releases/download/$NVIM_VERSION/nvim-linux64.deb"
    curl -LO "https://github.com/neovim/neovim/releases/download/$NVIM_VERSION/nvim-linux64.deb.sha256sum"
    if [ "$(sha256sum -c nvim-linux64.deb.sha256sum)" != "nvim-linux64.deb: OK" ]; then
        prompt -e "\n Neovim checksum failed."
        exit 1
    fi
    sudo apt install -y ./nvim-linux64.deb
    rm ./nvim-linux64.deb ./nvim-linux64.deb.sha256sum
}

# Checking for root access and proceed if it is present
if [ "$UID" != "$ROOT_UID" ]; then
    # Error message
    prompt -e "This script should be run as root.\n"
    prompt -e "Operation canceled."
    exit 1
fi

# Installing neovim
prompt -i "\nInstalling Neovim bin from source.\n"
nvim_install

prompt -s "Neovim was installed successfully!"

# Copying config files to XDG_CONFIG_HOME
sudo -u "$SUDO_USER" ln -sf "$(pwd)"/config ${XDG_CONFIG_HOME:-~/.config}/nvim

# Installing Packer for nvim plugins
git clone --depth 1 https://github.com/wbthomason/packer.nvim ~/.local/share/nvim/site/pack/packer/start/packer.nvim
