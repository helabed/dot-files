# Path to your oh-my-zsh installation.
export ZSH=/Users/helabed/.oh-my-zsh

# Set name of the theme to load.
# Look in ~/.oh-my-zsh/themes/
# Optionally, if you set this to "random", it'll load a random theme each
# time that oh-my-zsh is loaded.
#ZSH_THEME="robbyrussell"
#ZSH_THEME="gozilla"
#ZSH_THEME="fino"
#ZSH_THEME="takashiyoshida"
#ZSH_THEME="random"
ZSH_THEME="jonathan"

# Uncomment the following line to use case-sensitive completion.
# CASE_SENSITIVE="true"

# Uncomment the following line to disable bi-weekly auto-update checks.
# DISABLE_AUTO_UPDATE="true"

# Uncomment the following line to change how often to auto-update (in days).
# export UPDATE_ZSH_DAYS=13

# Uncomment the following line to disable colors in ls.
# DISABLE_LS_COLORS="true"

# Uncomment the following line to disable auto-setting terminal title.
# DISABLE_AUTO_TITLE="true"

# Uncomment the following line to enable command auto-correction.
# ENABLE_CORRECTION="true"

# Uncomment the following line to display red dots whilst waiting for completion.
# COMPLETION_WAITING_DOTS="true"

# Uncomment the following line if you want to disable marking untracked files
# under VCS as dirty. This makes repository status check for large repositories
# much, much faster.
# DISABLE_UNTRACKED_FILES_DIRTY="true"

# Uncomment the following line if you want to change the command execution time
# stamp shown in the history command output.
# The optional three formats: "mm/dd/yyyy"|"dd.mm.yyyy"|"yyyy-mm-dd"
# HIST_STAMPS="mm/dd/yyyy"

# Would you like to use another custom folder than $ZSH/custom?
# ZSH_CUSTOM=/path/to/new-custom-folder

# Which plugins would you like to load? (plugins can be found in ~/.oh-my-zsh/plugins/*)
# Custom plugins may be added to ~/.oh-my-zsh/custom/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
# Add wisely, as too many plugins slow down shell startup.
plugins=(git ruby rails osx sublime gem brew capistrano coffee compleat bundler vi-mode tmux history-substring-search)

# User configuration

source $ZSH/oh-my-zsh.sh

# You may need to manually set your language environment
# export LANG=en_US.UTF-8

export PATH="$PATH:$HOME/bin:/usr/local/bin:/usr/bin:/bin:/usr/sbin:/sbin:/opt/X11/bin"

# Preferred editor for local and remote sessions
# if [[ -n $SSH_CONNECTION ]]; then
#   export EDITOR='vim'
# else
#   export EDITOR='mvim'
# fi

# Compilation flags
# export ARCHFLAGS="-arch x86_64"

# ssh
# export SSH_KEY_PATH="~/.ssh/dsa_id"

# Set personal aliases, overriding those provided by oh-my-zsh libs,
# plugins, and themes. Aliases can be placed here, though oh-my-zsh
# users are encouraged to define aliases within the ZSH_CUSTOM folder.
# For a full list of active aliases, run `alias`.
#
# Example aliases
# alias zshconfig="mate ~/.zshrc"
# alias ohmyzsh="mate ~/.oh-my-zsh"

# Vim binding for Zsh
bindkey -v

# command line history search after you start typing. this bound to Up and Down keys, for more info, see:
# http://unix.stackexchange.com/questions/97843/how-can-i-search-history-with-what-is-already-entered-at-the-prompt-in-zsh
# bindkey "^[[A" history-beginning-search-backward
# bindkey "^[[B" history-beginning-search-forward
# Dec. 18, 2015 - After a recent upgrade to oh-my-zsh, the above got broken and no longer works
# so now using https://github.com/zsh-users/zsh-history-substring-search
# added 'history-substring-search' to plugins=(...) above
bindkey '^[[A' history-substring-search-up
bindkey '^[[B' history-substring-search-down

#
# Got these from .bashrc
export PATH=$PATH:$HOME/Android/adt-bundle-mac-x86_64-20140321/sdk/platform-tools/:$HOME/Android/adt-bundle-mac-x86_64-20140321/sdk/tools/

alias tree="find . -print | sed -e 's;[^/]*/;|____;g;s;____|; |;g'"

export PATH="$PATH:$HOME/.rvm/bin" # Add RVM to PATH for scripting
[[ -s "$HOME/.rvm/scripts/rvm" ]] && source "$HOME/.rvm/scripts/rvm" # Load RVM into a shell session *as a function*

export EDITOR='vim'             # needed by tmuxinator
export DISABLE_AUTO_TITLE=true  # for tmux/tmuxinator to display window names
#source ~/.tmuxinator/bin/tmuxinator.zsh
fpath=($HOME/.tmuxinator/completion ${fpath})
autoload -U compinit
compinit

# interactive commments so that we can comment out a line we are not ready
# to use yet when zshell is used interactively <-> versus programatically
setopt interactivecomments

# to enable ImageMagic so that we can run rspec tests for headliner
if [ $HOST = 'hani-elabeds-iMac-2.local' ]; then
  export PATH="$PATH:/usr/local/bin" # Add 'identify' utility from ImageMagic - iMac
else
  # macbookpro hostname is: 'hani-elabeds-MacBook-Pro.local'
  export PATH="$PATH:/opt/local/bin" # Add 'identify' utility from ImageMagic - MacBookPro
fi
