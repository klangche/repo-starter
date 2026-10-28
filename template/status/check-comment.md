---
task: Fix the stale template/ comment in check.yml
who: Claude Code
state: Review
branch: fix/check-comment
files: .github/workflows/check.yml
plan: |
  - reword the comment to match docs/ADOPT.md (template/ exists only in the starter), check: no "copy before its setup" left; check still passes
reviewer:
review:
updated: 2026-10-28
---
Follow-up from the review of #8.
