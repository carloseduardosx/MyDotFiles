export ZSH="${HOME}/.oh-my-zsh"
export MAVEN_OPTS="-Xmx1024m -XX:MaxPermSize=512m"

ZSH_THEME="robbyrussell"

plugins=(
  git
  zsh-autosuggestions
  zsh-syntax-highlighting
  colored-man-pages
)
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

function gmdevenv { cd ${HOME}/Projects/greenmile/gm-dev-env/core; ./run.sh $*; cd - >/dev/null; }


autoload -U +X bashcompinit && bashcompinit
complete -o nospace -C /usr/local/bin/terraform terraform

# pnpm
export PNPM_HOME="${HOME}/Library/pnpm"
case ":$PATH:" in
  *":$PNPM_HOME:"*) ;;
  *) export PATH="$PNPM_HOME:$PATH" ;;
esac
export PATH="/opt/homebrew/opt/libpq/bin:$PATH"

# Kubernetes
export KUBE_EDITOR="nvim"

# SonarQube
export PATH="$HOME/Documents/abbvie/code-coverage/sonarqube/sonar-scanner/sonar-scanner-5.0.1.3006-macosx/bin:$PATH"

[ -s "${HOME}/.scm_breeze/scm_breeze.sh" ] && source "${HOME}/.scm_breeze/scm_breeze.sh"

# NVM
export NVM_DIR="$([ -z "${XDG_CONFIG_HOME-}" ] && printf %s "${HOME}/.nvm" || printf %s "${XDG_CONFIG_HOME}/nvm")"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh" # This loads nvm

if command -v pyenv 1>/dev/null 2>&1; then
  eval "$(pyenv init -)"
fi

export LC_ALL=en_US.UTF-8
export LC_CTYPE=en_US.UTF-8

# GPG agent setup interfacing with the terminal (TTY)
export GPG_TTY=$(tty)

# Editor (sops uses this)
export EDITOR="nvim"

# Load .env secrets
if [ -f "${HOME}/projects/MyDotFiles/.env" ]; then
  . "${HOME}/projects/MyDotFiles/.env"
fi
