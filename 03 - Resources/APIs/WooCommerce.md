---
date: 2026-06-25
tags: [api, backend]
domain: WooCommerce
---

# WooCommerce API

**Last synced:** 2026-06-25 21:37  
**Base URL:** `http://localhost:5000`

---

## `POST` /api/wc/callback

### Request Body

```json
{
  "user_id": "uuid-here",
  "consumer_key": "",
  "consumer_secret": "",
  "key_permissions": ""
}
```

| Field | Type | Required |
|-------|------|----------|
| `user_id` | string | **required** |
| `consumer_key` | string | **required** |
| `consumer_secret` | string | **required** |
| `key_permissions` | string | **required** |

---

## `GET` /api/wc/return

---

## `GET` /api/v1/integrations/woocommerce

> **Auth required** — Bearer token in `Authorization` header

---

## `POST` /api/v1/integrations/woocommerce/oauth

> **Auth required** — Bearer token in `Authorization` header

### Request Body

```json
{
  "store_url": "https://example.com/image.jpg"
}
```

| Field | Type | Required |
|-------|------|----------|
| `store_url` | string | **required** |

### Response

```json
{
  "redirect_url": ...
}
```

---

## `POST` /api/v1/integrations/woocommerce/disconnect

> **Auth required** — Bearer token in `Authorization` header

### Response

```json
{
  "status": ...
}
```

---

## `DELETE` /api/v1/integrations/woocommerce/disconnect

> **Auth required** — Bearer token in `Authorization` header

### Response

```json
{
  "status": ...
}
```

---

## `POST` /api/v1/integrations/woocommerce/test

> **Auth required** — Bearer token in `Authorization` header

---

## `POST` /api/webhooks/woocommerce/orders

---

## `POST` /api/webhooks/woocommerce/products

---

