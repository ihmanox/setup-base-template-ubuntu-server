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
