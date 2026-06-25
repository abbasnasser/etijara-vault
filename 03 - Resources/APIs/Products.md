---
date: 2026-06-25
tags: [api, backend]
domain: Products
---

# Products API

**Last synced:** 2026-06-25 19:35

---

## Endpoints

| Method | Path | Handler |
|--------|------|----------|
| `GET` | `/api/v1/products` | `List` |
| `POST` | `/api/v1/products` | `Create` |
| `GET` | `/api/v1/products/:id` | `Get` |
| `PUT` | `/api/v1/products/:id` | `Update` |
| `PATCH` | `/api/v1/products/:id` | `Update` |
| `DELETE` | `/api/v1/products/:id` | `Delete` |
| `GET` | `/api/v1/products/:id/images` | `ListImages` |
| `POST` | `/api/v1/products/:id/images` | `CreateImage` |
| `PUT` | `/api/v1/products/:id/images/:imageId` | `UpdateImage` |
| `DELETE` | `/api/v1/products/:id/images/:imageId` | `DeleteImage` |
| `GET` | `/api/v1/products/:id/variants` | `ListVariants` |
| `POST` | `/api/v1/products/:id/variants` | `CreateVariant` |
| `PUT` | `/api/v1/products/:id/variants/:variantId` | `UpdateVariant` |
| `GET` | `/api/v1/products/:id/shopify` | `GetShopifyMapping` |
| `POST` | `/api/v1/products/:id/shopify` | `SyncToShopify` |
| `DELETE` | `/api/v1/products/:id/shopify` | `RemoveFromShopify` |
| `GET` | `/api/v1/products/:id/woocommerce` | `GetWooMapping` |
| `POST` | `/api/v1/products/:id/woocommerce` | `SyncToWooCommerce` |
| `DELETE` | `/api/v1/products/:id/woocommerce` | `RemoveFromWooCommerce` |
