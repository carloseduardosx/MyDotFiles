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
&& wget -P /usr/local/bin/ https://raw.githubusercontent.com/technomancy/leiningen/stable/bin/lein \
&& chmod a+x /usr/local/bin/lein \
&& lein \
&& echo ':plugins [[cider/cider-nrepl "0.14.0"]]' > ~/.lein/profiles.clj \
&& go get -u github.com/nsf/gocode \
&& mkdir ~/.tern-project \
&& pip install jedi \
&& pip3 install jedi
