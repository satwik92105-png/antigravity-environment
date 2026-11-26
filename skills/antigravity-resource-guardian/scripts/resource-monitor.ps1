<#
.SYNOPSIS
    Antigravity Resource Guardian — System Telemetry & Workload Budget Monitor
.DESCRIPTION
    Lightweight, native Windows 11 PowerShell monitoring script designed for 8 GB RAM systems.
    Monitors RAM, Storage, CPU, and agent process footprints without external dependencies.
.PARAMETER Mode
    Execution mode: 'status' (default), 'check', 'simulate', 'monitor', or 'stop'.
.PARAMETER TaskType
    For 'check' mode: 'install', 'build', 'browser', 'swarm', or 'general'.
.PARAMETER SimulatedRamPct
    For 'simulate' mode: overrides actual RAM usage percentage for testing thresholds.
.PARAMETER SimulatedDiskPct
    For 'simulate' mode: overrides actual Disk utilization percentage for testing thresholds.
.PARAMETER SimulatedCpuPct
    For 'simulate' mode: overrides actual CPU utilization percentage for testing thresholds.
.PARAMETER Format
    Output format: 'text' (default) or 'json'.
#>
[CmdletBinding()]
param(
    [ValidateSet('status', 'check', 'simulate', 'monitor', 'stop')]
    [string]$Mode = 'status',

    [ValidateSet('install', 'build', 'browser', 'swarm', 'general')]
    [string]$TaskType = 'general',

    [double]$SimulatedRamPct = -1,
    [double]$SimulatedDiskPct = -1,
    [double]$SimulatedCpuPct = -1,

    [ValidateSet('text', 'json')]
    [string]$Format = 'text',

    [int]$IntervalSeconds = 10,
    [int]$DurationSeconds = 60
)

$ErrorActionPreference = 'SilentlyContinue'

# Paths
$ScriptDir = Split-Path -Parent $MyInvocation.MyCommand.Definition
$ConfigFile = Join-Path $ScriptDir "..\config\thresholds.json"
$StateDir = Join-Path $ScriptDir "..\state"
$PidFile = Join-Path $StateDir "monitor.pid"
$LogFile = Join-Path $StateDir "resource-history.log"

if (-not (Test-Path $StateDir)) {
    New-Item -ItemType Directory -Path $StateDir -Force | Out-Null
}

# Load thresholds
$Thresholds = @{
    RamNormalMax = 40.0
    RamCautionMax = 45.0
    RamHighCautionMax = 50.0
    DiskCriticalPct = 80.0
    DiskMinFreeGb = 15.0
    CpuWarningPct = 80.0
    MaxAntigravityRamMb = 512.0
}

if (Test-Path $ConfigFile) {
    try {
        $JsonConfig = Get-Content $ConfigFile -Raw | ConvertFrom-Json
        if ($JsonConfig.ram_thresholds) {
            $Thresholds.RamNormalMax = [double]$JsonConfig.ram_thresholds.normal_max_pct
            $Thresholds.RamCautionMax = [double]$JsonConfig.ram_thresholds.caution_max_pct
            $Thresholds.RamHighCautionMax = [double]$JsonConfig.ram_thresholds.high_caution_max_pct
            $Thresholds.MaxAntigravityRamMb = [double]$JsonConfig.ram_thresholds.baseline_adaptation.max_antigravity_ram_mb
        }
        if ($JsonConfig.disk_thresholds) {
            $Thresholds.DiskCriticalPct = [double]$JsonConfig.disk_thresholds.critical_pct
            $Thresholds.DiskMinFreeGb = [double]$JsonConfig.disk_thresholds.min_free_gb
        }
        if ($JsonConfig.cpu_thresholds) {
            $Thresholds.CpuWarningPct = [double]$JsonConfig.cpu_thresholds.warning_pct
        }
    } catch {}
}

