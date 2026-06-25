---
date: 2026-06-25
tags: [api, backend]
domain: Shopify
---

# Shopify API

**Last synced:** 2026-06-25 19:35

---

## Endpoints

| Method | Path | Handler |
|--------|------|----------|
| `GET` | `/api/auth/shopify/callback` | `Callback` |
| `GET` | `/api/v1/integrations/shopify` | `Get` |
| `POST` | `/api/v1/integrations/shopify/oauth` | `OAuth` |
| `POST` | `/api/v1/integrations/shopify/disconnect` | `Disconnect` |
| `DELETE` | `/api/v1/integrations/shopify/disconnect` | `Disconnect` |
| `POST` | `/api/v1/integrations/shopify/test` | `Test` |
| `POST` | `/api/v1/integrations/shopify/reregister` | `Reregister` |
| `POST` | `/api/webhooks/shopify` | `ShopifyUnified` |
| `POST` | `/api/webhooks/shopify/orders` | `ShopifyOrders` |
| `POST` | `/api/webhooks/shopify/checkouts` | `ShopifyCheckouts` |
| `POST` | `/api/webhooks/shopify/products` | `ShopifyProducts` |
| `POST` | `/api/webhooks/shopify/inventory` | `ShopifyInventory` |
| `POST` | `/api/webhooks/shopify/capture` | `ShopifyCapture` |
| `POST` | `/api/webhooks/shopify/compliance/customers/data-request` | `ShopifyCustomersDataRequest` |
| `POST` | `/api/webhooks/shopify/compliance/customers/redact` | `ShopifyCustomersRedact` |
| `POST` | `/api/webhooks/shopify/compliance/shop/redact` | `ShopifyShopRedact` |
