---
date: 2026-06-25
tags: [api, backend, overview]
---

# EcomEngine API Overview

**Last synced:** 2026-06-25 20:07  
**Total endpoints:** 105  
**Bruno collection:** `Bruno/EcomEngine Api/`

---

## [[Auth]] (5 endpoints)

| Method | Path | Auth |
|--------|------|------|
| `POST` | `/api/v1/auth/signup` | ✓ |
| `POST` | `/api/v1/auth/login` | ✓ |
| `POST` | `/api/v1/auth/verify-otp` | ✓ |
| `POST` | `/api/v1/auth/forgot-password` | ✓ |
| `POST` | `/api/v1/auth/reset-password` | ✓ |

## [[Customers]] (9 endpoints)

| Method | Path | Auth |
|--------|------|------|
| `GET` | `/api/v1/customers` | ✓ |
| `POST` | `/api/v1/customers` | ✓ |
| `GET` | `/api/v1/customers/:id` | ✓ |
| `PUT` | `/api/v1/customers/:id` | ✓ |
| `DELETE` | `/api/v1/customers/:id` | ✓ |
| `GET` | `/api/v1/customers/:id/notes` | ✓ |
| `POST` | `/api/v1/customers/:id/notes` | ✓ |
| `POST` | `/api/v1/customers/:id/tags` | ✓ |
| `DELETE` | `/api/v1/customers/:id/tags` | ✓ |

## [[Delivery]] (4 endpoints)

| Method | Path | Auth |
|--------|------|------|
| `GET` | `/api/v1/delivery/:provider/locations` | ✓ |
| `GET` | `/api/v1/integrations/:provider` | ✓ |
| `POST` | `/api/v1/integrations/:provider/connect` | ✓ |
| `DELETE` | `/api/v1/integrations/:provider/disconnect` | ✓ |

## [[Email]] (3 endpoints)

| Method | Path | Auth |
|--------|------|------|
| `GET` | `/api/email/auth` | ✓ |
| `GET` | `/api/email/auth/callback` | ✓ |
| `GET` | `/api/email/setup` | ✓ |

## [[Health]] (1 endpoints)

| Method | Path | Auth |
|--------|------|------|
| `GET` | `/health` | — |

## [[Integrations]] (3 endpoints)

| Method | Path | Auth |
|--------|------|------|
| `GET` | `/api/v1/integrations` | ✓ |
| `GET` | `/api/v1/integrations/stock` | ✓ |
| `POST` | `/api/v1/integrations/stock` | ✓ |

## [[Inventory]] (5 endpoints)

| Method | Path | Auth |
|--------|------|------|
| `GET` | `/api/v1/inventory` | ✓ |
| `GET` | `/api/v1/inventory/:variantId` | ✓ |
| `PUT` | `/api/v1/inventory/:variantId` | ✓ |
| `GET` | `/api/v1/inventory/:variantId/history` | ✓ |
| `GET` | `/api/v1/stock` | ✓ |

## [[Orders]] (7 endpoints)

| Method | Path | Auth |
|--------|------|------|
| `GET` | `/api/v1/orders` | ✓ |
| `POST` | `/api/v1/orders` | ✓ |
| `GET` | `/api/v1/orders/:id` | ✓ |
| `PUT` | `/api/v1/orders/:id/status` | ✓ |
| `PUT` | `/api/v1/orders/:id/ship` | ✓ |
| `PUT` | `/api/v1/orders/:id/deliver` | ✓ |
| `POST` | `/api/v1/orders/:id/cancel` | ✓ |

## [[Products]] (19 endpoints)

| Method | Path | Auth |
|--------|------|------|
| `GET` | `/api/v1/products` | ✓ |
| `POST` | `/api/v1/products` | ✓ |
| `GET` | `/api/v1/products/:id` | ✓ |
| `PUT` | `/api/v1/products/:id` | ✓ |
| `PATCH` | `/api/v1/products/:id` | ✓ |
| `DELETE` | `/api/v1/products/:id` | ✓ |
| `GET` | `/api/v1/products/:id/images` | ✓ |
| `POST` | `/api/v1/products/:id/images` | ✓ |
| `PUT` | `/api/v1/products/:id/images/:imageId` | ✓ |
| `DELETE` | `/api/v1/products/:id/images/:imageId` | ✓ |
| `GET` | `/api/v1/products/:id/variants` | ✓ |
| `POST` | `/api/v1/products/:id/variants` | ✓ |
| `PUT` | `/api/v1/products/:id/variants/:variantId` | ✓ |
| `GET` | `/api/v1/products/:id/shopify` | ✓ |
| `POST` | `/api/v1/products/:id/shopify` | ✓ |
| `DELETE` | `/api/v1/products/:id/shopify` | ✓ |
| `GET` | `/api/v1/products/:id/woocommerce` | ✓ |
| `POST` | `/api/v1/products/:id/woocommerce` | ✓ |
| `DELETE` | `/api/v1/products/:id/woocommerce` | ✓ |

