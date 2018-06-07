 #!/bin/bash

  DOT_FILES=(.bashrc .bash_profile .gitconfig .vimrc .yarnrc .tmux.conf .zshrc .zprofile .tigrc …)

 for file in ${DOT_FILES[@]}
 do
     ln -s $HOME/dotfiles/$file/ $HOME/$file/
 done

 ln -s $HOME/dotfiles/bin $HOME/
 ln -s $HOME/dotfiles/.tmux $HOME/
 ln -s $HOME/dotfiles/init.vim $HOME/.config/nvim/init.vim
 ln -s $HOME/dotfiles/lazy.toml $HOME/.config/nvim/lazy.toml
 ln -s $HOME/dotfiles/dein.toml $HOME/.config/nvim/dein.toml
 ln -s $HOME/dotfiles/python.toml $HOME/.config/nvim/python.toml
 ln -s $HOME/dotfiles/php.toml $HOME/.config/nvim/php.toml
 ln -s $HOME/dotfiles/javascript.toml $HOME/.config/nvim/javascript.toml
