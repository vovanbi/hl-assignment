#!/usr/bin/env bash
# exit on error
set -o errexit

bundle config set --local path 'vendor/bundle'
bundle install --path vendor/bundle
bundle exec rails assets:precompile
bundle exec rails assets:clean
bundle exec rails db:migrate
bundle exec rails db:seed
