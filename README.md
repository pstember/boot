# Modern Terminal Setup (2026)

A blazing-fast, beautiful terminal configuration optimized for developer productivity.

## ⚡ Performance

- **Startup time:** ~0.6s (down from 3.4s with Oh-My-Zsh!)
- **Instant prompt:** ~50ms perceived startup
- **Optimizations:** Lazy-loading for nvm/rbenv/jenv, cached completions, minimal plugins

## 🎨 Stack

- **Terminal:** [WezTerm](https://wezfurlong.org/wezterm/) - GPU-accelerated terminal
- **Shell:** Zsh (vanilla, no Oh-My-Zsh framework)
- **Prompt:** [Starship](https://starship.rs/) - Fast, customizable prompt
- **Theme:** Gruvbox Dark with Nerd Font icons
- **Font:** MesloLGS Nerd Font Mono

## 📦 Installation

### Prerequisites

Install Homebrew if you haven't already:

```bash
/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
```

### 1. Terminal & Font

```bash
# Install WezTerm
brew install --cask wezterm

# Install Nerd Font for icons
brew tap homebrew/cask-fonts
brew install --cask font-meslo-lg-nerd-font
```

### 2. Starship Prompt

```bash
brew install starship
```

### 3. Modern CLI Tools

```bash
# Essential tools
brew install eza           # Modern 'ls' replacement
brew install bat           # Modern 'cat' with syntax highlighting
brew install fzf           # Fuzzy finder
brew install fd            # Modern 'find' replacement
brew install ripgrep       # Modern 'grep' replacement
brew install zoxide        # Smart 'cd' with frecency
brew install git-delta     # Beautiful git diffs

# Additional productivity tools
brew install prettyping    # Pretty ping output
brew install bpytop        # Resource monitor
brew install tldr          # Simplified man pages

# Zsh plugins
brew install zsh-syntax-highlighting
brew install zsh-autosuggestions
```

### 4. Configuration Files

Clone this repo and copy the configuration files:

```bash
git clone https://github.com/pstember/boot.git
cd boot

# Copy config files
cp .zshrc ~/.zshrc
cp .wezterm.lua ~/.wezterm.lua
mkdir -p ~/.config
cp -r .config/starship.toml ~/.config/

# Reload shell
source ~/.zshrc
```

Or manually download:
- [`.zshrc`](.zshrc) - Shell configuration
- [`.wezterm.lua`](.wezterm.lua) - Terminal configuration
- [`.config/starship.toml`](.config/starship.toml) - Prompt theme

## 🔧 Configuration Details

### Modern CLI Replacements

The setup includes modern alternatives to standard commands:

| Old     | New      | Description                              |
|---------|----------|------------------------------------------|
| `ls`    | `eza`    | Better file listing with icons           |
| `cat`   | `bat`    | Syntax highlighting & line numbers       |
| `grep`  | `rg`     | Blazing fast search                      |
| `find`  | `fd`     | Fast, user-friendly file finder          |
| `cd`    | `zoxide` | Smart directory jumping (frecency-based) |
| `top`   | `bpytop` | Beautiful resource monitor               |
| `ping`  | `prettyping` | Colorful ping with statistics        |
| `diff`  | `delta`  | Beautiful git diffs                      |

### Key Features

**Fuzzy Finding (fzf):**
- `Ctrl+R` - Search command history
- `Ctrl+T` - Search files with preview
- `Alt+C` - Navigate directories with preview

**Smart Navigation:**
- `cd <partial-path>` - Jump to frequently used directories (zoxide)
- `.3`, `.4`, `.5` - Quick parent directory navigation

**Lazy Loading:**
- nvm, rbenv, and jenv load on-demand (~800ms faster startup)

**Useful Aliases:**
- `ll` - Detailed file listing
- `la` - Long listing with git status
- `lt` - Tree view (2 levels)
- `gst` - Git status
- `src` - Reload shell config

### Custom Functions

```bash
mcd <dir>        # Create directory and cd into it
extract <file>   # Extract any archive type
trash <file>     # Move to macOS trash instead of rm
copypath         # Copy current path to clipboard
copyfile <file>  # Copy file contents to clipboard
```

## 🎯 Performance Optimizations

### Lazy Loading

Heavy tools load only when needed:
- **nvm** - Loads on first `nvm`, `node`, `npm`, or `npx` call
- **rbenv** - Loads on first `rbenv` call
- **jenv** - Loads on first `jenv` call
- **thefuck** - Run `enable-thefuck` to activate

### Completion Caching

Zsh completion cache refreshes only once per day, saving ~200ms on startup.

### Minimal Plugins

No Oh-My-Zsh framework overhead. Only essential plugins:
- zsh-syntax-highlighting (command validation)
- zsh-autosuggestions (history-based suggestions)

## 📁 Repository Structure

```
.
├── .zshrc                    # Shell configuration
├── .wezterm.lua              # Terminal emulator config
├── .config/
│   └── starship.toml         # Prompt theme (Gruvbox)
└── README.md                 # This file
```

## 🎨 Customization

### Change Prompt Theme

Edit `~/.config/starship.toml` or browse [Starship presets](https://starship.rs/presets/).

### Change Terminal Colors

Edit `.wezterm.lua` to change theme or adjust font size.

### Add More Aliases

Add custom aliases to the "MAKE TERMINAL BETTER" section in `.zshrc`.

