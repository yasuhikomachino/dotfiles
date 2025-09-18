# dotfiles

My personal dotfiles managed with GNU Stow for macOS.

## Prerequisites

- macOS
- [Homebrew](https://brew.sh/)
- [GNU Stow](https://www.gnu.org/software/stow/)

## Installation

### 1. Clone the repository

```bash
git clone https://github.com/yasuhikomachino/dotfiles.git ~/dotfiles
cd ~/dotfiles
```

### 2. Run setup script

This script will install Homebrew packages and other dependencies:

```bash
chmod +x ./osx/scripts/*.sh
./osx/scripts/main.sh setup
```

### 3. Create symlinks

Use GNU Stow to create symlinks for dotfiles:

```bash
stow osx
```

## Stow Commands

### Create symlinks

```bash
# Create symlinks for osx package
stow osx

# Dry run (simulation mode - doesn't modify filesystem)
stow -n osx

# Verbose mode (shows what is being linked)
stow -v osx
```

### Remove symlinks

```bash
# Remove all symlinks for osx package
stow -D osx

# Dry run for removal
stow -n -D osx

# Verbose removal
stow -v -D osx
```

### Restow (remove and recreate symlinks)

```bash
# Useful when you've made changes to the structure
stow -R osx

# Verbose restow
stow -v -R osx
```
