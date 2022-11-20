# Install oh-my-zsh before using this file
export ZSH="$HOME/.oh-my-zsh"

ZSH_THEME="apple"

# Uncomment one of the following lines to change the auto-update behavior
# zstyle ':omz:update' mode disabled  # disable automatic updates
# zstyle ':omz:update' mode auto      # update automatically without asking
zstyle ':omz:update' mode reminder  # just remind me to update when it's time

# Uncomment the following line to change how often to auto-update (in days).
 zstyle ':omz:update' frequency 30

# Uncomment the following line if pasting URLs and other text is messed up.
# DISABLE_MAGIC_FUNCTIONS="true"

# Uncomment the following line to disable colors in ls.
# DISABLE_LS_COLORS="true"

# Uncomment the following line to disable auto-setting terminal title.
DISABLE_AUTO_TITLE="true"

# Uncomment the following line if you want to disable marking untracked files
# under VCS as dirty. This makes repository status check for large repositories
# much, much faster.
DISABLE_UNTRACKED_FILES_DIRTY="true"

# Which plugins would you like to load?
# Standard plugins can be found in $ZSH/plugins/
# Custom plugins may be added to $ZSH_CUSTOM/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
# Add wisely, as too many plugins slow down shell startup.
# plugins=()

source $ZSH/oh-my-zsh.sh

# You may need to manually set your language environment
export LANG=en_US.UTF-8

# Preferred editor for local and remote sessions
if [[ -n $SSH_CONNECTION ]]; then
  export EDITOR='vim'
else
  export EDITOR='nvim'
fi

# Compilation flags
# export ARCHFLAGS="-arch x86_64"

# Personal aliases
alias python='python3'
alias pip='pip3'

# listing aliases
alias la='ls -a'
alias ll='ls -lh'
alias lal='ls -alh'

# git aliases
alias g='git'
alias gc='git clone'
alias gcm='git commit -m'
alias ga='git add'
alias gs='git status'


# Paths
# flutter install
export PATH="$PATH:/Users/udeshya/flutter/bin"
export PATH="$PATH:/Users/udeshya/Library/Android/sdk"
# openjdk install
#export PATH="/opt/homebrew/opt/openjdk/bin:$PATH"
#export PATH="/opt/homebrew/opt/sqlite/bin:$PATH"
export PATH="/Users/udeshya/.nepdate/bin:$PATH"

# Nodejs16 installation
export PATH="/opt/homebrew/opt/node@16/bin:$PATH"
export LDFLAGS="-L/opt/homebrew/opt/node@16/lib"
export CPPFLAGS="-I/opt/homebrew/opt/node@16/include"
