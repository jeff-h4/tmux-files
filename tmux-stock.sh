#!/bin/bash
STARTCMD='bash; source ~/.bash_profile'

TARGET_SESSION="StockProj"
BASE_DIR="~/proj/stockproj"
PROJ_NAME="StockProj"
RUN_LOCAL_SERVER="true"

if [ $RUN_LOCAL_SERVER = "true" ]; then
  echo "WARNING: You are running in LOCAL SERVER mode"
else
  echo "NOTE: Your setup requires that you run the server on Vagrant"
fi

CURR_WIN=1
tmux new-session -s $TARGET_SESSION -d -n $PROJ_NAME
tmux send-keys -t $TARGET_SESSION:$CURR_WIN "cd $BASE_DIR" C-m
tmux split-window -h -p 40
tmux send-keys -t $TARGET_SESSION:$CURR_WIN "cd $BASE_DIR/spec" C-m
CURR_WIN=2
tmux new-window -t $TARGET_SESSION:$CURR_WIN -n Controller-View
tmux send-keys -t $TARGET_SESSION:$CURR_WIN "cd $BASE_DIR/app/controllers" C-m
tmux split-window -h -p 50
tmux send-keys -t $TARGET_SESSION:$CURR_WIN "cd $BASE_DIR/app/views" C-m
CURR_WIN=3
tmux new-window -t $TARGET_SESSION:$CURR_WIN -n Model-Helper
tmux send-keys -t $TARGET_SESSION:$CURR_WIN "cd $BASE_DIR/app/models" C-m
tmux split-window -h -p 50
tmux send-keys -t $TARGET_SESSION:$CURR_WIN "cd $BASE_DIR/app/helpers" C-m
CURR_WIN=4
tmux new-window -t $TARGET_SESSION:$CURR_WIN -n Services
tmux send-keys -t $TARGET_SESSION:$CURR_WIN "cd $BASE_DIR/app/services" C-m
CURR_WIN=5
tmux new-window -t $TARGET_SESSION:$CURR_WIN -n Config-Lib
tmux send-keys -t $TARGET_SESSION:$CURR_WIN "cd $BASE_DIR/config" C-m
tmux split-window -h -p 50
tmux send-keys -t $TARGET_SESSION:$CURR_WIN "cd $BASE_DIR/lib" C-m
CURR_WIN=6
tmux new-window -t $TARGET_SESSION:$CURR_WIN -n ServerLog-ngrok
tmux send-keys -t $TARGET_SESSION:$CURR_WIN "cd $BASE_DIR/log" C-m
tmux send-keys -t $TARGET_SESSION:$CURR_WIN "filter-server-log" C-m
tmux split-window -h -p 50
# Manually launch ngrok when needed
#tmux send-keys -t $TARGET_SESSION:$CURR_WIN "./ngrok http 3000" C-m
if [ $RUN_LOCAL_SERVER = "true" ]; then
  CURR_WIN=7
  tmux new-window -t $TARGET_SESSION:$CURR_WIN -n Daemons
  tmux send-keys -t $TARGET_SESSION:$CURR_WIN "cd $BASE_DIR" C-m
  tmux send-keys -t $TARGET_SESSION:$CURR_WIN "bundle exec rails server" C-m
fi




