#!/bin/bash

# Color variables

RED='\033[00;31m'
GREEN='\033[00;32m'
YELLOW='\033[00;33m'
CYAN='\033[00;36m'
WHITE='\033[01;37m'

END=$'\e[0m'

# Functions

log() {
  printf "\n${WHITE}%s${END}\n" "$*"
}

error() {
  printf "\n${RED}%s${END}\n" "$*"
}

warning() {
  printf "\n${YELLOW}%s${END}\n" "$*"
}

info() {
  printf "\n${CYAN}%s${END}\n" "$*"
}

success() {
  printf "\n${GREEN}%s${END}\n" "$*"
}
