echo "Reading .zshrc"
# Path to your oh-my-zsh configuration.
ZSH=$HOME/.oh-my-zsh

# Set name of the theme to load.
# Look in ~/.oh-my-zsh/themes/
# Optionally, if you set this to "random", it'll load a random theme each
# time that oh-my-zsh is loaded.
ZSH_THEME="robbyrussell"

# Example aliases
# alias zshconfig="mate ~/.zshrc"
# alias ohmyzsh="mate ~/.oh-my-zsh"

# Set to this to use case-sensitive completion
# CASE_SENSITIVE="true"

# Uncomment this to disable bi-weekly auto-update checks
# DISABLE_AUTO_UPDATE="true"

# Uncomment to change how often before auto-updates occur? (in days)
# export UPDATE_ZSH_DAYS=13

# Uncomment following line if you want to disable colors in ls
# DISABLE_LS_COLORS="true"

# Uncomment following line if you want to disable autosetting terminal title.
# DISABLE_AUTO_TITLE="true"

# Uncomment following line if you want to disable command autocorrection
# DISABLE_CORRECTION="true"

# Uncomment following line if you want red dots to be displayed while waiting for completion
# COMPLETION_WAITING_DOTS="true"

# Uncomment following line if you want to disable marking untracked files under
# VCS as dirty. This makes repository status check for large repositories much,
# much faster.
# DISABLE_UNTRACKED_FILES_DIRTY="true"

# Uncomment following line if you want to  shown in the command execution time stamp 
# in the history command output. The optional three formats: "mm/dd/yyyy"|"dd.mm.yyyy"|
# yyyy-mm-dd
# HIST_STAMPS="mm/dd/yyyy"

# Which plugins would you like to load? (plugins can be found in ~/.oh-my-zsh/plugins/*)
# Custom plugins may be added to ~/.oh-my-zsh/custom/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
plugins=(git)

source $ZSH/oh-my-zsh.sh

# User configuration
 
# export MANPATH="/usr/local/man:$MANPATH"

# # Preferred editor for local and remote sessions
# if [[ -n $SSH_CONNECTION ]]; then
#   export EDITOR='vim'
# else
#   export EDITOR='mvim'
# fi

# Compilation flags
# export ARCHFLAGS="-arch x86_64"

# ssh
# export SSH_KEY_PATH="~/.ssh/dsa_id"

if [ -n "$INSIDE_EMACS" ]; then
    export ZSH_THEME="rawsyntax"
else
    export ZSH_THEME="robbyrussell"
fi
    export ZSH_THEME="robbyrussell"

export GRAILS_HOME=~/products/grails/grails-1.3.7/

export LC_ALL=en_US.UTF-8  
export LANG=en_US.UTF-8

export PATH=/Users/nli/bin:/usr/local/bin:/usr/X11/bin:/Users/nli:$GRAILS_HOME/bin:/usr/local/share/npm/bin:/usr/local/Cellar/ec2-api-tools/1.6.7/bin:/usr/local/sbin:/usr/bin:/bin:/usr/sbin:/sbin:
export JAVA_HOME=$(/usr/libexec/java_home)
export EC2_HOME=/usr/local/Cellar/ec2-api-tools/1.6.7/jars
export AWS_ACCESS_KEY=AKIAIUWB4LTUV4JNTZ4Q
export AWS_SECRET_KEY=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




### Added by the Heroku Toolbelt
export PATH="/usr/local/heroku/bin:$PATH"

### git-log-compact https://mackyle.github.io/git-log-compact/
ln -sf  /Users/nli/worklocal/git-log-compact/git-log-compact  /Users/nli/bin/git-log-compact

### hunspell directory
export DICTIONARY=sv_SE 

export ZSHRC_READ=true

# Python pip only allowed to run in virtual env!
export PIP_REQUIRE_VIRTUALENV=true


#THIS MUST BE AT THE END OF THE FILE FOR GVM TO WORK!!!
[[ -s "/Users/nli/.gvm/bin/gvm-init.sh" ]] && source "/Users/nli/.gvm/bin/gvm-init.sh"



#THIS MUST BE AT THE END OF THE FILE FOR JENV TO WORK!!!
[[ -s "/Users/nli/.jenv/bin/jenv-init.sh" ]] && source "/Users/nli/.jenv/bin/jenv-init.sh" && source "/Users/nli/.jenv/commands/completion.sh"


export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion

