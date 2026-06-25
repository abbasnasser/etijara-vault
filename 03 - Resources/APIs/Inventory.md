---
date: 2026-06-25
tags: [api, backend]
domain: Inventory
---

# Inventory API

**Last synced:** 2026-06-25 19:45  
**Base URL:** `http://localhost:5000`

---

## `GET` /api/v1/inventory

> **Auth required** — Bearer token in `Authorization` header

### Query Parameters

| Param | Description |
|-------|-------------|
| `limit` | integer — max results (default 20) |
| `offset` | integer — skip N results |
| `search` | string — search query |
| `stockStatus` | string |

---

## `GET` /api/v1/inventory/:variantId

> **Auth required** — Bearer token in `Authorization` header

### Path Parameters

| Param | Type | Description |
|-------|------|-------------|
| `variantId` | string | Route identifier |

---

## `PUT` /api/v1/inventory/:variantId

> **Auth required** — Bearer token in `Authorization` header

### Path Parameters

| Param | Type | Description |
|-------|------|-------------|
| `variantId` | string | Route identifier |

### Request Body

```json
{
  "action": "",
  "quantity": 1,
  "reason": "",
  "warehouse_id": "uuid-here",
  "low_stock_threshold": null
}
```

| Field | Type | Required |
|-------|------|----------|
| `action` | string | **required** |
| `quantity` | int | **required** |
| `reason` | string | **required** |
| `warehouse_id` | *string | optional |
| `low_stock_threshold` | *int | optional |

---

## `GET` /api/v1/inventory/:variantId/history

> **Auth required** — Bearer token in `Authorization` header

### Path Parameters

| Param | Type | Description |
|-------|------|-------------|
| `variantId` | string | Route identifier |

### Query Parameters

| Param | Description |
|-------|-------------|
| `limit` | integer — max results (default 20) |
| `offset` | integer — skip N results |

---

## `GET` /api/v1/stock

> **Auth required** — Bearer token in `Authorization` header

### Query Parameters

| Param | Description |
|-------|-------------|
| `sku` | string — product SKU |
| `variantId` | string |

---

