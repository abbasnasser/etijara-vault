---
date: 2026-06-25
tags: [api, backend]
domain: Delivery
---

# Delivery API

**Last synced:** 2026-06-25 20:07  
**Base URL:** `http://localhost:5000`

---

## `GET` /api/v1/delivery/:provider/locations

> **Auth required** — Bearer token in `Authorization` header

### Path Parameters

| Param | Type | Description |
|-------|------|-------------|
| `provider` | string | Route identifier |

---

## `GET` /api/v1/integrations/:provider

> **Auth required** — Bearer token in `Authorization` header

### Path Parameters

| Param | Type | Description |
|-------|------|-------------|
| `provider` | string | Route identifier |

---

## `POST` /api/v1/integrations/:provider/connect

> **Auth required** — Bearer token in `Authorization` header

### Path Parameters

| Param | Type | Description |
|-------|------|-------------|
| `provider` | string | Route identifier |

### Request Body

```json
{
  "country_code": 0,
  "phone_number": "+966501234567",
  "location_id": "uuid-here",
  "address": ""
}
```

| Field | Type | Required |
|-------|------|----------|
| `country_code` | int | **required** |
| `phone_number` | int64 | **required** |
| `location_id` | int | **required** |
| `address` | string | **required** |

---

## `DELETE` /api/v1/integrations/:provider/disconnect

> **Auth required** — Bearer token in `Authorization` header

### Path Parameters

| Param | Type | Description |
|-------|------|-------------|
| `provider` | string | Route identifier |

### Response

```json
{
  "status": ...
}
```

---

