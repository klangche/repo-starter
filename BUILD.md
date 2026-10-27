# Build

Everything that must be built, packaged and released, plus how to set up the repository. All builds run in GitHub Actions. The workflows are in `.github/workflows/`.

## Rules

- One repository per program. If a project needs several programs in one repo, create a launcher that can download and update the other files.
- Releases are triggered by a version tag (`vX.Y.Z`).
- Every release asset is named `<name>-<version>-<platform>.<ext>`, for example `ToolName-1.2.0-Windows.zip`.
- No code signing for now. Builds are unsigned. Because of that, the install instructions below must be in the zip.

## Program types

### PowerShell

- No compile step. Put the files to ship in `src/`.
- The release workflow zips `src/` together with `READ_ME_FIRST.txt`.
- Workflow: `.github/workflows/release-zip.yml`

### HTML

- A single file or a folder in `src/`.
- If it should run online, publish it with GitHub Pages. Otherwise ship it as a zip like PowerShell.
- Workflow: `.github/workflows/release-zip.yml`

### Apps

Apps are built professionally with a real build in Actions. Add one workflow per platform, for example `.github/workflows/build-windows.yml`.

- Windows: an .msi installer.
  - If the app is already installed, the update runs silently (`msiexec /i <file>.msi /qn`).
  - If the app is not installed, run the standard interactive install.
- macOS: one universal build (Apple Silicon and Intel).
- Linux: only when requested. One package for Debian 13 and one for Ubuntu. List the Ubuntu version here when requested.

## READ_ME_FIRST.txt

If installing needs a terminal command, or the OS will warn about an unsigned file, the zip must contain `READ_ME_FIRST.txt` at its root. A template is in this repo. Keep it short: what to do, then the command to copy.

## Release flow

1. Work lands on main through pull requests. Each pull request adds one file in `changes/`.
2. When you want a release, open the Actions tab, pick "Prepare release" and click "Run workflow". It reads all files in `changes/`, picks the next version (the biggest `bump` wins), updates `VERSIONS.md` and the features table in `README.md`, deletes the used change files and the status files that say `Done`, and opens a pull request named `Release vX.Y.Z`.
3. Check the release pull request and merge it.
4. Push the tag from your computer (replace v1.2.0 with the version in the pull request title):

```
git checkout main && git pull && git tag v1.2.0 && git push origin v1.2.0
```

   - `git checkout main && git pull`: go to main and get the merged release.
   - `git tag v1.2.0`: mark that commit with the version.
   - `git push origin v1.2.0`: send the tag to GitHub. This starts the build.

5. The build workflow runs and the files appear under Releases.

Step 4 is manual on purpose. Events made by the built-in workflow token do not start other workflows, so a tag created by a workflow would not start the build.

## Workflows

| File | What it does | When it runs |
| --- | --- | --- |
| check-repo.yml | Required files, AGENTS/CLAUDE identical, languages.csv, front matter, change file in the PR | Pull requests, pushes to main |
| pr-status.yml | Sets the label `ready` or `needs attention` | After check-repo, and for all open PRs when main changes |
| main-guard.yml | Fails if a commit reached main without a pull request | Pushes to main |
| prepare-release.yml | Collects changes and opens the release pull request | By hand |
| release-zip.yml | Zips `src/` and `READ_ME_FIRST.txt` into a release | Version tag |

## Repository setup (owner only)

Do this once per repository.

### Always

- Settings, Actions, General, Workflow permissions: tick "Allow GitHub Actions to create and approve pull requests". "Prepare release" needs it.
- Recommended: add a secret named `RELEASE_TOKEN` (a personal access token with write access to contents and pull requests in this repo). Pull requests opened with the built-in token do not start CI, so without it the release pull request has no checks.
- Agents need their own credentials, not the built-in token, or their pull requests will not start CI either.
- Set `Branch protection:` at the top of `AGENTS.md` and `CLAUDE.md` (same value in both files).
- Optional: create the label `skip-changes` for pull requests that need no change file. Only the owner uses it.

### Branch protection: enforced (public repo, or private repo on a paid plan)

Settings, Rules, Rulesets, New branch ruleset (menu names may differ slightly):

- Target the default branch (main).
- Require a pull request before merging.
- Require status checks to pass, and add the check named `check`.
- Require branches to be up to date before merging.
- Block force pushes.
- Restrict deletions.

Trade-off: with "up to date", every merge makes the other open pull requests fall behind main. Each one must be updated (rebase, or the "Update branch" button) and re-checked before it can merge. That is the price of never merging code that was only tested against an old main.

### Branch protection: none (private repo on the free plan)

GitHub cannot enforce rules here. You have this instead:

- `AGENTS.md` tells agents never to push to main and never to merge.
- The label `ready` marks pull requests with green CI and no conflicts. Only merge those.
- "Main guard" fails when a commit reaches main without a pull request, so you notice.
- Check yourself that a pull request is not far behind main before you merge it. Nothing blocks you.
- Gap: any token with write access can still push to main. Only a paid plan closes it.

### Actions minutes

Private repos have a limited number of free Actions minutes, and macOS builds use more of them. Check the current numbers in GitHub's billing settings before you run many builds.

## Build list

Add every program and package here. Changes to this table go in their own small pull request.

| Item | Type | Platforms | Workflow | Status |
| --- | --- | --- | --- | --- |
| Example | PowerShell | Windows | release-zip.yml | Planned |
