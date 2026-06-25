---
id: 202606251900
title: Example - Add rate limiting to auth endpoints
status: todo
priority: high
project: etijara
created: 2026-06-25
completed:
tags: [task, auth, security]
---

```dataviewjs
const p = dv.current();
const STATUS = {
  backlog:      { label:'Backlog',     dot:'#888780', ring:'#B4B2A9' },
  todo:         { label:'Todo',        dot:'#378ADD', ring:'#85B7EB' },
  'in-progress':{ label:'In progress', dot:'#EF9F27', ring:'#FAC775' },
  done:         { label:'Done',        dot:'#639922', ring:'#97C459' },
};
const PRIO = {
  urgent:{label:'Urgent',color:'#ef4444'},
  high:  {label:'High',  color:'#f97316'},
  medium:{label:'Medium',color:'#f59e0b'},
  low:   {label:'Low',   color:'#6b7280'},
};
const st = STATUS[p.status ?? 'todo'] ?? STATUS.todo;
const pr = PRIO[(p.priority ?? 'medium').toLowerCase()] ?? PRIO.medium;

const wrap = this.container.createEl('div');
wrap.style.cssText = 'font-family:-apple-system,BlinkMacSystemFont,"Segoe UI",sans-serif;border:1px solid var(--background-modifier-border);border-radius:10px;padding:16px 20px;margin-bottom:20px;background:var(--background-secondary);';

const meta = wrap.createEl('div');
meta.style.cssText = 'display:flex;align-items:center;gap:10px;flex-wrap:wrap;margin-bottom:14px;';

const sPill = meta.createEl('div');
sPill.style.cssText = `display:flex;align-items:center;gap:6px;padding:4px 10px;border-radius:20px;border:1px solid ${st.ring};background:${st.dot}18;`;
const sDot = sPill.createEl('div');
sDot.style.cssText = `width:10px;height:10px;border-radius:50%;background:${st.ring};border:1.5px solid ${st.dot};`;
sPill.createEl('span',{text:st.label}).style.cssText = `font-size:12px;font-weight:600;color:${st.dot};`;

const pPill = meta.createEl('div');
pPill.style.cssText = `display:flex;align-items:center;gap:5px;padding:4px 10px;border-radius:20px;border:1px solid ${pr.color}55;background:${pr.color}12;`;
pPill.createEl('span',{text:'●'}).style.cssText = `font-size:9px;color:${pr.color};`;
pPill.createEl('span',{text:pr.label}).style.cssText = `font-size:12px;font-weight:600;color:${pr.color};`;

if(p.project){const pp=meta.createEl('div');pp.style.cssText='padding:4px 10px;border-radius:20px;background:var(--background-primary);border:1px solid var(--background-modifier-border);font-size:12px;color:var(--text-muted);';pp.textContent=p.project;}
const dp=meta.createEl('div');dp.style.cssText='margin-left:auto;font-size:11px;color:var(--text-muted);';dp.textContent=`Created ${p.created??''}`;

wrap.createEl('div').style.cssText='border-top:1px solid var(--background-modifier-border);margin:12px 0;';

if(p.status!=='done'){
  const vaultPath=app.vault.adapter.basePath;
  const absPath=`${vaultPath}\\${p.file.path.replace(/\//g,'\\')}`;
  const script=`${vaultPath}\\scripts\\run-task.ps1`;
  const row=wrap.createEl('div');row.style.cssText='display:flex;align-items:center;gap:10px;';
  const btn=row.createEl('button');
  btn.textContent='▶  Run with Claude Code';
  btn.style.cssText='padding:8px 18px;font-size:13px;font-weight:600;background:#7c3aed;color:#fff;border:none;border-radius:7px;cursor:pointer;';
  const hint=row.createEl('span');hint.style.cssText='font-size:11px;color:var(--text-muted);';
  hint.textContent='Claude will implement this task and mark it done when finished.';
  btn.onclick=async()=>{
    btn.textContent='⏳  Working…';btn.disabled=true;btn.style.background='#5b21b6';
    try{
      const{exec}=require('child_process');
      exec(`powershell -ExecutionPolicy Bypass -NoExit -File "${script}" "${absPath}"`,err=>{
        if(err)new Notice('❌ '+err.message,8000);else new Notice('✅ Done! Reload note.',5000);
        btn.textContent='▶  Run with Claude Code';btn.disabled=false;btn.style.background='#7c3aed';
      });
      new Notice('⏳ Claude Code running in terminal…',4000);
    }catch(e){
      await navigator.clipboard.writeText(`powershell -ExecutionPolicy Bypass -File "${script}" "${absPath}"`);
      new Notice('Command copied to clipboard.',6000);
      btn.textContent='▶  Run with Claude Code';btn.disabled=false;btn.style.background='#7c3aed';
    }
  };
} else {
  const d=wrap.createEl('div');d.style.cssText='font-size:12px;color:#639922;font-weight:600;';
  d.textContent='✓  Completed by Claude Code'+(p.completed?'  ·  '+p.completed:'');
}
```

# Add rate limiting to auth endpoints

## Description
The `/login` and `/signup` endpoints are currently unprotected against brute-force attacks. We need rate limiting middleware so repeated attempts from the same IP are throttled.

## Acceptance criteria
- [ ] `POST /api/v1/auth/login` — max 10 requests/minute per IP, returns `429` with `Retry-After` header
- [ ] `POST /api/v1/auth/signup` — max 5 requests/hour per IP
- [ ] `POST /api/v1/auth/forgot-password`, `verify-otp`, `reset-password` — max 20/minute per IP
- [ ] Rate limit state stored in Redis (already available via `cache.Cache`)
- [ ] Middleware is reusable (not copy-pasted per route)

## Technical context
- Router: Echo (`github.com/labstack/echo/v4`)
- Redis cache: `internal/pkg/cache` — already wired into server
- Auth routes: `internal/core/auth/routes.go`
- Server setup: `cmd/api/server.go`
- Echo has a built-in `echomiddleware.RateLimiter` — check if it supports per-IP keys with Redis backend; if not, write a thin custom middleware.

## Notes
Keep it simple. Middleware should take `(limit int, window time.Duration)` args so it's easy to reuse across other sensitive endpoints later.

---

<!-- Claude Code appends the Completion Report below this line -->
