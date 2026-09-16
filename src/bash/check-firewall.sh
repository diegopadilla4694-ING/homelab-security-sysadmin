#!/usr/bin/env bash
# ==============================================================================
# Script: check-firewall.sh
# Script Description: Quick audit of the firewall and active TCP/UDP ports on the server node.
# ==============================================================================


# Enables defensive mode in bash to handle potential execution errors.
# --set -e: Stops the script if an error occurs in any command.
# --set -u: Stops the script if an attempt is made to use an undefined variable.
# --set -o pipefail: Stops the script if an error occurs in any command within a pipeline.
set -euo pipefail


# Prints the audit header with the current OS date and time.
echo "=================================================="
echo " SECURITY AND NETWORK AUDIT - $(date '+%Y-%m-%d %H:%M:%S')"
echo "=================================================="
echo ""

# 1. The script checks the status of the firewall (UFW).
echo "[+] Status of the Firewall (UFW):"
if command -v ufw &> /dev/null; then
    sudo ufw status verbose
else
    echo "[-] Error: UFW is not installed on this system."
fi

echo ""
echo "--------------------------------------------------"
echo ""

# 2. The script checks the active TCP/UDP ports on the server node.
echo "[+] Active TCP/UDP Ports on the Server Node:"
if command -v ss &> /dev/null; then
    sudo ss -tuln
else
    echo "[-] Error: The command 'ss' is not available."
fi

echo ""
echo "=================================================="
echo " Audit completed."
echo "=================================================="
