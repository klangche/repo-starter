---
task: Put the prompt to paste on the first line of the starter README
who: Claude Code
state: Review
branch: docs/readme-prompt-first
files: README.md (root)
plan: |
  - prompt block is the first line, with one line saying when to use it, check: head -5 README.md shows it; "Use it" no longer repeats the prompt
reviewer:
review:
updated: 2026-10-28
---
Owner: the first row must be what to paste into any agent.
