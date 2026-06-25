---
date: 2026-06-25
tags: [api, backend]
domain: Orders
---

# Orders API

**Last synced:** 2026-06-25 19:35

---

## Endpoints

| Method | Path | Handler |
|--------|------|----------|
| `GET` | `/api/v1/orders` | `List` |
| `POST` | `/api/v1/orders` | `Create` |
| `GET` | `/api/v1/orders/:id` | `Get` |
| `PUT` | `/api/v1/orders/:id/status` | `UpdateStatus` |
| `PUT` | `/api/v1/orders/:id/ship` | `Ship` |
| `PUT` | `/api/v1/orders/:id/deliver` | `Deliver` |
| `POST` | `/api/v1/orders/:id/cancel` | `Cancel` |
