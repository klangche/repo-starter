---
name: review-pr
description: Review a branch or pull request. Use in the Reviewer role
  subagent, or by a human's agent asked to check a diff.
---
# Review

The Reviewer is a different agent instance than the Builder. Review
means the whole diff, not the happy path. A rejection is a normal,
expected outcome (AGENTS.md section 6).

Read `AGENTS.md` first. Then, in order:

1. Scope: the issue names what to do. Every changed line must trace to
   it. Flag anything extra, anything "improved" in passing (section 3).
2. Simplicity: for each chunk ask "would a senior engineer call this
   overcomplicated?" An unused abstraction or a case that cannot happen
   is a change request.
3. Checks: the pull request must quote the checks it ran and their
   results. No results pasted = reject, however good the code looks.
   "Works" claimed by the Builder without a run is never accepted.
4. Style and hygiene: existing conventions win; formatter/linter clean;
   secrets absent, config outside the code, lock files present.
5. Tests: bug fixes must come with the test that reproduces them. Fixes
   without tests are change requests.

Output exactly one verdict:
- `Approved: <one-line reason>`
- `Request changes: <numbered list: file, line or hunk, concrete fix>`
- `Question: <one thing the Builder must answer>`

No verdict is never an option: a reviewer who cannot decide rejects.
