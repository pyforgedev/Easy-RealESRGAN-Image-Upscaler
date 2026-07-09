# 🚀 PromptForge — Batch Prompt Processing Toolkit

[![Open in Colab](https://colab.research.google.com/assets/colab-badge.svg)](https://colab.research.google.com/drive/1jCktX5ExxhJ8idt6VPET_Z5brElOYfD6?usp=sharing)
![Python](https://img.shields.io/badge/python-3.10+-blue.svg)
![License: MIT](https://img.shields.io/badge/License-MIT-yellow.svg)
![Version](https://img.shields.io/badge/version-v1.0-green)
![Status](https://img.shields.io/badge/status-active-success)

---

PromptForge is a tool for cleaning, grouping, and exporting prompts automatically based on **aspect ratio**.

Designed to speed up batch generation workflows across various AI image generators.

---

## ✨ Key Capabilities

- 📥 Multiple input modes
  - Paste text
  - Upload `.txt` file

- 🧹 Prompt cleaning
  - Remove duplicate prompts
  - Normalize whitespace

- ⚙️ Smart processing
  - Auto suffix injection
  - Ratio-based prompt grouping

- 📦 Batch exporting
  - Export per aspect ratio
  - Optional ZIP packaging
  - Automatic download

---

## 🧩 Interface Setup

This section builds the **interactive interface** using `ipywidgets`.

The interface allows users to:

- Select input mode
- Configure processing options
- Control output files

Main components created:

- Input mode selector
- Text input area
- File upload system
- Processing options
- Execution button
- Status display

---

## 🧠 Core Processing Engine

This section contains the main logic for processing prompts.

Pipeline steps:

1. Read input text
2. Detect **aspect ratio**
3. Clean prompts
4. Add suffix (optional)
5. Remove duplicate prompts
6. Group prompts by ratio
7. Save results to file

Parsing uses **regular expressions** to ensure prompt structure stays consistent.

---

## 📦 Export System

Processed prompts are exported automatically.

Output format:

- One file per aspect ratio
- Timestamp-based filenames
- Automatic batch folder creation

Optional features:

- Auto download
- ZIP packaging
- Blank line separation

---

## ▶️ Usage Guide

Follow these steps to use PromptForge:

### 1. Select Input Mode

- `Paste Text`
  or
- `Upload File`

### 2. Configure Processing Options

Optional settings:

- Remove duplicate prompts
- Add suffix
- Separate with blank space
- Auto download
- Auto zip files

### 3. Click the Button

`PROCESS PROMPTS`

### 4. Output Files

- Created automatically
- Downloaded automatically (if enabled)

---

## 📁 Output Structure

Each batch produces a folder:

```text
Batch_YYYYMMDD_HHMMSS/
  BatchPrompt_16x9_TIMESTAMP.txt
  BatchPrompt_1x1_TIMESTAMP.txt
  BatchPrompt_9x16_TIMESTAMP.txt
  Batch_YYYYMMDD_HHMMSS.zip
```

---

## ☕ Support

Your support helps sustain technology research and future creative open-source projects.

| Platform | Link |
| :--- | :--- |
| **Trakteer** | <https://trakteer.id/pyforge> |
| **Saweria** | <https://saweria.co/pyforge> |
| **SociaBuzz** | <https://sociabuzz.com/pyforge> |
| **PayPal** | <https://www.paypal.com/paypalme/Masyura> |

---

## ⚖️ License

This project is licensed under the **MIT License**.
You are free to use, modify, and distribute this code for personal or commercial purposes.

Copyright (c) 2026 **pyforgedev**

---

Made with ❤️ by **pyforgedev** — Full Stack Programmer & Creative Content Creator.
