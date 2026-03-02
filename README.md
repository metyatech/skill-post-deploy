# skill-post-deploy

Agent skill for verifying deployment after code changes. Covers globally linked npm packages, running services, daemons, and scheduled tasks.

## Overview

This skill provides procedures for detecting and verifying post-change deployment requirements:

- **Globally linked packages**: Detects `npm link`ed packages and guides rebuild + verification.
- **Running services**: Detects services/daemons powered by the changed repo and guides restart + verification.
- **Completion gate**: Ensures the running instance reflects the code changes before claiming completion.

## Install

```powershell
npx skills add metyatech/skill-post-deploy --yes --global
```

## Supported Environments

- Windows (PowerShell)
- macOS/Linux (Bash/Zsh)
- Node.js (for `npm` linked package detection)

## When it triggers

- After code changes to a repository that is globally installed via `npm link`.
- After code changes to a repository that powers a running service, daemon, or scheduled task.

## Usage Examples

### npm-linked package

When an agent modifies a package that is linked globally (e.g., `agent-rules`), it should:
1. Detect the link: `npm ls -g --depth=0`
2. Rebuild: `npm run build`
3. Verify: `my-cli --version`

### Windows Service

When an agent modifies a service:
1. Rebuild the service logic.
2. Restart: `Restart-Service -Name "MyService"`
3. Verify: `Get-Service -Name "MyService"` and check logs.

## Development

Since this repository contains primarily Markdown documentation (`SKILL.md`), development involves ensuring the procedures are accurate and follow the [Agent Skills specification](https://agentskills.io/specification).

### Verification

To verify changes to this skill:
1. Ensure `SKILL.md` frontmatter is correct and platform-agnostic.
2. Run `compose-agentsmd` to update project rules.
3. Validate Markdown formatting.

## Related Rules

The post-change deployment section in the `command-execution` rule module ([AGENTS.md](AGENTS.md)) provides the invariant (always check deployment needs after code changes). This skill provides the detailed procedures.

## Community Health

- [CONTRIBUTING.md](CONTRIBUTING.md)
- [SECURITY.md](SECURITY.md)
- [LICENSE](LICENSE)
