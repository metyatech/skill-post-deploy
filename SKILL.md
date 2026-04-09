---
name: post-deploy
description: Use when verifying deployment after code changes to globally linked packages (npm link), running services, daemons, or scheduled tasks. Triggers when code changes affect a globally installed CLI or a running service. Do not use for general development, CI setup, or initial deployments.
---

# Post-change deployment procedures

## Detection

### Globally linked packages

- The agent MUST run `npm ls -g --depth=0` and look for entries
  with `->` pointing to a local path.
- If the changed repository matches a globally linked package, the
  agent MUST proceed to rebuild.

### Running services and scheduled tasks

- The agent MUST check for running processes associated with the
  repository (service names, PM2/systemd/Windows service entries).
- The agent MUST check for scheduled tasks (cron, Windows Task
  Scheduler) referencing the repository.

## Rebuild and verify

### npm-linked packages

1. Run the repository's build command (e.g., `npm run build`,
   `tsc`).
2. Verify the rebuilt output by running the CLI's `--version` or a
   smoke command.
3. Report the verified version.

### Services and daemons

1. Rebuild the service component.
2. Restart using the service manager (PM2 restart, systemctl
   restart, etc.).
3. Verify with deterministic evidence:
   - New PID (compare before and after).
   - Port check (verify listening).
   - Service status query.
   - Log entry showing updated behavior or version.
4. Report the verification evidence.

## Completion gate

- The agent MUST NOT claim completion until the running instance
  reflects the changes. The agent MUST include verification
  evidence in the final response.
