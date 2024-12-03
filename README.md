```markdown
# Dokumentasi API Herbmate

Selamat datang di API Herbmate! API ini memungkinkan Anda untuk mengambil data dari database MySQL terkait tanaman, penyakit, serta pertanyaan dan resep yang relevan.

## Prasyarat

1. Node.js terinstal di komputer Anda.
2. Database MySQL dengan struktur berikut:
   - **Tabel `pertanyaan`**: Menyimpan data pertanyaan dengan kolom `teks_pertanyaan`, `penyakit`, `nama_tanaman`, dan `kategori`.
   - **Tabel `info_tambahan`**: Menyimpan informasi tambahan seperti resep dengan kolom `nama_tanaman`, `penyakit`, dan `resep`.

```

## Endpoint

### 1. Pengecekan Dasar API
**URL**: `/`  
**Metode**: `GET`  
**Deskripsi**: Memastikan API berjalan dan terhubung ke database.

#### Respon
```json
{
  "message": "API Express terhubung ke MySQL!"
}
```

---

### 2. Kategori 1: Pertanyaan Pembuka
**URL**: `/api/pertanyaan/kategori/1`  
**Metode**: `GET`  
**Deskripsi**: Memberikan pesan selamat datang dan arahan ke kategori berikutnya.

#### Respon
```json
{
  "message": "Selamat datang! Silakan pilih kategori pertanyaan berikut: kategori 2 untuk memulai."
}
```

---

### 3. Kategori 2: Pertanyaan Pemisah
**URL**: `/api/pertanyaan/kategori/2`  
**Metode**: `GET`  
**Deskripsi**: Memberikan daftar penyakit dan tanaman untuk dikategorikan lebih lanjut.

#### Respon
```json
{
  "message": "Silakan pilih kategori selanjutnya berdasarkan daftar berikut:",
  "kategori_3a": "Saya ingin menanyakan terkait tanaman tertentu.",
  "kategori_3b": "Saya ingin menanyakan terkait penyakit tertentu.",
  "list_penyakit": ["Penyakit 1", "Penyakit 2"],
  "list_tanaman": ["Tanaman 1", "Tanaman 2"]
}
```

---

### 4. Kategori 3a: Pertanyaan Berdasarkan Tanaman
**URL**: `/api/pertanyaan/kategori/3a`  
**Metode**: `GET`  
**Parameter Query**:
- `nama_tanaman` (wajib): Nama tanaman.

#### Respon
- **Sukses**
```json
{
  "message": "Berikut adalah pertanyaan terkait tanaman 'Tanaman':",
  "pertanyaan": ["Pertanyaan 1", "Pertanyaan 2"],
  "next_kategori": "Kategori 4a untuk detail lebih lanjut."
}
```
- **Error**: Jika data tanaman tidak ditemukan.
```json
{
  "message": "Pertanyaan untuk tanaman 'Tanaman' tidak ditemukan."
}
```

---

### 5. Kategori 3b: Pertanyaan Berdasarkan Penyakit
**URL**: `/api/pertanyaan/kategori/3b`  
**Metode**: `GET`  
**Parameter Query**:
- `nama_penyakit` (wajib): Nama penyakit.
- `kategori` (wajib): Nomor kategori.

#### Respon
- **Sukses**
```json
{
  "message": "Berikut adalah pertanyaan yang berkaitan dengan penyakit 'Penyakit' dan kategori 'Kategori':",
  "pertanyaan": [
    {
      "teks": "Pertanyaan 1",
      "tanaman": "Tanaman 1"
    }
  ],
  "next_kategori": "Kategori 4b untuk mengetahui resep."
}
```
- **Error**: Jika data tidak ditemukan.
```json
{
  "message": "Pertanyaan untuk penyakit 'Penyakit' dan kategori 'Kategori' tidak ditemukan."
}
```

---

### 6. Kategori 4a: Detail Tanaman
**URL**: `/api/pertanyaan/kategori/4a`  
**Metode**: `GET`  
**Parameter Query**:
- `nama_tanaman` (wajib): Nama tanaman.

#### Respon
- **Sukses**
```json
{
  "message": "Berikut adalah detail untuk tanaman 'Tanaman':",
  "detail": [
    {
      "teks_pertanyaan": "Pertanyaan 1",
      "penyakit": "Penyakit 1",
      "kategori": "1"
    }
  ]
}
```
- **Error**: Jika data tanaman tidak ditemukan.
```json
{
  "message": "Detail untuk tanaman 'Tanaman' tidak ditemukan."
}
```

---

### 7. Kategori 4b: Pertanyaan dan Resep
**URL**: `/api/pertanyaan/kategori/4b`  
**Metode**: `GET`  
**Parameter Query**:
- `nama_penyakit` (wajib): Nama penyakit.
- `nama_tanaman` (wajib): Nama tanaman.
- `kategori` (wajib): Nomor kategori.

#### Respon
- **Sukses**
```json
{
  "message": "Berikut adalah pertanyaan dan resep untuk penyakit 'Penyakit' dengan tanaman 'Tanaman':",
  "pertanyaan": ["Pertanyaan 1", "Pertanyaan 2"],
  "resep": "Resep untuk penyakit dan tanaman ini."
}
```
- **Error**: Jika data tidak ditemukan.
```json
{
  "message": "Tidak ditemukan resep untuk penyakit 'Penyakit' dengan tanaman 'Tanaman'."
}
```

---

## Menjalankan Server
1. Clone repository ini.
2. Instal dependensi:
   ```bash
   npm install
   ```
3. Perbarui konfigurasi database dengan kredensial MySQL Anda.
4. Jalankan server:
   ```bash
   node app.js
   ```
5. Buka `http://localhost:3000` untuk memastikan server berjalan.

---

## Catatan
- Pastikan skema database Anda sesuai dengan yang diharapkan.
- Uji endpoint menggunakan alat seperti Postman atau cURL.
```
