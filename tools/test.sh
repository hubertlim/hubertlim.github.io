#!/usr/bin/env bash
#
# Build and validate the site in Docker

set -eu

help() {
  echo "Build and validate the site in Docker"
  echo
  echo "Usage:"
  echo
  echo "   bash $0"
}

if (($#)); then
  case "$1" in
  -h | --help)
    help
    exit 0
    ;;
  *)
    help
    exit 1
    ;;
  esac
fi

exec docker compose run --rm jekyll bash -lc \
  'bundle exec jekyll b -d /tmp/site && bundle exec htmlproofer /tmp/site --disable-external --ignore-urls "/^http:\/\/127.0.0.1/,/^http:\/\/0.0.0.0/,/^http:\/\/localhost/"'
