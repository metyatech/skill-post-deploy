# skill-post-deploy

Agent skill for verifying deployment after code changes. Covers globally linked npm packages, running services, daemons, and scheduled tasks.

## Overview

This skill provides procedures for detecting and verifying post-change deployment requirements:

- **Globally linked packages**: Detects `npm link`ed packages and guides rebuild + verification.
- **Running services**: Detects services/daemons powered by the changed repo and guides restart + verification.
- **Completion gate**: Ensures the running instance reflects the code changes before claiming completion.

## Install

```bash
npx skills add metyatech/skill-post-deploy --yes --global
```

## When it triggers

- After code changes to a repository that is globally installed via `npm link`.
- After code changes to a repository that powers a running service, daemon, or scheduled task.

## Related rules

The post-change deployment section in the `command-execution` rule module (AGENTS.md) provides the invariant (always check deployment needs after code changes). This skill provides the detailed procedures.

## License

[MIT](LICENSE)
