# Path to your oh-my-zsh installation.
export ZSH=/Users/Jeffrey/.oh-my-zsh

# Set name of the theme to load.
# Look in ~/.oh-my-zsh/themes/
# Optionally, if you set this to "random", it'll load a random theme each
# time that oh-my-zsh is loaded.
ZSH_THEME="nanotech"

# Uncomment the following line to use case-sensitive completion.
# CASE_SENSITIVE="true"

# Uncomment the following line to use hyphen-insensitive completion. Case
# sensitive completion must be off. _ and - will be interchangeable.
# HYPHEN_INSENSITIVE="true"

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
plugins=(git)

# User settings
source .local_secrets
# Keys and Secrets
source .api_keys

# JH: Had to copy over the line below from my Bash files.
export PATH="$PATH:$HOME/.rvm/bin" # Add RVM to PATH for scripting
# JH: For some reason, the line below is what is generated after
# install oh-my-zsh. And it doesn't work. Zeus and RVM don't quite work
# export PATH="/Users/Jeffrey/.rvm/gems/ruby-2.1.4/bin:/Users/Jeffrey/.rvm/gems/ruby-2.1.4@global/bin:/Users/Jeffrey/.rvm/rubies/ruby-2.1.4/bin:/usr/local/bin:/usr/bin:/bin:/usr/sbin:/sbin:/Users/Jeffrey/.rvm/bin"
# JH END

# JH: Bloody NVM to manage bastard NodeJS
# This will activate NVM when the shell starts up
export NVM_DIR=~/.nvm
. $(brew --prefix nvm)/nvm.sh
export NODE_VERSION="6.9.5"
echo "NVM: Using Node Version $NODE_VERSION"
nvm use $NODE_VERSION
# JH END

# export MANPATH="/usr/local/man:$MANPATH"

source $ZSH/oh-my-zsh.sh

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
#
# Don't close running jobs. Disabled because I just want the jobs to die on exit
# setopt NOHUP 
# I don't want the Zsh Job Check
setopt NO_CHECK_JOBS
# Disable Zsh's Auto Titling
DISABLE_AUTO_TITLE=true

# From Jeff's bash_profile
# Path Changes ##############################################
[[ -s "$HOME/.rvm/scripts/rvm" ]] && source "$HOME/.rvm/scripts/rvm"  # This loads RVM into a shell session.
# Aliases ###################################################
alias random_dev='function __random_dev() { devs=("tyler.nelson" "nathaniel.mots" "aaron.cheng" "michael.cheung" "brian.oreilly"); echo $devs[$[RANDOM%5+1]] }; __random_dev'
alias send_for_cr='jcl beta stop; jcl update -t Stabilizing; jcl update -a $(random_dev); jcl comment "Over to you for CR!"'
alias jcl='ruby script/jira/command_line.rb'

###################################
# Xero
###################################
alias clear-xero='echo '\''delete from consumer_tokens; delete from syncable_connectors; delete from syncable_links ; delete from xero_accounts; delete from sync_failures;'\'' | mysql themis_development -u root -p'
###################################
# General Aliases
###################################
# a quick way to get out of current directory ##
alias ..='cd ..'
alias ...='cd ../../../'
alias ....='cd ../../../../'
alias .....='cd ../../../../'
alias agc='ag -c'

alias be='bundle exec'
alias branchg='git branch -a | grep'
alias branchlist='git branch --list'
alias brc='bundle exec rails console'
alias brs='bundle exec rails server'
alias buildkite-download-artifacts="bundle exec script/download_buildkite_artifacts"
   
