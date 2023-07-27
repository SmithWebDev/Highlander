export PATH=$HOME/bin:/usr/local/bin:$PATH
export ZSH="$HOME/.oh-my-zsh"
export BREW_HOME="/home/linuxbrew/.linuxbrew/bin"
export PATH="/opt/homebrew/opt/postgresql@15/bin:$PATH"
export LDFLAGS='-L/opt/homebrew/opt/postgresql@15/lib'
export CPPFLAGS='-I/opt/homebrew/opt/postgresql@15/include'
export EDITOR='nvim'

ZSH_THEME="robbyrussell"

zstyle ':omz:update' mode auto      # update automatically without asking
ENABLE_CORRECTION="true"

# Would you like to use another custom folder than $ZSH/custom?
# ZSH_CUSTOM=/path/to/new-custom-folder

# Which plugins would you like to load?
# Standard plugins can be found in $ZSH/plugins/
# Custom plugins may be added to $ZSH_CUSTOM/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
# Add wisely, as too many plugins slow down shell startup.
BUNDLED_COMMANDS=(rubocop)

plugins=(
  asdf
  bundler
  colored-man-pages
  colorize
  dash
  elixir
  git
  zsh-autosuggestions
  zsh-vi-mode
)

##############################
#          ALIAS             #
##############################

# Brew Commands/ Serives
# ----------------------------

#---- PostgreSQL Services
alias pgstart='brew services start postgresql'
alias pgstop='brew services stop postgresql'

#---- Redis Services
alias redisstart='brew services start redis'
alias redisstop='brew services stop redis'

#---- PostgreSQL & Redis
alias startservices='brew services start redis && brew services start postgresql@14'
alias stopservices='brew services stop redis && brew services stop postgresql@14'

#     Config files
# ----------------------------

#---- ZSH Shell Configuration
alias zshc='nvim ~/.zshrc'
alias szsh='source ~/.zshrc'

#---- Neovim Configuration Directory
alias nvc='nvim ~/.config/nvim/'

#---- Neovim Plugin Directory
alias nvp='nvim ~/.config/nvim/lua/smithwebdev/plugins'

#---- Wezterm Configuration
alias wc='nvim ~/.config/wezterm/wezterm.lua'

#     Neovim Aliases
# ----------------------------

#---- Alternate Neovim launch commands
alias v='nvim'
# alias nv='nvim'

#---- Update Neovim Nightly
alias update_neovim='brew uninstall neovim && brew install neovim --HEAD'

# ----------------------------
#     Language Aliases
# ----------------------------

#     Git
# ----------------------------

#---- Git Status
alias gs='git status'

#     Rails
# ----------------------------

#---- start rails foreman server
alias bd='bin/dev'

#---- start rails server
alias rs='rails s'

#---- start rails console
alias rc='rails c'

#---- start rails test
alias rt='rails test'

#---- Rails Search & Kill Server
alias search='lsof -wni tcp:3000'
alias search1='lsof -wni tcp:5432'
alias destroy='kill -9 $1'

#---- Rails Routes Alias -------
alias rr='rails routes'
alias rrg='rails routes | grep $1'


####################################
#        FUNCTIONS
####################################

#-----------------------------------
#        Bash Terminal Functions
#-----------------------------------

#------- make directory and change directory
function mkcd() { mkdir $1 && cd $1;}

#---------------------------
#        Git Functions
#---------------------------

#------- Initial Git Commit
function gic() { git add . && git commit -m "initial commit";}

#------- Git Merge => Master
function gmerge() { git checkout master && git merge $1 && git push;}

#------- Git commit & push to branch
function gcpu() { git add . && git commit -m "$1" && git push -u origin $2;}

#------- Git commit & upstream push
function gacp() { git add . && git commit -m "$1" && git push;}

#------- Git add remote && push
function grap() { git remote add origin $1 && git push -u origin master;}


#---------------------------
#        Neovim Functions
#---------------------------

#------- Neovim Configuration Switcher
function nv() {
  items=('default' 'Lazy' 'wassimk')
  config=$(printf "%s\n" "${items[@]}" | fzf --prompt="Neovim Config >> " --height=~50% --layout=reverse --border --exit-0)
  if [[ -z $config ]]; then
    echo "No configuration was selected"
    return 0
  elif [[ $config == 'default' ]]; then
    config=""
  fi
  NVIM_APPNAME=$config nvim $0
}


source $ZSH/oh-my-zsh.sh

# User configuration

# export MANPATH="/usr/local/man:$MANPATH"

# You may need to manually set your language environment
# export LANG=en_US.UTF-8

# Preferred editor for local and remote sessions
# if [[ -n $SSH_CONNECTION ]]; then
#   export EDITOR='vim'
# else
#   export EDITOR='mvim'
# fi

# Compilation flags
# export ARCHFLAGS="-arch x86_64"

# Set personal aliases, overriding those provided by oh-my-zsh libs,
# plugins, and themes. Aliases can be placed here, though oh-my-zsh
# users are encouraged to define aliases within the ZSH_CUSTOM folder.
# For a full list of active aliases, run `alias`.

[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh
. "$HOME/.asdf/asdf.sh"
. "$HOME/.asdf/completions/asdf.bash"

ASDF_GOLANG_MOD_VERSION_ENABLED=true

# Generated for envman. Do not edit.
[ -s "$HOME/.config/envman/load.sh" ] && source "$HOME/.config/envman/load.sh"
source /opt/homebrew/share/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh
