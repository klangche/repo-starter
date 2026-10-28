---
task: Fix BUILD.md wrapper and ruleset notes for the reusable workflows
who: Claude Code
state: In progress
branch: docs/build-wrappers
files: docs/BUILD.md
plan: |
  - ruleset check name for project repos, check: BUILD.md names `check / check`
  - wrapper example with permissions and labeled trigger, check: matches the header comment in check.yml
  - point to the wrapper comments of the other three, check: each workflow file has one
reviewer:
review:
updated: 2026-10-28
---
Follow-up from the review of feat/ci-workflows. Based on PR #2's branch.
