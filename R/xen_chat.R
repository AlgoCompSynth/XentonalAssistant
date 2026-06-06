#' Define tools available to the xen.assist agent
#'
#' @param model Character string specifying the LLM model to use. Defaults to "gemma4:31b".
#' @param base_url Character string specifying the API base URL. Defaults to "http://localhost:11434/v1".
#' @param system_prompt_path Path to the file containing the system prompt. Defaults to the package-internal system_prompt.md.
#' 
#' @importFrom ellmer chat_openai_compatible
#' @export
xen_chat <- function(model = "gemma4:31b", 
                    base_url = "http://localhost:11434/v1",
                    system_prompt_path = system.file("prompts/system_prompt.md", package = "XentonalAssistant")) {
  
  if (!requireNamespace("ellmer", quietly = TRUE)) {
    stop("Package 'ellmer' is required for xen_chat(). Please install it.")
  }

  # Load system prompt
  prompt_text <- if (file.exists(system_prompt_path)) {
    readLines(system_prompt_path, warn = FALSE) |> paste(collapse = "\n")
  } else {
    "You are a music theory assistant specializing in xentonal scales."
  }

  # Initialize the chat object via Ollama/OpenAI-compatible endpoint
  chat <- ellmer::chat_openai_compatible(
    base_url = base_url,
    model = model,
    system_prompt = prompt_text,
    api_key = "ollama"
  )
  
  # Register the xentonal tools
  chat$register_tools(get_xen_tools())

  message("--- xen.assist initialized ---")
  message("Type 'exit' or 'quit' to stop.")
  
  # Simple interactive loop
  while (TRUE) {
    user_input <- readline(prompt = "User > ")
    if (tolower(user_input) %in% c("exit", "quit")) break
    
    tryCatch({
      response <- chat$chat(user_input)
      cat("\nxen.assist >", response, "\n\n")
    }, error = function(e) {
      warning("Error during chat interaction: ", e$message)
    })
  }
}
