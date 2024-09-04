# How to get a fancy looking terminal

Let's go from this

![Screenshot 2021-11-01 at 16.36.10.png](How%20to%20get%20a%20fancy%20looking%20terminal%2088fe24af928246a39b2024580f1e5c11/Screenshot_2021-11-01_at_16.36.10.png)

To this

![Screenshot 2021-11-01 at 18.38.36.png](How%20to%20get%20a%20fancy%20looking%20terminal%2088fe24af928246a39b2024580f1e5c11/Screenshot_2021-11-01_at_18.38.36.png)

# Prerequisites

- Have Homebrew installed. This can be done with the following command (to copy-paste in the terminal)

```bash
/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
```

- ITerm2

```bash
brew install --cask iterm2
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
