export ZSH=/Users/carloseduardo/.oh-my-zsh

ZSH_THEME="robbyrussell"

plugins=(git)

# Path
. $HOME/MyDotFiles/.path

# ZSH
. $ZSH/oh-my-zsh.sh

# Z
. $Z/z.sh

# Alias
. $HOME/MyDotFiles/.aliases
. $HOME/MyDotFiles/.goaliases

# Functions
. $HOME/MyDotFiles/functions/source.bash

# Logger
. $HOME/MyDotFiles/.logger

# Colors
. $HOME/MyDotFiles/.color-constants
