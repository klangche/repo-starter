# AGENTS.md

Rules for every AI agent in this repository. Humans follow them too.
`CLAUDE.md` is a thin pointer to this file. Keep the canon here only.

Based on:
- Andrej Karpathy's agent guidelines,
  https://github.com/forrestchang/andrej-karpathy-skills/blob/main/CLAUDE.md
- The AI-native SDLC playbook (Claude Academy),
  https://academy.claude.com/courses/ai-native-sdlc-playbook
- Superpowers skill pack, https://github.com/obra/superpowers
  (MIT; tdd, review-pr, debugging and planning adapted in `.claude/skills/`)
- Owner: the person who owns the repository or fork. Never an AI.
- Precedence: Karpathy principles (sections 1-4) first, then superpowers
  procedures (the skills in `.claude/skills/`, or the plugin), then the
  SDLC playbook structure. Git, GitHub and file rules (sections 6, 8, 9)
  override all of them.

## Commands

**Setup** (the owner has already run the install prompt from repo-starter's
README):

1. Read `AGENTS.md` fully. Ask the owner what is unclear, and how the code
   is split. Propose the stack. In "Project" below, replace the defaults
   with the project's own values in one pull request (`docs/setup` to
   `main` or the default branch). Quote any pre-existing rules file in the
   pull request description.
2. New repository: write `README.md` about the project (section 10).
   Existing repository: leave its README and code as they are.
3. After the merge, create `dev` if it is missing, and make it the default
   branch (owner action). The Planner opens the first plan issue.

