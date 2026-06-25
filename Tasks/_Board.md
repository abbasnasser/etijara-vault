---
cssclasses: [linear-board-page]
tags: [board]
---

```dataviewjs
const pages = dv.pages('"Tasks"')
  .where(p => !p.file.name.startsWith('_'))
  .sort(p => p.created, 'desc');

const COLS = [
  { id:'backlog',      label:'Backlog',      dot:'#888780', ring:'#B4B2A9', txt:'#888780' },
  { id:'todo',         label:'Todo',         dot:'#378ADD', ring:'#85B7EB', txt:'#3b82f6' },
  { id:'in-progress',  label:'In progress',  dot:'#EF9F27', ring:'#FAC775', txt:'#f59e0b' },
  { id:'done',         label:'Done',         dot:'#639922', ring:'#97C459', txt:'#10b981' },
];

const PRIO = {
  urgent: { label:'Urgent', color:'#ef4444', sym:'!!' },
  high:   { label:'High',   color:'#f97316', sym:'▲'  },
  medium: { label:'Medium', color:'#f59e0b', sym:'●'  },
  low:    { label:'Low',    color:'#6b7280', sym:'▽'  },
};

const counts = Object.fromEntries(COLS.map(c => [
  c.id, pages.where(p => (p.status ?? 'todo') === c.id).length
]));
const total    = pages.length;
const inProg   = counts['in-progress'];
const doneCnt  = counts['done'];

/* ── root ──────────────────────────────────────────────────────── */
const root = this.container.createEl('div', {cls:'linear-board'});

/* ── header ────────────────────────────────────────────────────── */
const hdr = root.createEl('div', {cls:'lb-header'});
const htitle = hdr.createEl('div');
htitle.createEl('span', {text:'Etijara', cls:'lb-title'});
htitle.createEl('span', {text:'/ Tasks', cls:'lb-subtitle'});

const newBtn = hdr.createEl('button', {text:'+ New issue', cls:'lb-new-btn'});
newBtn.onclick = () => app.commands.executeCommandById('templater-obsidian:create-new-note-from-template');

/* ── stats bar ─────────────────────────────────────────────────── */
const stats = root.createEl('div', {cls:'lb-stats'});
const addStat = (val, label) => {
  const s = stats.createEl('div', {cls:'lb-stat'});
  s.createEl('b', {text: String(val)});
  s.appendText(' ' + label);
};
addStat(total - doneCnt, 'open');
addStat(inProg, 'in progress');
addStat(doneCnt, 'completed');

/* ── columns ───────────────────────────────────────────────────── */
const grid = root.createEl('div', {cls:'lb-cols'});

for (const col of COLS) {
  const tasks = pages.where(p => (p.status ?? 'todo') === col.id);
  const colEl = grid.createEl('div', {cls: col.id === 'done' ? 'lb-done' : ''});

  /* column header */
  const head = colEl.createEl('div', {cls:'lb-col-head'});
  const dot = head.createEl('div', {cls:'lb-col-icon'});
  dot.style.cssText = `background:${col.ring};border:1.5px solid ${col.dot}`;
  head.createEl('span', {text: col.label, cls:'lb-col-name', attr:{style:`color:${col.txt}`}});
  head.createEl('span', {text: String(tasks.length), cls:'lb-col-count'});

  /* cards */
  for (const task of tasks) {
    const card = colEl.createEl('div', {cls:'lb-card'});
    card.onclick = () => app.workspace.openLinkText(task.file.path, '', false);

    card.createEl('div', {text: task.file.name, cls:'lb-card-title'});

    const meta = card.createEl('div', {cls:'lb-card-meta'});

    /* tags (skip 'task') */
    const rawTags = task.tags ? (Array.isArray(task.tags) ? task.tags : [task.tags]) : [];
    rawTags.filter(t => t !== 'task').forEach(t =>
      meta.createEl('span', {text: t, cls:'lb-tag'})
    );

    if (col.id === 'done') {
      const d = meta.createEl('span', {cls:'lb-done-date'});
      d.textContent = task.completed ?? '';
    } else {
      /* priority badge */
      const pkey = (task.priority ?? 'medium').toLowerCase();
      const pc   = PRIO[pkey] ?? PRIO.medium;
      const pEl  = meta.createEl('span', {cls:'lb-prio'});
      pEl.style.color = pc.color;
      pEl.textContent = `${pc.sym} ${pc.label}`;
    }
  }
}
```
