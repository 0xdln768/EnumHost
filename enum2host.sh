#!/usr/bin/env bash
# @0xdln768

# Validation Dependencie
for tool in ping date; do
  if ! which $tool &>/dev/null; then
    echo -e "\n[!] Faltan Estas Dependencias: $tool\n"
    exit 1
  fi
done

# Validation Argument
if [[ $# -ne 2 ]]; then
  echo -e "\n[!] Uso: $0 <IP ITERABLE> <MASK-SUBNETTING>\n"
  echo -e "\t[*] Example: $0 192.168.0 24"
  exit 1
fi

# Function Ctrl_C
ctrl_c(){
  echo -e "\n[!] Saliendo...\n"
  tput cnorm
  exit 1
}

# Flujo Ctrl_C
trap ctrl_c INT

# Variables Groblaes
target=${1}
mask="${2}"
MaskFork=$(echo $((2**(32-"$mask"))))
output="Host.txt"

# Validation File Output
if [[ -f "$output" ]]; then
  rm -rf "$output"
fi

# Validation Character
if ! [[ "$target" =~ ^([0-9]{1,3}\.){2}[0-9]{1,3}$ ]]; then
  echo -e "\n[!] Error: El formato de IP ITERABLE no es válido. Debe ser como: 192.168.0\n"
  exit 1
fi

# Ping Masive
tput civis
for ips in $(seq 1 "$MaskFork"); do
  ping -c1 -W1 "${target}.${ips}" &>/dev/null && echo "${target}.${ips}" >> "$output" &
done; wait

# Validaction IPS INACTIVE
if [[ ! -f "$output" ]]; then
  clear
  echo -e "\n[*] La ip no es correcta o no hay ip activas\n"
  tput cnorm
  exit 1
fi

# Informacion Descrictiva
clear
echo -e "\n==========================================="
echo "      INFORMACION $(date '+%H:%M:%S %d/%m/%Y')"
echo -e "===========================================" && sleep 0.60
echo -e "\n@0xdln768\n"

echo -e "\n[*] IP Total -> $(wc -l "$output" 2>/dev/null)\n"
cat "$output" 2>/dev/null 
tput cnorm
