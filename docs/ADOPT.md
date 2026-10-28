# Adopt

How to start a project from this starter, or add it to a project that already
exists. Written so an AI agent can follow it step by step.

## New project (blank start)

1. Create the repository from this one (GitHub "Use this template", or copy
   the files).
2. The owner fills in "What it is" in `README.md`, in one or two sentences.
3. The owner sets `Branch protection:` in `AGENTS.md` and `CLAUDE.md`. See
   `docs/BUILD.md`, "Repository setup".
4. Prompt the agent with what to build. The agent proposes the language and
   project type (`docs/CODING.md` section 1). The owner confirms.
5. The agent writes `project-type` and `languages` in `docs/BUILD.md` and
   starts building.

## Existing project

The agent does this on one branch in one pull request. It does not change the
existing code in the same pull request.

1. Read the existing repository first: languages, folder layout, build,
   formatter and linter settings, CI, `.gitignore`.
2. Copy the starter files that do not exist yet. Never overwrite an existing
   file.
3. Merge these files instead of replacing them:
   - `.gitignore` and `.gitattributes`: add the missing lines at the end.
   - `README.md`: keep the existing text. Add the Files list and the sections
     that are missing.
   - An existing `AGENTS.md` or `CLAUDE.md`: do not change it. Write the
     proposed merged text in the pull request description. The owner decides.
4. Fill in `project-type` and `languages` in `docs/BUILD.md` from what the
   project already uses.
5. Note in the pull request where the existing code differs from
   `docs/CODING.md`. The existing conventions stay. Do not fix them in this
   pull request.
6. Do not add workflows that collide with existing CI. List the collisions in
   the pull request and let the owner choose.
7. The owner reviews and merges. From then on all rules in `AGENTS.md` apply.

## Who is the owner

The owner is the person who owns the repository or the fork. An AI agent is
never the owner.
