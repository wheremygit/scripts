# My Scripts Collection

Welcome to my personal collection of automation and utility scripts. This repository houses various tools designed to optimize Linux workflows, manage packages, and bypass software compatibility limitations.

---

## Repository Structure

Based on the repository layout:

```text
.
├── LICENSE                            # Repository license terms
├── README.md                          # Main repository overview (this file)
├── Davinci Resolve Scripts/           # Video editing automation tools
│   ├── Import Bin.py                  # Automated folder-to-bin sync tool
│   ├── Import Media.py                # Advanced asset-by-asset media importer
│   └── README.md                      # Detailed setup for DaVinci Resolve scripts
└── Package Management/                # System administration tools
    └── arch-reboot-check.sh           # Arch Linux post-update reboot checker

```

---

## Featured Tools

### 1. DaVinci Resolve Automation (Linux)

Located in `Davinci Resolve Scripts/`, this toolset fixes the infamous "silent AAC audio" issue common to Linux video editing setups.

Instead of dealing with separate tracks or fragile GUI automation, these scripts pre-process your media files instantly using FFmpeg. They clone the video stream exactly (zero quality loss, lightning-fast) and transcode the audio to lossless **FLAC**, then inject the unified clips directly into your open Resolve project.

* **Import Media.py:** Multi-select any combination of supported files (videos, audio, images, LUTs). Videos are optimized on the fly; other assets are imported directly.
* **Import Bin.py:** Select an entire directory. The script transcodes any video files inside it and automatically creates a matching, organized Bin (sub-folder) in your Media Pool.

*For standalone dependencies and setup instructions, check out the [Davinci Resolve Scripts README](https://github.com/wheremygit/scripts/blob/main/Davinci%20Resolve%20Scripts/README.md).*

### 2. Package Management Utilities

Located in `Package Management/`:

* **arch-reboot-check.sh:** A lightweight utility script for Arch Linux that checks system files (like the Linux kernel, systemd, and glibc) post-upgrade to determine if a system reboot is required.

---
