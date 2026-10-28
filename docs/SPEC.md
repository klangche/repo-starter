# Spec

What this project builds. The Planner fills it in during the setup pull
request (`docs/ADOPT.md`). The owner approves it by merging. Every agent reads
it before a task.

Rules for this file:

- Change it only in its own small pull request, and say why.
- One exception: a task pull request may add or tick its own line in
  "Backlog".
- If something here is unclear, the agent asks the owner. It does not guess.

## Goal

Not filled in yet. One or two sentences: what it does and who it is for.

## Users and platforms

- Users:
- Platforms: (Windows, macOS, Linux, web, Android, iOS)

## Languages and stack

Proposed by the agent (`docs/CODING.md` section 1), decided by the owner.

| Part | Language or framework | Why |
| --- | --- | --- |
| | | |

## Architecture

The programs, how they talk to each other, and what code they share. Use the
layout in `docs/CODING.md` section 2.

## Out of scope

What this project will not do.

## Backlog

One line per task, in the order to build them. Each task fits in one pull
request and has a check. Agents take the first open task that no status file
in `status/` claims.

- [ ] task, check: how to verify it

## Decisions

Newest first. One line per decision: date, what was decided, why.
