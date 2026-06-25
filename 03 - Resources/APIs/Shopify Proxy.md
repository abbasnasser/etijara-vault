---
date: 2026-06-25
tags: [api, backend]
domain: Shopify Proxy
---

# Shopify Proxy API

**Last synced:** 2026-06-25 19:45  
**Base URL:** `http://localhost:5000`

---

## `GET` /api/shopify-proxy/products

### Query Parameters

| Param | Description |
|-------|-------------|
| `workspace_id` | string |

---

## `GET` /api/shopify-proxy/stock

### Query Parameters

| Param | Description |
|-------|-------------|
| `workspace_id` | string |
| `sku` | string — product SKU |
| `variantId` | string |

---

## `POST` /api/shopify-proxy/orders

### Query Parameters

| Param | Description |
|-------|-------------|
| `workspace_id` | string |

### Request Body

```json
{
  "customerEmail": "",
  "customerName": "",
  "currency": "SAR",
  "items": [{
    "variantId": "",
    "sku": "",
    "title": "Sample Title",
    "quantity": 1,
    "price": "29.99"
  }]
}
```

| Field | Type | Required |
|-------|------|----------|
| `customerEmail` | string | **required** |
| `customerName` | string | **required** |
| `currency` | string | **required** |
| `items` | array of objects | optional |
| `  variantId` | string | **required** |
| `  sku` | string | **required** |
| `  title` | string | **required** |
| `  quantity` | int | **required** |
| `  price` | float64 | **required** |

---

## `OPTIONS` /api/shopify-proxy/orders

### Query Parameters

| Param | Description |
|-------|-------------|
| `workspace_id` | string |

### Request Body

```json
{
  "customerEmail": "",
  "customerName": "",
  "currency": "SAR",
  "items": [{
    "variantId": "",
    "sku": "",
    "title": "Sample Title",
    "quantity": 1,
    "price": "29.99"
  }]
}
```

| Field | Type | Required |
|-------|------|----------|
| `customerEmail` | string | **required** |
| `customerName` | string | **required** |
| `currency` | string | **required** |
| `items` | array of objects | optional |
| `  variantId` | string | **required** |
| `  sku` | string | **required** |
| `  title` | string | **required** |
| `  quantity` | int | **required** |
| `  price` | float64 | **required** |

---

