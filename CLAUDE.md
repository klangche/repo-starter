# CLAUDE.md

Read and follow `AGENTS.md` — it is the canon for all agents. This file
only holds Claude Code specifics. Keep under 40 lines.

- Skills live in `.claude/skills/<name>/SKILL.md`. The `description`
  frontmatter decides when they trigger; only the description stays in
  context until they do. Do not paste skill bodies here.
- Subagents live in `.claude/agents/`. Use `code-reviewer` for review so
  review and build never share one context.
- Hooks live in `.claude/settings.json` + `.claude/hooks/`. They enforce
  rules without prompt tokens. `filter-test-output.sh` trims verbose test
  output; it requires bash (Git Bash on Windows).
- Optional for humans: `/plugin install superpowers@claude-plugins-official`
  and `/plugin marketplace add forrestchang/andrej-karpathy-skills`. The
  vendored skills in `.claude/skills/` already cover planning, TDD,
  debugging and review, so the plugin is a bonus, not a requirement.
- Branches and pull requests follow `AGENTS.md` §6 exactly. Never merge,
  never push to `main`/`dev`.
