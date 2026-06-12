#! /usr/bin/env -S bash -l

set -e

echo "* Re-create Fedora Distrobox *"

distrobox assemble create \
 --file fedora-distrobox.ini

pushd command-line-installers > /dev/null
  distrobox enter fedora-distrobox  -- ./fedora-installs.sh
  distrobox enter fedora-distrobox  -- ./1-command-line-setup.sh

popd > /dev/null

echo "* Finished Re-create Fedora Distrobox *"
echo ""
