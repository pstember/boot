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

# ZSH, Oh My Zsh and PowerLevel10k

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

Our theme of choice will be PowerLevel10k - [https://github.com/romkatv/powerlevel10k](https://github.com/romkatv/powerlevel10k)

Our theme will only affect the red selection in the following screenshot

![Untitled](How%20to%20get%20a%20fancy%20looking%20terminal%2088fe24af928246a39b2024580f1e5c11/Untitled.png)

To install it, run the following command

```bash
git clone --depth=1 https://github.com/romkatv/powerlevel10k.git ${ZSH_CUSTOM:-$HOME/.oh-my-zsh/custom}/themes/powerlevel10k
```

And replace the `ZSH_THEME` value from `robbyrussell` to `powerlevel10k/powerlevel10k` 

from your `.zshrc` file

Then reload the config with

```bash
omz reloa
```

Now the powerlevel10k configuration assistant should kick in.

<aside>
⚠️ Yours might look different and if asked to install a font, select yes !
You want to have the `mensloLGS NF` font installed for this to look the best

</aside>

![Screenshot 2021-11-01 at 17.21.28.png](How%20to%20get%20a%20fancy%20looking%20terminal%2088fe24af928246a39b2024580f1e5c11/Screenshot_2021-11-01_at_17.21.28.png)

Now go through the configuration assistant and make it look the way you want.

Done? Great, let's go and customize a bit further. Open the file `.p10k.zsh` and have a look around line 32. Here you can choose what you want the terminal to display on the right and left hand side.

Here is what I selected for mine - More info about prompt [https://github.com/romkatv/powerlevel10k#batteries-included](https://github.com/romkatv/powerlevel10k#batteries-included)

```bash
# The list of segments shown on the left. Fill it with the most important segments.
  typeset -g POWERLEVEL9K_LEFT_PROMPT_ELEMENTS=(
    # =========================[ Line #1 ]=========================
  # os_icon                 # os identifier
    context
    ssh
    root_indicator
    dir                     # current directory
    dir_writable
    vcs                     # git status
    # =========================[ Line #2 ]=========================
    newline                 # \n
    prompt_char             # prompt symbol
  )

  typeset -g POWERLEVEL9K_RIGHT_PROMPT_ELEMENTS=(
    # =========================[ Line #1 ]=========================
    status                  # exit code of the last command
    command_execution_time  # duration of the last command
    root_indicator
    background_jobs         # presence of background jobs
    node_version          # node.js version
    go_version            # go version (https://golang.org)
    dotnet_version        # .NET version (https://dotnet.microsoft.com)
    php_version           # php version (https://www.php.net/)
    java_version          # java version (https://www.java.com/)
    rbenv                   # ruby version from rbenv (https://github.com/rbenv/rbenv)
    kubecontext             # current kubernetes context (https://kubernetes.io/)
    terraform               # terraform workspace (https://www.terraform.io)
    aws                     # aws profile (https://docs.aws.amazon.com/cli/latest/userguide/cli-configure-profiles.html)
    aws_eb_env              # aws elastic beanstalk environment (https://aws.amazon.com/elasticbeanstalk/)
    azure                   # azure account name (https://docs.microsoft.com/en-us/cli/azure)
    gcloud                  # google cloud cli account and project (https://cloud.google.com/)
    google_app_cred         # google application credentials (https://cloud.google.com/docs/authentication/production)
    vim_shell               # vim shell indicator (:sh)
    timewarrior             # timewarrior tracking status (https://timewarrior.net/)
    taskwarrior             # taskwarrior task count (https://taskwarrior.org/)
    # =========================[ Line #2 ]=========================
    newline
  )
```

For Snyk Showcase, I would recommend you also set the following two variables

- POWERLEVEL9K_STATUS_OK
- POWERLEVEL9K_STATUS_ERROR

to `true` to display the result of the last command when running a test. 

Your terminal should now have the look that you want, for reference, mine looks like this

![Screenshot 2021-11-01 at 17.53.39.png](How%20to%20get%20a%20fancy%20looking%20terminal%2088fe24af928246a39b2024580f1e5c11/Screenshot_2021-11-01_at_17.53.39.png)

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
source /usr/local/share/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh
source /usr/local/share/zsh-autosuggestions/zsh-autosuggestions.zsh
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