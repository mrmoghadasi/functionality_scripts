#!/bin/bash

# Start a new tmux session
tmux new-session -d -s my_session
sleep 2
# Split the window horizontally
tmux split-window -h

# Select the left pane and split it vertically
tmux select-pane -t 0
tmux split-window -v


# Run htop in the top-left pane
tmux select-pane -t 0
tmux send-keys "htop" C-m

# Run nload in the top-right pane
tmux select-pane -t 1
tmux send-keys "nload" C-m


# Rename the session (optional)
tmux rename-session "3-pane-setup"

# Attach to the tmux session
tmux attach-session -t my_session
