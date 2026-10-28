---
task: Project README without starter text
who: Claude Code
state: Done
branch: fix/project-readme
files: template/README.md, template/docs/ADOPT.md, template/docs/TLDR.txt, .github/workflows/prepare-release.yml, README.md (root)
plan: |
  - template/README.md becomes a plain project README (standard sections, features table, one line pointing to AGENTS.md), check: no starter-specific text left in it
  - ADOPT.md: setup fills the project README; adoption keeps the existing README and only adds a Features table and the AGENTS.md line, check: no "Files list" instruction left
  - prepare-release skips the README when it has no Features section, check: collect script on a copy without the section does not crash
  - root README tells agents never to copy its text, check: grep
reviewer: separate Claude Code subagent instance (a887b64c3bfb97674)
review: |
  rejected once: an existing Features section without a table got no table
  and crashed the release step. Fixed (table goes inside the existing
  section; release skips a section without table rows). Re-review approved.
updated: 2026-10-28
---
Owner: the created project README mixed the project and repo-starter README.
