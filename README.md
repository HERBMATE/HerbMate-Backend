

```markdown
# Struktur Proyek

project-root/
```
├── flask-backend/
│   ├── model.h5                     # File model Machine Learning
│   ├── model_api.py                 # API Flask untuk menjalankan model
│   └── requirements.txt             # Daftar dependensi Python
├── express-gateway/
│   ├── index.js                     # API Gateway menggunakan Express.js
│   ├── package.json                 # File konfigurasi Node.js
│   ├── package-lock.json            # File lock untuk npm
│   └── node_modules/                # Folder dependensi Node.js
└── README.md                        # Dokumentasi proyek
```

## Penjelasan Struktur

1. **flask-backend/**
   - **model.h5**: File model Machine Learning yang disimpan setelah proses pelatihan.
   - **model_api.py**: Skrip Python untuk menjalankan API Flask, menangani request, dan memproses model.
   - **requirements.txt**: Daftar dependensi Python untuk backend Flask. Contohnya:
     ```plaintext
     flask
     tensorflow
     numpy
     ```

2. **express-gateway/**
   - **index.js**: API Gateway yang meneruskan request dari klien ke Flask dan mengembalikan respons.
   - **package.json**: Berisi informasi proyek Node.js, dependensi, dan skrip.
     ```json
     {
       "name": "express-gateway",
       "version": "1.0.0",
       "main": "index.js",
       "dependencies": {
         "axios": "^1.0.0",
         "body-parser": "^1.20.0",
         "express": "^4.18.0"
       }
     }
     ```
   - **node_modules/**: Folder yang secara otomatis dibuat setelah menjalankan `npm install` untuk menginstal dependensi.

3. **README.md**: Dokumentasi untuk menjelaskan tujuan proyek, langkah instalasi, dan panduan penggunaan.

## Langkah-langkah Setup

### 1. Menyiapkan Flask Backend

Masuk ke folder backend:
```bash
cd flask-backend
```

Buat lingkungan virtual:
```bash
python -m venv venv
source venv/bin/activate  # Mac/Linux
venv\Scripts\activate     # Windows
```

Install dependensi:
```bash
pip install -r requirements.txt
```

### apabila tidak bisa install dengan requirements.txt install secara manual

Install dependensi tensorflow:
```bash
pip install tensorflow
```
Install dependensi tensorflow:
```bash
pip install Flask
```

Install dependensi tensorflow:
```bash
pip install numpy
```


Jalankan Flask:
```bash
python model_api.py
```

### 2. Menyiapkan Express Gateway

Masuk ke folder gateway:
```bash
cd express-gateway
```

Instal dependensi Node.js:
```bash
npm install
```

Jalankan Express.js:
```bash
node index.js
```

### 3. Menghubungkan Flask dan Express

Pastikan Flask berjalan di http://127.0.0.1:5000 dan Express.js di http://127.0.0.1:3000. Express.js akan meneruskan request ke Flask melalui endpoint `/predict`.
```
