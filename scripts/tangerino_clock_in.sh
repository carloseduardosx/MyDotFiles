#!/usr/bin/env bash

RED='\033[00;31m'
GREEN='\033[00;32m'
CYAN='\033[00;36m'
WHITE='\033[01;37m'

END=$'\e[0m'

function log() {
  printf "\n${WHITE}%s${END}\n" "$*"
}

function info() {
  printf "\n${CYAN}%s${END}\n" "$*"
}

current_date=$(date '+%d/%m/%Y %H:%M:%S')
employer_id="${EMPLOYER_ID}"
employee_pin="${EMPLOYEE_PIN}"

if ! test -n "${employer_pin}"; then
  info "What's your PIN?"
  read employee_pin
fi

if ! test -n "${employer_id}"; then
  info "What's the employer code?"
  read employer_id
fi

if test -n "${employer_id}" && test -n "${employee_pin}"; then
  employee_id=$(wget -qO- https://app.tangerino.com.br/Tangerino/ws/fingerprintWS/funcionario/empregador/${employer_id}/pin/${employee_pin} | python -m json.tool | sed '15!d' | grep -Eo "[0-9]{1,}")

  curl -X POST https://app.tangerino.com.br/Tangerino/ws/pontoWS/ponto/sincronizacaoPontos/1.2 \
    -H "Content-Type: application/json" \
    -H "EMPREGADOR: ${employer_id}" \
    -H "pin: ${employee_pin}" \
    -H "funcionarioid: ${employee_id}" \
    -H "USERNAME: ${employee_id}" \
    --basic \
    --user "${employer_id}:${employee_id}" \
    -d @- << EOF
{
    "horaInicio": "${current_date}",
    "deviceId": 9,
    "online": "true",
    "codigoEmpregador": "${employer_id}",
    "pin": ${employee_pin},
    "horaFim": "",
    "tipo": "WEB",
    "foto": "",
    "intervalo": "",
    "versao": "registra-ponto-finguerprint",
    "plataforma": "WEB",
    "funcionarioid": ${employee_id},
    "idAtividade": 6
  }
EOF
else
  error "Employer ID or Employee PIN not set!"
fi
