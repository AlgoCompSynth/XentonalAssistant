#! /usr/bin/env -S bash -l

set -e

source set-container-envars

# https://docs.ollama.com/linux#install
echo "..Stopping existing ollama.service if any"
sudo systemctl disable --now ollama.service || treu
echo "..Installing Ollama with official installer"
curl -fsSL https://ollama.com/install.sh | sh || true

echo "..Fixing model storage owner:group"
sudo systemctl disable --now ollama.service || true
sudo chown --recursive ollama.ollama /usr/share/ollama
sudo systemctl enable --now ollama.service
systemctl status ollama.service

echo ""
ollama list

echo "** Finished Ollama **"
echo ""
