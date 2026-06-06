
# XentonalAssistant Todo List

## High-Level Goals
- [ ] Build an R package `XentonalAssistant` providing the `xen.assist` agent.
- [ ] Implement musical scale handling and audio generation (WAV).
- [ ] Create a terminal chat interface for the assistant.
- [ ] Ensure full compliance with r-pkgs.org (tests, devtools::check, pkgdown).

## Detailed Requirements

### Musical Capabilities
- [x] Scale specification logic (migrate from `eikosany`/`consonaR`).
- [ ] WAV generation:
    - [ ] Note generation (Sine, Triangle, Square, Sawtooth).
    - [ ] Parameters: Pitch, Duration, Sample Rate (48kHz), Bit Depth (24-bit).
    - [ ] Chord construction from notes.
    - [ ] Progression construction from chords.
    - [ ] Melody extraction and mixing with progression.

### R Package Standards
- [ ] Unit tests using `testthat`.
- [ ] All CRAN checks pass (`devtools::check()`).
- [ ] `pkgdown` site setup and population.

### Agent/Interface (The "xen.assist" core)
- [ ] Research and select CRAN AI packages for the agentic logic.
    - Implicit Req: Must support local LLM via Ollama.
    - Implicit Req: Terminal chat interface.
- [ ] Implement terminal chat interface.
- [ ] Integrate AI model interaction via Ollama (local requirement).

### Project Management & Recordkeeping
- [x] Keep all persistent state in `inst/prompts` as ASCII text files.
- [ ] Update `REFERENCES.bib` for any external resources used.
- [x] Migrate necessary code from `~/Projects/eikosany` and `~/Projects/consonaR`.

## Current Sprint: Agent Core Implementation
- [ ] Run `scripts/setup_deps.R` to prepare environment.
- [ ] Implement basic `xen_chat` loop using `ellmer` or similar package.
- [ ] Map LLM tool calls to XentonalAssistant functions.
- [x] Fix DESCRIPTION trailing newline.
- [x] Ensure tests source package functions for validation.
- [ ] Implement `note_synth` and verify audio output.
- [ ] research CRAN package `ellmer` (Posit) or similar for Ollama integration.
- [ ] Define API bridge between the Terminal Chat Interface and R functions.
- [ ] Verify all functions in R/scaling.R are unique and correctly named.
- [ ] Review R/synthesis.R for consistency with scaling output.
- [ ] Establish initial test suite skeletons (testthat).