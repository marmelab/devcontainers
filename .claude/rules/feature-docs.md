# Feature documentation

Applies when adding or changing a local Dev Container Feature under `.devcontainer/<feature>/`.

When you add a feature (a folder with `devcontainer-feature.json` and `install.sh`), update docs in the same change:

- Write the feature's own `README.md` in `.devcontainer/<feature>/`. Cover what it does, requirements, and usage. Link to `install.sh` and `devcontainer-feature.json`.
- Update the root [README.md](../../README.md):
  - Add the feature to the "Repository structure" tree.
  - Mention it in "Developing this repository" if the repo's own Dev Container uses it.

When you add or change functionality in a published template under `src/<template-id>/`, update both its `README.md` and its `NOTES.md` by hand, keeping them in sync. Neither is auto-generated (doc generation was removed from the release workflow), so edits stick and must be made directly.

Keep docs in sync when a feature's behaviour, options, or mounts change. Follow [writing-style.md](writing-style.md).
