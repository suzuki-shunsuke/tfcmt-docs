#!/usr/bin/env bash

set -eu
set -o pipefail

cd "$(dirname "$0")/.."

command_console() {
  echo '```console'
  echo "$ $*"
  "$@"
  echo '```'
}

commands() {
  for cmd in plan apply; do
    echo "
## tfcmt $cmd

$(command_console tfcmt help $cmd)"
  done
}

echo "---
sidebar_position: 600
---

# Command Usage

<!-- This is generated by scripts/generate-usage.sh. Don't edit this file directly. -->

$(command_console tfcmt help)
$(commands)" > docs/usage.md
