---
task: Fix the stale template/ comment in check.yml
who: Claude Code
state: Done
branch: fix/check-comment
files: .github/workflows/check.yml
plan: |
  - reword the comment to match docs/ADOPT.md (template/ exists only in the starter), check: no "copy before its setup" left; check still passes
reviewer: separate Claude Code subagent instance (a7c403249fed73eca)
review: approved, no findings.
updated: 2026-10-28
---
Follow-up from the review of #8.