function Get-SystemMetrics {
    $os = Get-CimInstance Win32_OperatingSystem -ErrorAction SilentlyContinue
    $totalRamMb = [math]::Round($os.TotalVisibleMemorySize / 1024, 1)
    $freeRamMb = [math]::Round($os.FreePhysicalMemory / 1024, 1)
    $usedRamMb = [math]::Round($totalRamMb - $freeRamMb, 1)
    $ramPct = [math]::Round(($usedRamMb / $totalRamMb) * 100, 1)

    $drive = Get-PSDrive C -ErrorAction SilentlyContinue
    $usedDiskGb = [math]::Round($drive.Used / 1GB, 1)
    $freeDiskGb = [math]::Round($drive.Free / 1GB, 1)
    $totalDiskGb = [math]::Round($usedDiskGb + $freeDiskGb, 1)
    $diskPct = [math]::Round(($usedDiskGb / $totalDiskGb) * 100, 1)

    # CPU Load
    $cpu = 0
    try {
        $cpuObj = Get-CimInstance Win32_Processor -ErrorAction SilentlyContinue | Measure-Object -Property LoadPercentage -Average
        $cpu = [math]::Round($cpuObj.Average, 1)
    } catch {
        $cpu = 0
    }

    # Process group memory
    $procGroups = @{
        NodeMb = 0.0
        BrowserMb = 0.0
        PythonMb = 0.0
        PowerShellMb = 0.0
        GitMb = 0.0
    }

    $allProcs = Get-Process -ErrorAction SilentlyContinue
    foreach ($p in $allProcs) {
        $name = $p.ProcessName.ToLower()
        $wsMb = [math]::Round($p.WorkingSet64 / 1MB, 1)
        if ($name -match 'node') { $procGroups.NodeMb += $wsMb }
        elseif ($name -match 'chrome|msedge|brave|firefox') { $procGroups.BrowserMb += $wsMb }
        elseif ($name -match 'python') { $procGroups.PythonMb += $wsMb }
        elseif ($name -match 'powershell|pwsh') { $procGroups.PowerShellMb += $wsMb }
        elseif ($name -match 'git') { $procGroups.GitMb += $wsMb }
    }

    $totalAgentRamMb = [math]::Round($procGroups.NodeMb + $procGroups.PythonMb + $procGroups.PowerShellMb, 1)

    return [PSCustomObject]@{
        Timestamp = (Get-Date).ToString("yyyy-MM-dd HH:mm:ss")
        TotalRamGb = [math]::Round($totalRamMb / 1024, 2)
        UsedRamGb = [math]::Round($usedRamMb / 1024, 2)
        FreeRamGb = [math]::Round($freeRamMb / 1024, 2)
        RamPercent = $ramPct
        TotalDiskGb = $totalDiskGb
        UsedDiskGb = $usedDiskGb
        FreeDiskGb = $freeDiskGb
        DiskPercent = $diskPct
        CpuPercent = $cpu
        ProcessMemory = $procGroups
        AgentMemoryMb = $totalAgentRamMb
    }
}

