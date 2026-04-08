#!/usr/bin/env bash
#
# Run the site in Docker

set -eu

help() {
  echo "Usage:"
  echo
  echo "   bash $0"
  echo
  echo "Starts the Jekyll site with Docker Compose."
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

exec docker compose up --build