## get rid of command not found ##
alias cd..='cd ..'
alias clean_assets="bundle exec rake browserify:generate_index && bundle exec rake tmp:cache:clear && npm install"
alias clean-fingers="git checkout script/test.d/sql_fingerprint.log"
# Usage of clioremote
# > clioremote brian brianclio # brian is my local name of the remote, brianclio is the github username
alias clioremote='function __clioremote() { git remote add $1 git@github.com:$2/themis.git  }; __clioremote'
alias clr='clear'
alias db-dump="mysqldump -u root -p$MYSQL_PASS themis_development > host_db_dump.sql"
alias db-load="mysql -u root -p$MYSQL_PASS themis_development < host_db_dump.sql"
alias db-migrate-dev='bundle exec rake db:migrate'
alias db-migrate-test='bundle exec rake db:migrate RAILS_ENV=test'
alias db-reset-dev='bundle exec rake db:drop db:create db:migrate && bundle exec rake db:seed || echo '\''failed'\'''
alias db-reset-test='bundle exec rake db:drop db:create db:migrate RAILS_ENV=test || echo '\''failed'\'''
alias edit-zshrc="vim ~/.zshrc"
alias df='df -H'
alias du='du -ch'
alias g='hub'
alias git='hub'
alias git-fetch-upstream="git fetch upstream"
alias git-merge-upstream-master="git merge upstream/master && echo 'Do you need to do an npm install?'"
alias govagrant="cd_themis;vagrant ssh;cd_themis"
alias gpet='cd ~/proj/themis/engines/cliopetra/'
alias gthemis='cd ~/proj/themis'
alias gv='gvim'
alias histg='history | grep'
alias ll='ls -alh'
alias login-mysql='mysql -u root -p'
alias lookup='ls ~/lookup'
alias lookup-api-testing='cat ~/lookup/api_testing.txt'
alias lookup-beta='cat ~/lookup/beta.txt'
alias lookup-gencmdref='cat ~/lookup/gencmdref.txt'
alias lookup-gitref='cat ~/lookup/gitref.txt'
alias lookup-httpcoderef='cat ~/lookup/httpstatcoderef.txt'
alias lookup-jclref='cat ~/lookup/jclref.txt'
alias lookup-jsref='cat ~/lookup/jsref.txt'
alias lookup-pryref='cat ~/lookup/pryref.txt'
alias lookup-railsref='cat ~/lookup/railsref.txt'
alias lookup-rspecref='cat ~/lookup/rspecref.txt'
alias lookup-sqlref='cat ~/lookup/sqlref.txt'
alias mc='memcached &'
alias mkdir='mkdir -pv'
alias mkroutes='bundle exec rake routes > routes.txt'
alias myip='curl http://ipecho.net/plain; echo'
alias mysql='/usr/local/Cellar/percona-server56/5.6.33-79.0/bin/mysql'
alias rails-get-pid='lsof -wni tcp:3000'
alias redis-flush='echo '\''flush_all'\'' | nc localhost 11211 && redis-cli flushall'
alias regen-js-index='bundle exec rake browserify:generate_index'
alias rs='redis-server'
alias source-zsh="pushd ~; source .zshrc; popd;"
alias sql-root='mysql -u root -p$MYSQL_PASS'
alias start_release='script/releaser.rb release-init'
alias stash='git stash'
alias stfu="stfu-graylog-ext && stfu-nplusone && stfu-poller && stfu-statsd && stfu-statsd-client"
#alias stfu-graylog-ext="awk 'NR==17 {$4='jeff'} { print }' lib/graylog_extension/graylog_extension.rb > lib/logging/graylog_extension/.graylog_extension.tmp"
alias stfu-graylog-ext-1="sed -i '' '17s/true/false/g' lib/graylog_extension/graylog_extension.rb"
alias stfu-graylog-ext-2="sed -i '' '26s/true/false/g' lib/graylog_extension/graylog_extension.rb"
alias stfu-graylog-ext-3="sed -i '' '33s/true/false/g' lib/graylog_extension/graylog_extension.rb"
alias stfu-graylog-ext-4="sed -i '' '36,38s/true/false/g' lib/graylog_extension/graylog_extension.rb"
alias stfu-graylog-ext="stfu-graylog-ext-1 && stfu-graylog-ext-2 && stfu-graylog-ext-3 && stfu-graylog-ext-4"
alias stfu-nplusone="sed -i '' '13s/backtrace/backtrace.slice(0,3).map { |x| x.gsub(Rails.root.to_s,"")}/g' extras/util/n_plus_one_query_checker.rb"
alias stfu-poller="sed -i '' 's/setInterval/return; setInterval/g' app/javascripts/polling.js"
alias stfu-statsd="sed -i '' 's/Rails.logger.debug/#Rails.logger.debug/g' extras/statsd.rb"
alias stfu-statsd-client="sed -i '' '82s/.*/@@logger = nil/g' extras/statsd_client.rb"
#alias stfu-statsd-client="awk 'NR==83 {$0='@@logger = nil'} { print }' extras/statsd_client.rb > extras/statsd_client_temp.rb"
alias test-coffeelint='script/test.d/70_coffeelint'
alias test-js-all='bundle exec rake karma:run RAILS_ENV=test'
alias test-karma='script/test.d/70_karma'
alias test-karma-debug='DEBUG=1 script/test.d/70_karma'
alias tm='tmux'
alias tma='tmux attach -t'
alias tmd='tmux detach'
alias tmkill='tmux kill-session -t'
alias tmuxerrant='./tmuxerrant.sh'
alias tmux-attach-beta="tmux attach -t Beta"
alias tmux-attach-errant="tmux attach -t Errant"
alias tmux-attach-stock="tmux attach -t StockProj"
alias tmux-attach-themis="tmux attach -t Themis"
alias tmux-attach-vagrant="tmux attach -t ThemisVagrant"
alias tmux-kill-themis="tmux kill-session -t Themis"
alias tmux-kill-vagrant="tmux kill-session -t ThemisVagrant"
alias tmux-list="tmux list-sessions"
alias tmuxnewthemis='./tmuxnewthemis.sh'
alias tmuxthemis='./tmuxthemis.sh'
alias tmuxvagrant='./tmuxvagrant.sh'
alias tree="find . -print | sed -e 's;[^/]*/;|____;g;s;____|; |;g'"
alias unfuck-angular="rm -rf node_modules public/assets/* && bundle install --local && yarn install && bundle exec rake tmp:cache:clear"
alias unfuck-browserify="chmod +rwx ~/clio/themis/node_modules/browserify/bin/cmd.js"
alias unfuck-browserifyinc="chmod +rwx ~/clio/themis/node_modules/browserify-incremental/bin/cmd.js"
alias unfuck-coffeelint="chmod +rwx ~/clio/themis/node_modules/coffeelint/bin/coffeelint"
alias unfuck-karma="chmod +rwx ~/clio/themis/node_modules/karma/bin/karma"
alias unfuck-node-permissions="unfuck-browserify && unfuck-browserifyinc && unfuck-coffeelint && unfuck-karma && unfuck-phantomjs"
alias unfuck-phantomjs="chmod +x ~/clio/themis/node_modules/phantomjs-prebuilt/bin/phantomjs"
alias unfuck-poller="sed -i '' 's/config.polling_frequency = 1.minute/config.polling_frequency = 1000.minutes/g' config/environments/development.rb"
alias unison-clean="rm ~/.unison/ar*"
alias update-lib-themis-ui="npm install --save github:clio/lib-themius.git#" # Append v2.1.0 or whatever
alias v='/usr/local/Cellar/vim/7.4.963/bin/vim'
alias vdie='vagrant destroy'
alias vup='vagrant up'
alias vim='/usr/local/Cellar/vim/7.4.963/bin/vim'
alias vimrc='vim ~/.vimrc'
alias wget='wget -c' # Continue any file download where we left off
alias z='zeus'
alias zc='zeus console'
alias zr='zeus rspec'
alias zstart='zeus start'
alias zshrc='vim ~/.zshrc'

