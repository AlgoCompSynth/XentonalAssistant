# Synthesize a Single Note

Generates a Wave object for a single frequency

## Usage

``` r
note_synth(
  freq,
  signal = "tria",
  duration_sec = 1,
  velocity = 100,
  sample_rate_hz = 48000,
  bit_width = 24
)
```

## Arguments

- freq:

  The frequency of the note in Hz

- signal:

  Signal type: "sine", "tria", "square" or "saw"

- duration_sec:

  Duration in seconds, default 1

- velocity:

  MIDI velocity (0-127), default 100

- sample_rate_hz:

  Sample rate, default 48000

- bit_width:

  Bit width (8, 16, 24, 32, 64), default 24

## Value

A tuneR Wave object
