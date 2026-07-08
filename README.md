# marmelab Dev Container Templates

Reusable [Dev Container](https://containers.dev/) templates for marmelab projects.

A Dev Container is a fully configured, reproducible development environment that runs in a container. These templates let any marmelab project bootstrap a consistent environment in seconds — same Node version, same tooling, same conventions — whether you open it in [VS Code](https://code.visualstudio.com/docs/devcontainers/containers), a JetBrains IDE, or [GitHub Codespaces](https://github.com/features/codespaces).

## Available templates

| Template          | ID     | Description                                                                                                                                                                                 |
| ----------------- | ------ | ------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------- |
| [Node](src/node/) | `node` | Node.js development container with `build-essential` and `sudo`, running as a non-root `node` user. The Node major version and Debian variant are selectable via the `imageVariant` option. |

## Using a template

These templates are published as OCI artifacts to GitHub Container Registry under `ghcr.io/marmelab/devcontainers`.

### From VS Code

1. Open the Command Palette (`Ctrl/Cmd + Shift + P`).
2. Run **Dev Containers: Add Dev Container Configuration Files…**
3. Choose **Show All Definitions…**, then search for the marmelab template you want.

### From the CLI

Install the [Dev Container CLI](https://github.com/devcontainers/cli) and apply a template into your project:

```sh
npm install -g @devcontainers/cli

# Apply the Node template into the current project
devcontainer templates apply \
  --template-id ghcr.io/marmelab/devcontainers/node:latest \
  --workspace-folder .
```

This drops a `.devcontainer/` folder into your project. Open the project in your IDE and choose **Reopen in Container**.

## Repository structure

```
.
├── .devcontainer/          # Dev Container used to develop THIS repository
│   └── claude-code/        #   └─ local feature that installs the Claude Code CLI
├── src/                    # Published templates (one folder per template)
│   └── node/
│       ├── .devcontainer/  #   └─ the files copied into a consuming project
│       ├── devcontainer-template.json  # template metadata & options
│       ├── README.md       #   └─ template documentation (hand-written)
│       └── NOTES.md        #   └─ extra notes for template consumers
├── test/                   # Smoke tests, one folder per template + shared utils
│   ├── node/test.sh
│   └── test-utils/test-utils.sh
└── .github/
    ├── actions/smoke-test/ # Composite action: build a template + run its tests
    └── workflows/          # CI (test on PR) and release (publish templates)
```

## Adding a new template

1. Create `src/<template-id>/` containing a `devcontainer-template.json` and a `.devcontainer/` folder. Use `${templateOption:<name>}` placeholders for any configurable values declared under `options`.
2. Add smoke tests in `test/<template-id>/test.sh` (see [Testing](#testing)).
3. Reference the new template's path in the PR test filter in [test-pr.yaml](.github/workflows/test-pr.yaml) so CI picks it up.
4. Document the template in `src/<template-id>/README.md`, and add any extra consumer notes in `src/<template-id>/NOTES.md`.

## Testing

Each template has a smoke test under `test/<template-id>/test.sh` that uses the shared helpers in [test/test-utils/test-utils.sh](test/test-utils/test-utils.sh). The [smoke-test composite action](.github/actions/smoke-test/action.yaml) builds the template with the Dev Container CLI (resolving option defaults) and runs the test script inside the resulting container.

Run a smoke test locally (requires Docker, the Dev Container CLI, and `jq`):

```sh
npm ci

# Build the container for the template
.github/actions/smoke-test/build.sh node

# Run the smoke test inside it
.github/actions/smoke-test/test.sh node
```

CI runs these automatically on every pull request that touches a template — see [test-pr.yaml](.github/workflows/test-pr.yaml).

## Releasing

Publishing is manual and gated to `main`. Trigger the **Release Dev Container Templates** workflow ([release.yaml](.github/workflows/release.yaml)) via _workflow_dispatch_. It publishes every template under `src/` to `ghcr.io/marmelab/devcontainers`.

## Developing this repository

This repo ships its own Dev Container ([.devcontainer/](.devcontainer/)) so you can work on the templates with a consistent environment. It builds on the same Node base and adds a local [`claude-code` feature](.devcontainer/claude-code/) that installs the [Claude Code](https://www.anthropic.com/claude-code) CLI and mounts your host Claude credentials. Open the repo in VS Code and choose **Reopen in Container**.

## License

[MIT](LICENSE.md) © marmelab
