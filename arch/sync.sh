#!/bin/bash

set -e

echo "[$(date)] sync.sh started" >> /var/log/sync.log

MIRROR_DIR="/var/www/html/arch"
REMOTE="rsync://mirrors.edge.kernel.org/archlinux/"

mkdir -p "$MIRROR_DIR"
rsync -rtlH --delete-after --delay-updates --safe-links --progress "$REMOTE" "$MIRROR_DIR" >> /var/log/sync.log 2>&1
