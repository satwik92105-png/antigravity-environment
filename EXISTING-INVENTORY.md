# Existing Environment Inventory Audit

**Audit Timestamp:** 2026-11-24T01:33:00+05:30  
**Status:** 100% Verified against Host Environment

---

## 1. Verified Plugins (42 Total)

Every plugin reported in the user prompt was verified on the filesystem at `C:\Users\HP\.gemini\config\plugins\` and `C:\Users\HP\.gemini\antigravity\builtin\plugins\`.

| Plugin Identifier | Classification | Description & Scope |
| :--- | :--- | :--- |
| `android-cli-plugin` | Official Plugin | Jetpack Compose previews, Android Device Hub, and CLI rendering. |
| `auth0` | Partner Plugin | Auth0 tenant authentication and user management workflows. |
| `canva` | Partner Plugin | Canva REST API, asset upload, brand kit checks, and batch generation. |
| `chemistry` | Official Plugin | RDKit descriptors, ChEMBL queries, PubChem lookups, reaction mechanisms, and CADD. |
| `chrome-devtools-plugin` | Official Plugin | Chrome browser automation, a11y, cookies, memory leaks, and performance tracing. |
| `coderabbit` | Partner Plugin | AI pull request code review, autofix workflows, and `.coderabbit.yaml` config. |
| `context7` | Partner Plugin | Up-to-date documentation and library API lookup MCP. |
| `crowdstrike` | Partner Plugin | CrowdStrike endpoint security detections and integrations. |
| `data-agent-kit-plugin` | Official Plugin | BigQuery DataFrames (BigFrames), Dataform/dbt, Jupyter notebooks, and Composer. |
| `dynatrace` | Partner Plugin | Dynatrace APM, observability metrics, and traces. |
| `egm` | Official Plugin | Ensemble of Goldfish Mindsets: specialized architectural review personas. |
| `figma` | Partner Plugin | Figma canvas inspection, Code Connect, GLSL shaders, and generative plugins. |
| `firebase` | Official Plugin | Firebase Auth, Crashlytics, Firestore security rules authoring, and Functions. |
| `flutter` | Official Plugin | Dart & Flutter unit testing, widget tests, architecture patterns, and static analysis. |
| `gemini-api` | Official Plugin | Gemini API shell CLI, multimodal generation (images, TTS, video), and documentation. |
| `genomics` | Official Plugin | ClinVar, dbSNP, ENCODE cCREs, Ensembl, GTEx, JASPAR, and UCSC conservation. |
| `get-shit-done` | Installed Plugin | GSD meta-prompting framework: Phase discussion, atomic planning, and verification. |
| `gmail` | Official Plugin | Gmail Go CLI: query emails, drafts, labels, attachments, and messaging. |
| `google-antigravity-sdk` | Official Plugin | Antigravity autonomous agent design and multi-agent system orchestrator. |
| `google-cloud-developer` | Official Plugin | Google Cloud IAM, Application Default Credentials (ADC), and gcloud recipes. |
| `google-developer-knowledge` | Official Plugin | Google official developer knowledgebase and documentation queries. |
| `google_maps_platform` | Official Plugin | Google Maps Platform APIs, geocoding, and routing. |
| `high-def-uiux-studio` | Installed Plugin | Modern aesthetic guidelines (Bento grids, luminous borders) and UI benchmarking. |
| `keenable` | Partner Plugin | Real-time web search and page content extraction. |
| `keenable-select` | Partner Plugin | Multi-page structured tabular data extraction across the web. |
| `linear` | Partner Plugin | Linear project management (issues, cycles, milestones, documents, and comments). |
| `mobbin` | Partner Plugin | UI/UX design patterns, mobile/web screens, and real-world user flow references. |
| `modern-web-guidance-plugin` | Official Plugin | Modern web frontend architecture and standards guidance. |
| `mongodb-atlas` | Partner Plugin | MongoDB Atlas schema design, Queryable Encryption (QE) sizing, and query tuning. |
| `parallel` | Partner Plugin | High-speed parallel web search and fetch. |
| `ponytail` | Installed Plugin | Lazy senior developer philosophy: smallest viable working code, test-backed changes. |
| `ralph-loop` | Installed Plugin | Ralph autonomous agent loop running AI tools repeatedly against PRD stories. |
| `science-overview` | Official Plugin | Scientific plugins overview and cross-domain workflow router. |
| `scientific-literature` | Official Plugin | ClinicalTrials.gov, arXiv, bioRxiv, medRxiv, Europe PMC, and openFDA. |
| `structural-biology` | Official Plugin | Protein Data Bank (PDB), STRING PPIs, UniProtKB, and Human Protein Atlas. |
| `swarm` | Built-in Plugin | Native Antigravity swarm orchestration via shared message board. |
| `vercel-plugin` | Partner Plugin | Comprehensive Vercel deployment, AI SDK, Chat SDK, functions, cache, and firewall. |
| `web-app-security-auditor` | Installed Plugin | Gray-box end-user journey simulation and backend API vulnerability auditing. |
| `web-security-inspector` | Installed Plugin | Static security analysis, OWASP Top 10 code audits, and endpoint header inspections. |
| `web-user-assistant` | Installed Plugin | Web action automation paired with Gmail OTP/magic link verification extraction. |
| `wispr-flow` | Partner Plugin | Wispr Flow meeting transcripts, calendar events, and scratchpad notes. |
| `zapier` | Partner Plugin | Zapier MCP server enabling execution across 7,000+ integrated cloud apps. |

---

## 2. Verified Active MCP Servers (20 Active)

The following MCP servers were inspected and verified in `C:\Users\HP\.gemini\antigravity\mcp` and `mcp_config.json`:

1. **`21st-dev`**: 51 tools (video editing, UI components, themes, animations).
2. **`canva_canva`**: 43 tools (design creation, exports, brand kits, image generation).
3. **`chrome-devtools`**: 33 tools (DOM snapshot, page navigation, click/fill, console logs, Lighthouse audit).
4. **`context7_context7`**: 2 tools (`resolve-library-id`, `query-docs`).
5. **`data-agent-kit-plugin_dak-data-agent-kit`**: Data Agent Kit pipeline tools.
6. **`data-agent-kit-plugin_dak-notebook`**: 9 tools (Jupyter notebook cell inspection, insertion, deletion, replacement).
7. **`figma_figma`**: 47 tools (node inspection, variable tokens, FigJam diagrams, GLSL shaders, Code Connect).
8. **`gemini-api_gemini-api-docs`**: 2 tools (Gemini API documentation lookup).
9. **`keenable-select_keenable-select`**: 3 tools (`select`, `generate_html_report`, `revoke_html_report`).
10. **`keenable_keenable`**: 2 tools (`search_web_pages`, `fetch_page_content`).
11. **`linear_linear`**: 70 tools (issues, cycles, projects, comments, documents, release notes).
12. **`mobbin_mobbin`**: 8 tools (screens, user flows, collections, visual references).
13. **`parallel_parallel-search`**: 3 tools (`web_search`, `web_fetch`, `send_feedback`).
14. **`playwright`**: 25 tools (headless browser automation, snapshots, clicks, forms, network inspection).
15. **`shadcn`**: 7 tools (component registries, examples, code scaffolding).
16. **`structural-biology_structure_viewer_mcp`**: 9 tools (3D molecular viewer, region annotation, overlays).
17. **`ui-skills`**: 2 tools (curated UI design skills).
18. **`wispr-flow_wispr-flow`**: 16 tools (meeting summaries, participants, calendar events).
19. **`yt-dlp`**: 10 tools (YouTube metadata, transcripts, audio/video downloads).
20. **`zapier_zapier`**: 17 tools (execute actions, discover connections, manage integrations).

### MCP Server Discrepancy & Health Notes:
- **Duplicate Directory Found:** `science_biomolecular_structure_viewer_mcp` contained the exact same 9 tool schemas as `structural-biology_structure_viewer_mcp`. Only the latter is actively bound in the runtime.
- **Unauthenticated MCP Servers:**
  - `vercel-plugin_vercel` (250 tools): Configured but blocked awaiting user OAuth sign-in.
  - `mongodb-atlas_mongodb-atlas`: Configured but blocked awaiting user sign-in.
- **Global `mcp_config.json`:** Successfully defines `yt-dlp`, `ffmpeg`, `playwright`, `shadcn`, `21st-dev`, `chrome-devtools`, and `ui-skills`.
