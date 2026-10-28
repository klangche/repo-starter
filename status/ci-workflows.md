---
task: Add the four CI workflows described in docs/BUILD.md
who: Claude Code
state: In progress
branch: feat/ci-workflows
files: .github/workflows/check.yml, .github/workflows/pr-status.yml, .github/workflows/main-guard.yml, .github/workflows/prepare-release.yml
plan: |
  - check.yml, check: run its script locally on this repo, passes; fails on a broken AGENTS/CLAUDE copy
  - pr-status.yml, check: YAML valid, actionlint clean
  - main-guard.yml, check: YAML valid, actionlint clean
  - prepare-release.yml, check: run its script locally on a scratch copy, version and files come out right
reviewer:
review:
updated: 2026-10-28
---
Based on claude/generell-programmeringsstandard-cy9m0o (PR #2), because the
check validates the project-type values added there. Owner approved this branch.
