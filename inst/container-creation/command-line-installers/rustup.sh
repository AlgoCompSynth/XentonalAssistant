#! /usr/bin/env -S bash -l

set -e

source set-container-envars

echo "..Installing RustUp"
curl --proto '=https' --tlsv1.2 -sSf https://sh.rustup.rs | sh -s -- -y
