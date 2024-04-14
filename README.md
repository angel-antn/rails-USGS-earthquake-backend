# ⛰️Rails Earthquake App Backend💎

#### _Nota_

🔒 -> Requiere Bearer Token

🔓 -> No requiere Bearer Token

## Features

### Get features 🔓

```http
  GET /api/features
```

#### Queries

| Queries    | Type     | Descripción                                                   |
| :--------- | :------- | :------------------------------------------------------------ |
| `mag_type` | `string` | Permite filtar por mag_type (md, ml, ms, mw, me, mi, mb, mlg) |
| `page`     | `number` | Permite seleccionar la página                                 |
| `per_page` | `number` | Permite seleccionar qty de resultados por página              |

### Get one feature 🔓

```http
  GET /api/features/:id
```

#### Parameters

| Parameters | Type     | Descripción                                           |
| :--------- | :------- | :---------------------------------------------------- |
| `id`       | `string` | **Requerido**. El id del feature que se desea obtener |

## Comment

### Get comments 🔓

```http
  GET /api/features/:feature_id/comments
```

#### Parameters

| Parameter    | Type     | Descripción                                                       |
| :----------- | :------- | :---------------------------------------------------------------- |
| `feature_id` | `string` | **Requerido**. El id del feature del que se desea ver comentarios |

### Create comments 🔒

```http
  POST /api/features/:feature_id/comments
```

#### Parameters

| Parameter | Type     | Descripción                                                |
| :-------- | :------- | :--------------------------------------------------------- |
| `id`      | `string` | **Requerido**. El id del feature del que se desea comentar |

#### Payload

| Payload | Type     | Descripción                                |
| :------ | :------- | :----------------------------------------- |
| `body`  | `string` | **Requerido**. El contenido del comentario |

### Delete comments 🔒

```http
  DELETE /api/features/:feature_id/comments/:id
```

#### Parameters

| Parameter    | Type     | Descripción                                                          |
| :----------- | :------- | :------------------------------------------------------------------- |
| `feature_id` | `string` | **Requerido**. El id del feature del que se desea borrar comentarios |
| `id`         | `string` | **Requerido**. El id del comentario que se desea borrar              |

## Users

### Login 🔓

```http
  POST /api/users/login
```

#### Payload

| Payload    | Type     | Descripción                           |
| :--------- | :------- | :------------------------------------ |
| `email`    | `string` | **Requerido**. Email del usuario      |
| `password` | `string` | **Requerido**. Contraseña del usuario |

### Register 🔓

```http
  POST /api/users/register
```

#### Payload

| Payload    | Type     | Descripción                                  |
| :--------- | :------- | :------------------------------------------- |
| `email`    | `string` | **Requerido**. Email del nuevo usuario       |
| `password` | `string` | **Requerido**. Contraseña del nuevo usuario  |
| `name`     | `string` | **Requerido**. El nombre del nuevo usuario   |
| `lastname` | `string` | **Requerido**. El apellido del nuevo usuario |

### Me 🔒

```http
  GET /api/users/me
```
