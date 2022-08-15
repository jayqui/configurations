# This file should be sourced

function init() {
  tmux kill-session -t "omada_session"
  cd ~/workspace/kairos
  # -d: do not attach to the new session yet
  tmux new-session -s "omada_session" -n "kk" -d
}

function start() {
  tmux attach-session -t "omada_session"
}

function setup_for_kairos() {
  tmux new-window -n "rails s"
  tmux split-window -h
  tmux new-window -n "rails c"
  tmux new-window -n "ks rails"
  tmux new-window -n "kp rails"
  tmux new-window -n "oo rs"
  tmux new-window -n "sidekiq"

  tmux select-window -t "rails s"
  tmux select-pane -t 2
  tmux send-keys "kk && LIVERELOAD=true npm run dev" C-m
  tmux select-pane -t 1
  tmux send-keys "kk && rails s" C-m
  tmux select-window -t "rails c"
  tmux send-keys "kk && rails c" C-m
  tmux select-window -t "ks rails"
  tmux send-keys "kk && ks rails" C-m
  tmux select-window -t "kp rails"
  tmux send-keys "kk && kp rails" C-m
  tmux select-window -t "oo rs"
  tmux send-keys "oo && gm && gv && bundle && migrate && gco . && rails s" C-m
  tmux select-window -t "sidekiq"
  tmux send-keys "kk && sidekiq" C-m

  tmux select-window -t 1
}

function setup_for_lando() {
  tmux new-window -n "lan"
  tmux new-window -n "lan fore"
  tmux new-window -n "lan rc"
  tmux new-window -n "las rails"
  tmux new-window -n "lap rails"

  tmux select-window -t "lan"
  tmux send-keys "lan" C-m
  tmux select-window -t "lan fore"
  tmux send-keys "lan && foreman start" C-m
  tmux select-window -t "lan rc"
  tmux send-keys "lan && rails c" C-m
  tmux select-window -t "las rails"
  tmux send-keys "lan && las rails" C-m
  tmux select-window -t "lap rails"
  tmux send-keys "lan && lap rails" C-m
  tmux select-window -t "lan"
}

function query_lando() {
  tmux new-window -n "las rails"
  tmux new-window -n "lap rails"

  tmux select-window -t "las rails"
  tmux send-keys "lan && las rails" C-m
  tmux select-window -t "lap rails"
  tmux send-keys "lan && lap rails" C-m
}

function query_orange() {
  tmux new-window -n "os rails"
  tmux new-window -n "op rails"

  tmux select-window -t "os rails"
  tmux send-keys "os rails" C-m
  tmux select-window -t "op rails"
  tmux send-keys "op rails" C-m
}
