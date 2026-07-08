## Installing

Apply the template to a project with the [Dev Container CLI](https://github.com/devcontainers/cli). This example sets every option:

```sh
devcontainer templates apply \
  --workspace-folder . \
  --template-id "ghcr.io/marmelab/devcontainers/node:latest" \
  --template-args '{"containerName":"My App","imageVariant":"24-trixie","workspaceFolder":"/workspaces/my-app"}'
```

Omit any option from `--template-args` to fall back to its default.

## What's included

This template provides a Node.js development environment based on the official [`node`](https://hub.docker.com/_/node) Debian images, plus the conveniences marmelab projects expect:

- **Node.js & npm**: version selected via the `imageVariant` option.
- **`build-essential`**: a C/C++ toolchain (`gcc`, `make`, and friends) for building native npm modules.
- **`sudo`**: passwordless `sudo` for the `node` user, so you can install extra OS packages without rebuilding.
- **Non-root `node` user**: the container runs as the unprivileged `node` user by default.
- **`DEVCONTAINER=true`**: set so tooling and scripts can detect they run inside a Dev Container.

## Selecting a Node version

Use the `imageVariant` option to pick the Node major version and Debian base (`trixie` or `bookworm`). It maps directly to a `node:<imageVariant>` image tag, so any [official tag](https://hub.docker.com/_/node/tags) works even if it isn't in the proposals list. The value is baked into the `FROM` line of `.devcontainer/Dockerfile`, which the container is built from.

```dockerfile
# .devcontainer/Dockerfile
FROM node:24-trixie # produced from "imageVariant": "24-trixie"
```

## Naming the container

Use the `containerName` option to set the Dev Container display name shown in VS Code. It defaults to `Node`.

```jsonc
// .devcontainer/devcontainer.json
"name": "My App" // produced from "containerName": "My App"
```

## Setting the workspace folder

Use the `workspaceFolder` option to choose where the project is mounted inside the container. It defaults to `/workspaces/${localWorkspaceFolderBasename}`, which mounts the project under `/workspaces/<your-folder-name>`. The bind mount follows this path automatically, so setting the option is enough.

```jsonc
// .devcontainer/devcontainer.json
"workspaceFolder": "/workspaces/my-app" // produced from "workspaceFolder": "/workspaces/my-app"
```

## Customizing

After applying the template, you own the generated `.devcontainer/` files. Common changes:

- **System packages**: add them to the `apt-get install` line in `.devcontainer/Dockerfile`.
- **Features, extensions, ports, lifecycle commands**: edit `.devcontainer/devcontainer.json` to add [Features](https://containers.dev/features), VS Code extensions, forwarded ports, or hooks such as `postCreateCommand`.
