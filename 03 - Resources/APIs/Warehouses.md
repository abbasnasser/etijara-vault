---
date: 2026-06-25
tags: [api, backend]
domain: Warehouses
---

# Warehouses API

**Last synced:** 2026-06-25 19:35

---

## Endpoints

| Method | Path | Handler |
|--------|------|----------|
| `GET` | `/api/v1/warehouses` | `List` |
| `POST` | `/api/v1/warehouses` | `Create` |
| `GET` | `/api/v1/warehouses/:id` | `Get` |
| `PUT` | `/api/v1/warehouses/:id` | `Update` |
| `DELETE` | `/api/v1/warehouses/:id` | `Delete` |
| `POST` | `/api/v1/warehouses/:id/default` | `SetDefault` |
| `PATCH` | `/api/v1/warehouses/:id/toggle` | `Toggle` |
| `GET` | `/api/v1/warehouses/:id/inventory` | `GetByWarehouse` |
| `GET` | `/api/v1/warehouses/inventory` | `ListInventory` |
| `POST` | `/api/v1/warehouses/inventory/assign` | `Assign` |
| `PUT` | `/api/v1/warehouses/inventory/quantity` | `UpdateQuantity` |
| `POST` | `/api/v1/warehouses/inventory/transfer` | `Transfer` |
| `GET` | `/api/v1/warehouses/inventory/movements` | `ListMovements` |
| `GET` | `/api/v1/warehouses/inventory/alerts` | `ListAlerts` |
| `POST` | `/api/v1/warehouses/inventory/alerts/:alertId/resolve` | `ResolveAlert` |
