# Claude Code

A local [Dev Container Feature](https://containers.dev/implementors/features/) that installs the [Claude Code](https://www.anthropic.com/claude-code) CLI into the container.

This feature is used by **this repository's own Dev Container** ([../devcontainer.json](../devcontainer.json)) to give contributors Claude Code while working on the templates. It is referenced locally (`"./claude-code": {}`) and is **not** part of the published `node` template.

## What it does

- **Installs the Claude Code CLI** ([install.sh](install.sh)) — downloads and runs the official installer from `https://claude.ai/install.sh` as the container user, and adds `$HOME/.local/bin` to the `PATH` in `~/.bashrc`.
- **Mounts your host credentials and config** so Claude Code is already authenticated inside the container ([devcontainer-feature.json](devcontainer-feature.json)):
  - `~/.claude.json` → `/home/node/.claude.json`
  - `~/.claude` → `/home/node/.claude`
- **Installs the VS Code extension** `Anthropic.claude-code`.

## Requirements

You must already have Claude Code set up on your host machine, i.e. a `~/.claude.json` file and a `~/.claude` directory must exist — they are bind-mounted into the container. If they don't exist, create them (e.g. by running Claude Code once on the host) before opening the Dev Container.

## Usage

It is wired into the repository's Dev Container, so no setup is required — open the repo in VS Code and **Reopen in Container**. To reuse it in another Dev Container in this repo, reference it relatively:

```jsonc
// devcontainer.json
"features": {
  "./claude-code": {}
}
```
