#!/bin/bash
# ╔══════════════════════════════════════════════════════════════════════╗
# ║   Ubuntu Server Base Template Setup - Minimal Docker Environment     ║
# ║   Author: Rudimental / Alluniux                                      ║
# ║   Description: Converts a fresh Ubuntu install into a clean          ║
# ║   golden image template with Docker + Nano preinstalled.             ║
# ╚══════════════════════════════════════════════════════════════════════╝

set -e

echo "🚀 Starting Ubuntu Base Template Configuration..."

# ──────────────────────────────────────────────
# 1️⃣ Update and upgrade system
# ──────────────────────────────────────────────
echo "🔧 Updating system..."
apt update -y && apt upgrade -y
apt autoremove -y && apt clean

# ──────────────────────────────────────────────
# 2️⃣ Install essentials
# ──────────────────────────────────────────────
echo "📦 Installing Nano, Curl, and basic tools..."
apt install -y nano curl apt-transport-https ca-certificates software-properties-common gnupg lsb-release

# ──────────────────────────────────────────────
# 3️⃣ Install Docker Engine (Official Script)
# ──────────────────────────────────────────────
echo "🐳 Installing Docker..."
curl -fsSL https://get.docker.com -o get-docker.sh
bash get-docker.sh
rm -f get-docker.sh

# Enable and start Docker
systemctl enable docker
systemctl start docker

# ──────────────────────────────────────────────
# 4️⃣ Install Docker Compose Plugin
# ──────────────────────────────────────────────
echo "⚙️ Installing Docker Compose plugin..."
apt install -y docker-compose-plugin

# ──────────────────────────────────────────────
# 5️⃣ Add user to Docker group
# ──────────────────────────────────────────────
CURRENT_USER=$(logname 2>/dev/null || echo $SUDO_USER)
if [ -n "$CURRENT_USER" ]; then
  echo "👤 Adding user '$CURRENT_USER' to Docker group..."
  usermod -aG docker "$CURRENT_USER"
fi

# ──────────────────────────────────────────────
# 6️⃣ Clean identifiers and traces
# ──────────────────────────────────────────────
echo "🧹 Cleaning unique identifiers and logs..."
truncate -s 0 /etc/machine-id || true
truncate -s 0 /var/lib/dbus/machine-id || true
rm -f /etc/ssh/ssh_host_*
journalctl --rotate && journalctl --vacuum-time=1s || true
rm -rf /var/log/* /tmp/* /var/tmp/*

# ──────────────────────────────────────────────
# 7️⃣ Clear command history
# ──────────────────────────────────────────────
echo "🧽 Clearing shell history..."
history -c || true
cat /dev/null > ~/.bash_history || true

# ──────────────────────────────────────────────
# 8️⃣ Create useful aliases (quality of life)
# ──────────────────────────────────────────────
echo "⚡ Adding quality-of-life aliases..."
cat <<'EOF' >> /etc/bash.bashrc

# ── Rudimental Base Aliases ─────────────────────────────
alias ll='ls -lh --color=auto'
alias cls='clear'
alias dps='docker ps --format "table {{.Names}}\t{{.Status}}\t{{.Ports}}"'
EOF

# ──────────────────────────────────────────────
# 9️⃣ Final cleanup
# ──────────────────────────────────────────────
echo "🧩 Final cleanup..."
apt clean -y
sync

echo ""
echo "✅ Base Template Configuration Complete!"
echo "⚠️ IMPORTANT: Reboot the system before cloning or templating."
echo ""
echo "👉 After reboot, this system will have:"
echo "   - Docker Engine & Compose preinstalled"
echo "   - Nano ready"
echo "   - Clean system logs and identifiers"
echo "   - User '$CURRENT_USER' with Docker access"
echo ""
echo "💡 Tip: Run 'docker run hello-world' after reboot to confirm Docker works."
echo ""
