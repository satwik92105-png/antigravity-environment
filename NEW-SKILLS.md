# Newly Installed Skills Specification

All skills listed below have been installed globally to `C:\Users\HP\.gemini\config\skills\` and registered in `C:\Users\HP\.gemini\config\skills.json`.

---

## 1. Local Document Processing (Official Anthropic Skills)

### 1. `docx`
- **Location:** `C:\Users\HP\.gemini\config\skills\docx\`
- **Capabilities:** Create, inspect, edit, and format professional Word documents (`.docx`, `.dotx`). Handles tables of contents, typographic hierarchy, image insertions, and style template inheritance.
- **Trigger:** Mention of Word doc, `.docx`, or requests to generate formal structured reports.

### 2. `xlsx`
- **Location:** `C:\Users\HP\.gemini\config\skills\xlsx\`
- **Capabilities:** Create, modify, clean, and analyze spreadsheets (`.xlsx`, `.csv`, `.tsv`). Handles formula calculations, multi-sheet workbooks, charting, and restructuring messy data rows.
- **Trigger:** Spreadsheets, tabular data conversion, data sanitization, financial models.

### 3. `pdf`
- **Location:** `C:\Users\HP\.gemini\config\skills\pdf\`
- **Capabilities:** Deep inspection of PDF documents, text extraction, form field reading, metadata analysis, and layout preservation.
- **Trigger:** PDF document parsing, data extraction from invoices or manuals.

### 4. `pptx`
- **Location:** `C:\Users\HP\.gemini\config\skills\pptx\`
- **Capabilities:** Create and format PowerPoint decks (`.pptx`). Sets slide layouts, shapes, typography, speaker notes, and visual decks.
- **Trigger:** Presentation deck creation, slide deck editing, pitch decks.

---

## 2. Rigorous Engineering & Verification (Superpowers Skills)

### 5. `test-driven-development`
- **Location:** `C:\Users\HP\.gemini\config\skills\test-driven-development\`
- **Capabilities:** Enforces the strict TDD cycle:
  1. Write a focused unit/integration test that asserts expected behavior.
  2. Run the test and verify it fails for the expected reason.
  3. Write the minimal implementation code to pass the test.
  4. Refactor and verify clean passing state.
- **Trigger:** Implementing any new feature, algorithm, endpoint, or bug fix.

### 6. `systematic-debugging`
- **Location:** `C:\Users\HP\.gemini\config\skills\systematic-debugging\`
- **Capabilities:** Prevents guesswork and random code modifications. Guides the agent to:
  1. Reproduce the bug consistently in an isolated test.
  2. Formulate explicit, testable hypotheses for the root cause.
  3. Trace the failure to the earliest diverging state.
  4. Fix the root cause in the shared primitive and confirm fix.
- **Trigger:** Any runtime error, failed test, regression, or unexpected behavior.

### 7. `verification-before-completion`
- **Location:** `C:\Users\HP\.gemini\config\skills\verification-before-completion\`
- **Capabilities:** Mandates "Evidence Before Assertions." Prohibits the agent from claiming a task is done or a bug is resolved without executing a concrete test or verification command and citing the output log.
- **Trigger:** Prior to finalizing a task, declaring completion, or committing changes.

### 8. `using-git-worktrees`
- **Location:** `C:\Users\HP\.gemini\config\skills\using-git-worktrees\`
- **Capabilities:** Safely creates isolated Git worktree environments for experimental branches, preventing disruption to the primary working copy.
- **Trigger:** Multi-agent branch isolation, speculative refactorings.

---

## 3. Architecture & Security (OpenAI Skills)

### 9. `security-threat-model`
- **Location:** `C:\Users\HP\.gemini\config\skills\security-threat-model\`
- **Capabilities:** Repository-grounded architectural threat modeling. Identifies trust boundaries, assets, threat actors, attack vectors, and STRIDE mitigations. Produces actionable threat models.
- **Trigger:** Explicit requests for threat modeling, security architecture reviews, or pre-production audits.

### 10. `security-ownership-map`
- **Location:** `C:\Users\HP\.gemini\config\skills\security-ownership-map\`
- **Capabilities:** Analyzes Git history to compute code ownership, bus factor, sensitive module hotspots, and orphaned code paths.
- **Trigger:** Auditing repository bus factor, critical path maintenance risks.

### 11. `cloudflare-deploy`
- **Location:** `C:\Users\HP\.gemini\config\skills\cloudflare-deploy\`
- **Capabilities:** End-to-end guidance for deploying applications and infrastructure to Cloudflare Workers, Pages, KV, D1, and R2 using Wrangler.
- **Trigger:** Deploying or managing Cloudflare infrastructure.

---

## 4. Meta-Engineering & Collaboration

### 12. `mcp-builder`
- **Location:** `C:\Users\HP\.gemini\config\skills\mcp-builder\`
- **Capabilities:** Best practices for building Model Context Protocol (MCP) servers using FastMCP (Python) or the MCP TypeScript SDK. Covers tool design, schema definitions, error propagation, and stdio/HTTP transports.
- **Trigger:** Creating or refactoring MCP servers.

### 13. `skill-creator`
- **Location:** `C:\Users\HP\.gemini\config\skills\skill-creator\`
- **Capabilities:** Guide for designing, optimizing, benchmarking, and writing high-accuracy `SKILL.md` runbooks with progressive disclosure.
- **Trigger:** Authoring new agent skills.

### 14. `doc-coauthoring`
- **Location:** `C:\Users\HP\.gemini\config\skills\doc-coauthoring\`
- **Capabilities:** Structured workflow for authoring technical specs, RFCs, Architecture Decision Records (ADRs), and product proposals through iterative refinement.
- **Trigger:** Drafting technical proposals, architectural RFCs, or documentation.

---

## 5. Modern Frontend Architecture (Vercel Labs)

### 15. `vercel-composition-patterns`
- **Location:** `C:\Users\HP\.gemini\config\skills\vercel-composition-patterns\`
- **Capabilities:** React 19 component composition patterns, compound components, render props, and context providers that scale without boolean prop proliferation.
- **Trigger:** Refactoring complex UI components, designing reusable component libraries.

### 16. `web-design-guidelines`
- **Location:** `C:\Users\HP\.gemini\config\skills\web-design-guidelines\`
- **Capabilities:** Web Interface Guidelines audit: accessibility checks, focus management, touch targets, and visual polish.
- **Trigger:** Auditing website UX, checking UI compliance.
