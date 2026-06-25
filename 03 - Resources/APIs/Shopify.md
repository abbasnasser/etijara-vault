---
date: 2026-06-25
tags: [api, backend]
domain: Shopify
---

# Shopify API

**Last synced:** 2026-06-25 21:37  
**Base URL:** `http://localhost:5000`

---

## `GET` /api/auth/shopify/callback

### Query Parameters

| Param | Description |
|-------|-------------|
| `code` | string |
| `shop` | string |
| `state` | string |
| `hmac` | string |
| `timestamp` | string |

---

## `GET` /api/v1/integrations/shopify

> **Auth required** — Bearer token in `Authorization` header

---

## `POST` /api/v1/integrations/shopify/oauth

> **Auth required** — Bearer token in `Authorization` header

### Request Body

```json
{
  "shopName": ""
}
```

| Field | Type | Required |
|-------|------|----------|
| `shopName` | string | **required** |

### Response

```json
{
  "redirect_url": ...
  "shop": ...
}
```

---

## `POST` /api/v1/integrations/shopify/disconnect

> **Auth required** — Bearer token in `Authorization` header

### Response

```json
{
  "status": ...
}
```

---

## `DELETE` /api/v1/integrations/shopify/disconnect

> **Auth required** — Bearer token in `Authorization` header

### Response

```json
{
  "status": ...
}
```

---

## `POST` /api/v1/integrations/shopify/test

> **Auth required** — Bearer token in `Authorization` header

---

## `POST` /api/v1/integrations/shopify/reregister

> **Auth required** — Bearer token in `Authorization` header

---

## `POST` /api/webhooks/shopify

---

## `POST` /api/webhooks/shopify/orders

---

## `POST` /api/webhooks/shopify/checkouts

---

## `POST` /api/webhooks/shopify/products

---

## `POST` /api/webhooks/shopify/inventory

---

## `POST` /api/webhooks/shopify/capture

---

## `POST` /api/webhooks/shopify/compliance/customers/data-request

---

## `POST` /api/webhooks/shopify/compliance/customers/redact

---

## `POST` /api/webhooks/shopify/compliance/shop/redact

---

