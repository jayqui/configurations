# This file should be sourced

function init() {
  tmux kill-session -t "omada_session"

  # -d: do not attach to the new session yet
  tmux new-session -s "omada_session" -d
}

function start() {
  tmux attach-session -t "omada_session"
}

function setup_for_msk() {
  tmux new-window -n "msk"
  tmux new-window -n "fe"
  tmux new-window -n "fl sh"
  tmux new-window -n "msk stag db"
  # tmux new-window -n "msk prod-rep db"

  tmux select-window -t "msk"
  tmux send-keys "mskw && switch staging" C-m
  tmux select-window -t "fe"
  tmux send-keys "mskw && switch staging && yarn run dev" C-m
  tmux select-window -t "fl sh"
  tmux send-keys "mskw && switch staging && flask shell" C-m
  tmux select-window -t "msk stag db"
  tmux send-keys "mskw && switch staging && remote-run msk-webapp-staging db" C-m
  # tmux select-window -t "msk prod-rep db"
  # tmux send-keys "mskw && switch staging && remote-run msk-webapp-production db" C-m
}

function setup_for_kairos() {
  tmux new-window -n "kk"
  tmux new-window -n "rails s"
  tmux split-window -h
  tmux new-window -n "rails c"
  tmux new-window -n "ks rails"
  tmux new-window -n "kp rails"
  tmux new-window -n "oo rs"
  tmux new-window -n "sidekiq"

  tmux select-window -t "kk"
  tmux send-keys "kk" C-m
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

function setup_for_mapp() {
  tmux new-window -n "mm"
  tmux new-window -n "mm rs"
  tmux split-window -h
  tmux new-window -n "mm rc"
  tmux new-window -n "ms rails"
  tmux new-window -n "mr rails"
  tmux new-window -n "mp rails"

  tmux select-window -t "mm"
  tmux send-keys "mm" C-m
  tmux select-window -t "mm rs"
  tmux select-pane -t 2
  tmux send-keys "mm && bin/webpack-dev-server" C-m
  tmux select-pane -t 1
  tmux send-keys "mm && rails s -p 9999" C-m
  tmux select-window -t "mm rc"
  tmux send-keys "mm && rails c" C-m
  tmux select-window -t "ms rails"
  tmux send-keys "mm && kube-connect connect staging marketing web rails c" C-m
  tmux select-window -t "mr rails"
  tmux send-keys "mm && kube-connect connect --namespace marketing-preprod infra marketing sidekiq rails c" C-m
  tmux select-window -t "mp rails"
  tmux send-keys "mm && kube-connect connect production marketing sidekiq rails c" C-m # read-only
  # tmux send-keys "mm && kube-connect connect --read-write production marketing sidekiq rails c" C-m # read-write counterpart
}

function setup_for_mapp_dockerized() {
  tmux new-window -n "mm"
  tmux new-window -n "mm dc"
  tmux new-window -n "mm dc r c"
  tmux new-window -n "ms rails"
  tmux new-window -n "mp rails"

  tmux select-window -t "mm"
  tmux send-keys "mm" C-m
  tmux select-window -t "mm dc"
  tmux send-keys "mm && dc build && dc up" C-m
  tmux select-window -t "mm dc r c"
  tmux send-keys "mm && dc run --rm rails c"
  tmux select-window -t "ms rails"
  tmux send-keys "mm && kube-connect connect staging marketing web rails c" C-m
  tmux select-window -t "mp rails"
  tmux send-keys "mm && mp rails" C-m
}

function query_lando() {
  tmux new-window -n "las rails"
  tmux new-window -n "lap rails"

  tmux select-window -t "las rails"
  tmux send-keys "lan && kube-connect connect staging lando web rails c" C-m
  tmux select-window -t "lap rails"
  tmux send-keys "lan && lap rails" C-m
}

function query_kairos() {
  tmux new-window -n "ks rails"
  tmux new-window -n "kp rails"

  tmux select-window -t "ks rails"
  tmux send-keys "kk && ks rails" C-m
  tmux select-window -t "kp rails"
  tmux send-keys "kk && kp rails" C-m
}

function query_orange() {
  tmux new-window -n "os rails"
  tmux new-window -n "op rails"

  tmux select-window -t "os rails"
  tmux send-keys "os rails" C-m
  tmux select-window -t "op rails"
  tmux send-keys "op rails" C-m
}

function query_mapp() {
  tmux new-window -n "ms rails"
  tmux new-window -n "mr rails"
  tmux new-window -n "mp rails"

  tmux select-window -t "ms rails"
  tmux send-keys "mm && kube-connect connect staging marketing web rails c" C-m
  tmux select-window -t "mr rails"
  tmux send-keys "mm && mr rails" C-m
  tmux select-window -t "mp rails"
  tmux send-keys "mm && mp rails" C-m
}
