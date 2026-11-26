# Resource Optimization & 8 GB RAM Efficiency Blueprint (Phase 2)

**Host Machine Telemetry:**
- **Host Architecture:** AMD Ryzen 3 (4 Cores / 8 Logical Threads)
- **Total Physical RAM:** 7.19 GB (~8 GB physical)
- **Baseline Memory Utilization:** ~92.4% (Used: ~6.64 GB, Available: ~550 MB)
- **SSD Storage (C:):** 202.8 GB total, 151.1 GB used (74.5%), 51.7 GB free (25.5% free buffer)
- **Primary Operational Directive:** Maximize practical capability without adding persistent background memory overhead, keeping Antigravity's incremental footprint within a $\le 512\text{ MB}$ budget.

---

## 1. Grounded Host Baseline vs. Agent Budget

Windows 11 and host background processes typically consume $5.5–6.5\text{ GB}$ of RAM on 8 GB systems.
Attempting to enforce an absolute $50\%$ total-system RAM limit on an active Windows desktop is physically impossible without killing OS processes.

Instead, the **Antigravity Resource Guardian** implements a **Calibrated Host Budget**:
1. **Incremental Agent Budget:** Antigravity's active process working set (Node.js + Python + PowerShell) is capped at $\le 512\text{ MB}$.
2. **Dynamic Workload Gating:**
   - If Available RAM $> 600\text{ MB}$: Standard single-agent workflows proceed normally.
   - If Available RAM is $300–600\text{ MB}$: High caution; no background parallel agents; sequential tool execution only.
   - If Available RAM $< 300\text{ MB}$: Throttled; heavy tasks (browsers, builds) are paused; session progress saved to disk.
3. **No Phantom Daemons:** Every newly integrated capability is purely file-based (`SKILL.md`) or on-demand stdio, adding **0 MB persistent background RAM**.

---

## 2. Process Footprint Audit (Measured Real-Time)

From the Resource Guardian telemetry benchmark on the host machine:
- **Node.js Subprocesses:** ~173.5 MB
- **Chromium Browsers:** ~1,765.9 MB (host browser tabs + active MCP sessions)
- **PowerShell Runtime:** ~158.2 MB
- **Python Telemetry Engine:** ~0 MB (exits immediately after execution)
- **Antigravity Core Overhead:** $< 350\text{ MB}$ total.

---

## 3. Storage & Thermal Protection Rules

1. **Storage Target:** Keep C: drive utilization $< 80\%$ (maintain $> 15\text{ GB}$ free).
   - *Current State:* 51.7 GB free (safely above the 15 GB minimum threshold).
   - Before large `npm install` or `git clone` operations, run pre-flight checks to estimate disk footprint.
2. **CPU & Thermal Mitigation:**
   - Ryzen 3 has 4 physical cores. Avoid running multi-threaded test runners with unlimited workers.
   - Constrain test execution to sequential or 2-worker limits (`--maxWorkers=2`).
