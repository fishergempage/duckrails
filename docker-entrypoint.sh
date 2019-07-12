#!/bin/bash
set -e

if [ "$1" = 'puma' ]; then

  # if [ -z "${SECRET_KEY_BASE}" ]; then
  #   echo 'WARNING: Environment variable SECRET_KEY_BASE has not been set - Setting a random SECRET_KEY_BASE'
  #   export SECRET_KEY_BASE="$(bundle exec rake secret)"
  # fi

  # Ensure db:migrations have run if upgraded
  bundle exec rake db:migrate

fi
exec bundle exec "$@"
