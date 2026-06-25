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

```dataviewjs
/* ── Linear-style issue header ─────────────────────────────────── */
const p = dv.current();

const STATUS = {
  backlog:      { label:'Backlog',     dot:'#888780', ring:'#B4B2A9' },
  todo:         { label:'Todo',        dot:'#378ADD', ring:'#85B7EB' },
  'in-progress':{ label:'In progress', dot:'#EF9F27', ring:'#FAC775' },
  done:         { label:'Done',        dot:'#639922', ring:'#97C459' },
};
const PRIO = {
  urgent: { label:'Urgent', color:'#ef4444' },
  high:   { label:'High',   color:'#f97316' },
  medium: { label:'Medium', color:'#f59e0b' },
  low:    { label:'Low',    color:'#6b7280' },
};

const st  = STATUS[p.status ?? 'todo']  ?? STATUS.todo;
const pr  = PRIO[(p.priority ?? 'medium').toLowerCase()] ?? PRIO.medium;

const wrap = this.container.createEl('div');
wrap.style.cssText = `
  font-family:-apple-system,BlinkMacSystemFont,"Segoe UI",sans-serif;
  border:1px solid var(--background-modifier-border);
  border-radius:10px;padding:16px 20px;margin-bottom:20px;
  background:var(--background-secondary);
`;

/* metadata row */
const meta = wrap.createEl('div');
meta.style.cssText = 'display:flex;align-items:center;gap:10px;flex-wrap:wrap;margin-bottom:14px;';

/* status pill */
const sPill = meta.createEl('div');
sPill.style.cssText = `display:flex;align-items:center;gap:6px;padding:4px 10px;
  border-radius:20px;border:1px solid ${st.ring};background:${st.dot}18;cursor:pointer;`;
const sDot = sPill.createEl('div');
sDot.style.cssText = `width:10px;height:10px;border-radius:50%;background:${st.ring};border:1.5px solid ${st.dot};`;
sPill.createEl('span', {text: st.label}).style.cssText = `font-size:12px;font-weight:600;color:${st.dot};`;

/* priority pill */
const pPill = meta.createEl('div');
pPill.style.cssText = `display:flex;align-items:center;gap:5px;padding:4px 10px;
  border-radius:20px;border:1px solid ${pr.color}55;background:${pr.color}12;`;
pPill.createEl('span', {text: '●'}).style.cssText = `font-size:9px;color:${pr.color};`;
pPill.createEl('span', {text: pr.label}).style.cssText = `font-size:12px;font-weight:600;color:${pr.color};`;

/* project pill */
if (p.project) {
  const proj = meta.createEl('div');
  proj.style.cssText = `padding:4px 10px;border-radius:20px;background:var(--background-primary);
    border:1px solid var(--background-modifier-border);font-size:12px;color:var(--text-muted);`;
  proj.textContent = p.project;
}

/* created date */
const datePill = meta.createEl('div');
datePill.style.cssText = 'margin-left:auto;font-size:11px;color:var(--text-muted);';
datePill.textContent = `Created ${p.created ?? ''}`;

/* divider */
const hr = wrap.createEl('div');
hr.style.cssText = 'border-top:1px solid var(--background-modifier-border);margin:12px 0;';

/* ── Run button (only when not done) ───────────────────────────── */
if (p.status !== 'done') {
  const vaultPath = app.vault.adapter.basePath;
  const relPath   = p.file.path;
  const absPath   = `${vaultPath}\\${relPath.replace(/\//g,'\\')}`
  const script    = `${vaultPath}\\scripts\\run-task.ps1`;

  const btnRow = wrap.createEl('div');
  btnRow.style.cssText = 'display:flex;align-items:center;gap:10px;';

  const btn = btnRow.createEl('button');
  btn.textContent = '▶  Run with Claude Code';
  btn.style.cssText = `
    padding:8px 18px;font-size:13px;font-weight:600;
    background:#7c3aed;color:#fff;border:none;border-radius:7px;
    cursor:pointer;letter-spacing:.2px;flex-shrink:0;
  `;
  const hint = btnRow.createEl('span');
  hint.style.cssText = 'font-size:11px;color:var(--text-muted);';
  hint.textContent = 'Claude will implement this task and mark it done when finished.';

  btn.onclick = async () => {
    btn.textContent = '⏳  Working…';
    btn.disabled = true; btn.style.background = '#5b21b6';
    hint.textContent = 'Claude Code is running — check the terminal for live output.';
    try {
      const { exec } = require('child_process');
      exec(`powershell -ExecutionPolicy Bypass -NoExit -File "${script}" "${absPath}"`, err => {
        if (err) { new Notice('❌ ' + err.message, 8000); }
        else      { new Notice('✅ Done! Reload note to see the report.', 5000); }
        btn.textContent = '▶  Run with Claude Code';
        btn.disabled = false; btn.style.background = '#7c3aed';
        hint.textContent = 'Claude will implement this task and mark it done when finished.';
      });
      new Notice('⏳ Claude Code started in a terminal window…', 4000);
    } catch(e) {
      await navigator.clipboard.writeText(
        `powershell -ExecutionPolicy Bypass -File "${script}" "${absPath}"`
      );
      new Notice('Command copied to clipboard — paste in PowerShell.', 6000);
      btn.textContent = '▶  Run with Claude Code';
      btn.disabled = false; btn.style.background = '#7c3aed';
    }
  };
} else {
  const done = wrap.createEl('div');
  done.style.cssText = 'font-size:12px;color:#639922;font-weight:600;';
  done.textContent = '✓  Completed by Claude Code' + (p.completed ? '  ·  ' + p.completed : '');
}
```

# <% tp.file.title %>

## Description
> What needs to be done and why?


## Acceptance criteria
- [ ] 
- [ ] 

## Technical context
> Files to look at, related endpoints, relevant domain, architecture notes.


## Notes


---

<!-- Claude Code appends the Completion Report below this line -->
