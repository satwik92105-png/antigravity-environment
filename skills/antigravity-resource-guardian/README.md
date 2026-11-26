# Antigravity Resource Guardian

A lightweight, native Windows 11 host performance and resource guardian designed specifically for Antigravity running on **8 GB RAM / AMD Ryzen 3** machines.

---

## 🚀 Purpose

Operating agentic development environments on 8 GB RAM machines requires strict memory and process hygiene. Traditional monitoring agents consume 200–500 MB of background memory; the **Antigravity Resource Guardian** uses **native PowerShell CIM instances** with zero persistent background RAM footprint when idle.

## 📊 Monitored Parameters

| Resource | Collection Method | Target Operational Threshold |
| :--- | :--- | :--- |
| **Physical RAM** | `Win32_OperatingSystem.TotalVisibleMemorySize` / `FreePhysicalMemory` | Budgeted to keep Antigravity addition $< 512\text{ MB}$; caution above 45%. |
| **SSD Storage** | `Get-PSDrive C` | Maintain $> 20\%$ free storage ($> 15\text{ GB}$). Alert at $80\%$ usage. |
| **CPU Load** | `Win32_Processor.LoadPercentage` | Throttle concurrency above $80\%$ sustained load. |
| **Process Footprint** | `Get-Process` (Node.js, Browsers, Python, PowerShell, Git) | Isolate agent-created processes from Windows system baseline. |

## 🛠 Directory Layout

```
antigravity-resource-guardian/
├── SKILL.md                 # Antigravity agent instructions and operational runbooks
├── README.md                # Technical overview and design specs
├── config/
│   └── thresholds.json      # Customizable memory, disk, and CPU limits
└── scripts/
    └── resource-monitor.ps1 # Production PowerShell monitoring engine
```

## 💻 CLI Usage

```powershell
# Snapshot real-time metrics
.\scripts\resource-monitor.ps1 -Mode status

# Pre-task risk check (install, build, browser, or swarm)
.\scripts\resource-monitor.ps1 -Mode check -TaskType browser

# Test threshold alerts safely with simulated values
.\scripts\resource-monitor.ps1 -Mode simulate -SimulatedRamPct 52.0 -SimulatedDiskPct 82.0

# Run a 60-second monitoring window (10s intervals)
.\scripts\resource-monitor.ps1 -Mode monitor -IntervalSeconds 10 -DurationSeconds 60

# Stop any running monitor process
.\scripts\resource-monitor.ps1 -Mode stop
```
