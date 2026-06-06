# Define tools available to the xen.assist agent

Define tools available to the xen.assist agent

## Usage

``` r
xen_chat(
  model = "gemma4:31b",
  base_url = "http://localhost:11434/v1",
  system_prompt_path = system.file("prompts/system_prompt.md", package =
    "XentonalAssistant")
)
```

## Arguments

- model:

  Character string specifying the LLM model to use. Defaults to
  "gemma4:31b".

- base_url:

  Character string specifying the API base URL. Defaults to
  "http://localhost:11434/v1".

- system_prompt_path:

  Path to the file containing the system prompt. Defaults to the
  package-internal system_prompt.md.
