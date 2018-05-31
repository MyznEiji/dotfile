 #!/bin/bash

  DOT_FILES=(.bashrc .bash_profile .gitconfig .vimrc .yarnrc .tmux.conf .zshrc .zprofile bin .tigrc …)

 for file in ${DOT_FILES[@]}
 do
     ln -s $HOME/dotfiles/$file $HOME/$file
 done


ln -s $HOME/dotfiles/init.vim $HOME/.config/nvim/init.vim
