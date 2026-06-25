# run-task.ps1 — Invokes Claude Code on an Obsidian task file
# Usage: run-task.ps1 "C:\path\to\task.md"
param([string]$TaskFile)

$BackendDir = "C:\Users\abbas\Desktop\ecom-engine"
$VaultDir   = "C:\Users\abbas\Desktop\etijara vault"
$ClaudeBin  = "claude"   # must be in PATH (nvm or npm global)
$Today      = Get-Date -Format "yyyy-MM-dd"
$Now        = Get-Date -Format "yyyy-MM-dd HH:mm"

if (-not (Test-Path $TaskFile)) {
    Write-Error "Task file not found: $TaskFile"
    exit 1
}

# ── 1. Read the task ──────────────────────────────────────────────────────────
$taskContent = Get-Content $TaskFile -Raw -Encoding UTF8

# ── 2. Mark in-progress ───────────────────────────────────────────────────────
$updated = $taskContent `
    -replace '(?m)^status:\s*.+$', 'status: in-progress'
[System.IO.File]::WriteAllText($TaskFile, $updated, [System.Text.Encoding]::UTF8)
Write-Host "→ Status set to in-progress"

# ── 3. Build the prompt ───────────────────────────────────────────────────────
$prompt = @"
You are Claude Code, an autonomous coding assistant.

## Workspaces
- Go backend (Echo, GORM): $BackendDir
- Obsidian vault:           $VaultDir

## Your Task

The following task was assigned to you from the project's task manager.
Read it carefully, then implement the required changes in the backend codebase.

---
TASK FILE: $TaskFile

$taskContent
---

## Instructions

1. Understand every acceptance criterion listed in the task.
2. Explore the relevant backend code (use Read, Grep, Glob as needed).
3. Implement the changes — edit files, create new ones, run commands as needed.
4. Verify your changes satisfy all acceptance criteria.
5. When done, **edit the task file** ($TaskFile) to:
   a. Replace the line  `status: in-progress`  with  `status: done`
   b. Replace the line  `completed: `          with  `completed: $Today`
   c. Append EXACTLY the following block at the very end of the file
      (after all existing content, separated by a blank line):

---

## Completion Report
**Completed:** $Now

### Changes made
[List every file you modified or created, and what you changed]

### How to verify
[Step-by-step instructions to test the feature]

### Notes
[Any caveats, follow-ups, or things the developer should know]

Do the work now. Start by reading the relevant source files.
"@

# ── 4. Write prompt to temp file (avoids CLI length / quoting issues) ─────────
$tmpFile = [System.IO.Path]::Combine([System.IO.Path]::GetTempPath(), "claude-task-$([System.Guid]::NewGuid()).txt")
[System.IO.File]::WriteAllText($tmpFile, $prompt, [System.Text.Encoding]::UTF8)

Write-Host "→ Running Claude Code (this may take several minutes)..."
Write-Host "   Task: $TaskFile"
Write-Host ""

# ── 5. Run Claude Code ────────────────────────────────────────────────────────
try {
    Set-Location $BackendDir

    # Pipe the prompt via stdin to avoid Windows command-line length limits
    $claudeOutput = Get-Content $tmpFile -Raw | & $ClaudeBin `
        --print `
        --dangerously-skip-permissions `
        --allowedTools "Edit,Read,Write,Bash,Grep,Glob" `
        2>&1

    Write-Host $claudeOutput
} catch {
    Write-Error "Failed to run Claude Code: $_"
    # Restore status to todo so user can retry
    (Get-Content $TaskFile -Raw) -replace 'status: in-progress', 'status: todo' |
        Set-Content $TaskFile -Encoding UTF8 -NoNewline
    exit 1
} finally {
    Remove-Item $tmpFile -ErrorAction SilentlyContinue
}

# ── 6. Verify and report ──────────────────────────────────────────────────────
$final = Get-Content $TaskFile -Raw -Encoding UTF8
if ($final -match '(?m)^status:\s*done') {
    Write-Host ""
    Write-Host "✅ Task completed and marked as done!"
} else {
    # Claude may have done the work but forgot to update the file — nudge it
    Write-Host ""
    Write-Host "⚠️  Claude finished but did not mark the task as done."
    Write-Host "   Check the task file and mark it manually if the work looks correct."
}
