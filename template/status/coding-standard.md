---
task: General coding standard for any language, and adoption into existing repos
who: Claude Code
state: Done
branch: claude/generell-programmeringsstandard-cy9m0o
files: AGENTS.md, CLAUDE.md, README.md, docs/BUILD.md, docs/CODING.md, docs/ADOPT.md, .gitignore, .gitattributes, .DS_Store
plan: |
  - add docs/CODING.md (language choice, structure, per-language tooling), check: file exists, linked from AGENTS.md and README.md
  - add docs/ADOPT.md (blank start and existing repo), check: file exists, linked from README.md
  - AGENTS.md section 16 and owner definition, mirrored to CLAUDE.md, check: diff AGENTS.md CLAUDE.md is empty
  - BUILD.md: languages field, several programs per repo, generic build rules, check: no rule contradicts CODING.md
  - rename gitignore/gitattributes to dotfiles, remove .DS_Store, check: git check-ignore .DS_Store succeeds
reviewer: separate Claude Code subagent instance (ae8e71c4b38f3e872)
review: |
  approved. Notes fixed: PowerShell guide name (docs/CODING.md), languages
  casing (docs/BUILD.md), owner text duplicated (docs/ADOPT.md). Open: check.yml
  is not in the repo, so CI acceptance of new project-type values is unverified.
  Branch name set by the session, not feat/<slug>. Owner approved one PR.
updated: 2026-10-28
---
Owner approved editing AGENTS.md and CLAUDE.md in this task. One pull request
for all files, on the branch given by the session.
