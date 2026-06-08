---
# client: claude/claude-4-5-sonnet-latest
tools: [docs, env, files, ide, search, session, web]
---
# xen

> An AI-powered engine for xentonal algorithmic composition and exploration.

## Overview

`xen` is a personal R project designed to enable the exploration of non-standard musical scales (xentonicity) through the use of large language models (LLMs). Rather than acting as a traditional music library, it serves as an "engine" that allows an AI agent to programmatically define mathematical scale systems, map them to a keyboard, and synthesize audio to audition the results.

The primary objective is to use AI to drive the process of algorithmic composition, shifting the human role from manual parameter tuning to high-level curation and prompting.

## Design Philosophy & Context

The project is built around the idea that xentonal music—which often involves complex mathematical relationships between frequencies—is a fertile ground for LLM exploration. By providing an AI with precise tools to generate scales and hear them immediately, the developer can iterate on compositional ideas (like scale choice and chord progressions) via a conversational interface.

### Key Design Decisions
* **Agentic Execution:** The library is designed to be driven by a capable AI agent that can read this documentation (`btw.md`), explore the source code, write R scripts, and execute them directly in the environment. This removes the need for rigid tool-definition wrappers and allows for maximum flexibility in how the AI combines functions.
* **Data-Centric Scales:** Scales are represented as tables (data frames). This allows for easy manipulation and ensures that frequency data can be passed transparently between scale generation, keyboard mapping, and synthesis modules.
* **Direct Waveform Synthesis:** To avoid the constraints of MIDI and standard 12-TET tuning, `xen` uses `seewave` and `tuneR` to generate raw WAV files. This ensures absolute frequency precision for any custom xentonal system.

## Quick Reference

| Detail | Context |
| :--- | :--- |
| **Language** | R |
| **Core Stack** | `seewave` (Synthesis), `tuneR` (WAV handling) |
| **Operational Mode** | Agent-driven code execution via `btw.md` context |
| **Primary Goal** | Xentonal algorithmic composition via AI |

## How It Works

The project follows a linear pipeline from mathematical theory to audible sound, which the AI agent can drive by writing and executing R code using these modules:

### 1. Scale Generation (`R/scaling.R`)
* `et_scale_generate(period, divisions, root_freq)`: Generates an Equal Divisions of the Octave (EDO) scale.
* `cps_scale_table(harmonics, choose, root_divisor)`: Creates a Combination Product Set (CPS) scale table from harmonic sets.
* `ps_scale_table(ps_def, root_divisor)`: Creates a product set scale from explicit definitions (e.g., '1x3').

### 2. Keyboard Mapping (`R/scaling.R`)
* `keyboard_map(scale_table, middle_c_octave = 4)`: Maps xentonal notes to MIDI note numbers and frequencies for a physical or virtual keyboard layout.

### 3. Audio Synthesis (`R/synthesis.R`)
* `note_synth(freq, signal, ...)`: Generates a single-frequency `Wave` object.
* `chord_synth(chord, signal, ...)`: Sums multiple frequencies into a chord `Wave` object.
* `chord_WAVs(...)`: Batch exports chord inversions to WAV files for multisampling.

### 4. Analysis Tools (`R/scaling.R`)
* `interval_table(scale_table)`: Analyzes the harmonic relationships and intervals within a scale table.

## Technical Details

### Directory Structure
```text
./
├── R/
│   ├── data.R          # Data handling utilities
│   ├── scaling.R       # CORE: Scale generation, interval analysis, and keyboard mapping logic
│   ├── synthesis.R     # CORE: Waveform synthesis and WAV file export
│   └── xen_chat.R      # (Legacy) Interactive chat loop wrapper
└── DESCRIPTION         # Package metadata and dependencies
```

### Key Dependencies
* **`seewave`**: Used for the `synth()` function to create raw waveforms.
* **`tuneR`**: Handles the creation, normalization, and writing of `.wav` files.
* **`data.table`**: Used for efficient manipulation of scale tables.

## Development Workflow

### Working with an AI Agent
When acting as the assistant for this project, the agent should:
1. Consult `btw.md` to identify which function (e.g., `cps_scale_table`) is needed.
2. Check the implementation in `R/scaling.R` or `R/synthesis.R` if the exact arguments are unclear.
3. Write and run an R script that chains these functions together.
4. If synthesizing audio, save output to a temporary `.wav` file for the user to audition.

## Roadmap & Future Directions

The project is currently evolving from a scale exploration tool into a composition tool:
* **Music Theory Extensions:** Integration of higher-level music theory logic (e.g., voice leading, chord substitutions) to allow the AI to generate meaningful chord progressions within xentonal systems.
* **Compositional Structures:** Tools for the AI to define melodic movement and harmonic rhythm based on generated scales.
