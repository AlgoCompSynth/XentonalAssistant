#! /usr/bin/env -S bash -l

set -e

source set-container-envars > /dev/null

# https://pi.dev/docs/latest/quickstart#install
echo "..Installing pi coding agent"
npm install -g --ignore-scripts @earendil-works/pi-coding-agent > /dev/null
echo "..pi coding agent is installed."
