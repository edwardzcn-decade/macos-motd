# MacOS Message of the Day

Basic message of the day (MOTD) cli script for MacOS users.

## Usage

### Quick setup

Run the autoconfig script from this repository:

```bash
./install.sh
```

The installer asks for the ASCII banner text. Press enter to use `macOS`, or type a custom value (e.g. your pc name).

It writes the banner value to `~/.macos-motd.conf` and adds a marked startup block to `~/.zshrc`. Running it more than once will **not** duplicate the startup block.

### Install Homebrew

Homebrew is required to install the necessary ascii arts tools. If you don’t have Homebrew installed, follow the [installation steps](https://brew.sh/) below:

1. Open your terminal.
2. Run the following command to install Homebrew with `curl`.

  ```bash
  /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
  ```

3. After the installation is complete, ensure Homebrew is working by checking its version:

  ```bash
  brew --version
  ```

### Install the ASCII tools

If you don't like the ASCII arts to show in your terminal, you can skip this step.

Figlet provides a variety of fonts style for ASCII arts. Toilet is another tool that can customize the ASCII arts with different colors and styles.

```bash
brew install figlet
```

```bash
brew install toilet
```

If `toilet` is not installed, the script falls back to a simple colored text banner.

### Configure services

Service checks are configured in `10-macos-sysinfo` with two aligned Bash arrays: `services` and `serviceNames`.

To enable or disable a service, comment or uncomment the matching line in both arrays:

```bash
# "notion.id"
# "Notion"
```

## Display

```bash
 __  __             ___  ____
|  \/  | __ _  ___ / _ \/ ___|
| |\/| |/ _` |/ __| | | \___ \
| |  | | (_| | (__| |_| |___) |
|_|  |_|\__,_|\___|\___/|____/

Welcome, edwardzcn-decade. It's currently Mon Dec  9 16:13:18 CST 2024
IP:            192.168.1.200
Usage of /:    8% of 228G
Services running:
  Chrome: ● active ChatGPT: ● active Teams: ▲ inactive
  Surge: ● active Docker: ▲ inactive
```

### Features

- [x] Show basic system information (macOS/Linux)
- [x] Add autoconfig startup script
- [x] Add naive configuration for checking services
- [x] Add configurable ASCII banner text

### LICENSE

MIT
