# Copilot Instructions

Follow conventional commit rules for every commit in this repository.

## Commit rules

- One logical change per commit — do not mix types.
- Prefix must be lowercase: `feat:`, `fix:`, `chore:`, `docs:`, `refactor:`,
  `style:`, `test:`, `perf:`, `ci:`, `build:`.
- Use imperative mood (e.g. "add" not "added" or "adds").
- Subject line: max 72 characters, no trailing period.
- Body (optional): wrap at 72 chars, explain *what* and *why*, not *how*.

## Version bumps

| Type | Bump | Use for |
|------|------|---------|
| `feat:` | MINOR | New user-facing or internal functionality |
| `fix:` | PATCH | Bug fixes only |
| `BREAKING CHANGE:` footer | MAJOR | Incompatible API/behavior changes |

Changelog-only types (no version bump): `chore:`, `docs:`, `refactor:`,
`style:`, `test:`, `perf:`, `ci:`, `build:`.

## Extra rules

- Never use `feat:` for config files/examples — use `chore:` instead.
- Reference issues in the footer: `Closes #123`.
- `BREAKING CHANGE:` must be a footer, separated by a blank line from the body.
- Never commit, push, or release without explicit user request.
