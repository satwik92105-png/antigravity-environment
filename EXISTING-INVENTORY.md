# Existing Environment Inventory Audit (Phase 2 Update)

**Audit Timestamp:** 2026-11-24  
**Audit Scope:** 42 Plugins, 20 MCP Servers, 41 Global Skills, 15 Specialist Agent Roles.  
**Verification Status:** 100% Grounded & Verified on Host Filesystem.

---

## 1. Verified Plugins (42 Total)

| Plugin Name | Category | Scope / Capabilities |
| :--- | :--- | :--- |
| `android-cli-plugin` | Official Plugin | Jetpack Compose preview rendering, Device Hub, and Android build CLI tools. |
| `auth0` | Partner Plugin | Auth0 tenant authentication and user identity management. |
| `canva` | Partner Plugin | Canva design creation, brand kit compliance checks, batch exports. |
| `chemistry` | Official Plugin | RDKit descriptors, ChEMBL queries, PubChem lookups, reaction mechanisms, CADD. |
| `chrome-devtools-plugin` | Official Plugin | Chrome browser automation, a11y, cookies, memory leak diagnostics, Lighthouse. |
| `coderabbit` | Partner Plugin | AI PR code reviews, autofix workflows, `.coderabbit.yaml` repository configuration. |
| `context7` | Partner Plugin | Up-to-date documentation and library API reference lookup MCP. |
| `crowdstrike` | Partner Plugin | CrowdStrike security endpoint detections and integrations. |
| `data-agent-kit-plugin` | Official Plugin | BigQuery DataFrames (BigFrames), Dataform/dbt pipelines, Jupyter notebooks. |
| `dynatrace` | Partner Plugin | Dynatrace APM observability, traces, and metrics. |
| `egm` | Official Plugin | Ensemble of Goldfish Mindsets: specialized architectural review personas. |
| `figma` | Partner Plugin | Figma canvas inspection, Code Connect, GLSL shaders, and generative plugins. |
| `firebase` | Official Plugin | Firebase Auth, Crashlytics, Firestore security rules authoring, Cloud Functions. |
| `flutter` | Official Plugin | Dart & Flutter unit testing, widget tests, architecture patterns, static analysis. |
| `gemini-api` | Official Plugin | Gemini API shell CLI, multimodal media generation, documentation lookup. |
| `genomics` | Official Plugin | ClinVar, dbSNP, ENCODE cCREs, Ensembl, GTEx, JASPAR, UCSC conservation. |
| `get-shit-done` | Installed Plugin | GSD meta-prompting framework: Phase discussion, atomic planning, verification. |
| `gmail` | Official Plugin | Gmail Go CLI: search, send, draft, label, read email messages. |
| `google-antigravity-sdk` | Official Plugin | Antigravity autonomous agent design and multi-agent system orchestrator. |
| `google-cloud-developer` | Official Plugin | Google Cloud IAM, Application Default Credentials (ADC), gcloud recipes. |
| `google-developer-knowledge` | Official Plugin | Official Google developer knowledgebase and documentation queries. |
| `google_maps_platform` | Official Plugin | Google Maps Platform APIs, geocoding, and routing. |
| `high-def-uiux-studio` | Installed Plugin | Modern aesthetic guidelines (Bento grids, luminous micro-borders), UI benchmarking. |
| `keenable` | Partner Plugin | Real-time web search and page content extraction. |
| `keenable-select` | Partner Plugin | Multi-page structured tabular data extraction across the web. |
| `linear` | Partner Plugin | Linear workspace sync (issues, cycles, projects, comments, documents). |
| `mobbin` | Partner Plugin | Mobile and web design UI patterns, screens, and user flow references. |
| `modern-web-guidance-plugin` | Official Plugin | Modern frontend architectural patterns and framework guidelines. |
| `mongodb-atlas` | Partner Plugin | MongoDB Atlas schema design, Queryable Encryption (QE) sizing, query tuning. |
| `parallel` | Partner Plugin | High-speed parallel web search and fetch. |
| `ponytail` | Installed Plugin | Lazy senior developer methodology: smallest viable working code, test-backed. |
| `ralph-loop` | Installed Plugin | Ralph autonomous agent loop running AI tools repeatedly against PRD stories. |
| `science-overview` | Official Plugin | Scientific plugins overview and cross-domain workflow router. |
| `scientific-literature` | Official Plugin | ClinicalTrials.gov, arXiv, bioRxiv, medRxiv, Europe PMC, openFDA. |
| `structural-biology` | Official Plugin | Protein Data Bank (PDB), STRING PPIs, UniProtKB, Human Protein Atlas. |
| `swarm` | Built-in Plugin | Native Antigravity swarm coordination via shared message board. |
| `vercel-plugin` | Partner Plugin | Vercel deployment, AI SDK, Chat SDK, functions, cache, firewall, sandboxing. |
| `web-app-security-auditor` | Installed Plugin | Gray-box end-user journey simulation and backend API vulnerability auditing. |
| `web-security-inspector` | Installed Plugin | Static security analysis, OWASP Top 10 code audits, endpoint header inspections. |
| `web-user-assistant` | Installed Plugin | Web action automation paired with Gmail OTP/magic link verification extraction. |
| `wispr-flow` | Partner Plugin | Wispr Flow meeting transcripts, calendar events, scratchpad notes. |
| `zapier` | Partner Plugin | Zapier MCP server enabling execution across 7,000+ connected cloud apps. |

