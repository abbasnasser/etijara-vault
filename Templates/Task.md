---
id: <% tp.date.now("YYYYMMDDHHmm") %>
title: <% tp.file.title %>
status: todo
priority: medium
project: etijara
created: <% tp.date.now("YYYY-MM-DD") %>
completed: 
tags: [task]
---

# <% tp.file.title %>

## Description
> What needs to be done and why?


## Acceptance Criteria
- [ ] 
- [ ] 

## Technical Context
> Files to look at, related endpoints, relevant domain, etc.


## Notes


---

```dataviewjs
// ── Claude Code Task Runner ───────────────────────────────────────────────────
const vaultPath = app.vault.adapter.basePath;
const relPath   = dv.current().file.path;
const absPath   = `${vaultPath}\\${relPath.replace(/\//g, '\\')}`;
const script    = `${vaultPath}\\scripts\\run-task.ps1`;

// Status badge
const status = dv.current().status ?? 'todo';
const badge = {
  'todo':        ['🔵 TODO',       '#3b82f6'],
  'in-progress': ['🟡 IN PROGRESS','#f59e0b'],
  'done':        ['✅ DONE',        '#10b981'],
  'backlog':     ['⚪ BACKLOG',     '#6b7280'],
}[status] ?? ['❓ UNKNOWN', '#888'];

const badgeEl = this.container.createEl('span', { text: badge[0] });
badgeEl.style.cssText = `
  display:inline-block; padding:3px 10px; border-radius:12px;
  background:${badge[1]}22; color:${badge[1]};
  font-weight:600; font-size:13px; margin-bottom:12px;
  border:1px solid ${badge[1]}55;
`;
this.container.createEl('br');

if (status === 'done') {
  this.container.createEl('em', { text: 'This task has been completed by Claude Code.' });
} else {
  // ── Run button ──────────────────────────────────────────────────────────────
  const btn = this.container.createEl('button');
  btn.innerHTML = '▶&nbsp; Run with Claude Code';
  btn.style.cssText = `
    margin-top:8px; padding:9px 20px; font-size:14px; font-weight:600;
    background:#7c3aed; color:#fff; border:none; border-radius:8px;
    cursor:pointer; letter-spacing:0.3px; transition:opacity .15s;
  `;
  btn.onmouseenter = () => btn.style.opacity = '0.85';
  btn.onmouseleave = () => btn.style.opacity = '1';

  btn.onclick = async () => {
    btn.innerHTML = '⏳&nbsp; Claude is working…';
    btn.disabled = true;
    btn.style.background = '#6b7280';

    // ── Try Shell Commands plugin first ─────────────────────────────────────
    const shellCmd = Object.values(app.commands.commands)
      .find(c => c.name?.toLowerCase().includes('run task'));

    if (shellCmd) {
      app.commands.executeCommandById(shellCmd.id);
      new Notice('Claude Code started! Check the terminal for progress.', 5000);
      setTimeout(() => {
        btn.innerHTML = '▶&nbsp; Run with Claude Code';
        btn.disabled = false; btn.style.background = '#7c3aed';
      }, 8000);
      return;
    }

    // ── Fallback: spawn via Electron child_process ──────────────────────────
    try {
      const { exec } = require('child_process');
      const cmd = `powershell -ExecutionPolicy Bypass -NoExit -File "${script}" "${absPath}"`;
      exec(cmd, (err, stdout, stderr) => {
        if (err) {
          new Notice(`❌ Error: ${err.message}`, 8000);
        } else {
          new Notice('✅ Claude Code finished! Reload the note to see the report.', 6000);
        }
      });
      new Notice('⏳ Claude Code is running in a terminal window…', 4000);
    } catch (e) {
      // ── Last resort: copy command to clipboard ──────────────────────────
      const manualCmd = `powershell -ExecutionPolicy Bypass -File "${script}" "${absPath}"`;
      await navigator.clipboard.writeText(manualCmd);
      new Notice(
        '⚠️ Could not auto-run.\nPowerShell command copied to clipboard!\nPaste it in a terminal to start.',
        8000
      );
      btn.innerHTML = '▶&nbsp; Run with Claude Code';
      btn.disabled = false; btn.style.background = '#7c3aed';
    }
  };
}
```

---
<!-- Claude Code will append the Completion Report below this line -->
