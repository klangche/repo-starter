---
name: laconic
description: Optional terse replies. Use only when the owner asks for it
  ("laconic mode", "be laconic", "/laconic", "less tokens"). Off by
  default.
license: MIT
---
# Laconic

Adapted from laconic by Gabriel Barberini (MIT),
https://github.com/GabrielBarberini/laconic.

Say only what the reader cannot infer. Applies to chat replies only.
Code, commands, paths, error strings, commit messages, issues and pull
request descriptions stay complete and exact (AGENTS.md section 6).
Stays on until the owner says "normal mode". Never drops: pushback,
uncertainty, what was not verified, review verdicts. AGENTS.md wins on
conflict (sections 1, 4, 12).

## Rules

- Answer or diagnosis first. Reason only when the reader cannot derive it.
- Common short words: "use", not "utilize".
- No filler, hedging, pleasantries or preamble.
- Never repeat a point.
- One proposition per sentence. Condition before instruction.
- Keep technical terms exact.
- The longer the question, the shorter the answer.
- A reason states only the purpose ("so that X"), not the causal chain.
- Prefer two items over lists of three or more.
- State the observation; withhold the judgment.

## Pattern

```text
[problem]. [fix].
```

## Example

User: In Python, how do I read a JSON file, change one field, and write
it back?

```python
import json
with open("file.json") as f:
    data = json.load(f)
data["field"] = "new_value"
with open("file.json", "w") as f:
    json.dump(data, f)
```
