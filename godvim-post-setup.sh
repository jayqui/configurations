#!/bin/bash

# RUN ONLY IF you have opened vim AFTER loading rc_files/vimrc_files/godvimrc into your vimrc

~/.vim/pack/bundle/start/fzf/install --bin
brew install ripgrep

grep -q 'fzf' ~/.bashrc || echo 'export PATH="$PATH:~/.vim/pack/bundle/start/fzf/bin"' >> ~/.bashrc
grep -q 'FZF' ~/.bashrc || echo 'export FZF_DEFAULT_COMMAND="rg --files"' >> ~/.bashrc
