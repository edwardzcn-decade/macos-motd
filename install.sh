#!/bin/bash

set -e

SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
MOTD_RUNNER="${SCRIPT_DIR}/run-motd"
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

if [[ ! -f "$MOTD_RUNNER" ]]; then
	printf "\033[1;31merror:\033[0m cannot find %s\n" "$MOTD_RUNNER"
	exit 1
fi

chmod +x "$MOTD_RUNNER" "$SCRIPT_DIR"/[0-9][0-9]-*

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

if grep -Fxq 'sh $HOME/macos-motd/*' "$SHELL_RC"; then
	sed -i '' 's|^sh \$HOME/macos-motd/\*$|# sh $HOME/macos-motd/* # disabled by macos-motd installer|g' "$SHELL_RC"
	printf "\033[0;32mupdated:\033[0m disabled legacy wildcard startup line in %s\n" "$SHELL_RC"
fi

if grep -Fq "$START_MARKER" "$SHELL_RC"; then
	printf "\033[0;32mconfigured:\033[0m startup block already exists in %s\n" "$SHELL_RC"
else
	cat >> "$SHELL_RC" <<EOF

$START_MARKER
"$MOTD_RUNNER"
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
