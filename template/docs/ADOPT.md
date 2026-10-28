# Adopt

How an AI agent adds this standard to a project, new or existing. The owner
starts it with the prompt in the README of
https://github.com/klangche/repo-starter.

- The repository has no code yet (at most the `README.md`, `LICENSE` or
  `.gitignore` that GitHub created): do the setup pull request.
- Otherwise, or if any file in the list below already exists other than
  those three: do the adoption pull request.

## Get the files

Clone the starter into a temporary folder outside the project and copy from
the clone:

```
git clone --depth 1 https://github.com/klangche/repo-starter.git <temp folder>/repo-starter
```

If cloning is not possible, download and unpack
https://github.com/klangche/repo-starter/archive/refs/heads/main.zip instead.
It unpacks to a folder `repo-starter-main/`, and the paths below are inside
it.

Copy into the project root:

- `AGENTS.md` and `CLAUDE.md`
- every file in `.github/workflows/`
- everything inside `template/`, including `.gitignore` and `.gitattributes`,
  placed at the root. Not the `template/` folder itself.

Do not copy the starter's own `README.md` from its root. The project gets
`template/README.md`. Delete the clone when done.

`Branch protection:` at the top of `AGENTS.md` and `CLAUDE.md`: ask the owner
which value applies (see `docs/BUILD.md`, "Repository setup") and write it in
both files. That is the only edit an agent makes to them.

## Setup pull request

One pull request, branch `docs/setup`. The Planner writes it, a Reviewer
reviews it (`docs/PLANNER.md`), the owner merges it. It is the only pull
request that may change all of these files together. No other work starts
until the owner has merged it.

1. Clone the starter (above). Create `status/<slug>.md` in the project from
   the clone's `template/status/_TEMPLATE.md` and push it as the first commit
   (`AGENTS.md` section 9). Then copy the files. Files GitHub created:
   `README.md` is replaced by the template, `LICENSE` stays, `.gitignore`
   gets the missing lines added.
2. Reset what came with the files from the starter:
   - `changes/` and `status/`: delete every file except `README.md`,
     `_TEMPLATE.md` and this task's status file.
   - `docs/VERSIONS.md`: delete everything below the marker line
     `<!-- NEWEST VERSION BELOW THIS LINE -->`.
   - `README.md`: replace `PROJECT NAME`, and delete every row in the
     features table below the header.
   - `docs/BUILD.md`: delete every row in the build list below the header.
   - `docs/languages.csv`: keep only the header `key,en`.
   - `docs/PLANNER.md`: delete the entries in the decision log.
   - `docs/TLDR.txt` is owner only from now on. The agent tells the owner to
     read it.
3. Fill in `docs/SPEC.md`. The agent proposes the languages and stack, lists
   what is unclear, and asks the owner. It does not guess.
4. Fill in `project-type` and `languages` in `docs/BUILD.md` from the spec.
5. Write `README.md` for the project: fill in every section, delete the
   sections that do not apply, keep "Features" and the `AGENTS.md` line in
   "Development". It is about the project only. Do not copy text from the
   starter's README or docs into it. "Install" may say "Not available yet"
   until there is something to install.
6. Add one change file, as for any task.
7. The owner reviews the spec and merges. Merging is the approval.

After that, agents take tasks from the backlog in `docs/SPEC.md`, one task per
pull request (`docs/PLANNER.md`).

## Adoption pull request (existing project)

One pull request, branch `docs/adopt`. It does not change the existing code.

1. Read the existing repository first: languages, folder layout, build,
   formatter and linter settings, CI, `.gitignore`.
2. Clone the starter (above). Create `status/<slug>.md` from the clone's
   `template/status/_TEMPLATE.md` and push it as the first commit. Then copy
   the files, but only the ones that do not exist yet. Never
   overwrite an existing file. Then apply the reset in "Setup pull request"
   step 2 to the copied files.
3. Merge these files instead of replacing them:
   - `.gitignore` and `.gitattributes`: add the missing lines at the end.
   - `README.md`: keep the existing text as it is. Only add the features
     table header from `template/README.md` (the release step writes to it):
     inside the existing `## Features` section if there is one, else in a new
     `## Features` section. And, if there is no development or contributing section,
     the line "Contributors and AI agents follow [AGENTS.md](AGENTS.md)."
     Add nothing else.
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
7. Add one change file. The owner reviews and merges.
   From then on all rules in `AGENTS.md` apply.

The owner is defined at the top of `AGENTS.md`.
