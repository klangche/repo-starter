#!/bin/bash
# Filter-test-output: trims verbose test/run output before it reaches the
# model. Tokens are the budget (AGENTS.md section 5), not terminal scroll.
#
# Claude Code calls this with one JSON object on stdin:
#   { "tool_name": "Bash", "tool_input": { "command": "...",
#     "output": "..."}, ... }
# Exit code 0 and any stdout replace nothing by default; this hook only
# rewrites the output when it is long. Anything the tool cannot parse is
# left alone (fail open).
#
# Requires jq and bash (Git Bash on Windows keeps the same script portable).

input=$(cat)
# Only act on Bash results, and only on long output.
command=$(printf '%s' "$input" | jq -r '.tool_input.command // empty' 2>/dev/null)
output=$(printf '%s' "$input" | jq -r '.tool_output // empty' 2>/dev/null)
[ -z "$command" ] || [ -z "$output" ] && exit 0

lines=$(printf '%s' "$output" | wc -l)
[ "$lines" -le 200 ] && exit 0

summary=$(printf '%s' "$output" | grep -Ei 'fail|error|panic|assert|passed [0-9]+' | tail -30)
if [ -n "$summary" ]; then
  printf '%s' "$input" | \
    jq -c --arg s "[$summary]" '.tool_output = $s' 2>/dev/null
fi
