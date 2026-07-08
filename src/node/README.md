# Node (node)

marmelab's standard Node.js development container, with build-essential, sudo, and a non-root node user. The Node version and Debian variant are selectable.

## Options

| Options Id   | Description       | Type   | Default Value |
| ------------ | ----------------- | ------ | ------------- |
| imageVariant | Node image to use | string | 24-trixie     |

## What's included

This template provides a Node.js development environment based on the official [`node`](https://hub.docker.com/_/node) Debian images, plus the conveniences marmelab projects expect:

- **Node.js & npm** — version selected via the `imageVariant` option.
- **`build-essential`** — a C/C++ toolchain (`gcc`, `make`, …) for building native npm modules.
- **`sudo`** — passwordless `sudo` for the `node` user, so you can install extra OS packages without rebuilding.
- **Non-root `node` user** — the container runs as the unprivileged `node` user by default.
- **`g` alias** — `g` is aliased to `git` for the `node` user.
- **`DEVCONTAINER=true`** — set so tooling and scripts can detect they run inside a Dev Container.

## Selecting a Node version

Use the `imageVariant` option to pick the Node major version and Debian base (`trixie` or `bookworm`). It maps directly to a `node:<imageVariant>` image tag, so any [official tag](https://hub.docker.com/_/node/tags) works even if it isn't in the proposals list.

```jsonc
// .devcontainer/devcontainer.json
"image": "node:24-trixie" // produced from "imageVariant": "24-trixie"
```

## Customizing

After applying the template, edit the generated `.devcontainer/Dockerfile` to install additional system packages, or `.devcontainer/devcontainer.json` to add [Features](https://containers.dev/features), VS Code extensions, ports, or lifecycle commands (`postCreateCommand`, etc.).

---

_Note: This file was auto-generated from the [devcontainer-template.json](https://github.com/marmelab/devcontainers/blob/main/src/node/devcontainer-template.json). Add additional notes to a `NOTES.md`._
