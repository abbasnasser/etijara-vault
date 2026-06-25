---
date: 2026-06-25
tags: [api, backend]
domain: Integrations
---

# Integrations API

**Last synced:** 2026-06-25 21:37  
**Base URL:** `http://localhost:5000`

---

## `GET` /api/v1/integrations

> **Auth required** — Bearer token in `Authorization` header

---

## `GET` /api/v1/integrations/stock

> **Auth required** — Bearer token in `Authorization` header

---

## `POST` /api/v1/integrations/stock

> **Auth required** — Bearer token in `Authorization` header

### Request Body

```json
{
  "enabled": false
}
```

| Field | Type | Required |
|-------|------|----------|
| `enabled` | bool | **required** |

---

