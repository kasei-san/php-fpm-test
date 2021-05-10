#!/bin/sh
set -e

# exec nginx -g "daemon off;"
exec nginx-debug -g "daemon off;"
