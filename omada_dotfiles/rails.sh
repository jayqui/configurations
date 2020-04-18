alias migrate='bundle exec rake db:migrate db:test:prepare'
alias redo='bundle exec rake db:migrate:redo db:test:prepare'
alias rollback='bundle exec rake db:rollback db:test:prepare'
alias be='bundle exec'
alias set_ar_metadata_test="psql -d data_warehouse_test -c \"DROP TABLE IF EXISTS ar_internal_metadata; CREATE TABLE ar_internal_metadata AS ( SELECT 'environment'::TEXT AS key, 'test'::TEXT AS value, NOW() AS created_at, NOW() AS updated_at );\""
alias unfuck_tests="set_ar_metadata_test && RAILS_ENV=test rake db:drop db:create db:migrate && rake"
alias unfuck_tests_5="set_ar_metadata_test && RAILS_ENV=test rake db:drop db:create db:migrate && rake"
alias run_changed_tests='git status --porcelain | grep "spec" | cut -c 4- | xargs rspec'
alias rct=run_changed_tests
