# Network Hardening: UFW (Uncomplicated Firewall) Configuration.

## Configuration Overview.
I implemented a **default-deny security policy** on the ASUS server node. All unauthorized incoming traffic is rejected by default, limiting the attack surface to essential services only.

---

## Commands used to configure the server firewall.

To secure the ASUS server, run the following commands in order:

```bash
# 1. ALLOW SSH FIRST (It is crucial to enable SSH to avoid losing access to the server from my laptop).
sudo ufw allow 22/tcp

# 2. SET DEFAULT POLICIES
# Block all traffic coming from outside my network to secure the server.
sudo ufw default deny incoming

# This command allows the server to respond and initiate traffic to the external network.
sudo ufw default allow outgoing

# 3. ENABLE THE FIREWALL SERVICE.
sudo ufw enable

# 4. CHECK AND QUERY THE FIREWALL.
sudo ufw status verbose
```


## Automated Audit Script.

The script `src/bash/check-firewall.sh` was implemented to audit network security.

### Functionality:
1. Checks the status and active rules of the firewall (UFW) (`sudo ufw status verbose`).
2. Displays listening TCP/UDP ports using the script's automated routine with the `sudo ss -tuln` command.

### Script execution modes:
```bash
# Grant execution permissions (only the first time).
chmod +x src/bash/check-firewall.sh

# Run the script.
./src/bash/check-firewall.sh