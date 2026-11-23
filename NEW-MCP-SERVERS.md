# MCP Servers Evaluation & Integration Blueprint

**Evaluation Focus:** Model Context Protocol (MCP) capabilities across code intelligence, research, devops, testing, and memory efficiency.

---

## 1. Candidate Evaluation & Trade-off Analysis

### A. Code Intelligence & Semantic AST: Serena (`oraios/serena`)
- **What it is:** Semantic code retrieval, editing, refactoring, and debugging at the AST and symbol level using Language Server Protocol (LSP) integrations.
- **Benefits:** Replaces brute-force regex/grep with symbol-level operations (`find_symbol`, `find_referencing_symbols`, atomic symbol insertions).
- **Resource Footprint:** Serena runs via Python/`uvx` and spawns dedicated LSP servers (e.g. Pyright, TypeScript Language Server) which parse and index codebases into host RAM (typically 200–500 MB per language server).
- **Recommendation:** **On-Demand Staging.** Do not enable Serena as a permanent, continuously running global MCP background process on this 8 GB RAM system. Instead, stage it in project-level `mcp_config.json` for large polyglot refactoring tasks where symbol-level precision is essential.

### B. Remote GitHub Platform: GitHub MCP (`github/github-mcp-server`)
- **What it is:** Official MCP bridge connecting agents to GitHub issues, PRs, code search, and project boards.
- **Deployment Models:**
  1. *Local Stdio Server:* Spawns a Node/Docker process locally and requires a Personal Access Token (`GITHUB_PERSONAL_ACCESS_TOKEN`).
  2. *Remote Hosted Server:* Connects via HTTPS to GitHub's hosted endpoint (`https://api.githubcopilot.com/mcp/`), consuming zero local RAM.
- **Recommendation:** **Pending User Auth.** When GitHub issue/PR management is required, use the remote hosted endpoint or lightweight stdio process with a scoped PAT. (See `AUTHENTICATION-PENDING.md`).

### C. Search & Web Research: Firecrawl, Exa, Brave Search
- **Evaluation:**
  - Firecrawl (`firecrawl-mcp-server`): Excellent markdown web scraper, but requires a paid API key ($16+/mo) or self-hosted Docker infrastructure.
  - Exa (`exa-labs/exa-mcp-server`): Neural web search, requires a paid API key ($10+/mo).
  - Brave Search (`brave/brave-search-mcp-server`): Requires a Brave Search API key.
- **Verdict: Excluded as Redundant.** The existing environment already contains:
  1. Google Native Search (`search_web` tool): Free, high-speed, authoritative.
  2. `keenable_keenable`: Live web page search and text content fetching.
  3. `keenable-select_keenable-select`: Multi-page comparative tabular synthesis.
  4. `parallel_parallel-search`: Parallel multi-query web fetching.
  Installing Firecrawl or Exa would duplicate functionality while forcing paid subscriptions.

### D. Testing & Browser Automation: Playwright & Chrome DevTools
- **Current State:**
  - `playwright`: 25 tools (headless script execution, snapshots, form interaction).
  - `chrome-devtools`: 33 tools (DOM inspection, CSS, console errors, Lighthouse audits).
- **Verdict: Optimized.** These two cover 100% of web and UI testing requirements. Adding third-party frameworks like `browser-use` or `Skyvern` was rejected to avoid launching redundant browser processes that exhaust the 8 GB RAM limit.

---

## 2. Active Server Roster & Transport Architecture

The 20 verified MCP servers in your environment are categorized by transport:

| Server | Transport | Tool Count | Resource Profile |
| :--- | :--- | :--- | :--- |
| `21st-dev` | Remote HTTPS SSE | 51 | 0 MB Host RAM (Cloud Hosted) |
| `ui-skills` | Remote HTTPS SSE | 2 | 0 MB Host RAM (Cloud Hosted) |
| `playwright` | Local Stdio (npx) | 25 | On-Demand Process |
| `chrome-devtools` | Local Stdio (npx) | 33 | On-Demand Process |
| `shadcn` | Local Stdio (npx) | 7 | On-Demand Process |
| `yt-dlp` | Local Stdio (npx) | 10 | On-Demand Process |
| `ffmpeg` | Local Stdio (npx) | CLI | On-Demand Process |
| `linear_linear` | Plugin Managed | 70 | Plugin Sandbox |
| `figma_figma` | Plugin Managed | 47 | Plugin Sandbox |
| `canva_canva` | Plugin Managed | 43 | Plugin Sandbox |
| `wispr-flow_wispr-flow` | Plugin Managed | 16 | Plugin Sandbox |
| `zapier_zapier` | Plugin Managed | 17 | Plugin Sandbox |
| `data-agent-kit-plugin_dak-notebook`| Plugin Managed | 9 | Plugin Sandbox |
| `structural-biology_structure_viewer_mcp` | Plugin Managed | 9 | Plugin Sandbox |
| `mobbin_mobbin` | Plugin Managed | 8 | Plugin Sandbox |
| `context7_context7` | Plugin Managed | 2 | Plugin Sandbox |
| `keenable_keenable` | Plugin Managed | 2 | Plugin Sandbox |
| `keenable-select_keenable-select` | Plugin Managed | 3 | Plugin Sandbox |
| `parallel_parallel-search` | Plugin Managed | 3 | Plugin Sandbox |
| `gemini-api_gemini-api-docs` | Plugin Managed | 2 | Plugin Sandbox |
