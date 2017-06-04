#!/bin/bash
#STARTCMD='bash; source ~/.bash_profile'
STARTCMD='zsh; source ~/.zshenv'

TARGET_SESSION="ThemisVagrant"
BASE_DIR="~/clio/themis"
USE_UNISON="true"
echo "${0##*/}"

tmux new-session -s $TARGET_SESSION -d -n $TARGET_SESSION
CURR_WIN=1
tmux rename-window VagrantServer
tmux send-keys -t $TARGET_SESSION:$CURR_WIN "cd_themis" C-m
tmux send-keys -t $TARGET_SESSION:$CURR_WIN "vagrant ssh" C-m
tmux send-keys -t $TARGET_SESSION:$CURR_WIN "cd_themis" C-m
tmux send-keys -t $TARGET_SESSION:$CURR_WIN "bin/spring rails server -b 0.0.0.0" C-m
#tmux send-keys -t $TARGET_SESSION:$CURR_WIN "filtered-rails-server" C-m
CURR_WIN=2
tmux new-window -t $TARGET_SESSION:$CURR_WIN -n Console
tmux send-keys -t $TARGET_SESSION:$CURR_WIN "cd_themis" C-m
tmux send-keys -t $TARGET_SESSION:$CURR_WIN "sleep 5; vagrant ssh" C-m
tmux send-keys -t $TARGET_SESSION:$CURR_WIN "cd_themis" C-m
tmux send-keys -t $TARGET_SESSION:$CURR_WIN "bin/spring rails console" C-m
CURR_WIN=3
tmux new-window -t $TARGET_SESSION:$CURR_WIN -n Resque 
tmux send-keys -t $TARGET_SESSION:$CURR_WIN "cd_themis" C-m
tmux send-keys -t $TARGET_SESSION:$CURR_WIN "sleep 10; vagrant ssh" C-m
tmux send-keys -t $TARGET_SESSION:$CURR_WIN "cd_themis" C-m
tmux send-keys -t $TARGET_SESSION:$CURR_WIN "script/resque" C-m
CURR_WIN=4
tmux new-window -t $TARGET_SESSION:$CURR_WIN -n top
tmux send-keys -t $TARGET_SESSION:$CURR_WIN "cd_themis" C-m
tmux send-keys -t $TARGET_SESSION:$CURR_WIN "sleep 15; vagrant ssh" C-m
tmux send-keys -t $TARGET_SESSION:$CURR_WIN "cd_themis" C-m
tmux send-keys -t $TARGET_SESSION:$CURR_WIN "top" C-m
CURR_WIN=5
tmux new-window -t $TARGET_SESSION:$CURR_WIN -n SQL
tmux send-keys -t $TARGET_SESSION:$CURR_WIN "cd_themis" C-m
tmux send-keys -t $TARGET_SESSION:$CURR_WIN "sleep 20; vagrant ssh" C-m
tmux send-keys -t $TARGET_SESSION:$CURR_WIN "cd_themis" C-m
tmux send-keys -t $TARGET_SESSION:$CURR_WIN "sqlroot" C-m
CURR_WIN=6
tmux new-window -t $TARGET_SESSION:$CURR_WIN -n Spec
tmux send-keys -t $TARGET_SESSION:$CURR_WIN "cd_themis" C-m
tmux send-keys -t $TARGET_SESSION:$CURR_WIN "sleep 25; vagrant ssh" C-m
tmux send-keys -t $TARGET_SESSION:$CURR_WIN "cd_themis" C-m
tmux send-keys -t $TARGET_SESSION:$CURR_WIN "unfuck-node-permissions" C-m
if [ $USE_UNISON = "true" ]; then
  echo "NOTE: Unison mode ENABLED"
  CURR_WIN=7
  tmux new-window -t $TARGET_SESSION:$CURR_WIN -n Unison
  tmux send-keys -t $TARGET_SESSION:$CURR_WIN "cd_themis" C-m
  tmux send-keys -t $TARGET_SESSION:$CURR_WIN "unison themis_profile" C-m
fi
