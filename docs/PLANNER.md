# PLANNER.md

How work is planned and reviewed in this repository. Every agent reads this
before it starts a task.

This file is editable by everyone, but a change to it must go in its own small
pull request, and the pull request must explain why the plan needs to change.
Do not change it in the middle of a task.

## Roles

Three roles. One agent can hold one role at a time. An agent must never hold
the Builder and Reviewer roles for the same task.

- **Planner.** Reads the task, states assumptions, splits the task into steps.
  Each step has a verifiable check. If the task would push any agent past 60%
  of its context window, the Planner splits it further or hands it over. The
  Planner does not write code.
- **Builder.** Takes one step, works on one branch, opens one pull request.
  Writes the change file and the status file. Asks the Reviewer to review.
- **Reviewer.** A different agent instance than the Builder. Reads the task,
  the plan, the diff and the check. Approves or rejects with concrete
  references (file:line). A rejected review is normal. The Builder redoes the
  task. No hard feelings.

## Flow

1. Planner reads the task and writes the plan into `status/<slug>.md` under
   `plan:`. One line per step, each with a check.
2. Planner estimates the context cost. If any step is likely to pass 60%,
   split it or hand it to another agent.
3. Builder takes one step. Creates the branch, the change file and the status
   file. Pushes the status file first.
4. Builder implements and verifies. Sets the status to `Review`.
5. Reviewer reviews. Approves or rejects with file:line references. Writes the
   result in the status file under `review:`.
6. On approval, the Builder sets the status to `Done`. On rejection, the
   Builder picks up the notes and goes back to step 4.
7. The owner merges. The release step collects `changes/`.

## Status file fields used by the roles

- `plan:` written by the Planner.
- `reviewer:` the agent instance that reviewed.
- `review:` approved or rejected, with file:line notes.

See `status/_TEMPLATE.md`.

## Change protocol for this file

- One pull request per change to this file. Nothing else in the same pull
  request.
- The pull request description answers: what changes, why the plan needs to
  change, which open tasks are affected.
- The owner merges. Agents never merge.

## Decision log

Short entries, newest first. One line per decision: date, what was decided,
why. This is how a new agent understands the plan without reading old pull
requests.

<!-- NEWEST ENTRY BELOW THIS LINE -->
