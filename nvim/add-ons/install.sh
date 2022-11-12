#!/bin/bash

# Get the path to neovim binaries
NVIM_BIN=$(cd ../bin/; pwd)

# Installing node pkgs
npm install markdown-toc markdownlint-cli prettier 

# Creating symlinks to bin/
ln -sf $PWD/node_modules/markdown-toc/cli.js $NVIM_BIN/markdown-toc 
ln -sf $PWD/node_modules/markdownlint-cli/markdownlint.js $NVIM_BIN/markdownlint 
ln -sf $PWD/node_modules/prettier/bin-prettier.js $NVIM_BIN/prettier

# Installing lazygit
LAZYGIT_VERSION=$(curl -s "https://api.github.com/repos/jesseduffield/lazygit/releases/latest" | grep '"tag_name":' |  sed -E 's/.*"v*([^"]+)".*/\1/')
curl -Lo lazygit.tar.gz "https://github.com/jesseduffield/lazygit/releases/latest/download/lazygit_${LAZYGIT_VERSION}_Linux_x86_64.tar.gz"
tar xf lazygit.tar.gz -C $NVIM_BIN lazygit

# Installing stylua
STYLUA_VERSION=$(curl -s "https://api.github.com/repos/JohnnyMorganz/StyLua/releases/latest" | grep '"tag_name":' |  sed -E 's/.*"v*([^"]+)".*/\1/')
curl -Lo stylua.zip "https://github.com/JohnnyMorganz/StyLua/releases/download/v${STYLUA_VERSION}/stylua-linux-x86_64.zip"
unzip stylua.zip -d $NVIM_BIN

# Installing yamlfmt
YAMLFMT_VERSION=$(curl -s "https://api.github.com/repos/google/yamlfmt/releases/latest" | grep '"tag_name":' |  sed -E 's/.*"v*([^"]+)".*/\1/')
curl -Lo yamlfmt.tar.gz "https://github.com/google/yamlfmt/releases/latest/download/yamlfmt_${YAMLFMT_VERSION}_Linux_x86_64.tar.gz"
tar xf yamlfmt.tar.gz -C $NVIM_BIN yamlfmt

# Installing shfmt
SHFMT_VERSION=$(curl -s "https://api.github.com/repos/mvdan/sh/releases/latest" | grep '"tag_name":' |  sed -E 's/.*"v*([^"]+)".*/\1/')
curl -Lo $NVIM_BIN/shfmt "https://github.com/mvdan/sh/releases/latest/download/shfmt_v${SHFMT_VERSION}_linux_amd64"
chmod +x $NVIM_BIN/shfmt