function Evaluate-Status ($metrics, $simRam, $simDisk, $simCpu) {
    $ramPct = if ($simRam -ge 0) { $simRam } else { $metrics.RamPercent }
    $diskPct = if ($simDisk -ge 0) { $simDisk } else { $metrics.DiskPercent }
    $cpuPct = if ($simCpu -ge 0) { $simCpu } else { $metrics.CpuPercent }

    $ramState = 'NORMAL'
    $ramAction = 'All workloads permitted.'
    if ($ramPct -gt $Thresholds.RamHighCautionMax) {
        $ramState = 'CRITICAL_THROTTLED'
        $ramAction = 'PAUSE optional work; restrict to sequential execution; do not launch heavy browser or agent swarms.'
    } elseif ($ramPct -gt $Thresholds.RamCautionMax) {
        $ramState = 'HIGH_CAUTION'
        $ramAction = 'Avoid parallel tasks; run single agent operations only; minimize browser tabs.'
    } elseif ($ramPct -gt $Thresholds.RamNormalMax) {
        $ramState = 'CAUTION'
        $ramAction = 'Avoid launching unnecessary background processes.'
    }

    $diskState = 'NORMAL'
    $diskAction = 'Storage healthy.'
    if ($diskPct -ge $Thresholds.DiskCriticalPct -or $metrics.FreeDiskGb -lt $Thresholds.DiskMinFreeGb) {
        $diskState = 'CRITICAL'
        $diskAction = 'HALT large package downloads; clean temporary caches in scratch/ before proceeding.'
    } elseif ($diskPct -ge 75.0) {
        $diskState = 'WARNING'
        $diskAction = 'Verify package size before downloading.'
    }

    $cpuState = if ($cpuPct -ge $Thresholds.CpuWarningPct) { 'HIGH_LOAD' } else { 'NORMAL' }

    return [PSCustomObject]@{
        Metrics = $metrics
        EvaluatedRamPercent = $ramPct
        EvaluatedDiskPercent = $diskPct
        EvaluatedCpuPercent = $cpuPct
        RamState = $ramState
        RamRecommendation = $ramAction
        DiskState = $diskState
        DiskRecommendation = $diskAction
        CpuState = $cpuState
        CanProceedHeavyWorkload = ($ramState -notin @('CRITICAL_THROTTLED', 'HIGH_CAUTION')) -and ($diskState -ne 'CRITICAL')
    }
}

# --- Action Switch ---

