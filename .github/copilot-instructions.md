# Copilot coding agent instructions

Follow `AGENTS.md` in the repository root — it is the canon for all
agents. Workflow: plan issue, sub-issues, one branch and one pull request
per step, target `dev`. Never merge, never push to `main`/`dev`.

Role files live in `.claude/`: skills under `skills/`, the reviewer
subagent under `agents/`. When your task is
planning, TDD, debugging or review, open the matching skill file and
follow it before starting.
