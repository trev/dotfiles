# Path to your oh-my-zsh installation.
export ZSH=$HOME/.oh-my-zsh

# Set name of the theme to load.
# Look in ~/.oh-my-zsh/themes/
# Optionally, if you set this to "random", it'll load a random theme each
# time that oh-my-zsh is loaded.
ZSH_THEME="robbyrussell"

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
plugins=(git history-substring-search gpg-agent)

source $ZSH/oh-my-zsh.sh

# User configuration

export PATH="/usr/local/bin:/usr/bin:/bin:/usr/sbin:/sbin"
# export MANPATH="/usr/local/man:$MANPATH"

# You may need to manually set your language environment
# export LANG=en_US.UTF-8

# Preferred editor for local and remote sessions
export EDITOR='nvim'

# Set the CLI to vi mode instead of emacs
# This allows us to use the CLI like vim. Awesome!
set -o vi

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
alias git=hub
alias ls="ls -alh"
alias gs="git status"
alias gaa="git add ."
alias gar="git add -u" # http://stackoverflow.com/questions/492558/removing-multiple-files-from-a-git-repo-that-have-already-been-deleted-from-disk#1402793
alias gc="git checkout"
alias gd="git diff"
alias gpf="git push --force-with-lease"
alias server="foreman start -f Procfile.development"
alias vim="nvim"
alias rtdbp="DISABLE_DATABASE_ENVIRONMENT_CHECK=1 bin/rails db:test:prepare"
alias rptdbp="DISABLE_DATABASE_ENVIRONMENT_CHECK=1 RACK_ENV=test rake parallel:drop parallel:setup"
alias rdbdc="DISABLE_DATABASE_ENVIRONMENT_CHECK=1 bin/rails db:drop && DISABLE_DATABASE_ENVIRONMENT_CHECK=1 bin/rails db:create"
alias rdbdc="DISABLE_DATABASE_ENVIRONMENT_CHECK=1 bin/rails db:drop && DISABLE_DATABASE_ENVIRONMENT_CHECK=1 bin/rails db:create"

# Function to copy ssh public key to authorized_keys
# Usage: cpssh user@someserver.com
cpssh () {
  cat ~/.ssh/id_rsa.pub | ssh $@ "mkdir -p ~/.ssh && cat >>  ~/.ssh/authorized_keys"
}

# Color ls
export LSCOLORS=gxfxbEaEBxxEhEhBaDaCaD

# Color grep
export GREP_OPTIONS='--color=auto'

# Chruby
source /usr/local/share/chruby/chruby.sh
source /usr/local/share/chruby/auto.sh

# NPM without sudo (https://github.com/sindresorhus/guides/blob/master/npm-global-without-sudo.md)
NPM_PACKAGES="${HOME}/.npm-packages"
PATH="$NPM_PACKAGES/bin:$PATH"
unset MANPATH # delete if you already modified MANPATH elsewhere in your config
MANPATH="$NPM_PACKAGES/share/man:$(manpath)"

# added by travis gem
[ -f /Users/trevorwistaff/.travis/travis.sh ] && source /Users/trevorwistaff/.travis/travis.sh
