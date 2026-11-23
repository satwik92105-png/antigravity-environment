# Resource Optimization & 8 GB RAM Efficiency Blueprint

**Host Machine Telemetry:**
- **Total Physical RAM:** 7.19 GB
- **Baseline Memory Utilization:** ~90.6% (Used: ~6.52 GB, Available: ~670 MB)
- **Primary Operational Goal:** Maximum practical capability with zero background RAM creep, preventing OS paging and application freezing.

---

## 1. Core Optimization Decisions

### Decision 1: Stateless, File-Based Skill Architecture
- *Mechanism:* Skills installed into `~/.gemini/config/skills/` are purely static markdown files (`SKILL.md`) and lightweight helper scripts.
- *Memory Footprint:* **0 MB background RAM.**
- *Behavior:* The agent loads only the name and description into context at startup. The full body is read on-demand during active tasks, consuming zero memory when idle.

### Decision 2: Elimination of Persistent Background Daemons
- External agent runtimes (such as CrewAI workers, LangGraph FastAPI servers, or Dockerized sandboxes) constantly run Python or Node daemons that consume 200–800 MB each.
- In contrast, Antigravity’s native Subagents and Swarm run within the existing process event loop, adding **0 additional persistent processes**.

### Decision 3: On-Demand Stdio & Remote Streamable HTTP MCPs
- Rather than keeping multiple background database or browser servers running, tools like Playwright and Chrome DevTools MCP spawn child processes **only when a tool call is executed**.
- Remote MCP servers (`21st-dev`, `ui-skills`) offload computation to cloud endpoints over HTTPS, consuming **0 MB local RAM**.

### Decision 4: Rejection of Duplicate Local Browser Engines
- Competing browser automation frameworks (`browser-use`, `Skyvern`) each launch separate Chromium instances (150–300 MB RAM per instance).
- By standardizing strictly on the installed **Playwright** (25 tools) and **Chrome DevTools** (33 tools), browser processes are shared cleanly and terminated when sessions complete.

### Decision 5: Deduplication of Identical MCP Tool Schemas
- Discovered and flagged `science_biomolecular_structure_viewer_mcp`, which duplicated `structural-biology_structure_viewer_mcp`. Ensuring only one authoritative server is registered saves schema parsing overhead.

---

## 2. Recommended Runtime Guidelines for the User

1. **Keep Background Apps Lean:** When running heavy multi-agent workflows, close memory-heavy browser tabs or unused electron apps on the host to keep available RAM above 1 GB.
2. **Use Vercel Sandbox for Heavy Builds:** When building large Next.js projects or running extensive test suites, leverage the `offload-to-sandbox` skill to run builds on ephemeral Vercel microVMs instead of local CPU/RAM.
3. **Avoid Unnecessary Local LLMs:** Do not run local Ollama or HuggingFace models on this machine while Antigravity is active. Use cloud API endpoints (Gemini, Claude, OpenAI) to preserve host memory.
