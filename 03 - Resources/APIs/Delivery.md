---
date: 2026-06-25
tags: [api, backend]
domain: Delivery
---

# Delivery API

**Last synced:** 2026-06-25 19:35

---

## Endpoints

| Method | Path | Handler |
|--------|------|----------|
| `GET` | `/api/v1/delivery/:provider/locations` | `GetLocations` |
| `GET` | `/api/v1/integrations/:provider` | `GetStatus` |
| `POST` | `/api/v1/integrations/:provider/connect` | `Connect` |
| `DELETE` | `/api/v1/integrations/:provider/disconnect` | `Disconnect` |
