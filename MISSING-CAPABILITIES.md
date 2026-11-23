# Missing Capabilities & Gap Analysis

**Objective:** Identify high-value operational capabilities missing from the verified baseline, without introducing redundant duplicates or memory-heavy baggage.

---

## 1. High-Leverage Identified Capability Gaps

### Gap 1: Local Document Generation & Formatting (.docx, .xlsx, .pptx, .pdf)
- **Baseline State:** The environment had cloud integrations (Google Docs, Sheets, Slides, Canva), but **zero offline local capabilities** for creating, editing, and parsing Microsoft Office (.docx, .xlsx, .pptx) or PDF files directly on the filesystem.
- **Impact:** Agents tasked with generating client reports, data tables, presentation decks, or extracting text from PDFs had to rely on unstructured plain text or external cloud APIs.
- **Solution:** Integrated Anthropic's official `docx`, `xlsx`, `pptx`, and `pdf` document skills.

### Gap 2: Rigorous Software Engineering & TDD Workflows
- **Baseline State:** The environment possessed `gsd` (spec planning), `ponytail` (minimal diffs), and `ralph-loop` (autonomous loops), but lacked strict **Test-Driven Development (TDD)** enforcement and evidence-based verification guardrails.
- **Impact:** Agents could claim fixes or features were complete without proving them with failing/passing test runs.
- **Solution:** Integrated `obra/superpowers` core methodologies:
  - `test-driven-development` (write failing test first, verify failure, write minimal code, verify pass).
  - `systematic-debugging` (hypothesis-driven root-cause isolation before editing).
  - `verification-before-completion` (strict requirement to provide command execution logs before claiming victory).
  - `using-git-worktrees` (branch isolation for parallel tasks).

### Gap 3: Architectural Security Threat Modeling
- **Baseline State:** Existing security tools (`web-security-inspector`, `web-app-security-auditor`) were focused on post-implementation SAST code audits and endpoint headers. The environment lacked upfront **architectural threat modeling**.
- **Impact:** Architectural flaws (unclear trust boundaries, abuse paths, orphaned security modules) were only caught after code was written.
- **Solution:** Integrated OpenAI's `security-threat-model` (STRIDE-based threat modeling) and `security-ownership-map` (Git-grounded bus-factor and sensitive hotspot analysis).

### Gap 4: Meta-Tooling: Skill & MCP Authoring
- **Baseline State:** The agent had no built-in standard operating procedure for creating new MCP servers or evaluating new skills.
- **Impact:** Custom tools and skills lacked standardized validation, evaluation metrics, and FastMCP/TypeScript patterns.
- **Solution:** Integrated Anthropic's `mcp-builder` and `skill-creator`, alongside `doc-coauthoring` for technical RFCs and ADRs.

### Gap 5: Modern React / Frontend Architecture Guidance
- **Baseline State:** While styling rules (`high-def-uiux-studio`) and references (`mobbin`, `shadcn`) were present, patterns for scalable component composition without boolean prop explosion were missing.
- **Impact:** Complex UI components risked boolean prop bloat and brittle state coupling.
- **Solution:** Integrated Vercel's `vercel-composition-patterns` and `web-design-guidelines`.

### Gap 6: Cloudflare Worker & Edge Infrastructure Deployment
- **Baseline State:** The environment was heavily oriented toward Vercel and Firebase for edge and serverless deployments, with no native skill for Cloudflare Workers, Pages, and KV/D1.
- **Impact:** Deployments targeted to Cloudflare required manual unguided shell commands.
- **Solution:** Integrated `cloudflare-deploy`.

---

## 2. Intentionally Excluded & Non-Viable Candidates

| Candidate Component | Origin Repository | Evaluation & Reason for Exclusion |
| :--- | :--- | :--- |
| **LangGraph / CrewAI / AG2 / MetaGPT** | External Python frameworks | **Excluded:** Require persistent Python daemon processes, bloated dependency trees, and 1.5–3 GB RAM overhead. Redundant with Antigravity's native `Swarm` and `EGM`. |
| **OpenHands / SWE-agent** | Dockerized agent environments | **Excluded:** Require active Docker Desktop daemon (2–4 GB RAM minimum). Would cause catastrophic thrashing/OOM on this 8 GB RAM host. |
| **browser-use / Skyvern** | Vision-LLM browser tools | **Excluded:** Redundant with already installed **Playwright** (25 tools) and **Chrome DevTools** (33 tools). Multiple active browser engines exhaust memory and CPU. |
| **Firecrawl / Exa / Brave Search MCP** | Web search MCPs | **Excluded:** Redundant with native Google search (`search_web`), `keenable`, and `parallel-search`. Require paid API subscription keys. |
| **Duplicate Structure Viewer MCP** | Local duplicate | **Excluded:** `science_biomolecular_structure_viewer_mcp` duplicated `structural-biology_structure_viewer_mcp`. Kept single authoritative instance. |
