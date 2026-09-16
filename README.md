# <img src="https://cdn.jsdelivr.net/gh/devicons/devicon/icons/ubuntu/ubuntu-original.svg" width="38" height="38" valign="bottom"> Home Lab - SysAdmin & Cibersecurity


![Ubuntu Server](https://img.shields.io/badge/OS-Ubuntu_Server_22.04_LTS-E95420?style=for-the-badge&logo=ubuntu&logoColor=white)
![WSL2](https://img.shields.io/badge/Environment-WSL2_Ubuntu-0078D4?style=for-the-badge&logo=windows-terminal&logoColor=white)
![Copilot](https://img.shields.io/badge/CLI-GitHub_Copilot-181717?style=for-the-badge&logo=github&logoColor=white)

## **Project Description**

This project documents a hands-on **SysAdmin and Cybersecurity** lab consisting of two nodes connected via a hotspot:

- **Ubuntu Server:** A server node for deploying services, managing users and permissions, configuring networks, collecting logs, and implementing security controls.
- **ThinkPad with WSL2:** A client node and administration workstation for running tools, testing connections, automating tasks, and simulating operational and defensive scenarios.

The lab enables the practice—in an isolated and reproducible manner—of service installation and hardening, remote administration via SSH, network verification, event monitoring, backups, and incident analysis. Activities are conducted exclusively on the lab's own systems, prioritizing the documentation of changes, configuration validation, and error recovery.


## Documentation Navigation

- **Network Architecture and Design:**
  - [Network Topology and IP Map (netwok setup)](docs/architecture/network-setup.md)
- **Security and Hardening:** *(In development)*
- **Automation Scripts:** *(In development)*


### Repository Structure

```bash
.
├── LICENSE
├── README.md
├── docs/
│   ├── architecture/
│   │   ├── network-setup.md
│   │   └── structure.md
│   └── security/
│       └── ssh-hardening.md
└── src/
    └── bash/
        └── sys-info.sh
```

---
*Documentation generated and maintained directly from the terminal
