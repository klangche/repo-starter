---
name: planning
description: Plan a goal or task before any code. Use when a request
  could be more than one trivial change, has several readings, or has
  no issue yet. Covers brainstorming and writing the plan.
---
# Planning

The Planner writes the plan. Builders only build steps; review is a
separate agent. Keep working memory small (AGENTS.md section 5): plans
live in GitHub issues, never in local files.

## 1. Understand the request

- State assumptions out loud. If unsure, stop and ask.
- More than one reading of the request? List the readings, ask the owner
  to pick. Never pick silently.
- The request looks wrong or overengineered? Push back with the simpler
  alternative and its tradeoff.

## 2. Brainstorm

- Name the options (at least two when honest), and the tradeoff between
  them, in one line each.
- Choose a design with the owner. After that, build without re-asking.

## 3. Write the plan

- One plan issue with the goal. Its steps are ordered sub-issues, each
  with: what to do, and its check (a test, a command, an expected
  output).
- One step = one issue = one branch = one pull request. Keep steps small
  enough to finish and verify in one session.
- Steps that need a bug diagnosed first: the debugging skill applies to
  the sub-issue, with the diagnosis written in the issue before code.
- No issue access? Put the plan and checklist in the pull request
  description instead.
- Open the first step for work (branch, draft pull request) only per
  AGENTS.md section 6. Never start steps silently.

## 4. Hand over

- The checklist is the sub-issue list. The Planner stops there. What the
  Builder's checks are, and what "done" means, must be readable in the
  issues without talking to the Planner.

Adapted from superpowers by Jesse Vincent
(https://github.com/obra/superpowers, MIT License).
