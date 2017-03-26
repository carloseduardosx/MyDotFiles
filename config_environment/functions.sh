function info() {
  printf "\n${CYAN}%s${END}\n" "$*"
}

function success() {
  printf "\n${GREEN}%s${END}\n" "$*"
}

function install() {
    info "Installing ${1}"
    $1
    success "${1} installed"
}

function installer() {
    program="$1"
    install="$2"
    override="$3"

    if test -n "$override"; then
        install "${install}"
        return
    fi

    if command -v $program >/dev/null 2>&1; then
        info "${program} already installed"
    else
        install "${install}"
    fi
}
