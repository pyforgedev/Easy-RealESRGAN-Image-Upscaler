# Changelog

All notable changes to this project are documented in this file.
## [0.2.0] - 2026-07-09

### Bug Fixes

- Refactor code structure for improved readability and maintainability
- Gpu worker not detected
- Enhance logging and error handling in image import and batch upscale functions
- Add try catch in upload proses
- Add directory creation for destination path in image upscaler script
- Ensure output and report directories are created if they do not exist before saving files
- Add cleanup function for stale Cloudflare tunnels and improve process termination
- Remove Kaggle and Google Drive import functionalities from the image upscaler notebook
- Enhance keep-alive system: implement graceful shutdown and logging

### Documentation

- Add markdownlint configuration and update documentation for clarity and consistency

### Features

- Enhance GPU worker management and cleanup processes

### Miscellaneous Tasks

- Push release tag explicitly in release flow
- Create github release automatically when gh is available
- Sync release flow and docs with commit rules
- Update documentation to clarify release process and language usage
- Refactor code structure for improved readability and maintainability

## [0.1.1] - 2026-07-08

### Miscellaneous Tasks

- Add release.sh fallback and document toolchain requirements
- Release v0.1.1

## [0.1.0] - 2026-07-08

### Miscellaneous Tasks

- Add agent setup and release tooling
- Rename git-cliff config to cliff.toml for auto-discovery
- Release v0.1.0

