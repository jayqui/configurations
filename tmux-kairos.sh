# This file should be sourced
function setup_for_kairos() {
  cd ~/workspace/kairos
  session_name="kairos"

  tmux kill-session -t "kairos_session"
  # -d: do not attach to the new session yet
  tmux new-session -s "kairos_session" -d
  tmux new-window -n "rails s"
  tmux split-window -h
  tmux new-window -n "rails c"
  tmux new-window -n "ks rails"
  tmux new-window -n "kp rails"

  tmux select-window -t "rails s"
  tmux select-pane -t 2
  tmux send-keys "LIVERELOAD=true npm run dev" C-m
  tmux select-pane -t 1
  tmux send-keys "rails s" C-m
  tmux select-window -t "rails c"
  tmux send-keys "rails c" C-m
  tmux select-window -t "ks rails"
  tmux send-keys "ks rails" C-m
  tmux select-window -t "kp rails"
  tmux send-keys "kp rails" C-m

  tmux select-window -t 1
  tmux attach-session -t "kairos_session"
}
