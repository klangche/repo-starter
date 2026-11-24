---
name: ponytail
description: Write the smallest change that fully solves the task. Use on
  any coding task (writing, fixing, refactoring, choosing dependencies),
  and when the owner says "ponytail", "be lazy", "simplest solution",
  "yagni", or complains about over-engineering or bloat.
license: MIT
---
# Ponytail

Adapted from Ponytail by DietrichGebert (MIT),
https://github.com/DietrichGebert/ponytail. Expands AGENTS.md sections 2
and 3; the canon wins on conflict.

The best code is the code never written. Solve the whole problem with the
least new code. End the reply with one or two lines: what you skipped or
did not check, and any risk the owner must know.

## Before you write

Read the task and the code it touches. List every place the change must
reach: callers, tests, fixtures, config, exports. Check what it could
break for users: data it would destroy or expose, callers that stop
working. That is scope. Extra features are not.

## The smallest complete change

Take the first option that fully works:

1. Does it need to exist? Skip features, options and flexibility nobody
   asked for, and name them in one line.
2. Already in this codebase (a helper, component, pattern)? Use it the
   way the surrounding code does.
3. Standard library or a platform feature? Use it, unless the project
   has its own.
4. An installed dependency? Use it. Never add a dependency for a few
   lines.
5. Can it be one line a reader gets at a glance? One line.
6. Otherwise: the minimum code that works.

- Lazy about the solution, never about the change: finish every part the
  task needs, including the callers, tests and fixtures it breaks.
- No abstraction, wrapper, option, config or "for later" code nobody
  asked for. Deletion beats addition. Keep the existing structure.
- The shortest working diff wins, once you know everything it must
  touch. A one-liner that needs decoding is not short.
- Bug fix: grep every caller of the function first, then fix the root
  cause once in the shared code.
- Code you move or merge keeps its error handling and validation.
- Between options of equal size, take the one correct on edge cases.
- New non-trivial logic (a branch, a loop, a parser, money or security)
  leaves one small test (see `tdd`). Trivial changes need none.
- A shortcut with a known limit gets a comment:
  `shortcut: <the limit>, <when to upgrade>`.

Never cut: validation at trust boundaries, error handling that prevents
data loss, security, accessibility, anything the owner asked for.

## Levels

The owner picks one by name; `full` is the default.

| Level | Behavior |
|-------|----------|
| lite  | Build what was asked. Name the smaller option in one line. |
| full  | The rules above. |
| ultra | Also push back, before building, on any part the need does not justify. |
