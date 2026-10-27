# Versions

This project follows [Semantic Versioning](https://semver.org) (MAJOR.MINOR.PATCH) and the [Keep a Changelog](https://keepachangelog.com) layout.

Rules:

- This file is written by the release step (BUILD.md, "Release flow"). Do not edit the versions by hand.
- Changes that are not released yet live as files in `changes/`.
- Newest version first, directly under the marker line below.
- Every version uses the same template. Only these section names are used, and empty ones are left out.
- MAJOR: breaking change. MINOR: new feature, backwards compatible. PATCH: bug fix only.
- When several changes are released together, the biggest bump wins.
- Git tags are `vMAJOR.MINOR.PATCH` (for example `v1.2.0`). A tag starts the release build.
- The first release starts counting from 0.0.0.

## Template

```
## [X.Y.Z] - YYYY-MM-DD

### Added
- New features.

### Changed
- Changes to existing behavior.

### Deprecated
- Features that will be removed.

### Removed
- Features that were removed.

### Fixed
- Bug fixes.

### Security
- Security fixes.
```

## Released versions

<!-- NEWEST VERSION BELOW THIS LINE -->
