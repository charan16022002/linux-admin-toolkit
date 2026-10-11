# Linux Server Administration Toolkit

Read-only health snapshot for Linux/RHEL troubleshooting. It reports host details, uptime/load, memory, filesystem usage, top CPU processes, failed systemd units, and listening sockets.

## Run

```bash
chmod +x scripts/server_health.sh
./scripts/server_health.sh
```

No root access is required for the basic report, although some process/network details may be hidden by host permissions. Review scripts before running them on production servers.

## Operations checklist

- Check disk usage and identify the affected mount.
- Compare load average with CPU count and workload behavior.
- Review memory and swap pressure.
- Inspect failed services before restarting anything.
- Check recent journal entries for the affected service.
