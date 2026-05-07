# 🚀 Easy-RealESRGAN-Image-Upscaler

<p align="center">

<a href="https://www.kaggle.com/code/pyrisforge/easy-realesrgan-image-upscaler">
    <img src="https://img.shields.io/badge/Open%20in-Kaggle-blue?logo=kaggle" />
</a>

<a href="https://www.python.org/downloads/">
    <img src="https://img.shields.io/badge/python-3.12+-blue.svg" />
</a>

<a href="https://github.com/xinntao/Real-ESRGAN">
    <img src="https://img.shields.io/badge/Real--ESRGAN-v0.3.0-brightgreen" />
</a>

<a href="https://opensource.org/licenses/MIT">
    <img src="https://img.shields.io/badge/License-MIT-yellow.svg" />
</a>

</p>

<p align="center">
<b>Open-Source AI Image Upscaler for Kaggle & Colab</b><br>
Powered by Real-ESRGAN with Gradio UI, batch processing, adaptive tile fallback, Cloudflare public access, and GPU optimization.
</p>

---

# ✨ Features

## 🖼️ AI Image Upscaling
- High-quality image upscaling using **Real-ESRGAN**
- Supports both:
  - **General / Photo**
  - **Anime / Cartoon**
- Scale options:
  - **2x**
  - **4x**

---

## ⚡ Quality Presets

Choose between multiple quality modes depending on your GPU performance and desired output quality.

| Preset | Description |
| :--- | :--- |
| **Ultra** | Highest quality with FP32 precision and face enhancement |
| **High** | High-quality balanced mode |
| **Balanced** | Recommended default for Kaggle T4/P100 |
| **Fast** | Lowest VRAM usage and fastest processing |

---

## 📦 Batch Processing System

- Multi-image batch processing
- ZIP upload support
- Automatic image validation
- Resume processing system
- Failed image tracking
- Runtime logging system
- Auto ZIP export after processing

---

## 🧠 Adaptive Tile Fallback

Automatic VRAM-safe fallback system:

```text
600 → 400 → 200 → 100
```

If GPU memory fails during inference, the engine automatically retries with a smaller tile size instead of crashing the entire batch process.

---

## 🌐 Cloudflare Public Access

Built-in Cloudflare Tunnel integration allows you to:

- Launch Gradio publicly from Kaggle
- Access the UI from any device
- Share the application without local deployment

No external deployment platform required.

---

## 🎨 Interactive Gradio UI

Modern interface with:

- Drag & Drop Upload
- ZIP Extraction
- Kaggle Dataset Import
- Google Drive Import
- Interactive Galleries
- Batch Upscale Playground
- ZIP Download Export

---

## 🔍 Smart Image Validation

Automatically:
- detects invalid images
- fixes extension mismatches
- removes corrupted files
- validates supported formats

Supported formats:
- JPG
- JPEG
- PNG
- WEBP
- BMP
- TIFF

---

# 🖼️ Preview

> Add your UI screenshots here for better project presentation.

## Example Suggested Sections

- Main Interface
- Batch Processing
- Before vs After Comparison
- Cloudflare Public Access
- ZIP Export

---

# ⚡ Quick Start

## 1. Open the Kaggle Notebook

👉 https://www.kaggle.com/code/pyrisforge/easy-realesrgan-image-upscaler

---

## 2. Enable GPU

Go to:

```text
Settings → Accelerator → GPU
```

Recommended:
- Tesla T4
- Tesla P100

---

## 3. Run All Cells

The notebook will automatically:

- clone Real-ESRGAN
- install dependencies
- download models
- apply Python compatibility patches
- launch the Gradio application
- generate a public Cloudflare URL

---

## 4. Open the Public URL

After launch:

```text
🚀 Easy-RealESRGAN is Online!
```

Click the generated Cloudflare URL to access the application.

---

# 📂 Workflow

```text
Upload Images
    ↓
Select Quality & Scale
    ↓
Start Batch Upscaling
    ↓
Automatic Processing
    ↓
Auto ZIP Export
    ↓
Download Results
```

---

# ⚙️ Supported Modes

| Category | Options |
| :--- | :--- |
| **Image Type** | General / Anime |
| **Scale** | 2x / 4x |
| **Quality Preset** | Ultra / High / Balanced / Fast |
| **Input Sources** | Upload / ZIP / Kaggle / Google Drive |
| **Output Export** | Gallery / ZIP Download |

---

# 🧠 Project Architecture

## Core Components

| Component | Description |
| :--- | :--- |
| **QualityConfig** | Centralized preset & model configuration |
| **RealESRGANUpscaler** | Main inference engine |
| **Batch Processing Engine** | Multi-image processing system |
| **Resume System** | Continue processing after interruption |
| **Cloudflare Launcher** | Public Gradio access |
| **Logging System** | Structured runtime & error logging |

---

# 🚀 Optimizations

This project includes multiple runtime optimizations for Kaggle & Colab environments.

## ✅ GPU Optimizations
- Automatic VRAM cleanup
- Adaptive tile retry system
- FP16 optimization support
- Safe inference retry handling

---

## ✅ Stability Improvements
- Structured logging
- Timeout protection
- Image validation
- Memory cleanup
- Runtime-safe subprocess execution

---

## ✅ Batch Reliability
- Resume processing system
- Failed image tracking
- Automatic ZIP generation
- Corrupted file filtering

---

# ⚠️ Known Limitations

- Kaggle runtime sessions may disconnect after long inactivity.
- Very large images may still require lower quality presets depending on available VRAM.
- Cloudflare quick tunnels are temporary and may occasionally expire.
- Public Cloudflare URLs are regenerated every runtime session.

---

# 📚 Core Technologies

| Technology | Purpose |
| :--- | :--- |
| **Real-ESRGAN** | AI image upscaling |
| **GFPGAN** | Face restoration |
| **BasicSR** | Super-resolution framework |
| **Gradio** | Interactive UI |
| **Cloudflared** | Public tunnel access |
| **PyTorch** | Deep learning inference |

---

# 🙌 Credits

## Real-ESRGAN
https://github.com/xinntao/Real-ESRGAN

## GFPGAN
https://github.com/TencentARC/GFPGAN

## BasicSR
https://github.com/XPixelGroup/BasicSR

---

# ☕ Support the Project

If this project has been helpful to you, please consider supporting its development.  
Your support helps maintain and improve the project, fund future research, and continue building better open-source AI tools for the community.

Every contribution truly means a lot and helps push this project further. 🚀

| Platform | Link |
| :--- | :--- |
| **Trakteer** | https://trakteer.id/pyforge |
| **Saweria** | https://saweria.co/pyforge |
| **SociaBuzz** | https://sociabuzz.com/pyforge |
| **PayPal** | https://www.paypal.com/paypalme/Masyura |

---

# ⚖️ License

This project is licensed under the **MIT License**.

You are free to use, modify, and distribute this project, provided that the original copyright and license notice are included.

Copyright (c) 2026 **MasyuraC7**

---

<p align="center">
Made with ❤️ by <b>MasyuraC7</b><br>
Fullstack Programmer • AI Enthusiast • Open-Source Creator
</p>
