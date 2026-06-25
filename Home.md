# Etijara Vault

> Engineering knowledge base for the Etijara project.

---

## Navigation

| Area | Description |
|------|-------------|
| [[Tasks/_Board\|🗂️ Task Board]] | Project tasks — create, assign, run with Claude Code |
| [[Tasks/_All Tasks\|📋 All Tasks]] | Full task table view |
| [[01 - Projects/Etijara/README\|Etijara Project]] | Main project hub |
| [[03 - Resources/APIs/API Overview\|API Overview]] | All backend endpoints |
| [[02 - Areas/Engineering\|Engineering]] | Architecture & decisions |
| [[Meetings\|Meetings]] | Meeting notes |
| [[Daily Notes\|Daily Notes]] | Daily logs |

---

## 🟡 In Progress

```dataview
TABLE WITHOUT ID
  file.link AS "Task",
  priority AS "Priority"
FROM "Tasks"
WHERE status = "in-progress" AND !startswith(file.name, "_")
SORT created DESC
```

## 🔵 Todo (next up)

```dataview
TABLE WITHOUT ID
  file.link AS "Task",
  priority AS "Priority",
  created AS "Created"
FROM "Tasks"
WHERE status = "todo" AND !startswith(file.name, "_")
SORT priority ASC, created DESC
LIMIT 5
```

---

## Recent Notes

```dataview
TABLE file.mtime as "Modified"
FROM ""
WHERE file.name != "Home" AND !startswith(file.name, "_")
SORT file.mtime DESC
LIMIT 8
```
