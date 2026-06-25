---
date: 2026-06-25
tags: [api, backend]
domain: Workspaces
---

# Workspaces API

**Last synced:** 2026-06-25 20:07  
**Base URL:** `http://localhost:5000`

---

## `POST` /api/v1/workspaces

> **Auth required** — Bearer token in `Authorization` header

### Request Body

```json
{
  "name": ""
}
```

| Field | Type | Required |
|-------|------|----------|
| `name` | string | **required** |

---

## `GET` /api/v1/workspaces

> **Auth required** — Bearer token in `Authorization` header

---

## `POST` /api/v1/workspaces/:id/switch

> **Auth required** — Bearer token in `Authorization` header

### Path Parameters

| Param | Type | Description |
|-------|------|-------------|
| `id` | string | Route identifier |

---

## `GET` /api/v1/subscription

> **Auth required** — Bearer token in `Authorization` header

---