---

## 2. Verified Active MCP Servers (20 Active)

1. **`21st-dev`**: 51 tools (Remote HTTPS SSE) — video editing, UI components, themes.
2. **`canva_canva`**: 43 tools (Plugin Managed) — design creation, exports, brand kits.
3. **`chrome-devtools`**: 33 tools (Local Stdio) — DOM inspection, console logs, Lighthouse.
4. **`context7_context7`**: 2 tools (Plugin Managed) — documentation & API references.
5. **`data-agent-kit-plugin_dak-data-agent-kit`**: Data Agent Kit pipeline tools.
6. **`data-agent-kit-plugin_dak-notebook`**: 9 tools (Plugin Managed) — Jupyter notebook cells.
7. **`figma_figma`**: 47 tools (Plugin Managed) — design inspection, variables, Code Connect.
8. **`gemini-api_gemini-api-docs`**: 2 tools (Plugin Managed) — Gemini API reference.
9. **`keenable-select_keenable-select`**: 3 tools (Plugin Managed) — multi-page extraction.
10. **`keenable_keenable`**: 2 tools (Plugin Managed) — live web search & fetch.
11. **`linear_linear`**: 70 tools (Plugin Managed) — issues, projects, documents.
12. **`mobbin_mobbin`**: 8 tools (Plugin Managed) — UI flow & screen search.
13. **`parallel_parallel-search`**: 3 tools (Plugin Managed) — fast parallel search.
14. **`playwright`**: 25 tools (Local Stdio) — headless browser automation.
15. **`shadcn`**: 7 tools (Local Stdio) — component registries & scaffolding.
16. **`structural-biology_structure_viewer_mcp`**: 9 tools (Plugin Managed) — 3D molecular viewer.
17. **`ui-skills`**: 2 tools (Remote HTTPS SSE) — curated UI design skills.
18. **`wispr-flow_wispr-flow`**: 16 tools (Plugin Managed) — meetings, calendar events.
19. **`yt-dlp`**: 10 tools (Local Stdio) — YouTube metadata & transcripts.
20. **`zapier_zapier`**: 17 tools (Plugin Managed) — 7,000+ cloud app actions.

---

## 3. Global Skills (41 Total)

Located at `C:\Users\HP\.gemini\config\skills\` and mirrored in `skills/`:
- **Document Processing (4):** `docx`, `xlsx`, `pdf`, `pptx`
- **Engineering QA & TDD (10):** `test-driven-development`, `systematic-debugging`, `verification-before-completion`, `using-git-worktrees`, `writing-plans`, `executing-plans`, `brainstorming`, `receiving-code-review`, `requesting-code-review`, `finishing-a-development-branch`
- **Cybersecurity & Threat Modeling (3):** `security-threat-model`, `security-ownership-map`, `security-best-practices`
- **Host Resource Guardian (1):** `antigravity-resource-guardian`
- **UI/UX Design & Anti-Slop (10):** `design-taste-frontend`, `audit-ai-design-slop`, `audit-reference-originality`, `frontend-design`, `web-design-guidelines`, `animation-systems`, `ui-ux-pro-max`, `better-accessibility`, `better-colors`, `better-typography`
- **Cloud & DevOps (3):** `cloudflare-deploy`, `sentry`, `dispatching-parallel-agents`
- **Frontend Architecture (2):** `vercel-composition-patterns`, `winui-app`
- **Meta-Engineering (4):** `mcp-builder`, `skill-creator`, `doc-coauthoring`, `cli-creator`
- **Testing & Tooling (4):** `webapp-testing`, `better-writing`, `claude-api`, `discernment-nudge`

---

## 4. Operational Specialist Agents (15 Total)

1. Software Architect (`egm-design` / `ai-architect`)
2. Senior Full-Stack Developer (`senior-fullstack-dev`)
3. Frontend Developer (`uiux-architect`)
4. Backend Developer (`senior-fullstack-dev` / `vercel-services`)
5. Database Specialist (`database-specialist`)
6. Cybersecurity Reviewer (`cybersecurity-reviewer` / `web-sec-auditor`)
7. QA Engineer (`qa-engineer`)
8. Test Automation Engineer (`test-automation-engineer`)
9. Performance Engineer (`performance-optimizer`)
10. DevOps Engineer (`deployment-expert`)
11. Documentation Specialist (`egm-style` / `egm-structural`)
12. Research Specialist (`research`)
13. Debugging Specialist (`debugging-specialist`)
14. UI/UX Specialist (`uiux-architect` / `mobbin`)
15. Resource Manager (`resource-manager`)
