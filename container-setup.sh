#!/usr/bin/env bash
set -euo pipefail

pacman -Syu --noconfirm sudo fish git base-devel
useradd -m -G wheel -s /usr/bin/fish tester
echo 'tester:test' | chpasswd
echo '%wheel ALL=(ALL:ALL) ALL'       > /etc/sudoers.d/wheel
echo 'tester ALL=(ALL:ALL) NOPASSWD: ALL' > /etc/sudoers.d/nopasswd
chmod 440 /etc/sudoers.d/wheel /etc/sudoers.d/nopasswd
