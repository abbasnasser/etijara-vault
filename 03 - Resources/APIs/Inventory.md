---
date: 2026-06-25
tags: [api, backend]
domain: Inventory
---

# Inventory API

**Last synced:** 2026-06-25 19:35

---

## Endpoints

| Method | Path | Handler |
|--------|------|----------|
| `GET` | `/api/v1/inventory` | `List` |
| `GET` | `/api/v1/inventory/:variantId` | `Get` |
| `PUT` | `/api/v1/inventory/:variantId` | `Adjust` |
| `GET` | `/api/v1/inventory/:variantId/history` | `History` |
| `GET` | `/api/v1/stock` | `StockCheck` |
