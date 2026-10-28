---
task: Move everything except AGENTS.md, CLAUDE.md and .github/ into template/
who: Claude Code
state: Done
branch: feat/template-folder
files: everything; README.md docs/ changes/ status/ .gitignore .gitattributes move to template/; .github/workflows/check.yml, prepare-release.yml, release-zip.yml; AGENTS.md, CLAUDE.md; template/docs/ADOPT.md, template/docs/TLDR.txt, template/README.md
plan: |
  - git mv the files into template/, check: root holds only AGENTS.md, CLAUDE.md, .github/, template/
  - workflows use template/ while it exists, else the root, check: check script passes on this branch; release-zip skips here
  - setup pull request moves template/ to the root, check: on a scratch copy after the move, check and prepare-release work
  - AGENTS.md note on template/, TLDR rule (editable in the starter, humans only elsewhere), check: diff AGENTS.md CLAUDE.md empty
  - rewrite TLDR.txt for the new layout, check: every file in git ls-files is listed
reviewer: separate Claude Code subagent instance (a2db4c052f113ab79)
review: |
  approved. Fixed: docs/SPEC.md not made required in check.yml (would fail
  older adopted projects), TLDR points to template/docs/ADOPT.md. Left: a
  project with its own template/docs folder would confuse the detection;
  BUILD.md "copy from the template" wording predates this change.
updated: 2026-10-28
---
Owner chose the template/ folder layout. .github/ stays at the root because
GitHub only runs workflows from there and project repos call them by path.
Owner allowed agents to edit TLDR.txt in this repo.
