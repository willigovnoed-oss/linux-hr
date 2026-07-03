#!/usr/bin/env bash
#
# Linux HR -- build script
# Wraps debian live-build to produce a bootable Linux HR ISO.
#
set -euo pipefail

if [[ $EUID -ne 0 ]]; then
  echo "[!] run this as root: sudo ./build.sh" >&2
  exit 1
fi

if ! command -v lb &> /dev/null; then
  echo "[*] live-build not found, installing..."
  apt-get update
  apt-get install -y live-build
fi

echo "[*] configuring Linux HR build (Debian bookworm base)..."
lb config \
  --distribution bookworm \
  --archive-areas "main contrib non-free non-free-firmware" \
  --debian-installer false \
  --binary-images iso-hybrid \
  --iso-application "Linux HR" \
  --iso-volume "LINUX_HR" \
  --iso-publisher "linux-hr project" \
  --bootappend-live "boot=live components hostname=linux-hr username=hr locales=en_US.UTF-8"

echo "[*] building ISO -- this can take 20-60+ minutes depending on connection..."
lb build

echo "[+] done. look for linux-hr-*.iso in this directory."
echo "[+] test it with: qemu-system-x86_64 -m 2048 -cdrom linux-hr-*.iso"
