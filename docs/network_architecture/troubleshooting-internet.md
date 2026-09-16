# Resolution Log: Persistent Network Configuration with Netplan

## Problem
When switching the ASUS server to a different network (Wi-Fi/Hotspot), the system failed to automatically bring up the `wlo1` interface with Internet access after a reboot, preventing me from connecting remotely from my client laptop to the server.

## Diagnosis
The server runs an Ubuntu Server distribution that does not use traditional graphical network managers; instead, it handles persistent network configuration via YAML files within the OS, which are parsed by **Netplan**.

## Solution
1. I had to edit the default network configuration file located in `/etc/netplan/`.
2. I corrected the structure of the `.yaml` file, ensuring proper syntax and spacing/indentation, and enabled `dhcp4: true` for the `wlo1` interface.
3. Finally, I applied the rules to the kernel's network stack by executing:
   ```bash
   sudo netplan apply

The configuration used to enable DHCP on the `wlo1` interface is documented below:

```yaml
network:
  version: 2
  renderer: networkd 
  wifis:
    wlo1:
      dhcp4: true  <- This was the line I edited to enable the DHCP service.
      access-points:
        "TU_RED_WIFI": <- I set up the mobile network here (POCO M5S).
          password: "NETWORK_PASSWORD"
```



## Conclusions and Lessons Learned

Addressing this issue involved diagnosing and resolving a lack of Internet connectivity on the ASUS server.

This process marked my first practical experience with the syntax and structure of `.yaml` files in Linux environments. I learned to interpret, structure, and implement configuration files for **Netplan** (Ubuntu's network abstraction engine) from scratch, adhering to the strict indentation required by this format.

By declaring the `dhcp4: true` property within the wireless interface block (`wlo1`), the network daemon successfully requested and was assigned the IP address, subnet mask, and default gateway provided by the access point.

---

## Network Architecture and Commercial Firewall Bypass

During the project's initial phase, a total block on local communication (ICMP/Ping packets and SSH sessions on port 22) was identified between the **ThinkPad** laptop and the **ASUS** server when connected to the residential modem.

### Infrastructure Diagnosis:
1. **Layer 3 (Modem) Inspection:** The modem's web administration interface was accessed via a direct Ethernet cable connection.
2. **Root Cause:** The modem featured "Client Isolation" policies and an internal firewall configured by the Internet Service Provider (ISP) that dropped traffic between LAN and Wi-Fi interfaces, with no option to disable this locally.

### Implemented Solution:
To eliminate reliance on the ISP and ensure a controlled, secure testing environment, the network architecture was migrated to a hotspot provided by a **POCO M5s** mobile device.

This topology served as the default gateway, enabling correct packet routing, dynamic IP assignment via DHCP, and the successful establishment of an SSH session from the ThinkPad to the ASUS server.