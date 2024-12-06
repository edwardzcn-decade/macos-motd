# Message of the Day

Basic message of the day (MOTD) cli script for MacOS users.

## Usage

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

If you dont like the ASCII arts to show in your terminal, you can skip this step.

Figlet provides series fonts style for ASCII arts. Toilet is another tool that can customize the ASCII arts with different colors and styles.

```bash
brew install figlet
```

```bash
brew install toilet
```

## Display

```bash
 __  __             ___  ____
|  \/  | __ _  ___ / _ \/ ___|
| |\/| |/ _` |/ __| | | \___ \
| |  | | (_| | (__| |_| |___) |
|_|  |_|\__,_|\___|\___/|____/

Welcome, edwardzcn. It's currently Fri  6 Dec 2024 14:17:56 CST


Services running:
  Chrome: ● active Docker: ● active ChatGPT: ● active
```

### TODO

- [] Add autoconfig startup script
- [] Add configuration for checking services

### LICENSE

MIT