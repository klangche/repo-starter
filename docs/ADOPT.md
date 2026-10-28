# Adopt

How to start a project from this starter, or add it to a project that already
exists. Written so an AI agent can follow it step by step.

## New project (blank start)

1. Create the repository from this one (GitHub "Use this template", or copy
   the files).
2. The owner sets `Branch protection:` in `AGENTS.md` and `CLAUDE.md`, and
   does the one-time settings in `docs/BUILD.md`, "Repository setup".
3. The owner prompts the agent with what to build.
4. The first task is the setup pull request below. No other work starts until
   the owner has merged it.
5. After that, agents take tasks from the backlog in `docs/SPEC.md`, one task
   per pull request (`docs/PLANNER.md`).

## Setup pull request

One pull request, branch `docs/setup`. The Planner writes it, a Reviewer
reviews it (`docs/PLANNER.md`), the owner merges it. It is the only pull
request that may change all of these files together.

1. Reset what the copy inherited from the starter:
   - `changes/` and `status/`: delete every file except `README.md` and
     `_TEMPLATE.md`.
   - `docs/VERSIONS.md`: delete everything below the marker line
     `<!-- NEWEST VERSION BELOW THIS LINE -->`.
   - `README.md`: replace `PROJECT NAME`, and delete every row in the
     features table below the header.
   - `docs/BUILD.md`: delete every row in the build list below the header.
   - `docs/languages.csv`: keep only the header `key,en`.
   - `docs/PLANNER.md`: delete the entries in the decision log.
   - `docs/TLDR.txt` is owner only. The agent tells the owner to update it.
2. Fill in `docs/SPEC.md`. The agent proposes the languages and stack, lists
   what is unclear, and asks the owner. It does not guess.
3. Fill in `project-type` and `languages` in `docs/BUILD.md` from the spec.
4. Fill in "What it is" in `README.md`. "Install" may say "Not available
   yet" until there is something to install.
5. Add the status file and one change file, as for any task.
6. The owner reviews the spec and merges. Merging is the approval.

## Existing project

The agent does this on one branch in one pull request. It does not change the
existing code in the same pull request.

1. Read the existing repository first: languages, folder layout, build,
   formatter and linter settings, CI, `.gitignore`.
2. Copy the starter files that do not exist yet. Never overwrite an existing
   file. Then apply the reset in "Setup pull request" step 1 to the copied
   files.
3. Merge these files instead of replacing them:
   - `.gitignore` and `.gitattributes`: add the missing lines at the end.
   - `README.md`: keep the existing text. Add the Files list and the sections
     that are missing.
   - An existing `AGENTS.md` or `CLAUDE.md`: do not change it. Write the
     proposed merged text in the pull request description. The owner decides.
4. Fill in `project-type` and `languages` in `docs/BUILD.md`, and
   `docs/SPEC.md`, from what the project already uses. Leave the backlog for
   the owner to fill or approve.
5. Note in the pull request where the existing code differs from
   `docs/CODING.md`. The existing conventions stay. Do not fix them in this
   pull request.
6. Do not add workflows that collide with existing CI. List the collisions in
   the pull request and let the owner choose.
7. The owner reviews and merges. From then on all rules in `AGENTS.md` apply.

The owner is defined at the top of `AGENTS.md`.
