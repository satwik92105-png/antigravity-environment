---
name: antigravity-resource-guardian
description: >-
  Continuously monitors and guards Windows 11 host resources (RAM, SSD storage, CPU load, and process footprint)
  on 8 GB RAM machines. Use before heavy tasks (installs, browser automation, multi-agent swarms, builds),
  periodically during long operations, or whenever memory pressure threatens system stability.
---

# Antigravity Resource Guardian

The **Resource Guardian** is a host-level system guardian designed specifically for 8 GB RAM Windows 11 machines. It prevents Out-Of-Memory (OOM) freezing, disk exhaustion, and CPU throttling by actively measuring system telemetry and enforcing workload budgeting before and during heavy agent tasks.

---

## 1. Core Operating Limits & Action Rules

### Physical RAM Thresholds (8 GB Host)
- **`< 40% Total RAM` (Normal):** Full concurrent execution permitted across subagents, builds, and tools.
- **`40% – 45% Total RAM` (Caution):** Avoid launching speculative background tasks. Restrict subagents to essential work only.
- **`45% – 50% Total RAM` (High Caution):** Enforce strictly sequential execution. Do not launch multi-agent swarms or open additional browser contexts.
- **`> 50% Total RAM` (Throttled / Pause):**
  - **Baseline Calibration Rule:** If the host Windows baseline is already $\ge 50\%$ before Antigravity starts, do **not** attempt to kill Windows system processes. Instead, enforce a strict cap on Antigravity's *additional* process memory ($\le 512\text{ MB}$ total across Node, Python, and PowerShell).
  - Stop launching parallel agents.
  - Save session progress to `.planning/STATE.md` or local artifacts.
  - Close unused Playwright / Chromium headless tabs immediately after use.

### SSD Storage Thresholds (C: Drive)
- **Target:** Maintain at least **20% free storage** (or $\ge 15\text{ GB}$ free).
- **`> 75% Disk Utilization` (Warning):** Check package size before executing `npm install`, `pip install`, or `git clone`.
- **`> 80% Disk Utilization` (Critical):** Halt all optional downloads. Clean temporary files in `scratch/` only after verifying they do not contain user source files. Never delete unknown system directories.

### CPU & Thermal Discipline (Ryzen 3)
- If CPU utilization exceeds **80% sustained**:
  - Run build and test steps sequentially rather than with parallel workers (`-j 1` / `--maxWorkers=1`).
  - Pause non-essential background monitoring and allow thermal recovery.

---

## 2. Standard Operating Procedures (Runbooks)

### A. Pre-Flight Workload Check (Before Heavy Operations)
Before executing:
1. `npm install` / `pip install` / `git clone` of large repositories
2. Headless browser automation or Playwright suites
3. Multi-agent swarms (`swarm` / `invoke_subagent` fan-outs)
4. Heavy project builds or test runs

Run the pre-flight check command:
```powershell
powershell -ExecutionPolicy Bypass -File "C:\Users\HP\.gemini\config\skills\antigravity-resource-guardian\scripts\resource-monitor.ps1" -Mode check -TaskType <install|browser|build|swarm>
```
If the output reports `WorkloadRisk=CRITICAL` or `HIGH`, follow the recommended action (sequential execution, single agent, or memory release) before proceeding.

### B. Instant Telemetry Snapshot
To inspect real-time RAM, SSD, CPU, and agent process footprints:
```powershell
powershell -ExecutionPolicy Bypass -File "C:\Users\HP\.gemini\config\skills\antigravity-resource-guardian\scripts\resource-monitor.ps1" -Mode status
```

### C. Safe Threshold Simulation (Unit Testing)
To verify that warning and pause mechanisms trigger correctly without overloading the laptop:
```powershell
powershell -ExecutionPolicy Bypass -File "C:\Users\HP\.gemini\config\skills\antigravity-resource-guardian\scripts\resource-monitor.ps1" -Mode simulate -SimulatedRamPct 52.0 -SimulatedDiskPct 82.0
```

### D. Background Monitoring Window
To monitor resource consumption during a 60-second build or test run:
```powershell
powershell -ExecutionPolicy Bypass -File "C:\Users\HP\.gemini\config\skills\antigravity-resource-guardian\scripts\resource-monitor.ps1" -Mode monitor -IntervalSeconds 10 -DurationSeconds 60
```
To stop an active monitor job:
```powershell
powershell -ExecutionPolicy Bypass -File "C:\Users\HP\.gemini\config\skills\antigravity-resource-guardian\scripts\resource-monitor.ps1" -Mode stop
```

---

## 3. Post-Task Cleanup Protocol
When completing heavy browser or build operations:
1. Ensure headless browser contexts are closed (`browser_close` or killing isolated test Chrome PIDs).
2. Clean temporary build caches (e.g. `.next/cache`, `node_modules/.cache`) if disk free space falls below $15\text{ GB}$.
3. Log final memory delta to ensure zero lingering background daemons.
