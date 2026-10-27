# PROJECT NAME

## Files

- [README.md](README.md): this file, the entry point
- [AGENTS.md](AGENTS.md): rules for AI agents and LLMs (identical to CLAUDE.md)
- [CLAUDE.md](CLAUDE.md): same content as AGENTS.md
- [docs/PLANNER.md](docs/PLANNER.md): roles, flow, how to change the plan
- [docs/VERSIONS.md](docs/VERSIONS.md): version history
- [docs/BUILD.md](docs/BUILD.md): what to build, how to release, repository setup
- [docs/STATUS.md](docs/STATUS.md): how work is tracked
- [docs/TLDR.txt](docs/TLDR.txt): one-line summary of every file (humans only, AI skips it)
- [docs/languages.csv](docs/languages.csv): translations of all user-facing texts
- [docs/READ_ME_FIRST.txt](docs/READ_ME_FIRST.txt): template for the install note inside release zips
- [changes/](changes/): one small file per change, collected at release
- [status/](status/): one small file per task in progress

## What it is

One or two sentences about what this project does and who it is for.

## Install

Describe the install steps. If a terminal command is needed, show it here and
in `docs/READ_ME_FIRST.txt` inside the release zip.

## Features

Every feature lists the version that introduced it. Rows are added by the
release step.

| Feature | Since version | Notes |
| --- | --- | --- |
| Example feature | 0.1.0 | Delete this row |

## Supported platforms

No platform is selected by default. The owner picks the ones that apply and
removes the rest.

- Windows: .msi (if `app-windows` or `app-both`)
- macOS: universal (if `app-macos` or `app-both`)
- Linux: only on request (Debian 13 and Ubuntu)

## How work happens

- Agents work on many branches at the same time. Each branch has one pull
  request.
- Each pull request adds one file in `changes/`. Nobody edits
  `docs/VERSIONS.md` by hand.
- CI checks every pull request and labels it `ready` or `needs attention`.
- The owner reviews `ready` pull requests and merges them.
- To release, the owner runs "Prepare release". See `docs/BUILD.md`.

## Rules for updating this file

- The features table is filled in by the release step. Do not edit it in a
  normal task.
- Other changes to this file go in a separate pull request that touches only
  README.md.
- Keep the Files list at the top complete. If a file is added to the repo,
  link it here.
- Everything in this repository is written in English. See AGENTS.md section 0.
