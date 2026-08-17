# Modern Terminal Setup (2026)

A blazing-fast, beautiful terminal configuration optimized for developer productivity — managed with [chezmoi](https://chezmoi.io/) for one-command rampup on a new machine. See [New Machine Setup](#-new-machine-setup-fastest-rampup) below.

## ⚡ Performance

- **Startup time:** ~0.6s (down from 3.4s with Oh-My-Zsh!)
- **Instant prompt:** ~50ms perceived startup
- **Optimizations:** Lazy-loading for nvm/rbenv/jenv, cached completions, minimal plugins

## 🎨 Stack

- **Terminal:** [Ghostty](https://ghostty.org/) - Fast, native terminal
- **Multiplexer:** [cmux](https://github.com/manaflow-ai/cmux) - Terminal/agent workspace manager
- **Shell:** Zsh (vanilla, no Oh-My-Zsh framework)
- **Prompt:** [Starship](https://starship.rs/) - Fast, customizable prompt
- **Theme:** Gruvbox Dark with Nerd Font icons
- **Font:** MesloLGS Nerd Font Mono
- **Dotfile manager:** [chezmoi](https://chezmoi.io/) - this repo IS the chezmoi source directory

## 🚀 New Machine Setup (fastest rampup)

This repo doubles as the **chezmoi source directory** — it's not copy-pasted, it's applied.

### 1. Homebrew + chezmoi

```bash
/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
brew install chezmoi
```

### 2. Pull down and apply every managed dotfile in one shot

```bash
chezmoi init --apply pstember/boot
```

This clones the repo to `~/.local/share/chezmoi` and writes:
- `~/.zshrc`
- `~/.config/ghostty/config`
- `~/.config/starship.toml`
- `~/.config/cmux/cmux.json` (written `600`)

`README.md`, `Brewfile`, and the screenshots folder are reference-only (`.chezmoiignore`) — they never get written into `$HOME`.

### 3. Install every tool this setup depends on

```bash
brew bundle --file ~/.local/share/chezmoi/Brewfile
```

This is a curated list (top-level installs only — dependencies resolve automatically), so it won't clutter the new machine with the ~90 transitive packages `brew bundle dump` would otherwise include.

### 4. Recreate local-only secrets

`.zshrc` sources `~/.zsh_secrets` if present, which is **never** committed (this repo is public). These are workplace/context-specific tokens that don't belong in a generic public dotfiles repo and won't come to a new machine by default — recreate only what that machine actually needs:

```bash
umask 077
touch ~/.zsh_secrets
chmod 600 ~/.zsh_secrets
# then add whatever export lines this machine needs
```

### 5. Reload

```bash
source ~/.zshrc
```

That's it — five commands, no manual file copying, no guessing which dotfile goes where.

## 🔁 Keeping in sync afterward

Source of truth lives at `~/.local/share/chezmoi` (this repo, cloned). Day to day:

```bash
# after editing a live config file (e.g. ~/.zshrc):
chezmoi add ~/.zshrc
cd ~/.local/share/chezmoi && git commit -am "update zshrc" && git push

# to pull changes made from another machine:
chezmoi update        # git pull + apply in one step

# to refresh the Brewfile after installing something new:
cd ~/.local/share/chezmoi && brew bundle dump --file=Brewfile --force
# then hand-filter: `brew leaves` is the top-level formula list; drop anything
# that's just a dependency before committing, to keep the file lean.
```

**Never** run `chezmoi add ~/.zshrc` blindly without checking for secrets first — this repo is public. Run a secrets scanner (gitleaks, trufflehog, or equivalent) over the diff before committing.

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

### Initialization Order

**IMPORTANT:** The `.zshrc` file follows a specific initialization order to prevent conflicts:

1. All environment variables, paths, and aliases load first
2. **zoxide** initializes near the end (before Starship)
3. **Starship prompt** initializes last (must be final)

This order is critical for zoxide to function correctly. If you modify `.zshrc` and see a zoxide configuration warning, ensure `eval "$(zoxide init zsh --cmd cd)"` appears just before the Starship initialization at the end of the file.

## 📁 Repository Structure

Chezmoi's naming convention: `dot_` → `.`, `private_` → mode `600`.

```
.
├── dot_zshrc                       # → ~/.zshrc
├── dot_config/
│   ├── ghostty/
│   │   └── config                  # → ~/.config/ghostty/config
│   ├── starship.toml               # → ~/.config/starship.toml (Gruvbox theme)
│   └── cmux/
│       └── private_cmux.json       # → ~/.config/cmux/cmux.json (mode 600)
├── Brewfile                        # curated top-level brew formulae/casks — repo-only, ignored on apply
├── .chezmoiignore                  # keeps README/Brewfile/screenshots out of $HOME
└── README.md                       # this file
```

Not chezmoi-managed (legacy, pre-dating this setup, harmless dead weight since chezmoi ignores dot-prefixed source entries): `.bash_profile`, `.wezterm.lua`, `.gitconfig` (placeholder, never the real one), `.config/ghostty`, `.config/starship.toml`, `.zshrc` at repo root. Safe to delete manually if you want a tidier tree.

## 🎨 Customization

### Change Prompt Theme

Edit `~/.config/starship.toml` or browse [Starship presets](https://starship.rs/presets/).

### Change Terminal Colors

Edit `~/.config/ghostty/config` to change theme or adjust font size.

### Add More Aliases

Add custom aliases to the "MAKE TERMINAL BETTER" section in `.zshrc`.

