# Herbmate API

## Cloud Architecture
* Herbmate Cloud Architecture
![Herbmatecloudarchitecture](https://storage.googleapis.com/herbmate-models/Data-Image/google%20architecture.jpg)

## API

#### API for User Management

##### - Authentication and User Features -

**1. Register User**

* method: `POST`
* endpoint: `/users/register`
* body request:
  | Parameter | Type     |
  | :-------- | :------- |
  | `name`    | `string` |
  | `email`   | `string` `email` `unique` |
  | `password`| `string` |

  Example:
  ```json
  {
    "name": "John Doe",
    "email": "johndoe@gmail.com",
    "password": "password123"
  }
  ```

* body response:
  ```json
  {
  "error": false,
  "message": "User registered successfully",
  "data": {
    "id": 1,
    "name": "John Doe",
    "email": "johndoe@gmail.com"
    }
  }

  ```

---

**2. Login**

* method: `POST`
* endpoint: `/users/login`
* body request:
  | Parameter | Type     |
  | :-------- | :------- |
  | `email`   | `string` `email` |
  | `password`| `string` |

  Example:
  ```json
  {
    "email": "johndoe@gmail.com",
    "password": "password123"
  }
  ```

* body response:
  ```json
  {
  "error": false,
  "message": "Login successful",
  "data": {
    "id": 1,
    "name": "John Doe",
    "email": "johndoe@gmail.com"
  },
  "token": "eyJhbGci...jwt_token_here"
    }

  ```

---

**3. Forgot Password (Generate Reset Link)**

* method: `POST`
* endpoint: `/users/forgotPass`
* body request:
  | Parameter       | Type              |
  | :-------------- | :---------------- |
  | `email`         | `string`,`email`  |

  Example:
  ```json
  {
  "email": "johndoe@gmail.com"
    }
  ```

* body response:
  ```json
  {
  "error": false,
  "message": "Password reset link has been sent to your email."
    }
  ```

---
**4. Reset Password**

* method: `POST`
* endpoint: `/users/reset-password/:idUser/:token/:email`
* body request:
  | Parameter       | Type                      |
  | :-------------- | :------------------------ |
  | `newPassword`   | `string`,`minLength: 8`   |

  Example:
  ```json
  {
    "newPassword": "newpass123"
  }
  ```

* body response:
  ```json
  {
  "error": false,
  "message": "Password updated successfully"
    }
  ```

---

**4. Get All Users**

* method: `GET`
* endpoint: `/users/getAllUsers`
* headers: `Authorization: Bearer <token>`

* body response (example):
  ```json
  [
    {
      "id": 1,
      "name": "John Doe",
      "email": "johndoe@gmail.com"
    },
    {
      "id": 2,
      "name": "Jane Smith",
      "email": "janesmith@gmail.com"
    }
  ]
  ```
**4. Update Users**

* method: `PUT`
* endpoint: `/users/update/:email`
* body request:
  | Parameter       | Type                  |
  | :-------------- | :-------------------- |
  | `name`          | `string`(optional)    |
  | `password`      | `string`(optional)    |
  | `verify`        | `string`(optional)    |

* Example :
  ```json
  {
  "name": "Johnathan Doe",
  "password": "newpassword123",
  "verify": "oldpassword123"
    }

* body response (example):
  ```json
  {
  "error": false,
  "message": "User updated successfully",
  "data": {
    "id": 1,
    "name": "Johnathan Doe",
    "email": "johndoe@gmail.com"
  },
  "token": "new_jwt_token_here"
    }


  ```

---

#### API for Bookmark Management

**1. Add Bookmark**

* method: `POST`
* endpoint: `/users/addBookmark/:idUser/:id`
* body request:
  | Parameter       | Type         |
  | :-------------- | :----------- |
  | `idUser`        | `integer`    |
  | `id`            | `integer`    |

* Example :
  ```json
  {
  "idUser": 1,
  "id": 5
    }
  ```
* body response:
  ```json
  {
  "error": false,
  "message": "Bookmark added successfully"
    }
  ```

---

**2. Get Bookmarks**

* method: `GET`
* endpoint: `/users/getBookmark/:idUser`

* body response (example):
  ```json
  [
  {
    "id": 5,
    "name": "Bookmark 1"
  },
  {
    "id": 10,
    "name": "Bookmark 2"
  }
    ]
  ```

---
---

**3. Delete Bookmarks**

* method: `DELETE`
* endpoint: `/users/delBookmark/:idBookmark`

* body response (example):
  ```json
  {
  "error": false,
  "message": "Bookmark deleted successfully"
    }
  ```

---

#### API for Plant Information

**1. Get All Plants**

* method: `GET`
* endpoint: `/tanaman/getAllTanaman/:idUser`
* headers: `Authorization: Bearer <token>`

* body response (example):
  ```json
    {
    "error": false,
    "message": "GET All Tanaman Successfully",
    "data": [
        {
        "id": 1,
        "name": "Aloe Vera",
        "description": "A medicinal plant...",
        "uses": "Skin care, healing burns.",
        "status": true
        },
        {
        "id": 2,
        "name": "Basil",
        "description": "A culinary herb...",
        "uses": "Cooking, aromatherapy.",
        "status": false
        }
    ]
    }

  ```

---

**2. Search Plants**

* method: `GET`
* endpoint: `/tanaman/search/:tanaman`
* headers: `Authorization: Bearer <token>`

* body response (example):
  ```json
    {
    "error": false,
    "message": "Search Tanaman Successfully",
    "data": [
        {
        "id": 1,
        "name": "Aloe Vera",
        "description": "A medicinal plant...",
        "uses": "Skin care, healing burns."
        }
    ]
    }

  ```

---
---

**3. Get Plants Details**

* method: `GET`
* endpoint: `/tanaman/getDetails/:nama_tanaman`
* headers: `Authorization: Bearer <token>`

* body response (example):
  ```json
        {
    "error": false,
    "message": "GET Tanaman Details Successfully",
    "data": [
        {
        "id": 1,
        "name": "Aloe Vera",
        "description": "A medicinal plant used for skin care and healing burns.",
        "uses": "Skin care, healing burns."
        }
    ]
    }


  ```
---
---

**4. Get Recipe for a Disease**

* method: `GET`
* endpoint: `/tanaman/getResep/:penyakit`
* headers: `Authorization: Bearer <token>`

* body response (example):
  ```json
    {
  "error": false,
  "message": "GET Resep Successfully",
  "data": [
            {
            "id": 1,
            "name": "Aloe Vera",
            "description": "Used for treating burns and skin conditions.",
            "uses": "Skin care, healing burns."
            }
        ]
    }



  ```

---
---

**5. Get Recipe for a Disease**

* method: `GET`
* endpoint: `/tanaman/getRekomendasi/:penyakit/:tanaman`
* headers: `Authorization: Bearer <token>`

* body response (example):
  ```json
        {
    "error": false,
    "message": "Search Tanaman Successfully",
    "data": [
        {
        "id": 1,
        "name": "Aloe Vera",
        "description": "A medicinal plant useful for skin care and healing burns.",
        "uses": "Skin care, healing burns."
        }
    ]
    }



  ```

---

#### API for Chatbot

**Handle Chatbot Requests**

* method: `POST`
* endpoint: `/chatbot`
* headers: `Authorization: Bearer <token>`
* body request:
  | Parameter   | Type     |
  | :---------- | :------- |
  | `message`   | `string` |

  Example:
  ```json
  {
    "message": "What is the best plant for dry skin?"
  }
  ```

* body response:
  ```json
    {
    "error": false,
    "status": "ok",
    "statusCode": 200,
    "response": "Aloe Vera is highly recommended for dry skin."
    }

  ```
* body response (error - invalid message):
  ```json
        {
    "error": true,
    "status": "bad request",
    "statusCode": 400,
    "message": "Prompt must be related to herbal plants or medicine."
    }
  ```

* body response (error - missing message):
  ```json
    {
  "error": true,
  "status": "bad request",
  "statusCode": 400,
  "message": "Prompt is required"
    }

  ```

* body response (error - server issue):
  ```json
    {
  "error": true,
  "status": "internal server error",
  "statusCode": 500,
  "message": "Error details from server"
    }


  ```

---

#### API for Model Prediction

**Predict Using Uploaded File**

* method: `POST`
* endpoint: `/predict`
* headers: `Authorization: Bearer <token>`
* body request: `form-data`
  | Key   | Value           |
  | :---- | :-------------- |
  | `file`| `Select Files`  |

  Example:
  Upload an image file (e.g., `plant.jpg`).

* body response:
  ```json
  {
    "error": false,
    "status": "ok",
    "statusCode": 200,
    "data": {
        "id": 1,
        "name": "Aloe Vera",
        "description": "A medicinal plant...",
        "uses": "Skin care, healing burns."
     }
    }

  ```

* body response (error - no file uploaded):
  ```json
    {
    "error": true,
    "status": "bad request",
    "statusCode": 400,
    "message": "No file uploaded"
    }
  ```

* body response (error - invalid prediction result):
  ```json
    {
    "error": true,
    "status": "bad request",
    "statusCode": 400,
    "message": "Invalid prediction result"
    }
  ```

* body response (error - data not found):
  ```json
    {
    "error": true,
    "status": "not found",
    "statusCode": 404,
    "message": "Data not found"
    }
  ```
* body response (error - server issue):
  ```json
    {
    "error": true,
    "status": "internal server error",
    "statusCode": 500,
    "message": "Error details from server"
    }
  ```

