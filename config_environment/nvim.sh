installer "nvim" "brew install neovim/neovim/neovim && pip install neovim && pip3 install neovim && gem install neovim"

# Create base directories
mkdir -p ~/.config/nvim/bundle

# Install dein and nvim configuration
curl https://raw.githubusercontent.com/Shougo/dein.vim/master/bin/installer.sh > dein_installer.sh \
&& sh ./dein_installer.sh ~/.config/nvim/bundle \
&& cd .. \
&& ln -sf $(pwd)/init.vim ~/.config/nvim/init.vim \
&& ln -sf $(pwd)/tmux.conf ~/.tmux.conf \
&& rm config_environment/dein_installer.sh \
&& nvim -c 'call dein#install() | exit' \
&& brew install llvm --with-clang \
&& brew install leiningen \
&& go get -u github.com/nsf/gocode \
&& mkdir -p ~/.tern-project \
&& echo ${password} | sudo pip install jedi \
&& pip3 install jedi \
&& cd config_environment
