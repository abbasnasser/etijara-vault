---
date: 2026-06-25
tags: [api, backend]
domain: Orders
---

# Orders API

**Last synced:** 2026-06-25 21:32  
**Base URL:** `http://localhost:5000`

---

## `GET` /api/v1/orders

> **Auth required** — Bearer token in `Authorization` header

### Query Parameters

| Param | Description |
|-------|-------------|
| `limit` | integer — max results (default 20) |
| `page` | integer — page number (default 1) |
| `status` | string — filter by status |

---

## `POST` /api/v1/orders

> **Auth required** — Bearer token in `Authorization` header

### Request Body

```json
{
  "customer_id": "uuid-here",
  "notes": "Some notes here",
  "currency": "SAR",
  "items": [{
    "variant_id": "uuid-here",
    "quantity": 1
  }]
}
```

| Field | Type | Required |
|-------|------|----------|
| `customer_id` | string | **required** |
| `notes` | string | **required** |
| `currency` | string | **required** |
| `items` | array of objects | optional |
| `  variant_id` | string | **required** |
| `  quantity` | int | **required** |

---

## `GET` /api/v1/orders/:id

> **Auth required** — Bearer token in `Authorization` header

### Path Parameters

| Param | Type | Description |
|-------|------|-------------|
| `id` | string | Route identifier |

---

## `PUT` /api/v1/orders/:id/status

> **Auth required** — Bearer token in `Authorization` header

### Path Parameters

| Param | Type | Description |
|-------|------|-------------|
| `id` | string | Route identifier |

### Request Body

```json
{
  "status": "active"
}
```

| Field | Type | Required |
|-------|------|----------|
| `status` | string | **required** |

### Response

```json
{
  "id": ...
  "status": ...
}
```

---

## `PUT` /api/v1/orders/:id/ship

> **Auth required** — Bearer token in `Authorization` header

### Path Parameters

| Param | Type | Description |
|-------|------|-------------|
| `id` | string | Route identifier |

### Request Body

```json
{
  "tracking_number": "",
  "carrier": ""
}
```

| Field | Type | Required |
|-------|------|----------|
| `tracking_number` | string | **required** |
| `carrier` | string | **required** |

---

## `PUT` /api/v1/orders/:id/deliver

> **Auth required** — Bearer token in `Authorization` header

### Path Parameters

| Param | Type | Description |
|-------|------|-------------|
| `id` | string | Route identifier |

---

## `POST` /api/v1/orders/:id/cancel

> **Auth required** — Bearer token in `Authorization` header

### Path Parameters

| Param | Type | Description |
|-------|------|-------------|
| `id` | string | Route identifier |

### Response

```json
{
  "id": ...
  "status": ...
}
```

---

