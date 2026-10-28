---
task: Add the four CI workflows described in docs/BUILD.md
who: Claude Code
state: Done
branch: feat/ci-workflows
files: .github/workflows/check.yml, .github/workflows/pr-status.yml, .github/workflows/main-guard.yml, .github/workflows/prepare-release.yml
plan: |
  - check.yml, check: run its script locally on this repo, passes; fails on a broken AGENTS/CLAUDE copy
  - pr-status.yml, check: YAML valid, actionlint clean
  - main-guard.yml, check: YAML valid, actionlint clean
  - prepare-release.yml, check: run its script locally on a scratch copy, version and files come out right
reviewer: separate Claude Code subagent instance (ac7c8c8c0cb4e20e3)
review: |
  approved. Fixed: unknown mergeability now sets needs attention
  (pr-status.yml), issues: write added so labels can be created. Follow-up
  for a separate BUILD.md PR: project repos require check name `check / check`,
  wrapper permissions blocks, pull_request types for skip-changes.
  Not run on GitHub yet; actionlint not available.
updated: 2026-10-28
---
Based on claude/generell-programmeringsstandard-cy9m0o (PR #2), because the
check validates the project-type values added there. Owner approved this branch.
