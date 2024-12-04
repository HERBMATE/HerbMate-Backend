```markdown
# Dokumentasi API untuk Prediksi dan Informasi Tanaman

API ini menyediakan layanan untuk memprediksi jenis tanaman berdasarkan gambar serta akses ke database tanaman dengan fitur pencarian, penyaringan, dan pengurutan.

---

## URL Dasar
```
http://localhost:3000
```

---

## Daftar Endpoint

### 1. **Prediksi Jenis Tanaman**
Mengunggah gambar untuk memprediksi jenis tanaman dan mendapatkan detailnya.

**URL**: `/predict`  
**Metode**: `POST`  
**Content-Type**: `multipart/form-data`  

#### Permintaan
- **Body**:
  - `file` (wajib): File gambar yang akan diunggah.

#### Respon
- **Berhasil** (`200 OK`):
  ```json
  {
    "id": 1,
    "nama": "Tanaman X",
    "gambar": "/path/to/image",
    "deskripsi": "Deskripsi tanaman"
  }
  ```
- **Gagal**:
  - `400 Bad Request`:
    ```json
    { "error": "No file uploaded" }
    ```
  - `500 Internal Server Error`:
    ```json
    { "error": "Pesan kesalahan" }
    ```

---

### 2. **Ambil Semua Data Tanaman**
Mengambil daftar semua tanaman di database, termasuk nama dan path gambarnya.

**URL**: `/tanaman`  
**Metode**: `GET`  

#### Respon
- **Berhasil** (`200 OK`):
  ```json
  [
    { "nama": "Tanaman A", "gambar": "/path/to/imageA" },
    { "nama": "Tanaman B", "gambar": "/path/to/imageB" }
  ]
  ```
- **Gagal** (`500 Internal Server Error`):
  ```json
  { "error": "Pesan kesalahan" }
  ```

---

### 3. **Cari dan Urutkan Tanaman**
Mencari tanaman berdasarkan nama dan mengurutkan hasilnya secara alfabetis.

**URL**: `/tanaman/search`  
**Metode**: `GET`  

#### Parameter Query
- `nama` (opsional): Nama tanaman atau bagian nama yang akan dicari.
- `order` (opsional): Urutan hasil (`ASC` atau `DESC`). Default adalah `ASC`.

#### Respon
- **Berhasil** (`200 OK`):
  ```json
  [
    { "nama": "Tanaman X", "gambar": "/path/to/imageX" },
    { "nama": "Tanaman Y", "gambar": "/path/to/imageY" }
  ]
  ```
- **Gagal** (`500 Internal Server Error`):
  ```json
  { "error": "Pesan kesalahan" }
  ```

---

## Contoh Penggunaan

### Prediksi Jenis Tanaman
```bash
curl -X POST http://localhost:3000/predict \
     -F "file=@/path/to/image.jpg"
```

### Ambil Semua Data Tanaman
```bash
curl -X GET http://localhost:3000/tanaman
```

### Cari dan Urutkan Tanaman
```bash
curl -X GET "http://localhost:3000/tanaman/search?nama=Tanaman&order=DESC"
```

---

## Catatan
- Pastikan API Flask (`http://127.0.0.1:5000/predict`) sudah berjalan dan terkonfigurasi dengan baik.
- Database (`db_herbmate`) harus memiliki tabel bernama `tanaman` dengan kolom seperti `id`, `nama`, `gambar`, dll.
- File yang diunggah sementara disimpan di direktori `uploads/`. Pastikan file dikelola atau dihapus secara berkala untuk menghemat ruang.
```