switch ($Mode) {
    'stop' {
        if (Test-Path $PidFile) {
            $targetPid = Get-Content $PidFile -ErrorAction SilentlyContinue
            if ($targetPid) {
                Stop-Process -Id $targetPid -Force -ErrorAction SilentlyContinue
                Remove-Item $PidFile -Force -ErrorAction SilentlyContinue
                Write-Host "Resource monitor process ($targetPid) stopped."
            }
        } else {
            Write-Host "No active resource monitor PID found."
        }
        exit 0
    }

    'simulate' {
        $metrics = Get-SystemMetrics
        $eval = Evaluate-Status $metrics $SimulatedRamPct $SimulatedDiskPct $SimulatedCpuPct
        if ($Format -eq 'json') {
            $eval | ConvertTo-Json -Depth 4
        } else {
            Write-Host "=== ANTIGRAVITY RESOURCE GUARDIAN (SIMULATION) ===" -ForegroundColor Cyan
            Write-Host "Simulated RAM Usage : $SimulatedRamPct% [Status: $($eval.RamState)]"
            Write-Host "Action Required     : $($eval.RamRecommendation)"
            Write-Host "Simulated Disk Usage: $SimulatedDiskPct% [Status: $($eval.DiskState)]"
            Write-Host "Can Proceed Heavy   : $($eval.CanProceedHeavyWorkload)"
        }
        exit 0
    }

    'check' {
        $metrics = Get-SystemMetrics
        $eval = Evaluate-Status $metrics -1 -1 -1
        
        $workloadRisk = 'LOW'
        switch ($TaskType) {
            'install' { if ($metrics.FreeDiskGb -lt 5.0 -or $metrics.FreeRamGb -lt 0.3) { $workloadRisk = 'HIGH' } }
            'browser' { if ($metrics.FreeRamGb -lt 0.6) { $workloadRisk = 'HIGH' } }
            'build'   { if ($metrics.FreeRamGb -lt 0.5) { $workloadRisk = 'HIGH' } }
            'swarm'   { if ($metrics.FreeRamGb -lt 0.8) { $workloadRisk = 'CRITICAL' } }
        }

        $result = [PSCustomObject]@{
            TaskType = $TaskType
            WorkloadRisk = $workloadRisk
            CurrentRamPercent = $metrics.RamPercent
            AvailableRamGb = $metrics.FreeRamGb
            FreeDiskGb = $metrics.FreeDiskGb
            RecommendedAction = if ($workloadRisk -in @('HIGH', 'CRITICAL')) { 'Run sequentially; pause background agents; verify free memory.' } else { 'Safe to proceed.' }
            AllowExecution = ($workloadRisk -ne 'CRITICAL')
        }

        if ($Format -eq 'json') {
            $result | ConvertTo-Json
        } else {
            Write-Host "Pre-Task Resource Assessment [$TaskType]: Risk=$workloadRisk, FreeRAM=$($metrics.FreeRamGb)GB -> $($result.RecommendedAction)"
        }
        exit 0
    }

    'monitor' {
        $pid | Out-File -FilePath $PidFile -Encoding ascii -Force
        $startTime = Get-Date
        Write-Host "Starting Resource Guardian Monitor (Interval: ${IntervalSeconds}s, Duration: ${DurationSeconds}s)..."

        while (((Get-Date) - $startTime).TotalSeconds -lt $DurationSeconds) {
            $m = Get-SystemMetrics
            $line = "$($m.Timestamp) | RAM=$($m.UsedRamGb)/$($m.TotalRamGb)GB ($($m.RamPercent)%) | DiskFree=$($m.FreeDiskGb)GB | CPU=$($m.CpuPercent)% | Node=$($m.ProcessMemory.NodeMb)MB Browser=$($m.ProcessMemory.BrowserMb)MB"
            Add-Content -Path $LogFile -Value $line
            Start-Sleep -Seconds $IntervalSeconds
        }
        Remove-Item $PidFile -Force -ErrorAction SilentlyContinue
        Write-Host "Monitoring window finished cleanly."
        exit 0
    }

    default {
        # 'status'
        $metrics = Get-SystemMetrics
        $eval = Evaluate-Status $metrics -1 -1 -1

        if ($Format -eq 'json') {
            $eval | ConvertTo-Json -Depth 4
        } else {
            Write-Host "==========================================================" -ForegroundColor Cyan
            Write-Host "       ANTIGRAVITY RESOURCE GUARDIAN TELEMETRY            " -ForegroundColor Cyan
            Write-Host "==========================================================" -ForegroundColor Cyan
            Write-Host "Timestamp          : $($metrics.Timestamp)"
            Write-Host "Physical RAM       : $($metrics.UsedRamGb) GB used / $($metrics.TotalRamGb) GB total ($($metrics.RamPercent)%)"
            Write-Host "Available RAM      : $($metrics.FreeRamGb) GB"
            Write-Host "RAM State          : $($eval.RamState)" -ForegroundColor (if ($eval.RamState -eq 'NORMAL') { 'Green' } else { 'Yellow' })
            Write-Host "RAM Recommendation : $($eval.RamRecommendation)"
            Write-Host "----------------------------------------------------------"
            Write-Host "SSD Storage (C:)   : $($metrics.UsedDiskGb) GB used / $($metrics.TotalDiskGb) GB total ($($metrics.DiskPercent)%)"
            Write-Host "Free Storage       : $($metrics.FreeDiskGb) GB"
            Write-Host "Storage State      : $($eval.DiskState)" -ForegroundColor (if ($eval.DiskState -eq 'NORMAL') { 'Green' } else { 'Yellow' })
            Write-Host "----------------------------------------------------------"
            Write-Host "CPU Load           : $($metrics.CpuPercent)%"
            Write-Host "Process Footprint  :"
            Write-Host "  - Node.js        : $($metrics.ProcessMemory.NodeMb) MB"
            Write-Host "  - Browsers       : $($metrics.ProcessMemory.BrowserMb) MB"
            Write-Host "  - Python         : $($metrics.ProcessMemory.PythonMb) MB"
            Write-Host "  - PowerShell     : $($metrics.ProcessMemory.PowerShellMb) MB"
            Write-Host "==========================================================" -ForegroundColor Cyan
        }
    }
}
