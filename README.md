# setupvUbuntu Server as Base Template for Cloud Machines Images:


1. Ejecución:
  sudo bash setup-base-template.sh

2. Crear Script:
   nano setup-base-template.sh

3. Dale permisos y ejecútalo:
  chmod +x setup-base-template.sh
sudo ./setup-base-template.sh

4. sudo reboot

5. Probar con:
     docker run hello-world



🧩 Resultado

Tendrás una imagen minimalista, estable y profesional como base para:

VPS, Proxmox Templates, VMware Templates, Cloud Images, etc.

Instantáneas limpias para tus entornos de desarrollo con Docker.

¿Quieres que te genere también una versión de este script adaptada a Proxmox (para crear automáticamente una VM template con cloud-init y esta configuración dentro)?
Así podrías clonar máquinas Docker-ready en segundos desde el panel.

___________________________


# 🧱 Ubuntu Server Base Template Setup  
### _Minimal Docker Environment — Golden Image Builder_

#### Author: **Rudimental / Alluniux**  
#### Version: `1.0`  
#### License: `MIT`  
#### Compatible OS: **Ubuntu Server 20.04+ / 22.04+**

---

## 📘 Overview

This script automates the **initial setup and hardening of a fresh Ubuntu Server installation**, transforming it into a **clean, minimal, and production-ready base template** with **Docker Engine** and **Nano** preinstalled.  

It is designed for **golden image creation**, **template cloning**, or **cloud image pipelines**, ensuring every instance starts from a **standardized, secure, and trace-free baseline**.

---

## ⚙️ Features

✅ **System Upgrade & Cleanup** — Updates and removes unnecessary packages and caches  
🐳 **Docker Engine Installation** — Official Docker installation (latest stable)  
⚙️ **Docker Compose Plugin** — Adds modern Compose v2 plugin support  
👤 **User Integration** — Automatically adds the active user to the Docker group  
🧹 **Identity Sanitization** — Cleans unique identifiers (machine-id, SSH keys, logs)  
🧽 **History Purge** — Clears all shell command history and temporary files  
💡 **Quality of Life Enhancements** — Adds useful system-wide aliases (`ll`, `cls`, `dps`)  
🔒 **Ready for Cloning** — Ideal for VM templates, containers, or base server images  

---

## 🖥️ Requirements

| Requirement | Description |
|--------------|-------------|
| **Operating System** | Ubuntu Server 20.04 LTS or higher |
| **Privileges** | Must be run as **root** or with **sudo** |
| **Internet Access** | Required to fetch Docker installation script |
| **Fresh System** | Recommended for clean base image creation |

---

## 🚀 Installation & Usage

### 1️⃣ Clone or Copy the Script

```bash
curl -O https://your-repo-or-storage-link/setup-base-template.sh
chmod +x setup-base-template.sh
````

### 2️⃣ Run the Script with Root Privileges

```bash
sudo ./setup-base-template.sh
```

You’ll see clear progress logs during execution:

```
🚀 Starting Ubuntu Base Template Configuration...
🔧 Updating system...
🐳 Installing Docker...
⚙️ Installing Docker Compose plugin...
🧩 Final cleanup...
✅ Base Template Configuration Complete!
```

---

## 🔁 Post-Installation Steps

After the setup completes:

1. **Reboot the system** to apply group and service changes:

   ```bash
   sudo reboot
   ```

2. **Verify Docker installation**:

   ```bash
   docker run hello-world
   ```

3. **Confirm user access** (without `sudo`):

   ```bash
   docker ps
   ```

If no permission errors appear, Docker is correctly configured for your user.

---

## 🧩 Resulting Environment

| Component          | Description                                         |
| ------------------ | --------------------------------------------------- |
| **Docker Engine**  | Installed via official `get.docker.com` script      |
| **Docker Compose** | Installed as a plugin (`docker compose`)            |
| **Nano**           | Lightweight text editor preinstalled                |
| **Aliases**        | `ll`, `cls`, `dps` added globally                   |
| **Clean State**    | Logs, machine IDs, SSH keys, and temp files removed |
| **User Access**    | `$USER` added to `docker` group                     |

---

## 🧠 Usage Scenarios

This setup is ideal for:

* 🧱 **Base VM Templates** (VMware, Proxmox, VirtualBox, Hyper-V)
* ☁️ **Cloud Image Builders** (Packer, Terraform, Ansible pipelines)
* 🐳 **Docker Host Nodes** for microservice clusters
* ⚙️ **CI/CD Base Runners**
* 💽 **Golden Images** for reproducible deployments

---

## ⚠️ Notes & Best Practices

* Run only on **fresh Ubuntu installations** to avoid overwriting existing configurations.
* Always **reboot before cloning or snapshotting** to ensure a clean system state.
* If using in automation pipelines, run non-interactively:

  ```bash
  sudo bash setup-base-template.sh < /dev/null
  ```
* You may extend the alias section in `/etc/bash.bashrc` to include custom commands.

---

## 🧾 Example Output Summary

After execution, your console will show:

```
✅ Base Template Configuration Complete!
⚠️ IMPORTANT: Reboot the system before cloning or templating.

👉 After reboot, this system will have:
   - Docker Engine & Compose preinstalled
   - Nano ready
   - Clean system logs and identifiers
   - User 'ubuntu' with Docker access

💡 Tip: Run 'docker run hello-world' after reboot to confirm Docker works.
```

---

## 🏷️ Metadata

| Field              | Value                                |
| ------------------ | ------------------------------------ |
| **Author**         | Rudimental / Alluniux                |
| **Script Version** | 1.0                                  |
| **Created On**     | October 2025                         |
| **Purpose**        | Ubuntu Base Image Preparation        |
| **Tested On**      | Ubuntu 22.04.4 LTS (Jammy Jellyfish) |

---

## 🧰 Optional Enhancements

You can extend this setup with:

* 🔒 Automatic SSH hardening (fail2ban, UFW)
* 🧬 System baseline scanning (Lynis, CIS)
* 📦 Preloaded Docker images for CI/CD
* ⚡ Custom aliases or MOTD branding

---

## 🧡 Credits

Developed by **Rudimental / Alluniux**

> Building the foundation of reliable and autonomous infrastructure.


















