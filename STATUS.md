# Status

This file explains how work is tracked. It does not hold the status itself, because many branches editing one table would conflict all the time.

## Where the status lives

- Open pull requests are the live list of work. Labels show the state: `ready` or `needs attention`.
- Each task has its own file in `status/`, created on its branch. Use `status/_TEMPLATE.md`.
- The release step deletes status files that say `Done`.

## States

- In progress
- Blocked
- Done

## Rules

- Create your status file as your first commit and push it.
- Update `state` and `updated` when something changes.
- List the files or folders you will change in `files`, so others can avoid them.
- Humans and AI agents follow the same rules.
