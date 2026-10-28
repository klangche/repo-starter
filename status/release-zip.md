---
task: Add release-zip.yml for PowerShell and HTML releases
who: Claude Code
state: Review
branch: feat/release-zip
files: .github/workflows/release-zip.yml
plan: |
  - zip src/ with READ_ME_FIRST.txt at the root, named <name>-<version>-<platform>.zip, check: run the build step locally on a sample src/
  - publish the zip as a GitHub release for the tag, check: YAML parses, gh release command reviewed
reviewer:
review:
updated: 2026-10-28
---
Triggered by a vX.Y.Z tag. Reusable with inputs name and platform.
