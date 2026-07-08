# AGENTS.md

Collection of self-contained Jupyter notebooks. There is **no** Python package,
`pyproject.toml`/`setup.py`, `requirements.txt`, test suite, linter, or CI.
Don't look for or invent `install`/`lint`/`test`/`build` commands — they don't exist.

## Structure

Three independent notebooks, each run top-to-bottom ("Run all"); cell execution
order matters within a notebook.

- `easy-realesrgan-image-upscaler.ipynb` — main project. Real-ESRGAN image
  upscaler. **Kaggle + GPU** runtime, **Python 3.12+**. On first run it clones the
  upstream `xinntao/Real-ESRGAN` repo, patches BasicSR for 3.12 compatibility, and
  downloads model weights (needs internet). Core classes: `QualityConfig`,
  `RealESRGANUpscaler`; UI is `ipywidgets`.
- `ImageForge/ImageForge_—_Batch_Image_Converter.ipynb` — PNG↔JPG batch converter.
  **Google Colab**, **Python 3.10+**, Gradio UI exposed via a Cloudflare tunnel.
  Standalone; not part of the upscaler pipeline.
- `PromptForge/PromptForge.ipynb` — batch prompt cleaner/grouper by aspect ratio.
  **Google Colab**, **Python 3.10+**, `ipywidgets` UI. Standalone.

## Working with the code

- All executable logic lives inside `.ipynb` cells, not `.py` files. To read or
  edit code programmatically, parse notebooks (e.g. `nbformat`/`jupytext`), not
  grep on source files.
- Dependencies are installed inline in the first cells of each notebook, not
  declared in any manifest. Mirror that when changing deps.
- The main upscaler requires a GPU and network access at runtime; it cannot be
  exercised in a plain CPU/local shell.

## Releases

Versioning is local-driven via **git-cliff** (no npm/package.json here). Config
is `cliff.toml`; the `Makefile` wraps the steps:

- `make changelog V=0.2.0` — regenerate `CHANGELOG.md` up to tag `v0.2.0`.
- `make release V=0.2.0` — update changelog, commit `chore: release v0.2.0`,
  tag `v0.2.0`, and `git push --follow-tags`.

Version bumps follow conventional commits: `feat:` → minor, `fix:` → patch,
`BREAKING CHANGE:` → major (see `.github/copilot-instructions.md`).

## Notes

- READMEs are written in Indonesian; code cells are in English.
- MIT licensed, author `masyuraC7`.
