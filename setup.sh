 #!/bin/bash

  DOT_FILES=(.bashrc .bash_profile .gitconfig .vimrc .yarnrc .tmux.conf .zshrc .zprofile bin .tigrc .tmux …)

 for file in ${DOT_FILES[@]}
 do
     ln -s $HOME/dotfiles/$file $HOME/$file
 done


ln -s $HOME/dotfiles/init.vim $HOME/.config/nvim/init.vim
ln -s $HOME/dotfiles/tdein_lazy.toml $HOME/.config/nvim/toml/dein_lazy.toml
ln -s $HOME/dotfiles/dein.toml $HOME/.config/nvim/toml/dein.toml
ln -s $HOME/dotfiles/dein_python.toml $HOME/.config/nvim/toml/dein_python.toml
