---
date: 2026-06-25
tags: [api, backend]
domain: Products
---

# Products API

**Last synced:** 2026-06-25 21:37  
**Base URL:** `http://localhost:5000`

---

## `GET` /api/v1/products

> **Auth required** — Bearer token in `Authorization` header

### Query Parameters

| Param | Description |
|-------|-------------|
| `limit` | integer — max results (default 20) |
| `offset` | integer — skip N results |
| `search` | string — search query |
| `status` | string — filter by status |

---

## `POST` /api/v1/products

> **Auth required** — Bearer token in `Authorization` header

### Request Body

```json
{
  "product": {
    "title": "Sample Title",
    "handle": "",
    "body_html": "Some notes here",
    "vendor": null,
    "product_type": null,
    "tags": null,
    "status": "active",
    "options": [{
      "name": "",
      "position": 0,
      "values": []
    }],
    "variants": [{
      "title": "Sample Title",
      "option1": null,
      "option2": null,
      "option3": null,
      "price": "29.99",
      "compare_at_price": "29.99",
      "cost": "29.99",
      "sku": null,
      "barcode": null,
      "inventory_quantity": 0,
      "inventory_policy": "",
      "inventory_management": "",
      "requires_shipping": false,
      "taxable": false,
      "weight": null,
      "weight_unit": "",
      "status": "active",
      "image_id": "uuid-here",
      "position": 0
    }],
    "images": [{
      "src": "https://example.com/image.jpg",
      "alt": null,
      "position": 0
    }]
  }
}
```

| Field | Type | Required |
|-------|------|----------|
| `product` | object | optional |
| `  title` | string | **required** |
| `  handle` | string | **required** |
| `  body_html` | *string | optional |
| `  vendor` | *string | optional |
| `  product_type` | *string | optional |
| `  tags` | *string | optional |
| `  status` | string | **required** |
| `  options` | array of objects | optional |
| `    name` | string | **required** |
| `    position` | int | **required** |
| `    values` | []string | **required** |
| `  variants` | array of objects | optional |
| `    title` | string | **required** |
| `    option1` | *string | optional |
| `    option2` | *string | optional |
| `    option3` | *string | optional |
| `    price` | string | **required** |
| `    compare_at_price` | *string | optional |
| `    cost` | *string | optional |
| `    sku` | *string | optional |
| `    barcode` | *string | optional |
| `    inventory_quantity` | int | **required** |
| `    inventory_policy` | string | **required** |
| `    inventory_management` | string | **required** |
| `    requires_shipping` | bool | **required** |
| `    taxable` | bool | **required** |
| `    weight` | *string | optional |
| `    weight_unit` | string | **required** |
| `    status` | string | **required** |
| `    image_id` | *string | optional |
| `    position` | int | **required** |
| `  images` | array of objects | optional |
| `    src` | string | **required** |
| `    alt` | *string | optional |
| `    position` | int | **required** |

---

## `GET` /api/v1/products/:id

> **Auth required** — Bearer token in `Authorization` header

### Path Parameters

| Param | Type | Description |
|-------|------|-------------|
| `id` | string | Route identifier |

---

## `PUT` /api/v1/products/:id

> **Auth required** — Bearer token in `Authorization` header

### Path Parameters

| Param | Type | Description |
|-------|------|-------------|
| `id` | string | Route identifier |

### Request Body

```json
{
  "product": {
    "title": "Sample Title",
    "handle": null,
    "body_html": "Some notes here",
    "vendor": null,
    "product_type": null,
    "tags": null,
    "status": "active",
    "visibility": null,
    "options": [],
    "variants": []
  }
}
```

| Field | Type | Required |
|-------|------|----------|
| `product` | object | optional |
| `  title` | *string | optional |
| `  handle` | *string | optional |
| `  body_html` | *string | optional |
| `  vendor` | *string | optional |
| `  product_type` | *string | optional |
| `  tags` | *string | optional |
| `  status` | *string | optional |
| `  visibility` | *string | optional |
| `  options` | []patchOptionInput | **required** |
| `  variants` | []patchVariantInput | **required** |

### Response

```json
{
  "id": ...
}
```

---

## `PATCH` /api/v1/products/:id

> **Auth required** — Bearer token in `Authorization` header

### Path Parameters

| Param | Type | Description |
|-------|------|-------------|
| `id` | string | Route identifier |

### Request Body

```json
{
  "product": {
    "title": "Sample Title",
    "handle": null,
    "body_html": "Some notes here",
    "vendor": null,
    "product_type": null,
    "tags": null,
    "status": "active",
    "visibility": null,
    "options": [],
    "variants": []
  }
}
```

| Field | Type | Required |
|-------|------|----------|
| `product` | object | optional |
| `  title` | *string | optional |
| `  handle` | *string | optional |
| `  body_html` | *string | optional |
| `  vendor` | *string | optional |
| `  product_type` | *string | optional |
| `  tags` | *string | optional |
| `  status` | *string | optional |
| `  visibility` | *string | optional |
| `  options` | []patchOptionInput | **required** |
| `  variants` | []patchVariantInput | **required** |

### Response

```json
{
  "id": ...
}
```

---

## `DELETE` /api/v1/products/:id

> **Auth required** — Bearer token in `Authorization` header

### Path Parameters

| Param | Type | Description |
|-------|------|-------------|
| `id` | string | Route identifier |

---

## `GET` /api/v1/products/:id/images

> **Auth required** — Bearer token in `Authorization` header

### Path Parameters

| Param | Type | Description |
|-------|------|-------------|
| `id` | string | Route identifier |

---

## `POST` /api/v1/products/:id/images

> **Auth required** — Bearer token in `Authorization` header

### Path Parameters

| Param | Type | Description |
|-------|------|-------------|
| `id` | string | Route identifier |

