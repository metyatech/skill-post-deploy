---
name: post-deploy
description: Use when verifying deployment after code changes to globally linked packages, running services, daemons, or scheduled tasks. Triggers when code changes affect a globally installed tool or a running instance. Do not use for general development, CI setup, or initial deployments.
---

# Post-change deployment procedures

## Detection

### Globally linked packages

- Check for packages that are linked to a local path rather than installed from a registry.
- If the changed repository matches a linked package, proceed to rebuild.

### Running instances and scheduled tasks

- Check for running processes or services associated with the repository.
- Check for scheduled tasks or background jobs referencing the repository.

## Rebuild and verify

### Linked packages

1. Execute the repository's build procedure if applicable.
2. Verify the rebuilt output by executing a basic command (e.g., checking version).
3. Confirm the verified version reflects the expected state.

### Running instances and background tasks

1. Rebuild the service or application component.
2. Restart the instance using the appropriate process or service manager.
3. Verify with deterministic evidence:
   - Identify a change in process identification (e.g., PID).
   - Confirm active status (e.g., network port check).
   - Query the service manager for status.
   - Inspect logs for confirmation of updated behavior or version.
4. Document the verification evidence.

## Completion gate

Do not claim completion until the running instance reflects the changes. Include verification evidence in the final response.
