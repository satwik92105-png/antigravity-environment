# Compatibility & Agent Ecosystem Comparative Evaluation

**Mission Directive:** Investigate candidate agent frameworks and tools across AI ecosystems to determine whether they justify installation or whether native Antigravity capabilities render them redundant.

---

## 1. External Multi-Agent Frameworks Evaluation

| Framework | Architecture Type | Host Resource Cost | Native Antigravity Equivalent | Verdict |
| :--- | :--- | :--- | :--- | :--- |
| **LangGraph** (`langchain-ai/langgraph`) | StateGraph Python framework | High (Python daemon, LangChain/Pydantic runtime, ~300 MB RAM) | **Native Swarm + EGM personas** | **REJECTED (Redundant & Heavy)**. Antigravity native Swarm provides stateful multi-agent communication with zero memory footprint outside the main process. |
| **CrewAI** (`crewAIInc/crewAI`) | Role-based Python multi-agent | High (Multi-threaded Python runtime, LiteLLM, ~400 MB RAM) | **Antigravity Specialist Subagents** (`define_subagent`) | **REJECTED (Redundant)**. Subagents defined in Antigravity natively enforce role descriptions, prompts, and tool boundaries without Python daemon bloat. |
| **AG2 / AutoGen** (`ag2ai/ag2`) | Conversational agent framework | High (Async event loop, multi-agent chat history, ~350 MB RAM) | **Native Swarm Message Board** | **REJECTED (Redundant)**. Swarm message board already enables conversational collaboration, coordinator monitoring, and worker briefs. |
| **OpenHands** (`All-Hands-AI/OpenHands`) | Sandboxed Docker environment | Extreme (Docker Desktop daemon, container images, 2.5–4.0 GB RAM) | **Antigravity Tool Execution + Vercel Sandbox** | **REJECTED (Host Incompatible)**. The host has only 7.19 GB RAM total (~670 MB free). Docker containers would trigger catastrophic OS thrashing. |
| **SWE-agent** (`SWE-agent/SWE-agent`) | Dockerized benchmark agent | Extreme (Docker container, heavy dependencies, ~2.0 GB RAM) | **GSD + Ponytail + CodeRabbit** | **REJECTED (Host Incompatible)**. CodeRabbit and Ponytail provide faster, safer local code refinement with zero container overhead. |
| **MetaGPT** (`FoundationAgents/MetaGPT`) | Multi-agent software company | High (Complex Python runtime, mermaid generators, ~450 MB RAM) | **PRD (`prd`) + GSD + Architecture Matrix** | **REJECTED (Redundant)**. Spec-driven development (`gsd`), PRD loop (`ralph`), and architectural personas (`egm`) fulfill all product lifecycle needs. |
| **browser-use** (`browser-use/browser-use`) | Vision-LLM browser agent | High (Spawns active Chromium instance with continuous screenshot streaming) | **Playwright MCP + Chrome DevTools MCP** | **REJECTED (Duplication)**. Playwright and Chrome DevTools MCP already provide full headless and visual browser automation with lower resource consumption. |
| **Skyvern** (`Skyvern-AI/skyvern`) | Vision-based computer automation | Extreme (Docker, Playwright, LLM vision loop, ~1.5 GB RAM) | **Web User Assistant + Playwright MCP** | **REJECTED (Duplication)**. The existing Web User Assistant and Playwright integration cover the user interaction flows without external services. |

---

## 2. Universal Skills Ecosystem (`skills.sh` / `vercel-labs/skills`)

- **Compatibility:** **100% Native Antigravity Support.**
- **Integration Findings:** The universal `skills` CLI (`npx skills`) automatically identifies Google Antigravity as a supported agent (`antigravity Agent detected — installing non-interactively`) and installs modular `SKILL.md` bundles into `~/.gemini/config/skills/`.
- **Selected Repositories Evaluated:**
  - `anthropics/skills`: 20 skills evaluated; 6 selected (`docx`, `xlsx`, `pdf`, `pptx`, `mcp-builder`, `skill-creator`, `doc-coauthoring`).
  - `obra/superpowers`: 15 skills evaluated; 4 selected (`test-driven-development`, `systematic-debugging`, `verification-before-completion`, `using-git-worktrees`).
  - `openai/skills`: 43 skills evaluated; 3 selected (`security-threat-model`, `security-ownership-map`, `cloudflare-deploy`).
  - `vercel-labs/agent-skills`: 9 skills evaluated; 2 selected (`vercel-composition-patterns`, `web-design-guidelines`).
  - `github/awesome-copilot`: 200+ skills evaluated; verified existing coverage; excluded superficial duplicates.
  - `VoltAgent/awesome-agent-skills`: Evaluated as a meta-directory; relevant patterns integrated into specific skills.
