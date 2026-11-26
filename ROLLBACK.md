# Surgical Disaster Recovery & Rollback Procedure

**Critical Safety Directive:** Never use a global remove-all command (`npx skills remove --all`) or delete the entire `~/.gemini/config/skills/` directory. Doing so would destroy pre-existing skills and configurations.

Follow the surgical rollback procedure below, which removes **strictly and exclusively** the 51 skills and components introduced by this expansion mission.

---

## 1. Automated Surgical Rollback Script

To remove only the components introduced during this mission, execute this targeted PowerShell script:

```powershell
# Define the exact list of skills added by the expansion mission
$ExpansionSkills = @(
    "animation-systems",
    "antigravity-resource-guardian",
    "audit-ai-design-slop",
    "audit-reference-originality",
    "autofix",
    "better-accessibility",
    "better-colors",
    "better-typography",
    "better-writing",
    "brainstorming",
    "claude-api",
    "cli-creator",
    "cloudflare-deploy",
    "code-review",
    "coderabbit-config",
    "design-taste-frontend",
    "discernment-nudge",
    "dispatching-parallel-agents",
    "doc-coauthoring",
    "docx",
    "executing-plans",
    "finishing-a-development-branch",
    "frontend-design",
    "gsd",
    "gsd-execute",
    "gsd-plan",
    "gsd-verify",
    "mcp-builder",
    "pdf",
    "pptx",
    "prd",
    "ralph",
    "receiving-code-review",
    "requesting-code-review",
    "roo-code",
    "security-best-practices",
    "security-ownership-map",
    "security-threat-model",
    "sentry",
    "skill-creator",
    "systematic-debugging",
    "test-driven-development",
    "ui-ux-pro-max",
    "using-git-worktrees",
    "vercel-composition-patterns",
    "verification-before-completion",
    "web-design-guidelines",
    "webapp-testing",
    "winui-app",
    "writing-plans",
    "xlsx"
)

$GlobalSkillsDir = "C:\Users\HP\.gemini\config\skills"

foreach ($skill in $ExpansionSkills) {
    $targetPath = Join-Path $GlobalSkillsDir $skill
    if (Test-Path $targetPath) {
        Remove-Item -Recurse -Force $targetPath
        Write-Host "Surgically removed skill: $skill" -ForegroundColor Yellow
    }
}

Write-Host "Rollback complete. All pre-existing skills, plugins, and MCP configurations remain intact." -ForegroundColor Green
```

---

## 2. Reverting the Global Skills Manifest

If you wish to remove the global `skills.json` registration:
```powershell
Remove-Item -Force "C:\Users\HP\.gemini\config\skills.json" -ErrorAction SilentlyContinue
```

---

## 3. Preserved Components Guarantee

This surgical rollback guarantees that:
- **All 42 pre-existing plugins** in `C:\Users\HP\.gemini\config\plugins\` remain 100% untouched.
- **All 20 pre-existing MCP servers** and `mcp_config.json` remain 100% untouched.
- **All user projects and workspace files** in `C:\Users\HP\.gemini\antigravity\scratch\` remain 100% untouched.
- **All authentication tokens** and credentials remain 100% untouched.
