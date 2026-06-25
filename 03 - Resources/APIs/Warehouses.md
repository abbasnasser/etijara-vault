---
date: 2026-06-25
tags: [api, backend]
domain: Warehouses
---

# Warehouses API

**Last synced:** 2026-06-25 21:42  
**Base URL:** `http://localhost:5000`

---

## `GET` /api/v1/warehouses

> **Auth required** — Bearer token in `Authorization` header

---

## `POST` /api/v1/warehouses

> **Auth required** — Bearer token in `Authorization` header

---

## `GET` /api/v1/warehouses/:id

> **Auth required** — Bearer token in `Authorization` header

### Path Parameters

| Param | Type | Description |
|-------|------|-------------|
| `id` | string | Route identifier |

---

## `PUT` /api/v1/warehouses/:id

> **Auth required** — Bearer token in `Authorization` header

### Path Parameters

| Param | Type | Description |
|-------|------|-------------|
| `id` | string | Route identifier |

---

## `DELETE` /api/v1/warehouses/:id

> **Auth required** — Bearer token in `Authorization` header

### Path Parameters

| Param | Type | Description |
|-------|------|-------------|
| `id` | string | Route identifier |

---

## `POST` /api/v1/warehouses/:id/default

> **Auth required** — Bearer token in `Authorization` header

### Path Parameters

| Param | Type | Description |
|-------|------|-------------|
| `id` | string | Route identifier |

### Response

```json
{
  "status": ...
}
```

---

## `PATCH` /api/v1/warehouses/:id/toggle

> **Auth required** — Bearer token in `Authorization` header

### Path Parameters

| Param | Type | Description |
|-------|------|-------------|
| `id` | string | Route identifier |

---

## `GET` /api/v1/warehouses/:id/inventory

> **Auth required** — Bearer token in `Authorization` header

### Path Parameters

| Param | Type | Description |
|-------|------|-------------|
| `id` | string | Route identifier |

---

## `GET` /api/v1/warehouses/inventory

> **Auth required** — Bearer token in `Authorization` header

### Query Parameters

| Param | Description |
|-------|-------------|
| `limit` | integer — max results (default 20) |
| `offset` | integer — skip N results |
| `warehouse_id` | string |
| `variant_id` | string |
| `search` | string — search query |

---

## `POST` /api/v1/warehouses/inventory/assign

> **Auth required** — Bearer token in `Authorization` header

### Request Body

```json
{
  "warehouse_id": "uuid-here",
  "variant_id": "uuid-here",
  "quantity": 1
}
```

| Field | Type | Required |
|-------|------|----------|
| `warehouse_id` | string | **required** |
| `variant_id` | string | **required** |
| `quantity` | int | **required** |

---

## `PUT` /api/v1/warehouses/inventory/quantity

> **Auth required** — Bearer token in `Authorization` header

### Request Body

```json
{
  "warehouse_id": "uuid-here",
  "variant_id": "uuid-here",
  "quantity": 1,
  "reason": "",
  "reference": ""
}
```

| Field | Type | Required |
|-------|------|----------|
| `warehouse_id` | string | **required** |
| `variant_id` | string | **required** |
| `quantity` | int | **required** |
| `reason` | string | **required** |
| `reference` | string | **required** |

### Response

```json
{
  "status": ...
}
```

---

## `POST` /api/v1/warehouses/inventory/transfer

> **Auth required** — Bearer token in `Authorization` header

### Request Body

```json
{
  "from_warehouse_id": "uuid-here",
  "to_warehouse_id": "uuid-here",
  "variant_id": "uuid-here",
  "quantity": 1,
  "reason": ""
}
```

| Field | Type | Required |
|-------|------|----------|
| `from_warehouse_id` | string | **required** |
| `to_warehouse_id` | string | **required** |
| `variant_id` | string | **required** |
| `quantity` | int | **required** |
| `reason` | string | **required** |

### Response

```json
{
  "status": ...
}
```

---

## `GET` /api/v1/warehouses/inventory/movements

> **Auth required** — Bearer token in `Authorization` header

### Query Parameters

| Param | Description |
|-------|-------------|
| `variant_id` | string |
| `type` | string |
| `limit` | integer — max results (default 20) |
| `offset` | integer — skip N results |

---

## `GET` /api/v1/warehouses/inventory/alerts

> **Auth required** — Bearer token in `Authorization` header

### Query Parameters

| Param | Description |
|-------|-------------|
| `resolved` | string |

---

## `POST` /api/v1/warehouses/inventory/alerts/:alertId/resolve

> **Auth required** — Bearer token in `Authorization` header

### Path Parameters

| Param | Type | Description |
|-------|------|-------------|
| `alertId` | string | Route identifier |

### Response

```json
{
  "status": ...
}
```

---

