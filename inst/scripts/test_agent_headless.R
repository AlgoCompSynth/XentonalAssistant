
# Headless Integration Test for xen.assist
library(ellmer)
library(cli)

# Source necessary files from the package
source("R/scaling.R")
source("R/synthesis.R")
source("R/agent_tools.R")

cli::cli_h1("Starting Headless Integration Test for xen.assist")

# Configuration
model <- "gemma4:31b"
base_url <- "http://localhost:11434/v1"
system_prompt_path <- system.file("prompts/system_prompt.md", package = "XentonalAssistant")

# Load system prompt (fallback if not installed)
prompt_text <- if (file.exists(system_prompt_path)) {
  readLines(system_prompt_path, warn = FALSE) |> paste(collapse = "\n")
} else {
  "You are a music theory assistant specializing in xentonal scales."
}

# Initialize the chat object with tools registered
chat <- ellmer::chat_openai_compatible(
  base_url = base_url,
  model = model,
  system_prompt = prompt_text,
  api_key = "ollama"
)

chat$register_tools(get_xen_tools())

test_prompts <- list(
  "Generate a 31-EDO scale starting at 440Hz and tell me the frequencies of the first 5 notes.",
  "I want to hear a C# in 19-EDO (approximately 466Hz), please synthesize a sine wave for 1 second."
)

for (i in seq_along(test_prompts)) {
  cli::cli_h2("Test {i}: {test_prompts[[i]]}")
  
  tryCatch({
    response <- chat$chat(test_prompts[[i]])
    cat("\nAssistant répondre:\n", response, "\n\n")
  }, error = function(e) {
    cli::cli_alert_danger("Error during test: {e$message}")
  })
}

cli::cli_h1("Headless Test Completed")
