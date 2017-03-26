if test -e "$HOME/oh-my-zsh.sh"; then
    info "oh-my-zsh already installed"
else
    sh -c "$(curl -fsSL https://raw.githubusercontent.com/robbyrussell/oh-my-zsh/master/tools/install.sh)"
    cp .zshrc $HOME/.zshrc
fi
