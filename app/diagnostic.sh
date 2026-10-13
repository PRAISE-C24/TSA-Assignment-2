#!/usr/bin/env bash

# Exit Code Constants
EXIT_SUCCESS=0
EXIT_FAILURE=1
EXIT_INVALID=2

# Display usage instructions
usage() {
    echo "Usage: $0 <command> [arguments]"
    echo ""
    echo "Commands:"
    echo "  system           Display useful Linux system information."
    echo "  network <host>   Check the supplied host (ping check)."
    echo "  disk             Display disk space information."
    echo "  help             Display commands and usage."
}

# System Information Command
cmd_system() {
    echo "=== System Information ==="
    echo -n "Uptime: " && uptime
    echo -n "Kernel: " && uname -r
    if [ -f /etc/os-release ]; then
        echo -n "OS:     " && grep PRETTY_NAME /etc/os-release | cut -d= -f2 | tr -d '"'
    fi
    echo ""
    echo "--- Memory Usage ---"
    free -h || free
    return $EXIT_SUCCESS
}

# Network Check Command
cmd_network() {
    local host="$1"
    
    if [ -z "$host" ]; then
        echo "Error: Missing argument <host> for network command." >&2
        return $EXIT_INVALID
    fi
    
    echo "Checking connectivity to '$host'..."
    # Send 3 ping packets
    if ping -c 3 -W 2 "$host" >/dev/null 2>&1; then
        echo "Success: $host is reachable."
        return $EXIT_SUCCESS
    else
        echo "Operational Failure: Could not reach $host." >&2
        return $EXIT_FAILURE
    fi
}

# Disk Information Command
cmd_disk() {
    echo "=== Disk Information ==="
    df -h
    return $?
}

# --- Main Entry Point ---

if [ $# -eq 0 ]; then
    usage
    exit $EXIT_INVALID
fi

COMMAND="$1"
shift

case "$COMMAND" in
    system)
        cmd_system
        exit $?
        ;;
    network)
        cmd_network "$@"
        exit $?
        ;;
    disk)
        cmd_disk
        exit $?
        ;;
    help)
        usage
        exit $EXIT_SUCCESS
        ;;
    *)
        echo "Error: Invalid command '$COMMAND'." >&2
        echo "" >&2
        usage
        exit $EXIT_INVALID
        ;;
esac