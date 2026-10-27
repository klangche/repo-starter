# PROJECT NAME

## Files

- [README.md](README.md): this file, the entry point
- [AGENTS.md](AGENTS.md): rules for AI agents and LLMs (identical to CLAUDE.md)
- [CLAUDE.md](CLAUDE.md): same content as AGENTS.md
- [VERSIONS.md](VERSIONS.md): version history
- [BUILD.md](BUILD.md): what to build, how to release, repository setup
- [STATUS.md](STATUS.md): how work is tracked
- [TLDR.txt](TLDR.txt): one-line summary of every file (humans only, AI skips it)
- [languages.csv](languages.csv): translations of all user-facing texts
- [READ_ME_FIRST.txt](READ_ME_FIRST.txt): template for the install note inside release zips
- [changes/](changes/): one small file per change, collected at release
- [status/](status/): one small file per task in progress

## What it is

One or two sentences about what this project does and who it is for.

## Install

Describe the install steps. If a terminal command is needed, show it here and in `READ_ME_FIRST.txt` inside the release zip.

## Features

Every feature lists the version that introduced it. Rows are added by the release step.

| Feature | Since version | Notes |
| --- | --- | --- |
| Example feature | 0.1.0 | Delete this row |

## Supported platforms

- Windows: .msi
- macOS: universal
- Linux: only on request (Debian 13 and Ubuntu)

Remove the platforms that do not apply to this project.

## How work happens

- Agents work on many branches at the same time. Each branch has one pull request.
- Each pull request adds one file in `changes/`. Nobody edits `VERSIONS.md` by hand.
- CI checks every pull request and labels it `ready` or `needs attention`.
- The owner reviews `ready` pull requests and merges them.
- To release, the owner runs "Prepare release". See BUILD.md.

## Rules for updating this file

- The features table is filled in by the release step. Do not edit it in a normal task.
- Other changes to this file go in a separate pull request that touches only README.md.
- Keep the Files list at the top complete. If a file is added to the repo, link it here.
- Everything in this repository is written in English. See AGENTS.md section 0.
