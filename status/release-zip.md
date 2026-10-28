---
task: Add release-zip.yml for PowerShell and HTML releases
who: Claude Code
state: Done
branch: feat/release-zip
files: .github/workflows/release-zip.yml
plan: |
  - zip src/ with READ_ME_FIRST.txt at the root, named <name>-<version>-<platform>.zip, check: run the build step locally on a sample src/
  - publish the zip as a GitHub release for the tag, check: YAML parses, gh release command reviewed
reviewer: separate Claude Code subagent instance (a5f82cabcce0adb98)
review: |
  approved. Fixed: zip only when project-type lists powershell or html.
  Open: BUILD.md says to copy this file, the header also shows a reusable
  wrapper; align in a separate BUILD.md PR. Re-run on an existing release
  fails in gh release create, accepted.
updated: 2026-10-28
---
Triggered by a vX.Y.Z tag. Reusable with inputs name and platform.
