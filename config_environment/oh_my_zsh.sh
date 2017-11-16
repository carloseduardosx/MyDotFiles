if test -e "$HOME/oh-my-zsh.sh"; then
    info "oh-my-zsh already installed"
else
    echo ${password} | sh -c "$(curl -fsSL https://raw.githubusercontent.com/robbyrussell/oh-my-zsh/master/tools/install.sh)"
    ln -sfn `pwd`/.zshrc ~/.zshrc
fi
