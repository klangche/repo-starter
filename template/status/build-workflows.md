---
task: Make BUILD.md match how docs/ADOPT.md installs the workflows
who: Claude Code
state: Done
branch: docs/build-workflows
files: template/docs/BUILD.md
plan: |
  - say the five workflows come as full copies through ADOPT.md, wrappers are the alternative, check: no "copied from the template" or "The four" left
  - add release-zip to the workflows and permissions tables, check: table rows match .github/workflows/*.yml and their permissions
reviewer: separate Claude Code subagent instance (a7c403249fed73eca)
review: approved, no findings.
updated: 2026-10-28
---
Follow-up from the review of #8.
