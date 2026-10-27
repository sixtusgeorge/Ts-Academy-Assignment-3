#!/usr/bin/env bash
set -uo pipefail

print_help() {
    echo "=== DevOps Tool CLI (Assignment 3) ==="
    echo "Usage: $0 <command> [arguments]"
    echo ""
    echo "Commands:"
    echo "  system-info                Display system information"
    echo "  check-host <host>          Resolve and check host connectivity"
    echo "  check-port <host> <port>   Validate port and check TCP connectivity"
    echo "  help                       Display this help message"
}

if [ $# -lt 1 ]; then
    echo "Error: No command provided." >&2
    print_help >&2
    exit 2
fi

COMMAND="$1"
shift

case "$COMMAND" in
    system-info)
        echo "=== System Information ==="
        echo "Hostname: $(hostname)"
        echo "User: $(whoami)"
        echo "Date: $(date)"
        echo "Kernel: $(uname -r)"
        uptime
        exit 0
        ;;
    check-host)
        if [ $# -lt 1 ]; then
            echo "Error: Missing host argument." >&2
            exit 2
        fi
        HOST="$1"
        echo "Checking host: $HOST"
        if ping -c 2 -W 3 "$HOST" &> /dev/null; then
            echo "Host $HOST is reachable."
            exit 0
        else
            echo "Error: Host $HOST is unreachable or invalid." >&2
            exit 1
        fi
        ;;
    check-port)
        if [ $# -lt 2 ]; then
            echo "Error: Missing host or port argument." >&2
            echo "Usage: $0 check-port <host> <port>" >&2
            exit 2
        fi
        HOST="$1"
        PORT="$2"

        if ! [[ "$PORT" =~ ^[0-9]+$ ]] || [ "$PORT" -lt 1 ] || [ "$PORT" -gt 65535 ]; then
            echo "Error: Invalid port '$PORT'. Must be between 1 and 65535." >&2
            exit 2
        fi

        echo "Checking TCP connectivity to $HOST on port $PORT..."
        if nc -z -w 3 "$HOST" "$PORT" &> /dev/null; then
            echo "Port $PORT on $HOST is OPEN."
            exit 0
        else
            echo "Port $PORT on $HOST is CLOSED or unreachable." >&2
            exit 1
        fi
        ;;
    help|--help|-h)
        print_help
        exit 0
        ;;
    *)
        echo "Error: Invalid command '$COMMAND'." >&2
        print_help >&2
        exit 2
        ;;
esac
