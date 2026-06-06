# Chatting with the Xentonal Assistant

## Introduction

The `XentonalAssistant` package provides a built-in agent, `xen.assist`,
designed to help users explore and synthesize xentonal scales. Instead
of manually calling complex scaling functions, you can interact with the
assistant in plain English.

The assistant is powered by the `ellmer` package and connects to an
OpenAI-compatible API (such as Ollama) to process queries and execute R
tools automatically.

## Prerequisites

To use the chat functionality, you will need:

1.  **An LLM Server**: The assistant defaults to using **Ollama**.
    Ensure Ollama is installed and running on your local machine.

2.  **The `ellmer` package**: This package manages the communication
    between R and the LLM.

    ``` r

    install.packages("ellmer")
    ```

3.  **A compatible model**: By default, the assistant looks for
    `gemma4:31b`. You can pull this in Ollama via:

    ``` bash
    ollama pull gemma4:31b
    ```

## Starting the Chat

To start an interactive session, simply call the
[`xen_chat()`](https://algocompsynth.github.io/XentonalAssistant/reference/xen_chat.md)
function.

``` r

XentonalAssistant::xen_chat()
```

Once called, the assistant will initialize its system prompt and
register a set of xentonal tools (including scale generators and
synthesizers). You can then type your queries directly into the R
console. To exit the chat, type `exit` or `quit`.

## Customizing the Connection

If your LLM server is hosted on a different machine or you prefer a
different model, you can pass arguments to
[`xen_chat()`](https://algocompsynth.github.io/XentonalAssistant/reference/xen_chat.md):

``` r

XentonalAssistant::xen_chat(
  model = "llama3", 
  base_url = "http://192.168.1.50:11434/v1"
)
```

## What can the assistant do?

The `xen.assist` agent is equipped with specialized tools that allow it
to perform the following tasks on your behalf:

- **Scale Generation**: It can create Equal Tempered (EDO), Combination
  Product Set (CPS), and Product Set scales.
- **Analysis**: It can generate interval tables and MIDI keyboard maps
  for any generated scale.
- **Synthesis**: It can synthesize single notes or chords as WAV files
  using
  [`note_synth()`](https://algocompsynth.github.io/XentonalAssistant/reference/note_synth.md)
  and
  [`chord_synth()`](https://algocompsynth.github.io/XentonalAssistant/reference/chord_synth.md).

#### Example Queries

Try asking the assistant: - *“Can you create a 31-EDO scale starting at
440Hz?”* - *“What are the frequency ratios for a Bohlen-Pierce
scale?”* - *“Synthesize a sine wave C# in 19-EDO (approx 466Hz) so I can
hear it.”*

## Troubleshooting

If you encounter an error stating that `ellmer` is missing, please
install it. If the chat fails to connect, verify that your Ollama server
is running and that you have pulled the required model using the command
line.
