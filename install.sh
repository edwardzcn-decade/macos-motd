#!/bin/bash

set -e

SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
MOTD_SCRIPT="${SCRIPT_DIR}/10-macos-sysinfo"
CONFIG_FILE="${HOME}/.macos-motd.conf"
SHELL_RC="${HOME}/.zshrc"
START_MARKER="# >>> macos-motd >>>"
END_MARKER="# <<< macos-motd <<<"

printf "\033[1;36m"
printf "macos-motd setup\n"
printf "================\n"
printf "\033[0m"

if [[ "$(uname)" != "Darwin" ]]; then
	printf "\033[1;33mwarning:\033[0m this installer is designed for macOS.\n"
fi

if [[ ! -f "$MOTD_SCRIPT" ]]; then
	printf "\033[1;31merror:\033[0m cannot find %s\n" "$MOTD_SCRIPT"
	exit 1
fi

chmod +x "$MOTD_SCRIPT"

printf "ASCII banner text [macOS]: "
read -r banner_text
if [[ -z "$banner_text" ]]; then
	banner_text="macOS"
fi

cat > "$CONFIG_FILE" <<EOF
# macos-motd local config
# Change this value to customize the ASCII banner.
EOF
printf "ASCII_ART_NAME=%q\n" "$banner_text" >> "$CONFIG_FILE"

touch "$SHELL_RC"

if grep -Fq "$START_MARKER" "$SHELL_RC"; then
	printf "\033[0;32mconfigured:\033[0m startup block already exists in %s\n" "$SHELL_RC"
else
	cat >> "$SHELL_RC" <<EOF

$START_MARKER
"$MOTD_SCRIPT"
$END_MARKER
EOF
	printf "\033[0;32madded:\033[0m startup block to %s\n" "$SHELL_RC"
fi

if command -v toilet >/dev/null 2>&1; then
	printf "\033[0;32mok:\033[0m toilet found for styled ASCII output.\n"
else
	printf "\033[1;33moptional:\033[0m install toilet for styled ASCII output: brew install toilet figlet\n"
fi

printf "\033[1;36mdone:\033[0m open a new terminal to see your MOTD.\n"
