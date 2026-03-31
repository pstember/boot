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

---

## 📚 Legacy Setup (2021-2025)

<details>
<summary>Click to expand old Oh-My-Zsh + oh-my-posh setup (archived)</summary>

The instructions below document the original Oh-My-Zsh + oh-my-posh setup from 2021-2025. This setup has been replaced by the faster Starship-based configuration above.

### Prerequisites (Legacy)

- Have Homebrew installed. This can be done with the following command (to copy-paste in the terminal)

```bash
/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
```

- WezTerm

```bash
brew install --cask wezterm
```

From this point, all commands should be run in iTerm2 (no specific reason besides building muscle memory)

# ZSH, Oh My Zsh and Oh my Posh

Since 2019, macOS is shipping with ZSH as a default shell, so we will be building on this. To help us tweak things easily, we will use ***Oh My Zsh***

> Oh My Zsh is an open source, community-driven framework for managing your Zsh configuration.
Sounds boring. Let's try again.
Oh My Zsh will not make you a 10x developer...but you may feel like one!
Source - [https://ohmyz.sh/](https://ohmyz.sh/)
> 

To install it, simply run the following in the terminal

```bash
sh -c "$(curl -fsSL https://raw.github.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"
```

![Screenshot 2021-11-01 at 16.54.39.png](How%20to%20get%20a%20fancy%20looking%20terminal%2088fe24af928246a39b2024580f1e5c11/Screenshot_2021-11-01_at_16.54.39.png)

Things already look sexier, but we are just getting started, as mentioned by the terminal, let's go into the `.zshrc` file to see what we have. You can open it any way you want, I am using Sublime Text 3 and therefore I can do `subl .zshrc` to edit it in Sublime Text directly

We basically have 4 main elements (oh my zsh config, the theme, plugins to load, and our actual configuration)

```bash
# Path to your oh-my-zsh installation.
export ZSH="/Users/pstember/.oh-my-zsh"

# There to load
ZSH_THEME="robbyrussell"

# Which plugins would you like to load?
# Standard plugins can be found in $ZSH/plugins/
# Custom plugins may be added to $ZSH_CUSTOM/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
# Add wisely, as too many plugins slow down shell startup.
plugins=(git)

source $ZSH/oh-my-zsh.sh
```

Before doing any kind of customization, let's add a theme that will get us 80% there 🎉

Our theme of choice will be Oh-My-Posh - [https://ohmyposh.dev/](https://ohmyposh.dev/)

Our theme will only affect the red selection in the following screenshot

![Untitled](How%20to%20get%20a%20fancy%20looking%20terminal%2088fe24af928246a39b2024580f1e5c11/Untitled.png)

To install it, run the following command

```bash
brew install jandedobbeleer/oh-my-posh/oh-my-posh
```

And replace the line with `ZSH_THEME=robbyrussell` with the following from your `.zshrc` file 

```bash
eval "$(oh-my-posh init zsh --config ~/.config/ohmyposh/theme.toml)"
``` 

DO NOT FORGET to create the folder and copy the theme over, if you rather use the default one, remove `--config` and its value. Then reload the config with

```bash
reset
```

Now the theme should kick in and you are good to go 🎉🎉🎉

# Plugins

To enhance our experience, we will need some plugins, my suggestion is to go with to have the right level of auto-complete when pressing `tab`

To get this, go back to `.zshrc`

```bash
# Which plugins would you like to load?
# Standard plugins can be found in $ZSH/plugins/
# Custom plugins may be added to $ZSH_CUSTOM/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
# Add wisely, as too many plugins slow down shell startup.
plugins=(
  git
  kubectl
  docker
  docker-compose
  httpie
)
```

On top of the build-in, we will also use the following ones

- zsh-syntax-highlighting - This turns your entry from red to green when the command exists
- zsh-autosuggestions - This will suggest a command based on your input and history

To install, run the following

```bash
brew install zsh-syntax-highlighting
brew install zsh-autosuggestions
```

Then add the two next lines in your `.zshrc` right below the plugins section

```bash
source $ZSH/oh-my-zsh.sh # ALREADY EXIST IN THE FILE, add below
source /opt/homebrew/share/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh
source /opt/homebrew/share/zsh-autosuggestions/zsh-autosuggestions.zsh
```

# Custom commands and aliases

To overwrite some of the default command, we need to install the following

```bash
brew install exa

brew tap cantino/mcfly
brew install mcfly

brew install bat
brew install prettyping
```

and add the following in your `.zshrc` file

```bash
if [ -x "$(command -v exa)" ]; then
    alias ls="exa --icons"
    alias la="exa --long --all --group --icons"
    alias lt="exa --tree --level=2 --icons"
fi

eval "$(mcfly init zsh)"

alias cat='bat'
alias ping='prettyping --nolegend'
```

And don't forget to create your own aliases like these ones

```bash
alias cp='cp -iv'                           # Preferred 'cp' implementation
alias mv='mv -iv'                           # Preferred 'mv' implementation
alias mkdir='mkdir -pv'                     # Preferred 'mkdir' implementation
alias less='less -FSRXc'                    # Preferred 'less' implementation
# cd() { builtin cd "$@"; ll; }               # Always list directory contents upon 'cd'
alias cd..='cd ../'                         # Go back 1 directory level (for fast typers)
# alias ..='cd ../'                           # Go back 1 directory level
# alias ...='cd ../../'                       # Go back 2 directory levels
alias .3='cd ../../../'                     # Go back 3 directory levels
alias .4='cd ../../../../'                  # Go back 4 directory levels
alias .5='cd ../../../../../'               # Go back 5 directory levels
alias .6='cd ../../../../../../'            # Go back 6 directory levels
alias edit='subl'                           # edit:         Opens any file in sublime editor
alias f='open -a Finder ./'                 # f:            Opens current directory in MacOS Finder
alias c='clear'                             # c:            Clear terminal display
alias path='echo -e ${PATH//:/\\n}'         # path:         Echo all executable Paths
alias cic='set completion-ignore-case On'   # cic:          Make tab-completion case-insensitive
mcd () { mkdir -p "$1" && cd "$1"; }        # mcd:          Makes new Dir and jumps inside
trash () { command mv "$@" ~/.Trash ; }     # trash:        Moves a file to the MacOS trash

#   extract:  Extract most know archives with one command
#   ---------------------------------------------------------
    extract () {
        if [ -f $1 ] ; then
          case $1 in
            *.tar.bz2)   tar xjf $1     ;;
            *.tar.gz)    tar xzf $1     ;;
            *.bz2)       bunzip2 $1     ;;
            *.rar)       unrar e $1     ;;
            *.gz)        gunzip $1      ;;
            *.tar)       tar xf $1      ;;
            *.tbz2)      tar xjf $1     ;;
            *.tgz)       tar xzf $1     ;;
            *.zip)       unzip $1       ;;
            *.Z)         uncompress $1  ;;
            *.7z)        7z x $1        ;;
            *)     echo "'$1' cannot be extracted via extract()" ;;
             esac
         else
             echo "'$1' is not a valid file"
         fi
    }
```

From here, you should be good to go

Don't forget to update the file as your install more things into your environment like

- java
- go
- ruby
- etc.

My actual config file is available here - [https://github.com/pstember/boot/blob/master/.zshrc](https://github.com/pstember/boot/blob/master/.zshrc)

</details>
