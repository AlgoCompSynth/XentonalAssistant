#! /usr/bin/env -S bash -l

set -e

source set-container-envars > /dev/null

# https://docs.ollama.com/linux#install
echo "..Stopping existing ollama.service if any"
sudo systemctl disable --now ollama.service > /dev/null 2>&1 || true
echo "..Installing Ollama with official installer"
curl -fsSL https://ollama.com/install.sh | sh > /dev/null 2>&1

echo "..Fixing model storage owner:group"
sudo systemctl disable --now ollama.service > /dev/null 2>&1
sudo chown --recursive ollama:ollama /usr/share/ollama
sudo systemctl enable --now ollama.service
systemctl status ollama.service
