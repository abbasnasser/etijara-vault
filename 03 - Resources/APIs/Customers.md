---
date: 2026-06-25
tags: [api, backend]
domain: Customers
---

# Customers API

**Last synced:** 2026-06-25 21:32  
**Base URL:** `http://localhost:5000`

---

## `GET` /api/v1/customers

> **Auth required** — Bearer token in `Authorization` header

### Query Parameters

| Param | Description |
|-------|-------------|
| `limit` | integer — max results (default 20) |
| `page` | integer — page number (default 1) |
| `search` | string — search query |
| `type` | string |

---

## `POST` /api/v1/customers

> **Auth required** — Bearer token in `Authorization` header

### Request Body

```json
{
  "email": "user@example.com",
  "first_name": "John",
  "last_name": "Doe",
  "phone": "+966501234567",
  "address": null,
  "city": null,
  "state": null,
  "zip_code": null,
  "country": null,
  "customer_type": "",
  "notes": "Some notes here",
  "newsletter": false,
  "notify_orders": false,
  "preferred_carrier": null
}
```

| Field | Type | Required |
|-------|------|----------|
| `email` | string | **required** |
| `first_name` | string | **required** |
| `last_name` | string | **required** |
| `phone` | *string | optional |
| `address` | *string | optional |
| `city` | *string | optional |
| `state` | *string | optional |
| `zip_code` | *string | optional |
| `country` | *string | optional |
| `customer_type` | string | **required** |
| `notes` | *string | optional |
| `newsletter` | bool | **required** |
| `notify_orders` | bool | **required** |
| `preferred_carrier` | *string | optional |

---

## `GET` /api/v1/customers/:id

> **Auth required** — Bearer token in `Authorization` header

### Path Parameters

| Param | Type | Description |
|-------|------|-------------|
| `id` | string | Route identifier |

---

## `PUT` /api/v1/customers/:id

> **Auth required** — Bearer token in `Authorization` header

### Path Parameters

| Param | Type | Description |
|-------|------|-------------|
| `id` | string | Route identifier |

### Request Body

```json
{
  "first_name": "John",
  "last_name": "Doe",
  "phone": "+966501234567",
  "address": null,
  "city": null,
  "state": null,
  "zip_code": null,
  "country": null,
  "customer_type": null,
  "notes": "Some notes here",
  "newsletter": null,
  "notify_orders": null,
  "preferred_carrier": null
}
```

| Field | Type | Required |
|-------|------|----------|
| `first_name` | *string | optional |
| `last_name` | *string | optional |
| `phone` | *string | optional |
| `address` | *string | optional |
| `city` | *string | optional |
| `state` | *string | optional |
| `zip_code` | *string | optional |
| `country` | *string | optional |
| `customer_type` | *string | optional |
| `notes` | *string | optional |
| `newsletter` | *bool | optional |
| `notify_orders` | *bool | optional |
| `preferred_carrier` | *string | optional |

### Response

```json
{
  "id": ...
}
```

---

## `DELETE` /api/v1/customers/:id

> **Auth required** — Bearer token in `Authorization` header

### Path Parameters

| Param | Type | Description |
|-------|------|-------------|
| `id` | string | Route identifier |

---

## `GET` /api/v1/customers/:id/notes

> **Auth required** — Bearer token in `Authorization` header

### Path Parameters

| Param | Type | Description |
|-------|------|-------------|
| `id` | string | Route identifier |

---

## `POST` /api/v1/customers/:id/notes

> **Auth required** — Bearer token in `Authorization` header

### Path Parameters

| Param | Type | Description |
|-------|------|-------------|
| `id` | string | Route identifier |

### Request Body

```json
{
  "content": "",
  "created_by": null
}
```

| Field | Type | Required |
|-------|------|----------|
| `content` | string | **required** |
| `created_by` | *string | optional |

---

## `POST` /api/v1/customers/:id/tags

> **Auth required** — Bearer token in `Authorization` header

### Path Parameters

| Param | Type | Description |
|-------|------|-------------|
| `id` | string | Route identifier |

### Request Body

```json
{
  "tag": "",
  "color": null
}
```

| Field | Type | Required |
|-------|------|----------|
| `tag` | string | **required** |
| `color` | *string | optional |

---

## `DELETE` /api/v1/customers/:id/tags

> **Auth required** — Bearer token in `Authorization` header

### Path Parameters

| Param | Type | Description |
|-------|------|-------------|
| `id` | string | Route identifier |

### Query Parameters

| Param | Description |
|-------|-------------|
| `tag` | string |

---

