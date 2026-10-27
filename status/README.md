# status

One small file per task. Copy `_TEMPLATE.md`, rename it to match your branch
(for example `install-check.md`) and fill it in.

- `state`: In progress, Blocked, Review or Done
- `files`: what you will change, so others can avoid it
- `plan`: written by the Planner, one line per step with a check
- `reviewer`: the agent instance that reviewed
- `review`: approved or rejected, with file:line notes

The release step deletes files whose state is Done. See `docs/STATUS.md`.
