# Node (node)

marmelab's standard Node.js development container, with build-essential, sudo, and a non-root node user. The Node version and Debian variant are selectable.

## Options

| Options Id   | Description       | Type   | Default Value |
| ------------ | ----------------- | ------ | ------------- |
| imageVariant | Node image to use | string | 24-trixie     |

## What's included

This template provides a Node.js development environment based on the official [`node`](https://hub.docker.com/_/node) Debian images, plus the conveniences marmelab projects expect:

- **Node.js & npm**: version selected via the `imageVariant` option.
- **`build-essential`**: a C/C++ toolchain (`gcc`, `make`, and friends) for building native npm modules.
- **`sudo`**: passwordless `sudo` for the `node` user, so you can install extra OS packages without rebuilding.
- **Non-root `node` user**: the container runs as the unprivileged `node` user by default.
- **`DEVCONTAINER=true`**: set so tooling and scripts can detect they run inside a Dev Container.

## Selecting a Node version

Use the `imageVariant` option to pick the Node major version and Debian base (`trixie` or `bookworm`). It maps directly to a `node:<imageVariant>` image tag, so any [official tag](https://hub.docker.com/_/node/tags) works even if it isn't in the proposals list.

```jsonc
// .devcontainer/devcontainer.json
"image": "node:24-trixie" // produced from "imageVariant": "24-trixie"
```

## Customizing

After applying the template, you own the generated `.devcontainer/` files. Common changes:

- **System packages**: add them to the `apt-get install` line in `.devcontainer/Dockerfile`.
- **Features, extensions, ports, lifecycle commands**: edit `.devcontainer/devcontainer.json` to add [Features](https://containers.dev/features), VS Code extensions, forwarded ports, or hooks such as `postCreateCommand`.
