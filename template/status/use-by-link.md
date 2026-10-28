---
task: Use the starter by link instead of copying or forking it
who: Claude Code
state: Done
branch: feat/use-by-link
files: README.md (new, root), template/changes/use-by-link.md, template/docs/ADOPT.md, template/docs/TLDR.txt, AGENTS.md, CLAUDE.md
plan: |
  - root README.md with the prompt to paste, owner steps, by-hand file list, check: every path in it exists in the repo
  - ADOPT.md fetches the files from the starter instead of moving template/, check: following it on a scratch empty repo gives the same tree as before; check and prepare-release pass there
  - AGENTS.md preamble and TLDR.txt no longer talk about copies of the starter, check: no "Use this template" or "git mv template" left; diff AGENTS.md CLAUDE.md empty
reviewer: separate Claude Code subagent instance (a91d8c1278707c17b)
review: |
  rejected twice, then approved. Fixed: by-hand steps no longer overwrite
  existing files and point to setup vs adoption PR; archive zip fallback;
  temp folder; adoption path when a listed file exists; status file created
  from the clone and pushed first, kept by the reset; TLDR how-to removed.
  Follow-ups: stale comment in check.yml; BUILD.md "copy release-zip.yml
  from the template" wording.
updated: 2026-10-28
---
Owner wants the starter used by link (prompt an agent with the URL) and starred,
not copied or forked. The repo is public, so agents can read it.
