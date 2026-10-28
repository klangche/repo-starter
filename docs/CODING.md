# Coding standard

How code is written in this repository, in any language. Every agent reads
this before it writes code. Humans follow it too.

If this file is applied to an existing project, the conventions already in
that project win where they differ. Do not rewrite working code only to match
this file.

## 1. Choose the language

- Pick the language that fits the job, not the one used last time. One
  project can use several languages and several programs.
- The agent proposes the language and the stack, with one line on why. The
  owner decides.
- Once the owner has set the language, start building. Do not ask again.
- Record the decision in `docs/BUILD.md` under `languages`.

Typical fits. A starting point, not a rule:

| Purpose | Usual choice |
| --- | --- |
| Web page or web UI | HTML, CSS, JavaScript or TypeScript |
| Web server or API | TypeScript (Node), Python, Go, Rust |
| Desktop app with a shared UI | Tauri (Rust core, web UI), Electron, .NET MAUI |
| Native Windows app | C# (.NET) |
| Native macOS app | Swift |
| Fast or low-level code, drivers, engines | Rust, C++, C |
| Command-line tool | Rust, Go, Python |
| Scripts and automation on Windows | PowerShell |
| Scripts and automation on Linux or macOS | Bash, Python |
| Data, analysis, machine learning | Python |
| Mobile app | Kotlin (Android), Swift (iOS), Flutter or React Native for both |

## 2. Several programs, several systems

- When an app runs on several operating systems, the user should see the same
  front end on all of them. Share the UI code. Keep code that is specific to
  one system in its own folder.
- The front end and back end may use different languages. Choose per project.
- They talk through one documented interface (an API, IPC or a command line).
  Neither side reaches into the other's files.

Suggested layout when a repository holds more than one program:

```
apps/
  <program>/        one folder per program or per system
shared/
  ui/               front end used by every program
  <name>/           other shared code
```

A repository with one program uses `src/` and does not need this layout.

## 3. Structure

- One file holds one responsibility. Name the file after what it does
  (`validate-input.js`, `price_calc.py`, `network.rs`).
- Small functions that belong to the same feature may share a file. Then the
  file name describes the feature, not one of the functions.
- Split a file when it grows past one responsibility or gets hard to read.
  There is no fixed line limit.
- Keep the layout a new person would expect for that language and tool. A
  human should find the code to patch in seconds.
- Group by feature first, then by type, when a project grows.
- No dead code, no commented-out code, no copies of the same logic.

## 4. Web (HTML, CSS, JavaScript)

- HTML holds structure only. CSS goes in `.css` files. JavaScript goes in
  `.js` files.
- No inline `<script>` blocks, no `style=""` attributes, no `onclick=""` or
  other inline handlers. Attach handlers in JavaScript.
- Use ES modules (`import` and `export`). One module per responsibility, as in
  section 3. One small entry file wires the modules together.
- Use semantic HTML elements and make the page usable by keyboard. Images have
  `alt` text.
- User-facing texts come from `docs/languages.csv` by key. See AGENTS.md
  section 0.

## 5. Tools per language

Use the official or most common formatter and linter for the language, with
default settings unless the project already has its own. CI should run them.

| Language | Style | Formatter | Linter | Tests |
| --- | --- | --- | --- | --- |
| JavaScript, TypeScript | Common JS style | Prettier | ESLint | Vitest or Jest |
| HTML, CSS | | Prettier | Stylelint (CSS) | |
| Python | PEP 8 | Black or Ruff | Ruff | pytest |
| Rust | Rust style guide | rustfmt | Clippy | cargo test |
| C, C++ | Project style, else Google | clang-format | clang-tidy | GoogleTest or Catch2 |
| C# | .NET conventions | dotnet format | .NET analyzers | xUnit |
| Swift | Swift API Design Guidelines | swift-format | SwiftLint | XCTest |
| Go | Effective Go | gofmt | go vet | go test |
| PowerShell | PowerShell Practice and Style | | PSScriptAnalyzer | Pester |
| Bash | Google Shell Style Guide | shfmt | ShellCheck | bats |

For a language not in this table, use the tools its community treats as
standard.

## 6. General rules

- Names say what a thing is or does. No unclear abbreviations.
- Comments explain why, not what.
- Configuration and secrets stay outside the code. Secrets never go in the
  repository (AGENTS.md section 13).
- Commit the lock file of the package manager. Pin dependency versions.
- Add a dependency only when it saves real work. Prefer the standard library.
- Put tests where the language's tooling expects them.
- Handle errors where they can happen and show the user a clear message.

## Change protocol for this file

Same as `docs/PLANNER.md`: one small pull request per change, nothing else in
it, and the description explains why the standard needs to change.
