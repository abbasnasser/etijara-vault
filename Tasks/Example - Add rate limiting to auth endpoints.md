---
id: 202606251900
title: Example - Add rate limiting to auth endpoints
status: todo
priority: high
project: etijara
created: 2026-06-25
completed: 
tags: [task, backend, auth, security]
---

# Add rate limiting to auth endpoints

## Description
The `/login` and `/signup` endpoints are currently unprotected against brute-force attacks. We need to add rate limiting middleware so that:
- Repeated failed logins from the same IP are throttled
- Bulk signup attempts are blocked

## Acceptance Criteria
- [ ] `POST /api/v1/auth/login` — max 10 requests/minute per IP, returns `429` with `Retry-After` header when exceeded
- [ ] `POST /api/v1/auth/signup` — max 5 requests/hour per IP
- [ ] Other auth endpoints (verify-otp, forgot-password, reset-password) — max 20/minute per IP
- [ ] Rate limit state stored in Redis (already available via `cache.Cache`)
- [ ] Middleware is reusable (not copy-pasted per route)

## Technical Context
- Router: Echo (`github.com/labstack/echo/v4`)
- Redis cache: `internal/pkg/cache` — already wired into server
- Auth routes: `internal/core/auth/routes.go`
- Server setup: `cmd/api/server.go`
- Echo has a built-in `echomiddleware.RateLimiter` or you can use a custom middleware with Redis

## Notes
Keep it simple — Echo's built-in rate limiter is fine if it supports per-IP keys. If not, write a thin Redis-based middleware.

---

```dataviewjs
const vaultPath = app.vault.adapter.basePath;
const relPath   = dv.current().file.path;
const absPath   = `${vaultPath}\\${relPath.replace(/\//g, '\\')}`;
const script    = `${vaultPath}\\scripts\\run-task.ps1`;

const status = dv.current().status ?? 'todo';
const badge = {
  'todo':        ['🔵 TODO',       '#3b82f6'],
  'in-progress': ['🟡 IN PROGRESS','#f59e0b'],
  'done':        ['✅ DONE',        '#10b981'],
  'backlog':     ['⚪ BACKLOG',     '#6b7280'],
}[status] ?? ['❓ UNKNOWN', '#888'];

const badgeEl = this.container.createEl('span', { text: badge[0] });
badgeEl.style.cssText = `display:inline-block;padding:3px 10px;border-radius:12px;background:${badge[1]}22;color:${badge[1]};font-weight:600;font-size:13px;margin-bottom:12px;border:1px solid ${badge[1]}55;`;
this.container.createEl('br');

if (status === 'done') {
  this.container.createEl('em', { text: 'This task has been completed by Claude Code.' });
} else {
  const btn = this.container.createEl('button');
  btn.innerHTML = '▶&nbsp; Run with Claude Code';
  btn.style.cssText = 'margin-top:8px;padding:9px 20px;font-size:14px;font-weight:600;background:#7c3aed;color:#fff;border:none;border-radius:8px;cursor:pointer;';
  btn.onclick = async () => {
    btn.innerHTML = '⏳&nbsp; Claude is working…'; btn.disabled = true; btn.style.background = '#6b7280';
    try {
      const { exec } = require('child_process');
      exec(`powershell -ExecutionPolicy Bypass -NoExit -File "${script}" "${absPath}"`, (err) => {
        if (err) new Notice(`❌ ${err.message}`, 8000);
        else new Notice('✅ Done! Reload note to see report.', 5000);
      });
      new Notice('⏳ Claude Code running in terminal…', 4000);
    } catch(e) {
      await navigator.clipboard.writeText(`powershell -ExecutionPolicy Bypass -File "${script}" "${absPath}"`);
      new Notice('Command copied to clipboard — paste in PowerShell', 6000);
      btn.innerHTML = '▶&nbsp; Run with Claude Code'; btn.disabled = false; btn.style.background = '#7c3aed';
    }
  };
}
```

---
<!-- Claude Code will append the Completion Report below this line -->
