# Security & Configuration Audit

**Audit Date:** 2026-11-24  
**Audit Scope:** Filesystem boundaries, terminal permissions, browser sandbox, Gmail OAuth integration, MCP servers, credential storage, and least privilege.

---

## 1. High-Priority Integration Audits

### A. Gmail Integration (`gmail` and `gmail-workflow-bridge`)
- **Connected Account:** `satwik92105@gmail.com`
- **Authorized Scopes:** `gmail.modify`, `gmail.compose`, `gmail.send`, `userinfo.email`
- **Security Posture & Enforcement:**
  - *Narrow Time Boundaries:* Automation scripts and skills (`web-user-assistant`) must enforce strict time bounds (e.g. `newer_than:10m`).
  - *Narrow Keyword Filtering:* Queries are restricted strictly to verification tokens (`subject:(verification OR code OR activate OR confirm OR otp)`).
  - *Arbitrary Reading Prohibited:* The agent is structurally prohibited from dumping arbitrary inbox messages, reading personal correspondence, or logging email bodies.
  - *Send Confirmation Guardrail:* Sending external emails or deleting messages requires explicit human confirmation.

### B. Browser Automation & Network Sandboxing (`playwright` & `chrome-devtools`)
- **Capabilities:** Form filling, button clicks, screenshot capture, DOM navigation.
- **Safety Boundaries:**
  - *Anti-Bot & CAPTCHA Boundary:* Strictly refused: no automated solving, script bypassing, or proxy rotation for CAPTCHAs, Cloudflare Turnstile, or human verification gates. When detected, the agent pauses and prompts the user to solve it in the visible window.
  - *Financial & Account Guardrails:* Submitting payment credentials, making purchases, or deleting accounts requires explicit human approval.

### C. Third-Party MCP Servers & Execution Integrity
- **Local Stdio Transports:** `shadcn`, `chrome-devtools-mcp`, `ffmpeg-mcp-server`, `@kevinwatt/yt-dlp-mcp`, `@playwright/mcp`.
  - All invoked via `npx -y` with pinned or official package names.
  - Environment variables containing sensitive directories are scoped (`YTDLP_DOWNLOADS_DIR`, `FFMPEG_MCP_WORKSPACE`).
- **Remote Streamable HTTP Servers:** `21st-dev` (`https://21st.dev/api/mcp`), `ui-skills` (`https://www.ui-skills.com/mcp`).
  - Transport uses secure HTTPS.
  - No local shell injection attack surface.

### D. Filesystem & Terminal Execution Controls
- **Working Directory Discipline:** New projects and workspace files are strictly isolated to `C:\Users\HP\.gemini\antigravity\scratch\`.
- **System Integrity:** Modification of Windows system binaries, system registry, or unauthorized PATH modifications is prohibited.
- **Credential Storage:** Secrets and API keys must never be committed to git repositories or printed in raw terminal logs. Environment variables (`.env`) are placed in `.gitignore`.

---

## 2. Security Recommendations & Action Plan

1. **Keep Least Privilege on Global Skills:** Global skills in `~/.gemini/config/skills` should remain read-mostly workflows with explicit command prompts rather than unmonitored scripts.
2. **Review Pending Auth:** Complete OAuth authentication for official integrations (Vercel, MongoDB Atlas) only through official browser redirect cards.
3. **Continuous Secret Scanning:** Utilize `security-threat-model` and SAST tools prior to pushing code to public repositories.
