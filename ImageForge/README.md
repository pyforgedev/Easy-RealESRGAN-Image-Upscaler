# 🖼️ ImageForge — Batch Image Converter

[![Open in Colab](https://colab.research.google.com/assets/colab-badge.svg)](https://colab.research.google.com/drive/1PjLz6x7v4LYImHYauHyOzTcTPXDsBuMV?usp=sharing)
![Python](https://img.shields.io/badge/python-3.10+-blue.svg)
![License: MIT](https://img.shields.io/badge/License-MIT-yellow.svg)
![Version](https://img.shields.io/badge/version-v1.0-green)
![Status](https://img.shields.io/badge/status-active-success)

---

Batch image converter for automatically converting **PNG → JPG/JPEG** files.

Designed specifically for batch processing workflows before **image upscaling**
or other **AI pipelines** that require JPG format without transparency.

---

## ✨ Features

- 📂 **Batch PNG Conversion**: Convert many PNG files to JPG or back to PNG at once.
- 🎯 **Preserve Filename**: Original filenames are kept, only the extension changes.
- ⚙️ **Adjustable JPEG Quality**: Control compression quality for JPG output (10-100).
- 📦 **Automatic Output Folder**: Converted files are saved in a separate folder to stay organized.
- 🚀 **Fast Processing**: Optimized for fast image processing.
- 🖼️ **Transparent PNG to JPG Handling**: Automatically fills transparent PNG backgrounds (alpha channel) with white when converting to JPG, ideal for AI workflows.
- 🌐 **Gradio Interface**: Intuitive and easy-to-use interface via Gradio.
- ☁️ **Colab Optimized**: Designed to run smoothly on Google Colab with Cloudflare tunneling for public access.

---

## 🚀 How to Use (Google Colab)

1. **Open in Google Colab**: Click the "Open in Colab" badge above (or the `ImageForge.ipynb` file).
2. **Run All Cells**: Run all code cells sequentially via `Runtime` → `Run all`.
3. **Dependency Installation**: The first cell installs the required libraries (`gradio`).
4. **Application Running**: After all cells finish, you will see a Cloudflare link in the last cell's output (usually starting with `https://....trycloudflare.com`).
5. **Access the App**: Click the link to open the ImageForge interface in your browser.
6. **Upload & Convert**: Upload your PNG or JPG images, select the target format and quality (for JPG), then click "Start Conversion 🚀".
7. **Download Results**: Converted files are available for download as individual files or a ZIP if you uploaded multiple images.

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
