# CLAUDE.md

Read and follow `AGENTS.md` — it is the canon for all agents. This file
only holds Claude Code specifics. Keep under 40 lines.

- Skills live in `.claude/skills/<name>/SKILL.md`. The `description`
  frontmatter decides when they trigger; only the description stays in
  context until they do. Do not paste skill bodies here.
- Subagents live in `.claude/agents/`. Use `code-reviewer` for review so
  review and build never share one context.
- Optional for humans: `/plugin install superpowers@claude-plugins-official`
  and `/plugin marketplace add forrestchang/andrej-karpathy-skills`. The
  vendored skills in `.claude/skills/` already cover planning, TDD,
  debugging and review, so the plugin is a bonus, not a requirement.
- Branches, pull requests and labels follow `AGENTS.md` §6 exactly.
  Label every issue and pull request on creation. Never merge, never
  push to `main`/`dev`.
