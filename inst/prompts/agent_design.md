
## Agent Implementation Design: xen.assist

### Component 1: The LLM Interface (ollama)
- Package Recommendation: `ellmer`
- Reason: Supports local Ollama endpoints, structured outputs, and is designed for agentic workflows within the Posit/R ecosystem.
- Logic: a system prompt will be defined to instruct the model as "xen.assist", providing it with the function signatures of XentonalAssistant.

### Component 2: The Execution Bridge (The "Agent" part)
- Mechanism: Tool Calling / Function Calling.
- Flow: User Input $ightarrow$ ellmer/Ollama $ightarrow$ LLM identifies a tool call (e.g., `et_scale_generate`) $ightarrow$ R captures the request $ightarrow$ Executes function internally $ightarrow$ Returns result to LLM $ightarrow$ Final response to user.

### Component 3: The Terminal Interface
- Method: An R script using `readline` in a while loop, or a simple CLI wrapper via `optparse`.
- Integration: Packaged as an R function (e.g., `xen_chat()`) that the user calls from their terminal session.

### Implicit Requirements Checklist:
- [ ] Create system prompt template for xentonal music guidance.
- [ ] Implement "Tool" definitions for common XentonalAssistant functions.
- [ ] Handle file writing (WAV files) seamlessly via the agent.

### Notes from znmeb

There is an R package called `cli` for building terminal-oriented user interfaces.
See <https://cli.r-lib.org/> for the documentation. It appears to be installed on
the system already. There is also a Claude-compatible skill for it at 
`~/Projects/skills/r-lib/cli`.

```
⬢ [R-AI-D-CUDA] ❯ ll ~/Projects/skills/r-lib/cli/
total 12
-rw-rw-r--+1 znmeb znmeb 11213 Jun  6 00:59 SKILL.md
drwxrwxr-x+1 znmeb znmeb   134 Jun  6 00:59 references/
```
