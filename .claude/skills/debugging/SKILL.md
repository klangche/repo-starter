---
name: debugging
description: Diagnose before fixing. Use for any bug, regression, or
  "it should work but does not".
---
# Debugging

Diagnosis is written in the issue before any fix. An unexplained fix is
an unfixed bug (AGENTS.md section 4 and the workflow section).

1. Reproduce: write the smallest test or command that shows the bug.
   Run it. A bug you cannot reproduce is a different bug; keep looking.
2. Isolate: find where reality and expectation split. Read the code
   around it; change one variable at a time. Guessing fixes and running
   them to see "if it goes away" is not isolation.
3. Write the diagnosis in the issue: what is broken, why, and the
   proposed fix, in a few lines. The fix is implemented by a second
   Builder; hand over there.
4. The fix adds the failing test from step 1 to the suite, then the
   tdd skill from there (minimal code, no side work).
5. Check the whole suite passes. If the diagnosis was wrong, go back to
   step 2, do not patch over it.
6. If you cannot find it, say so in the issue and stop. Do not write a
   fake fix to look done.

Adapted from superpowers by Jesse Vincent
(https://github.com/obra/superpowers, MIT License).