## [[Shopify]] (16 endpoints)

| Method | Path | Auth |
|--------|------|------|
| `GET` | `/api/auth/shopify/callback` | — |
| `GET` | `/api/v1/integrations/shopify` | ✓ |
| `POST` | `/api/v1/integrations/shopify/oauth` | ✓ |
| `POST` | `/api/v1/integrations/shopify/disconnect` | ✓ |
| `DELETE` | `/api/v1/integrations/shopify/disconnect` | ✓ |
| `POST` | `/api/v1/integrations/shopify/test` | ✓ |
| `POST` | `/api/v1/integrations/shopify/reregister` | ✓ |
| `POST` | `/api/webhooks/shopify` | — |
| `POST` | `/api/webhooks/shopify/orders` | — |
| `POST` | `/api/webhooks/shopify/checkouts` | — |
| `POST` | `/api/webhooks/shopify/products` | — |
| `POST` | `/api/webhooks/shopify/inventory` | — |
| `POST` | `/api/webhooks/shopify/capture` | — |
| `POST` | `/api/webhooks/shopify/compliance/customers/data-request` | — |
| `POST` | `/api/webhooks/shopify/compliance/customers/redact` | — |
| `POST` | `/api/webhooks/shopify/compliance/shop/redact` | — |

## [[Shopify Proxy]] (4 endpoints)

| Method | Path | Auth |
|--------|------|------|
| `GET` | `/api/shopify-proxy/products` | ✓ |
| `GET` | `/api/shopify-proxy/stock` | ✓ |
| `POST` | `/api/shopify-proxy/orders` | ✓ |
| `OPTIONS` | `/api/shopify-proxy/orders` | ✓ |

## [[Upload]] (1 endpoints)

| Method | Path | Auth |
|--------|------|------|
| `GET` | `/api/v1/upload/presign` | ✓ |

## [[Warehouses]] (15 endpoints)

| Method | Path | Auth |
|--------|------|------|
| `GET` | `/api/v1/warehouses` | ✓ |
| `POST` | `/api/v1/warehouses` | ✓ |
| `GET` | `/api/v1/warehouses/:id` | ✓ |
| `PUT` | `/api/v1/warehouses/:id` | ✓ |
| `DELETE` | `/api/v1/warehouses/:id` | ✓ |
| `POST` | `/api/v1/warehouses/:id/default` | ✓ |
| `PATCH` | `/api/v1/warehouses/:id/toggle` | ✓ |
| `GET` | `/api/v1/warehouses/:id/inventory` | ✓ |
| `GET` | `/api/v1/warehouses/inventory` | ✓ |
| `POST` | `/api/v1/warehouses/inventory/assign` | ✓ |
| `PUT` | `/api/v1/warehouses/inventory/quantity` | ✓ |
| `POST` | `/api/v1/warehouses/inventory/transfer` | ✓ |
| `GET` | `/api/v1/warehouses/inventory/movements` | ✓ |
| `GET` | `/api/v1/warehouses/inventory/alerts` | ✓ |
| `POST` | `/api/v1/warehouses/inventory/alerts/:alertId/resolve` | ✓ |

## [[WooCommerce]] (9 endpoints)

| Method | Path | Auth |
|--------|------|------|
| `POST` | `/api/wc/callback` | ✓ |
| `GET` | `/api/wc/return` | ✓ |
| `GET` | `/api/v1/integrations/woocommerce` | ✓ |
| `POST` | `/api/v1/integrations/woocommerce/oauth` | ✓ |
| `POST` | `/api/v1/integrations/woocommerce/disconnect` | ✓ |
| `DELETE` | `/api/v1/integrations/woocommerce/disconnect` | ✓ |
| `POST` | `/api/v1/integrations/woocommerce/test` | ✓ |
| `POST` | `/api/webhooks/woocommerce/orders` | — |
| `POST` | `/api/webhooks/woocommerce/products` | — |

## [[Workspaces]] (4 endpoints)

| Method | Path | Auth |
|--------|------|------|
| `POST` | `/api/v1/workspaces` | ✓ |
| `GET` | `/api/v1/workspaces` | ✓ |
| `POST` | `/api/v1/workspaces/:id/switch` | ✓ |
| `GET` | `/api/v1/subscription` | ✓ |

