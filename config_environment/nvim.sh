installer "nvim" "brew install neovim/neovim/neovim"

# Create base directories
mkdir -p ~/.config/nvim/bundle

# Install dein and nvim configuration
curl https://raw.githubusercontent.com/Shougo/dein.vim/master/bin/installer.sh > dein_installer.sh \
&& sh ./dein_installer.sh ~/.config/nvim/bundle \
&& cd .. \
&& ln -s $(pwd)/init.vim ~/.config/nvim/init.vim \
&& ln -s $(pwd)/tmux.conf ~/.tmux.conf \
&& rm config_environment/dein_installer.sh \
&& nvim -c 'call dein#install() | exit'

