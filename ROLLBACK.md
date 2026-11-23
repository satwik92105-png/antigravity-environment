# Disaster Recovery & Complete Rollback Guide

If you ever wish to completely revert the additions made during this mission back to your exact initial baseline, follow the procedures outlined below.

---

## 1. Automated Rollback Command

To remove all newly installed global skills in a single command, execute in PowerShell:

```powershell
npx skills remove --global --all -y
```

This will automatically unregister and delete the newly copied skills from `C:\Users\HP\.gemini\config\skills\`.

---

## 2. Manual Surgical Rollback

If you prefer to manually remove the changes step-by-step:

### Step 1: Remove Global Skills Directory
Remove the newly installed skills directory:
```powershell
Remove-Item -Recurse -Force "C:\Users\HP\.gemini\config\skills"
```

### Step 2: Remove Global Skills Manifest
Delete the global `skills.json` configuration file:
```powershell
Remove-Item -Force "C:\Users\HP\.gemini\config\skills.json"
```

### Step 3: Remove Documentation Suite (Optional)
If you wish to remove this documentation directory:
```powershell
Remove-Item -Recurse -Force "C:\Users\HP\.gemini\antigravity\scratch\Antigravity-Environment"
```

---

## 3. Impact Assessment of Rollback

- **Preserved Intact:**
  - All 42 original plugins in `~/.gemini/config/plugins/` will remain completely untouched.
  - All original MCP servers and `mcp_config.json` will remain completely untouched.
  - All existing configuration files and authentication tokens (Gmail OAuth) will remain completely untouched.
- **Removed:**
  - The 16 newly added global skills (`docx`, `xlsx`, `pdf`, `pptx`, `test-driven-development`, `systematic-debugging`, `verification-before-completion`, etc.).
  - The newly registered subagent types will revert upon session restart.