**Update** (owner types `update repo-starter`): follow the Update prompt in
the repo-starter README (https://github.com/klangche/repo-starter). It
overwrites the manifest files, restores the "## Project" section unchanged,
and refreshes `.repo-starter.lock`. Upgrading from v1 (no `MANIFEST.txt`
files or `.repo-starter.lock` here): follow the same Update prompt.

**Uninstall** (owner runs the uninstall prompt): removes only the files
listed in `.repo-starter.lock` whose contents are unchanged. Everything
edited by the owner or created by others stays. Without the lock file it
stops and asks; it never guesses.

## 0. Language

- Everything in English: code, comments, commits, pull requests, docs,
  file names, logs, and your replies. Texts for end users in other
  languages: one strings file, stable keys, English first, missing
  translations fall back to English. Never use the English sentence as
  the key.

## 1. Think before coding

- State assumptions. If unsure, ask. Several readings: list them and ask.
- Unclear: stop, name what is unclear, ask.
- A simpler way exists: say so. Push back when the request looks wrong.
- Name the tradeoffs between options.
- Once the owner has decided (language, stack, design), build. Do not ask
  again.

## 2. Simplicity first

- Minimum code that solves the problem. No features, abstractions or
  settings nobody asked for. No error handling for cases that cannot
  happen. A senior engineer would call it overcomplicated? Then simplify.

## 3. Surgical changes

- Touch only what the task needs. Do not reformat or "improve" other code.
  Match the existing style. Remove only what your change made unused.
  Every changed line traces to the request.

## 4. Goal-driven execution

- Turn the task into checks (a test, a command, an expected output).
- Bug: first write a test that reproduces it, then make it pass.
- Short plan, one check per step. Work until the checks pass.
- Never claim it works without running it. If you could not run it, say so.

## 5. Context budget

- Estimate the context the task needs before you start. Above 60% of a
  session's budget: split it or hand it over. Skills, subagents and hooks
  exist to keep working context small:
  - Skills: only a skill's `name`/`description` sit in context until it
    triggers. Never paste skill bodies into the canon.
  - Subagents: heavy or parallel work goes to a subagent defined in
    `.claude/agents/` (Claude) or its per-tool equivalent. It loads only
    its own instructions, not the whole conversation.
  - Hooks run outside the model entirely. Prefer a hook over prompt text
    when a rule must always hold.

## 6. Workflow

Plan, then steps. Everything in GitHub, nothing in extra files.

- Repository structure (asked in Setup): separate repositories by default,
  for one developer or many. A monorepo (one folder per app) only when apps
  share code, an API or a launcher. Start separate: merging later is easy,
  splitting a monorepo is hard. A goal across repositories: plan it in a
  GitHub Project (Project > repository > app or package).

- Plan: every goal starts as a plan issue with the goal. Its steps are
  sub-issues, in order, each with what to do and its check. The sub-issue
  list is the checklist. A request without an issue: create it first.
- One step = one issue = one branch = one pull request. The pull request
  says `Closes #<issue>`.
- Branches: `main` holds only tested releases. `dev` is the beta channel
  and the default branch. Branch from latest `dev`: `feat/`, `fix/`,
  `docs/` or `debug/`, then issue number and slug (`feat/12-login`).
  Pull requests target `dev`. The owner squash merges.
- `dev` to `main`: one pull request, merge commit (not squash).
- Hotfix: branch from `main`, pull request to `main`; the owner closes
  the issue and merges `main` into `dev` after.
- Several agents: take only an open step with no claim, no linked pull
  request and no open `Blocked by #<issue>`. Claim it with a comment, then
  re-read the issue: the earliest claim wins, the other agent picks another
  step. Push the branch, open a draft pull request.
- Keep the branch up to date by merging its target into it. No rebase: that
  needs a force push.
- Roles: Planner (plan issue), Builder (one step), Reviewer (a different
  agent instance; see `.claude/agents/code-reviewer.md`).
- Pull request description: what changed, the checks you ran with results,
  what you could not verify, the Reviewer's verdict. Title in the style
  `Added: ...`, `Changed: ...`, `Fixed: ...`, `Removed: ...`,
  `Security: ...`; add `!` for breaking changes. Release notes are built
  from these titles.
- Debugging: first write the diagnosis and proposed fix in the issue
  (use the `debugging` skill). A separate Builder implements the fix.
- Skills, per role (in `.claude/skills/<name>/SKILL.md`; agents without
  a skill system read the same file tools):
  - Planner: `planning` (brainstorm, then plan and sub-issues).
  - Builder: `tdd` for features, `debugging` for bugs.
  - Reviewer: `review-pr`.
- No access to issues: put the plan and its checklist in the pull request
  description instead.
- Never merge. Never approve your own pull request. Never push to `main`
  or `dev` (except creating `dev` in Setup). Never change repository
  settings, rulesets, labels or secrets. If you pushed to `main`/`dev` by
  mistake, stop and tell the owner. No force push.

## 7. Code

- Pick the right language per part. Propose with one line of why; the
  owner decides. Follow each language's standard layout, formatter,
  linter and test tool.
- One file per responsibility, named after what it does.
- Web: HTML, CSS and JavaScript in separate files. No inline scripts,
  styles or handlers. ES modules.
- Several operating systems: one shared front end, system-specific code
  in its own folder, one documented interface between the parts.
- Existing projects: their conventions win. Do not rewrite working code
  to match these rules.
- Secrets and configuration stay out of the code. Commit lock files.
  Prefer the standard library.

## 8. Build and release

- Everything is built by GitHub Actions. No local builds for releases.
- CI builds and tests every pull request, to `dev` and to `main`.
- Beta: every merge into `dev` publishes a pre-release `vX.Y.Z-beta.N`.
  Release: only from `main`; the owner runs the release workflow in
  GitHub Actions, which creates the tag `vX.Y.Z`. Never create or push a
  tag locally. Versioning: SemVer; release notes from pull request titles
  since the last release (not the last beta).
- Assets: `<name>-<version>-<platform>.<ext>`; unsigned, so add a short
  `READ_ME_FIRST.txt` with any terminal command the user must run.
- Windows: .msi, silent update if already installed. macOS: one universal
  build. Linux: only on request.

## 9. Secrets and safety

- Never commit passwords, tokens, keys or certificates. Use GitHub
  Actions secrets.
- Ask before destructive commands (delete, force push, reset,
  uninstall).

## 10. README

- About the project only: what it is, features, install, usage,
  platforms, development, license. The only reference to these rules:
  "Contributors and AI agents follow AGENTS.md."

## 11. Done

- Works and verified, or clearly says what was not verified.
- Issue closed by the merged pull request; Reviewer approved (noted in
  the pull request); CI green.

## 12. Style

- Short, direct, plain. No marketing language. No emojis. Chat replies:
  TL;DR first, then short bullets. Long replies waste context (section 5).

## Install, update, uninstall (for repo-starter itself)

- Files installed and owned by repo-starter are exactly the paths in
  `MANIFEST.txt`. `CLAUDE.md` and `.github/copilot-instructions.md` are
  generated from this file; changing one means updating all three.
- The installing agent writes `.repo-starter.lock`: every installed file
  with its sha256. It is machine data, refresh on update, read on
  uninstall.
- The owner may edit everything after "## Project" (Project section) and
  nothing else. Uninstall must return all other installed files and the
  folders they came with only if the content hash matches the receipt.

## Project

Filled in by the setup pull request. Changed only by the owner.

- Branch protection: none
- Goal: repo-starter itself. Rules and portable skills for AI agents.
- Users and platforms: anyone using an AI coding agent, any platform.
- Repository structure: one repository.
- Stack: Markdown.
- Decisions:
  - 2026-11-01: v2. Canon in AGENTS.md, thin CLAUDE.md, portable skills
    in .claude/skills, install/update/uninstall by
    paste prompt with a sha256 receipt (.repo-starter.lock). Track v2
    issues on dev until testing done, then v2 to main.
