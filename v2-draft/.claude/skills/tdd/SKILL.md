---
name: tdd
description: Test-driven development for implementations. Use when
  building a feature or behavior with a checkable result.
---
# TDD, minimal loop

Shortest path to done: a failing check, the least code to pass it, then
cleanup. Never claim it works without running it (AGENTS.md section 4).

1. Reproduce the requirement as one failing check (test, command, or
   expected output). Run it. See it fail.
2. Write the minimum code that makes the check pass. No feature,
   abstraction or setting that was not required to pass it.
3. Run the check. Green? Stop there. If a simpler version exists, do it
   before moving on.
4. cleanup pass: remove dead code and anything the change made unused;
   match surrounding style. Checks green again before handoff.
5. Surgical rule: touching only what the task needs. New file only for a
   new responsibility; small related functions may share a file named
   after the feature.
6. State in the final summary what was verified by running, and what was
   not verified. No partial honesty: "not verified" is allowed, "works"
   without a run is not.
