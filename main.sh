#!/bin/bash
set -e

case "$1" in
  1)
    shift
    set -- --tlq --real "$@"
    ;;
  2)
    shift
    set -- --tl --real "$@"
    ;;
  3)
    shift
    set -- --npp --real "$@"
    ;;
  *)
    echo "Usage: $0 {1|2|3} [args...]"
    echo "  1 = --tlq --real"
    echo "  2 = --tl --real"
    echo "  3 = --npp --real"
    exit 1
    ;;
esac

exec /usr/local/bin/knor "$@"