#!/usr/bin/env bash
set -uo pipefail

section() { printf '\n==== %s ====\n' "$1"; }

section "Host"
hostnamectl 2>/dev/null || hostname
date -Is

section "Uptime and load"
uptime

section "Memory"
free -h 2>/dev/null || vmstat -s | head -n 12

section "Filesystem usage"
df -hT -x tmpfs -x devtmpfs 2>/dev/null || df -h

section "Top CPU processes"
ps -eo pid,comm,%cpu,%mem --sort=-%cpu | head -n 8

section "Failed systemd units"
if command -v systemctl >/dev/null 2>&1; then
  systemctl --failed --no-pager || true
else
  echo "systemctl is unavailable on this host."
fi

section "Network listeners"
if command -v ss >/dev/null 2>&1; then
  ss -lntup 2>/dev/null | head -n 20 || true
else
  echo "ss is unavailable on this host."
fi
