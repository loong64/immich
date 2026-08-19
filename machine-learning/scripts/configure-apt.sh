#!/usr/bin/env bash

set -e

cat > /etc/apt/sources.list.d/sid.sources << "EOF"
Types: deb
URIs: http://deb.debian.org/debian
Suites: sid
Components: main contrib non-free non-free-firmware
Signed-By: /usr/share/keyrings/debian-archive-keyring.pgp
EOF

sed -i -e's/ main/ main contrib non-free non-free-firmware/g' /etc/apt/sources.list.d/debian.sources
# sed -i -e's/ bookworm-updates/ bookworm-updates sid/g' /etc/apt/sources.list.d/debian.sources

# default priority is 500, so we set unstable to 450 to prefer stable packages
cat > /etc/apt/preferences.d/preferences << EOL
Package: *
Pin: release a=unstable
Pin-Priority: 450
EOL
