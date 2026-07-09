# AGENTS.md

Collection of self-contained Jupyter notebooks. There is **no** Python package,
`pyproject.toml`/`setup.py`, `requirements.txt`, test suite, linter, or CI.
Don't look for or invent `install`/`lint`/`test`/`build` commands — they don't exist.

## Structure

Three independent notebooks, each run top-to-bottom ("Run all"); cell execution
order matters within a notebook.

### easy-realesrgan-image-upscaler.ipynb (main project)

Real-ESRGAN image upscaler. **Kaggle + GPU** runtime, **Python 3.12+**. On first
run it clones the upstream `xinntao/Real-ESRGAN` repo, patches BasicSR for 3.12
compatibility, and downloads model weights (needs internet). Core engine classes:
`QualityConfig`, `RealESRGANUpscaler` (defined in Section 1.7); UI is **Gradio**
(Section 2).

The notebook is organized into three top-level sections, each introduced by a
`#` markdown header followed by one or more code cells. Section 1 was deliberately
split into **10 small, logically-grouped code cells** (each preceded by a
`## 📦 1.x` header) so the ~1800 lines of pipeline logic are easy to maintain,
attribute errors to, and scale. **Editing rule: only move cell boundaries — never
merge these back into one monolith cell.**

Cell layout (top-to-bottom):

- Intro markdown (title + Kaggle link).
- `# 📦 1. Full Pipeline — Environment, Models, Core Engine, Workers & Batch`
  - `## 📦 1.1 Imports & Logger` — stdlib/3rd-party imports; `logger`
    (`logging.getLogger("EasyRealESRGAN")`, `StreamHandler` only).
  - `## ⚙️ 1.2 Configuration & Constants` — `CFG` dict, `INPUT_DIR`/`OUTPUT_DIR`
    (incl. `enable_keep_alive`/`keep_alive_interval`), `MODEL_REGISTRY`, constants.
  - `## 🖥️ 1.3 GPU Detection & Runtime Validation` — `detect_available_gpus()`,
    `validate_runtime_environment()`, `initialize_worker_directories()`.
  - `## 🔧 1.4 Runtime Optimization & Dependencies` — `optimize_runtime_environment()`,
    `install_dependencies()`, `apply_python_compatibility_patch()`, `setup_repository()`.
  - `## 🚀 1.5 Environment Initialization` — `print_runtime_summary()`,
    `initialize_environment()` **and its top-level call**.
  - `## 📥 1.6 Model Download & Setup` — `validate_existing_model()`,
    `download_model()`, `setup_models()`, `if __name__ == "__main__": setup_models()`.
  - `## ⚡ 1.7 Core Upscaler Engine` — `QualityConfig`, `RealESRGANUpscaler`,
    global `upscaler_engine = RealESRGANUpscaler()`, `upscale_image()`.
  - `## 👷 1.8 GPU Worker Manager` — `GPUWorker`, `GPUWorkerManager`,
    global `gpu_worker_manager = GPUWorkerManager()` (+ `initialize_workers()`/
    `perform_health_check()` calls).
  - `## 💾 1.9 Data Manager` — resume DB (thread-safe), image validation, gallery,
    file ops, import handlers (`handle_upload`, etc.).
  - `## 🔄 1.10 Batch Engine` — `BatchTask`, `ParallelBatchProcessor`,
    `run_batch_upscale()`.
- `# 🎨 2. Gradio Interface` — Gradio UI (`build_ui()` + helpers), 1 code cell.
- `# 🌐 3. Cloudflare Tunnel Launcher` — `_cleanup_stale_tunnels()` (reaps orphaned
  `cloudflared` from prior runs), cloudflared binary download, `keep_runtime_alive()`
  (daemon thread, stopped via `keep_alive_stop` `threading.Event` in
  `launch_application()`'s `finally`), `launch_application()` +
  `if __name__: launch_application()`.

### ImageForge / PromptForge

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

> Note: this project does **not** use `release-it` (there is no npm/package.json
> here). Releases are handled entirely by **git-cliff** as described below.

Versioning is local-driven via **git-cliff** (no npm/package.json here). Config
is `cliff.toml`; the `Makefile` wraps the steps:

- `make changelog V=0.2.0` — regenerate `CHANGELOG.md` up to tag `v0.2.0`.
- `make release V=0.2.0` — regenerate `CHANGELOG.md`, commit
  `chore: release v0.2.0`, tag `v0.2.0`, push commit + tag, and (if `gh` is
  installed and authed) create the GitHub Release using that version's notes.

`make` and `git-cliff` must be on `PATH` (e.g. `~/.local/bin`). If `make` is
unavailable, `release.sh <version>` mirrors the `release` target.

Choose `V` manually following the conventional-commit bump rules:
`feat:` → minor, `fix:` → patch, `BREAKING CHANGE:` → major
(see `.github/copilot-instructions.md`). git-cliff groups commits into the
changelog by these same types but does **not** auto-compute the version.

## Kaggle Notebook Standards

The main project (`easy-realesrgan-image-upscaler.ipynb`) runs on **Kaggle GPU
runtimes**. All code must adhere to Kaggle's constraints:

- **Session limits**: max **9 hours** per session, **30 GB** RAM, single GPU
  (P100/T4). Be mindful of memory — avoid loading large intermediate blobs,
  explicitly `del` + `gc.collect()` after heavy allocations.
- **Internet access**: available only on first run (cloning repo, downloading
  weights). After that, the notebook must work fully offline — no runtime
  web requests, no pip install of unverified packages.
- **Disk**: `/kaggle/working` is writable; everything else is read-only. Always
  use `OUTPUT_DIR` (or similar) inside the working directory. Never hardcode
  paths outside `/kaggle/working`.
- **No daemons**: no `systemd`, no background services, no long-lived threads
  that outlive the cell. Subprocess workers must be joined/killed before the
  cell exits.
  - **Exception — keep-alive thread**: `keep_runtime_alive()` (Section 3) is an
    intentional `daemon=True` thread that prevents Kaggle from idling the session.
    It is long-lived *by design* but is cleanly stopped: `launch_application()`'s
    `finally` block sets `keep_alive_stop` (a `threading.Event`) and `join()`s the
    thread, so it never survives a Stop. **Do not** make it non-daemon, and **do
    not** remove the stop signal — otherwise the heartbeat logs persist after the
    notebook is stopped.
- **Idempotent cells**: each cell must be safe to re-run ("Run all" from top).
  Use `if not path.exists()` guards for downloads, and clean up stale state
  (kill orphan subprocesses, reset globals) before re-initializing.
- **Kaggle output limits**: console output per cell is capped at ~50 KB.
  Use loggers with a file handler, not massive `print()` — write logs to disk
  for debugging instead.
- **No interactive widgets on public sharing**: `ipywidgets` works in the
  Kaggle notebook editor but is **not** rendered in the public read-only view.
  Gradio/Streamlit inference cells must be in a separate cell with a clear
  "skip unless interactive" guard.
- **Error resilience**: wrap model loading and inference in `try/except`;
  Kaggle notebooks are often restarted with cold caches. Never let a
  transient failure (missing weights, CUDA OOM) kill the whole session.
- **No persistent secrets**: Kaggle Secrets or env vars for API keys only.
  Never hardcode tokens.
- **Portable CUDA**: always use `device = next(iter(model.parameters())).device`
  or an explicit CUDA check, never hardcode `cuda:0`.

## Notes

- Default language is **English** (this is an open-source project for a global
  audience): documentation, READMEs, and code comments are written in English;
  code cells are in English.
- MIT licensed, author `pyforgedev`.