### Request Body

```json
{
  "image": {
    "src": "https://example.com/image.jpg",
    "alt": null,
    "position": 0
  },
  "url": "https://example.com/image.jpg",
  "altText": null,
  "position": 0
}
```

| Field | Type | Required |
|-------|------|----------|
| `image` | object | optional |
| `  src` | string | **required** |
| `  alt` | *string | optional |
| `  position` | int | **required** |
| `url` | string | **required** |
| `altText` | *string | optional |
| `position` | int | **required** |

---

## `PUT` /api/v1/products/:id/images/:imageId

> **Auth required** — Bearer token in `Authorization` header

### Path Parameters

| Param | Type | Description |
|-------|------|-------------|
| `id` | string | Route identifier |
| `imageId` | string | Route identifier |

### Request Body

```json
{
  "image": {
    "alt": null,
    "position": null
  },
  "altText": null,
  "position": null
}
```

| Field | Type | Required |
|-------|------|----------|
| `image` | object | optional |
| `  alt` | *string | optional |
| `  position` | *int | optional |
| `altText` | *string | optional |
| `position` | *int | optional |

### Response

```json
{
  "id": ...
}
```

---

## `DELETE` /api/v1/products/:id/images/:imageId

> **Auth required** — Bearer token in `Authorization` header

### Path Parameters

| Param | Type | Description |
|-------|------|-------------|
| `id` | string | Route identifier |
| `imageId` | string | Route identifier |

---

## `GET` /api/v1/products/:id/variants

> **Auth required** — Bearer token in `Authorization` header

### Path Parameters

| Param | Type | Description |
|-------|------|-------------|
| `id` | string | Route identifier |

---

## `POST` /api/v1/products/:id/variants

> **Auth required** — Bearer token in `Authorization` header

### Path Parameters

| Param | Type | Description |
|-------|------|-------------|
| `id` | string | Route identifier |

### Request Body

```json
{
  "sku": null,
  "title": "Sample Title",
  "option1": null,
  "option2": null,
  "option3": null,
  "price": "29.99",
  "compare_at_price": "29.99",
  "inventory_quantity": 0,
  "inventory_policy": "",
  "inventory_management": "",
  "weight": null,
  "weight_unit": "",
  "requires_shipping": false,
  "taxable": false,
  "barcode": null
}
```

| Field | Type | Required |
|-------|------|----------|
| `sku` | *string | optional |
| `title` | string | **required** |
| `option1` | *string | optional |
| `option2` | *string | optional |
| `option3` | *string | optional |
| `price` | string | **required** |
| `compare_at_price` | *string | optional |
| `inventory_quantity` | int | **required** |
| `inventory_policy` | string | **required** |
| `inventory_management` | string | **required** |
| `weight` | *string | optional |
| `weight_unit` | string | **required** |
| `requires_shipping` | bool | **required** |
| `taxable` | bool | **required** |
| `barcode` | *string | optional |

---

## `PUT` /api/v1/products/:id/variants/:variantId

> **Auth required** — Bearer token in `Authorization` header

### Path Parameters

| Param | Type | Description |
|-------|------|-------------|
| `id` | string | Route identifier |
| `variantId` | string | Route identifier |

### Request Body

```json
{
  "sku": null,
  "title": "Sample Title",
  "option1": null,
  "option2": null,
  "option3": null,
  "price": "29.99",
  "compare_at_price": "29.99",
  "cost": "29.99",
  "inventory_quantity": null,
  "inventory_policy": null,
  "inventory_management": null,
  "weight": null,
  "weight_unit": null,
  "requires_shipping": null,
  "taxable": null,
  "barcode": null,
  "image_id": "uuid-here"
}
```

| Field | Type | Required |
|-------|------|----------|
| `sku` | *string | optional |
| `title` | *string | optional |
| `option1` | *string | optional |
| `option2` | *string | optional |
| `option3` | *string | optional |
| `price` | *string | optional |
| `compare_at_price` | *string | optional |
| `cost` | *string | optional |
| `inventory_quantity` | *int | optional |
| `inventory_policy` | *string | optional |
| `inventory_management` | *string | optional |
| `weight` | *string | optional |
| `weight_unit` | *string | optional |
| `requires_shipping` | *bool | optional |
| `taxable` | *bool | optional |
| `barcode` | *string | optional |
| `image_id` | *string | optional |

### Response

```json
{
  "id": ...
}
```

---

## `GET` /api/v1/products/:id/shopify

> **Auth required** — Bearer token in `Authorization` header

### Path Parameters

| Param | Type | Description |
|-------|------|-------------|
| `id` | string | Route identifier |

---

## `POST` /api/v1/products/:id/shopify

> **Auth required** — Bearer token in `Authorization` header

### Path Parameters

| Param | Type | Description |
|-------|------|-------------|
| `id` | string | Route identifier |

---

## `DELETE` /api/v1/products/:id/shopify

> **Auth required** — Bearer token in `Authorization` header

### Path Parameters

| Param | Type | Description |
|-------|------|-------------|
| `id` | string | Route identifier |

---

## `GET` /api/v1/products/:id/woocommerce

> **Auth required** — Bearer token in `Authorization` header

### Path Parameters

| Param | Type | Description |
|-------|------|-------------|
| `id` | string | Route identifier |

---

## `POST` /api/v1/products/:id/woocommerce

> **Auth required** — Bearer token in `Authorization` header

### Path Parameters

| Param | Type | Description |
|-------|------|-------------|
| `id` | string | Route identifier |

---

## `DELETE` /api/v1/products/:id/woocommerce

> **Auth required** — Bearer token in `Authorization` header

### Path Parameters

| Param | Type | Description |
|-------|------|-------------|
| `id` | string | Route identifier |

---

