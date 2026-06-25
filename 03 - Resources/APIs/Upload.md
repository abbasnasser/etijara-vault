---
date: 2026-06-25
tags: [api, backend]
domain: Upload
---

# Upload API

**Last synced:** 2026-06-25 20:07  
**Base URL:** `http://localhost:5000`

---

## `GET` /api/v1/upload/presign

> **Auth required** — Bearer token in `Authorization` header

### Query Parameters

| Param | Description |
|-------|-------------|
| `filename` | string |
| `content_type` | string |

### Response

```json
{
  "upload_url": ...
  "public_url": ...
  "key": ...
}
```

---

