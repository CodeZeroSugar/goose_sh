#!/bin/bash

# goose.sh - wrapper for goose migrations
# set up configuration and run from the root of your project
# == CONFIGURATION ==
DB_DRIVER="postgres"
DB_DSN="<input connection string here>"
MIGRATIONS_DIR="<input migrations directory here (/schema/number_name)"
# ===================

CMD="goose"

# Add -dir if set
if [ -n "$MIGRATIONS_DIR" ]; then
  CMD="$CMD -dir \"$MIGRATIONS_DIR\""
fi

# Add driver and DSN
CMD="$CMD $DB_DRIVER \"$DB_DSN\""

# Handle the subcommand
case "$1" in
up)
  eval "$CMD up"
  ;;
down)
  eval "$CMD down"
  ;;
status)
  eval "$CMD status"
  ;;
reset)
  eval "$CMD reset"
  ;;
version)
  eval "$CMD version"
  ;;
"")
  echo "Error: No command specified."
  echo "Usage: ./goose.sh <up|down|status|reset|version>"
  exit 1
  ;;
*)
  echo "Unknown command: $1"
  echo "Usage: ./goose.sh <up|down|status|reset|version>"
  exit 1
  ;;
esac
