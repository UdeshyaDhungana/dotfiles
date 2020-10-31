# If you come from bash you might have to change your $PATH
export PATH=$HOME/bin:/usr/local/bin:$PATH

# Path to your oh-my-zsh installation.
export ZSH="/home/udeshya/.oh-my-zsh"

#THEME
ZSH_THEME="af-magic"

# Uncomment the following line to change how often to auto-update (in days).
export UPDATE_ZSH_DAYS=7

# Uncomment the following line to disable auto-setting terminal title.
DISABLE_AUTO_TITLE="true"

# Add wisely, as too many plugins slow down shell startup.
plugins=(
  zsh-autosuggestions
  colored-man-pages
  git
  colorize
)

source $ZSH/oh-my-zsh.sh

# export MANPATH="/usr/local/man:$MANPATH"

################################ PERSONAL CONFIG #############################
disable r
bindkey -v

#Applications
alias v="nvim"
alias nb="newsboat"
alias iv="feh --auto-zoom --scale-down"
alias nnn="nnn -e"

############# config files ##########

alias cfv="nvim /home/udeshya/.config/nvim/init.vim"
alias sfv="nvim /home/udeshya/.zshrc"

#Above for parent
alias ab="cd .."
alias cls=clear
alias suspend="i3lock --color=555555 --ignore-empty-password  && systemctl suspend"

########### FUNCTIONS
function cdl(){
  cd $1 && ls
}

function music(){
  url=$(url-extractor $*)
  mpv "$url" --ytdl-format=worst --no-video
}

n (){
  if [ -n $NNNLVL ] && [ "${NNNLVL:-0}" -ge 1 ]; then
    echo "nnn is already running"
    return
  fi
  export NNN_TMPFILE="${XDG_CONFIG_HOME:-$HOME/.config}/nnn/.lastd"
  nnn "$@" -de

  if [ -f "$NNN_TMPFILE" ]; then
    . "$NNN_TMPFILE"
    rm -f "$NNN_TMPFILE" > /dev/null
  fi
}
