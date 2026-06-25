---
date: 2026-06-25
tags: [api, backend]
domain: Auth
---

# Auth API

**Last synced:** 2026-06-25 20:07  
**Base URL:** `http://localhost:5000`

---

## `POST` /api/v1/auth/signup

> **Auth required** — Bearer token in `Authorization` header

### Request Body

```json
{
  "email": "user@example.com",
  "password": "yourpassword123",
  "firstName": "John",
  "lastName": "Doe"
}
```

| Field | Type | Required |
|-------|------|----------|
| `email` | string | **required** |
| `password` | string | **required** |
| `firstName` | string | **required** |
| `lastName` | string | **required** |

---

## `POST` /api/v1/auth/login

> **Auth required** — Bearer token in `Authorization` header

### Request Body

```json
{
  "email": "user@example.com",
  "password": "yourpassword123"
}
```

| Field | Type | Required |
|-------|------|----------|
| `email` | string | **required** |
| `password` | string | **required** |

---

## `POST` /api/v1/auth/verify-otp

> **Auth required** — Bearer token in `Authorization` header

### Request Body

```json
{
  "email": "user@example.com",
  "otp": "123456"
}
```

| Field | Type | Required |
|-------|------|----------|
| `email` | string | **required** |
| `otp` | string | **required** |

---

## `POST` /api/v1/auth/forgot-password

> **Auth required** — Bearer token in `Authorization` header

### Request Body

```json
{
  "email": "user@example.com"
}
```

| Field | Type | Required |
|-------|------|----------|
| `email` | string | **required** |

### Response

```json
{
  "message": ...
}
```

---

## `POST` /api/v1/auth/reset-password

> **Auth required** — Bearer token in `Authorization` header

### Request Body

```json
{
  "email": "user@example.com",
  "otp": "123456",
  "newPassword": "yourpassword123"
}
```

| Field | Type | Required |
|-------|------|----------|
| `email` | string | **required** |
| `otp` | string | **required** |
| `newPassword` | string | **required** |

---

