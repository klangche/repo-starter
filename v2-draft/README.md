
###Install, Update, Uninstall:
Paste this into AI connected to your repo: '

```text
Install "https://github.com/klangche/repo-starter" in this repo
```
```text
textupdate repo-starter`.
```
```text
text update repo-starter`.
```

# repo-starter

One repository of rules and portable skills that make AI agents plan
first, keep changes as small as possible, use one branch and one pull
request per task with a separate reviewer, and follow each language's
standards. Works with Claude Code, Codex (GPT), GitHub Copilot and any
agent that can read a file. Nothing here is Claude-only: the canon is
`AGENTS.md`, read natively by Codex and Copilot coding agents and the
goal of an increasingly wide de-facto standard.

## What gets installed

```text
AGENTS.md                            canon, all agents (setup fills only "# Project")
CLAUDE.md                           thin Claude Code pointer (<40 lines)
.github/copilot-instructions.md     thin pointer, GitHub Copilot
.claude/settings.json               hook wiring
.claude/hooks/filter-test-output.sh trim verbose output before it is read
.claude/agents/code-reviewer.md     reviewer subagent (own context)
.claude/skills/planning/SKILL.md
.claude/skills/tdd/SKILL.md
.claude/skills/debugging/SKILL.md
.claude/skills/review-pr/SKILL.md
.repo-starter.lock                  receipt: every installed file + sha256
```

Skills load lazily: only name and description sit in context until a
skill triggers. Hooks enforce rules outside the model. Subagents keep
review out of the builder's context. The list may grow, but each added skill must earn its
tokens.

## Install

Paste this into any agent in the target repository:

```text
Install repo-starter rules in this repository from https://github.com/klangche/repo-starter, tag v2.

1. Download https://raw.githubusercontent.com/klangche/repo-starter/v2/MANIFEST.txt .
2. Download every path listed from
   https://raw.githubusercontent.com/klangche/repo-starter/v2/<path> and
   write it unchanged at the same path, creating folders as needed.
3. Never overwrite any file that is not in the manifest. If AGENTS.md
   already exists and has a section another tooling owns, keep it.
4. Write .repo-starter.lock: one line per installed file, the path and
   its sha256 in plain text.
5. Then follow the "Setup" command in the new AGENTS.md (ask me what is
   unclear, fill the "# Project" section, open the docs/setup pull
   request).
```

## Update

```text
update repo-starter

Reinstall per the repo-starter install prompt (same source, same
manifest) with these rules:
1. Overwrite the manifest files with the new contents.
2. Restores, after the overwrite, the "# Project" section of the
   previous AGENTS.md byte for byte; regenerate CLAUDE.md and
   .github/copilot-instructions.md from the identifiers in the new
   AGENTS.md if the generator has changed.
3. Refresh .repo-starter.lock from what is on disk after the update.
4. Answer with a per-file change report, then stop.
```

## Uninstall

```text
Uninstall repo-starter from this repository.

1. Read .repo-starter.lock. If it does not exist, stop and ask me:
   never guess what was installed.
2. For each file in the receipt: sha256 unchanged -> delete it; changed
   -> keep it and note it in the final report as "changed, kept".
3. Delete folders that house the removed manifest paths, but only when
   they are now empty.
4. Touch nothing else. Report: removed files, kept (changed) files,
   folders removed. Ask before continuing if a destructive step still
   stands.
```

## Tokens

AGENTS.md is the only thing every session always reads (about 3,000
tokens). Skills add their description line, and their body only when
triggered. Hooks and subagents spend no model context. Offline work: all
rules and skills are files in the repo, nothing calls out.

## Credits

- Andrej Karpathy-style agent guidelines:
  https://github.com/multica-ai/andrej-karpathy-skills/blob/main/CLAUDE.md
- The AI-native SDLC playbook (Claude Academy):
  https://academy.claude.com/courses/ai-native-sdlc-playbook
- Superpowers by obra: https://github.com/obra/superpowers
- Based on repo-starter rules by klangche:
  https://github.com/klangche/repo-starter

## Added by me

These are the parts of v2 that are in none of the credited sources:

- The agent-as-installer lifecycle: one paste prompt per operation
  (install / update / uninstall), no scripts and no manual copying. The
  agent downloads `MANIFEST.txt`, writes the files, and does everything
  else itself.
- The sha256 receipt (`.repo-starter.lock`): update restores the local
  "# Project" section byte for byte; uninstall deletes only files whose
  content still matches the receipt and refuses to guess without one.
  Nothing in the credited sources scopes a removal like this.
- The all-agent canon split: tool-independent rules in `AGENTS.md` with
  thin per-tool pointers only (`CLAUDE.md` under 40 lines,
  `.github/copilot-instructions.md`), so Codex, Copilot and Claude read
  the same canon instead of one Claude-only rules file.
- Token-efficiency requirements as rules, not tips (AGENTS.md section
  5: lazy skill loading, subagents for isolation, hooks instead of
  prompt text), and the hook to trim verbose output before it is read.
- Superpowers' planning / tdd / debugging / review-pr vendored as
  portable `SKILL.md` files in the repo, so they load per trigger,
  work offline, and survive in agent types without the superpowers
  plugin.
- The "Added by me" section itself: the four sources above define the
  baseline; anything beyond it is listed here so credit stays honest.

Only parts from this list are the owner's contribution; everything
else in the repo is from the sources above and stays credited there.

## Also

Contributors and AI agents follow AGENTS.md. Rules are for repo-starter
itself: one repository, Markdown sources of truth only. Issue-driven:
plan issue, sub-issues, one branch + one pull request per step, all
dev-ward while v2 is in testing.
