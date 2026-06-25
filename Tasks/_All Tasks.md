---
tags: [tasks]
---

# All Tasks

```dataview
TABLE WITHOUT ID
  file.link AS "Task",
  status AS "Status",
  priority AS "Priority",
  project AS "Project",
  created AS "Created",
  completed AS "Completed"
FROM "Tasks"
WHERE !startswith(file.name, "_")
SORT choice(status = "in-progress", 0, choice(status = "todo", 1, choice(status = "backlog", 2, 3))) ASC, created DESC
```
