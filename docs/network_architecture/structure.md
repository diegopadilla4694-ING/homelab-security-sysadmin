#  Network Architecture and Devices

## Network Topology

```mermaid
graph TD
    subgraph Local Network - POCO M5s Hotspot [Subnet 10.206.103.0/24]
        A[POCO M5s Hotspot<br/>Router / DHCP]

        subgraph Server
            B[ASUS - Ubuntu Server<br/>Static IP: 10.206.103.137<br/>Ports: SSH 22 / Netdata 19999]
        end

        subgraph Client
            C[ThinkPad - Windows + WSL2<br/>Dynamic IP: Hyper-V NAT<br/>GitHub CLI / Copilot CLI]
        end

        A -->|WiFi| B
        A -->|WiFi| C
        C -->|SSH Connection| B
    end
```

##  Addressing and Interfaces Table
| Device | Role | Operating System | Interface | Local IP | Active Services |
| :--- | :--- | :--- | :--- | :--- | :--- |
| **ASUS** | Main Server | Ubuntu Server | `wlo1` | `10.206.103.137` | SSH (`22`), Netdata (`19999`) |
| **ThinkPad** | Client / Console | WSL2 (Ubuntu) | `eth0` | Dynamic | GitHub CLI, Copilot CLI |