# JIRA stuff
alias curbranch='git rev-parse --abbrev-ref HEAD' #Current checked out git branch name
alias cgb='function __cgb() { open -a "Google Chrome" https://github.com/clio/themis/compare/master...jeff-h4:$(curbranch); unset -f __cgb;}; __cgb'
alias cb='function __cb() { string=$(curbranch); str1=${string%%-*}; str2=${string#$str1-}; str3=${str2%%-*}; echo $str3; unset -f __cb; }; __cb' #Current ticket number (assuming branch is named clio-00000 etc)
# Use 'jira clio-12345' to open specified ticket in JIRA
alias jira='function __jira() { open -a "Google Chrome" "https://themis.atlassian.net/secure/QuickSearch.jspa?searchString=CLIO-$*"; unset -f __jira; }; __jira' #Opens specified ticket number in jira
# Use 'jcb' to launch current ticket in JIRA
alias jcb='function __jcb() { jira $(cb); unset -f __jcb; }; __jcb' #Will look for current ticket number in jira - depends on branch being named in correct format with correct number

function cd_themis() {
  cd $HOME/clio/themis
}

function filter-server-log() {
  tail -f development.log | sed 's/^\[uuid\=[0-9a-f-]*\] \[version\=[a-z0-9.-]*\]//'
}

# Execute within Themis
function sort-sql() {
  script/test.d/98_sql_fingerprint --only-sort
  echo "------------------------------"
  echo " Make sure you add CSQL Explain output to the PR!"
  echo "------------------------------"
}
