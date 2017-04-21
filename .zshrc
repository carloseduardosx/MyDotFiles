export ZSH="/Users/carloseduardosx/.oh-my-zsh"
export MAVEN_OPTS="-Xmx1024m -XX:MaxPermSize=512m"

ZSH_THEME="robbyrussell"

plugins=(git zsh-completions)
autoload -U compinit && compinit

# Path
. $HOME/Projects/MyDotFiles/.path

# ZSH
. $ZSH/oh-my-zsh.sh

# Z
. $Z/z.sh

# Alias
. $HOME/Projects/MyDotFiles/.aliases
. $HOME/Projects/MyDotFiles/.goaliases

# Functions
. $HOME/Projects/MyDotFiles/functions/source.bash

# Logger
. $HOME/Projects/MyDotFiles/.logger

# Colors
. $HOME/Projects/MyDotFiles/.color-constants

# Add RVM to PATH for scripting. Make sure this is the last PATH variable change.
export PATH="$PATH:$HOME/.rvm/bin"

test -e "${HOME}/.iterm2_shell_integration.zsh" && source "${HOME}/.iterm2_shell_integration.zsh"
