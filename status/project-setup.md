---
task: Product-level planning (SPEC.md), reset step for copies, one setup pull request
who: Claude Code
state: In progress
branch: docs/project-setup
files: docs/SPEC.md, docs/ADOPT.md, docs/PLANNER.md, AGENTS.md, CLAUDE.md, README.md
plan: |
  - docs/SPEC.md template (goal, platforms, stack, architecture, scope, backlog, decisions), check: file exists, linked from README and AGENTS.md
  - ADOPT.md reset step and setup pull request, check: every starter leftover is listed (changes/, status/, VERSIONS.md, README, BUILD.md list, languages.csv)
  - AGENTS.md section 7 and 8 and PLANNER.md flow allow the setup pull request, check: no rule forbids what ADOPT.md asks; diff AGENTS.md CLAUDE.md empty
  - prepare-release still works on a reset copy, check: run the collect script on a reset scratch copy
reviewer:
review:
updated: 2026-10-28
---
Owner approved items 1-3, including the AGENTS.md and PLANNER.md edits.
