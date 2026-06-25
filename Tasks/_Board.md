---
tags: [board]
---

# 🗂️ Task Board

> Create new task: `Ctrl+P` → **Templater: Create new note from template** → **Task**

```dataviewjs
// ── Compact stat bar ──────────────────────────────────────────────────────────
const all = dv.pages('"Tasks"').where(p => !p.file.name.startsWith('_'));
const counts = { backlog:0, todo:0, 'in-progress':0, done:0 };
all.forEach(p => { const s = p.status ?? 'todo'; if (counts[s] !== undefined) counts[s]++; });

const bar = this.container.createEl('div');
bar.style.cssText = 'display:flex;gap:12px;margin-bottom:20px;flex-wrap:wrap;';
const stats = [
  ['⚪ Backlog',     counts.backlog,      '#6b7280'],
  ['🔵 Todo',        counts.todo,         '#3b82f6'],
  ['🟡 In Progress', counts['in-progress'],'#f59e0b'],
  ['✅ Done',         counts.done,         '#10b981'],
];
for (const [label, n, color] of stats) {
  const chip = bar.createEl('div', { text: `${label}  ${n}` });
  chip.style.cssText = `padding:4px 14px;border-radius:20px;font-size:13px;font-weight:600;
    background:${color}22;color:${color};border:1px solid ${color}44;`;
}
```

---

## ⚪ Backlog

```dataview
TABLE WITHOUT ID
  file.link AS "Task",
  priority AS "Priority",
  created AS "Created"
FROM "Tasks"
WHERE status = "backlog" AND !startswith(file.name, "_")
SORT priority ASC, created DESC
```

## 🔵 Todo

```dataview
TABLE WITHOUT ID
  file.link AS "Task",
  priority AS "Priority",
  created AS "Created"
FROM "Tasks"
WHERE status = "todo" AND !startswith(file.name, "_")
SORT priority ASC, created DESC
```

## 🟡 In Progress

```dataview
TABLE WITHOUT ID
  file.link AS "Task",
  priority AS "Priority",
  created AS "Created"
FROM "Tasks"
WHERE status = "in-progress" AND !startswith(file.name, "_")
SORT created DESC
```

## ✅ Done

```dataview
TABLE WITHOUT ID
  file.link AS "Task",
  completed AS "Completed"
FROM "Tasks"
WHERE status = "done" AND !startswith(file.name, "_")
SORT completed DESC
LIMIT 30
```
