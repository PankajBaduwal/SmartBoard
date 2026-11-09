#!/bin/sh
# Nepal Digital Education - Smart Board (macOS / Linux). Opens the board in its own window.
cd "$(dirname "$0")" || exit 1
if ! command -v node >/dev/null 2>&1; then
  echo "Node.js is needed to start the Smart Board. Install it from https://nodejs.org and try again." >&2
  exit 1
fi
exec node launcher.js "$@"
