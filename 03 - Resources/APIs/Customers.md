---
date: 2026-06-25
tags: [api, backend]
domain: Customers
---

# Customers API

**Last synced:** 2026-06-25 19:35

---

## Endpoints

| Method | Path | Handler |
|--------|------|----------|
| `GET` | `/api/v1/customers` | `List` |
| `POST` | `/api/v1/customers` | `Create` |
| `GET` | `/api/v1/customers/:id` | `Get` |
| `PUT` | `/api/v1/customers/:id` | `Update` |
| `DELETE` | `/api/v1/customers/:id` | `Delete` |
| `GET` | `/api/v1/customers/:id/notes` | `GetNotes` |
| `POST` | `/api/v1/customers/:id/notes` | `AddNote` |
| `POST` | `/api/v1/customers/:id/tags` | `AddTag` |
| `DELETE` | `/api/v1/customers/:id/tags` | `RemoveTag` |
