```
Set up this repository with the standards from https://github.com/klangche/repo-starter. Read its README and follow the steps for AI agents.
```

Paste this into any AI agent, in any repository: new, copied or one that
already has code. Then tell it what to build.

# repo-starter

Rules, docs and GitHub workflows that make AI agents build software the same
way in every project: plan first, one task per pull request, a separate
reviewer, checked by CI, versioned releases. Works for any language, for a new
project or one that already has code.

You do not fork or copy this repository. Point your AI agent at it.

## Use it

Open your project in your AI agent (Claude Code, Codex, Copilot or another)
and paste the line at the top of this page. Then tell it what to build, or
what the project is.

What happens:

1. The agent opens one pull request. It adds the files below, writes
   `docs/SPEC.md` (goal, languages, plan, task list) and asks you about
   anything unclear.
2. You read the spec and merge. Merging is your approval.
3. From then on the agent builds one task per pull request. CI checks each
   one and labels it `ready`. You review and merge.
4. When you want a release, run "Prepare release" in the Actions tab.

## Before you start (once per project, on GitHub)

- Settings, Actions, General: tick "Allow GitHub Actions to create and
  approve pull requests".
- Settings, General: tick "Automatically delete head branches".
- Recommended: add a secret `RELEASE_TOKEN` (a token with write access to
  contents and pull requests) so release pull requests get CI.

Details and branch protection: `template/docs/BUILD.md`, "Repository setup".

## By hand

Copy these into the root of your project. Never overwrite a file your
project already has, except a `README.md` that GitHub created:

| From this repository | To your project |
| --- | --- |
| `AGENTS.md`, `CLAUDE.md` | same names |
| `.github/workflows/*.yml` | `.github/workflows/` |
| everything inside `template/`, including `.gitignore` and `.gitattributes` | the root (not a `template/` folder) |

Then:

1. Set `Branch protection:` at the top of `AGENTS.md` and `CLAUDE.md`
   (`docs/BUILD.md`, "Repository setup").
2. Ask your agent to follow `docs/ADOPT.md`: the setup pull request for a
   project without code, the adoption pull request for one with code. It
   clears the history that came with the files, merges files you already
   had, and writes the spec.

## What you get

| File | What it does |
| --- | --- |
| `AGENTS.md` / `CLAUDE.md` | The rules every agent follows. Identical. Only you edit them. |
| `docs/SPEC.md` | What the project builds and the task list. |
| `docs/CODING.md` | Coding standard for every language. |
| `docs/PLANNER.md` | Roles: Planner, Builder, Reviewer, and the flow. |
| `docs/BUILD.md` | What to build, how to release, repository setup. |
| `docs/ADOPT.md` | The setup steps the agent follows. |
| `docs/TLDR.txt` | One line per file, for humans. |
| `changes/`, `status/` | One file per change and per task, so agents can work in parallel. |
| `.github/workflows/` | `check` (rules), `pr-status` (labels), `main-guard`, `prepare-release`, `release-zip`. |

## For AI agents

You were sent here to set up a project. Follow `template/docs/ADOPT.md` in
this repository. It says which files to copy and what to do with them. Never
copy text from this README into the project. The project's README is about
the project only (`template/README.md` is its outline).

## This repository

`AGENTS.md` and `CLAUDE.md` here are also the rules for changing this
repository. The project files live in `template/`.
