# Dokumentasi API HerbMate

API HerbMate adalah layanan berbasis Node.js yang menggunakan MySQL sebagai database backend. API ini dirancang untuk menyediakan informasi tentang tanaman herbal, penyakit, dan resep terkait berdasarkan kategori pertanyaan tertentu.

## Daftar Endpoint

### 1. Kategori 1: Pertanyaan Pembuka
**Endpoint:**
```
GET /api/pertanyaan/kategori/1
```
**Deskripsi:**
Mengembalikan pesan sambutan untuk memulai eksplorasi API.

**Respons:**
```json
{
  "message": "Selamat datang! Silakan pilih kategori pertanyaan berikut: kategori 2 untuk memulai."
}
```

---

### 2. Kategori 2: Daftar Tanaman dan Penyakit
**Endpoint:**
```
GET /api/pertanyaan/kategori/2
```
**Deskripsi:**
Mengembalikan daftar tanaman dan penyakit yang tersedia.

**Respons:**
```json
{
  "message": "Silakan pilih kategori selanjutnya berdasarkan daftar berikut:",
  "kategori_3a": [
    { "id": 1, "nama": "Tanaman A" },
    { "id": 2, "nama": "Tanaman B" }
  ],
  "kategori_3b": [
    { "id": 1, "nama": "Penyakit X" },
    { "id": 2, "nama": "Penyakit Y" }
  ]
}
```

---

### 3. Kategori 3a: Pertanyaan Berdasarkan Tanaman
**Endpoint:**
```
GET /api/pertanyaan/kategori/3a
```
**Query Parameter:**
- `nama_tanaman` *(string, required)*: Nama tanaman yang ingin dicari.

**Deskripsi:**
Mengembalikan daftar pertanyaan terkait dengan tanaman tertentu.

**Contoh Respons:**
```json
{
  "message": "Berikut adalah data terkait tanaman 'Tanaman A':",
  "tanaman": [
    {
      "id": 1,
      "pertanyaan": "Apa asal Tanaman A?",
      "jawaban": "Indonesia"
    },
    {
      "id": 2,
      "pertanyaan": "Apa nama latin Tanaman A?",
      "jawaban": "Plantus A"
    }
  ],
  "next_kategori": "Kategori 4a untuk detail lebih lanjut."
}
```

---

### 4. Kategori 3b: Pertanyaan Berdasarkan Penyakit
**Endpoint:**
```
GET /api/pertanyaan/kategori/3b
```
**Query Parameter:**
- `nama_penyakit` *(string, required)*: Nama penyakit yang ingin dicari.

**Deskripsi:**
Mengembalikan daftar pertanyaan yang relevan dengan penyakit tertentu. Setiap pertanyaan akan memuat daftar tanaman yang terkait.

**Contoh Respons:**
```json
{
  "message": "Berikut adalah pertanyaan yang berkaitan dengan penyakit 'Penyakit X':",
  "pertanyaan": [
    {
      "teks": "Apa tanaman yang cocok untuk Penyakit X?",
      "tanaman": [
        { "id": 1, "nama": "Tanaman A" },
        { "id": 2, "nama": "Tanaman B" }
      ]
    }
  ],
  "next_kategori": "Kategori 4b untuk mengetahui resep."
}
```

---

### 5. Kategori 4b: Resep Berdasarkan Tanaman dan Penyakit
**Endpoint:**
```
GET /api/pertanyaan/kategori/4b
```
**Query Parameter:**
- `nama_tanaman` *(string, required)*: Nama tanaman yang dipilih.
- `nama_penyakit` *(string, required)*: Nama penyakit yang dipilih.

**Deskripsi:**
Mengembalikan daftar resep yang terkait dengan kombinasi tanaman dan penyakit tertentu.

**Contoh Respons:**
```json
{
  "message": "Berikut adalah daftar pertanyaan dan resep untuk penyakit 'Penyakit X' dengan tanaman 'Tanaman A':",
  "pertanyaan4b": [
    {
      "pertanyaan": "Bagaimana cara menggunakan Tanaman A untuk Penyakit X?",
      "resep": "Rebus daun Tanaman A selama 10 menit, lalu minum."
    }
  ]
}
```

---

## Menjalankan Server
1. Pastikan MySQL sudah terpasang dan database `db_herbmate` sudah dikonfigurasi.
2. Instal dependensi:
   ```bash
   npm install
   ```
3. Jalankan server:
   ```bash
   node server.js
   ```
4. Akses API melalui:
   ```
   http://localhost:3000
   ```

---

## Struktur Database (Contoh)
### Tabel `tanaman`
| id  | nama        | asal         | nama_latin | kandungan |
|-----|-------------|--------------|------------|-----------|
| 1   | Tanaman A   | Indonesia    | Plantus A  | Zat A     |
| 2   | Tanaman B   | Malaysia     | Plantus B  | Zat B     |

### Tabel `pertanyaan`
| id  | teks_pertanyaan                          | nama_tanaman | penyakit    | kategori |
|-----|------------------------------------------|--------------|-------------|----------|
| 1   | Apa asal Tanaman A?                      | Tanaman A    | Penyakit X  | 3a       |
| 2   | Apa tanaman yang cocok untuk Penyakit X? | Tanaman A,B  | Penyakit X  | 3b       |

### Tabel `info_tambahan`
| id  | nama_tanaman | penyakit    | resep                            |
|-----|--------------|-------------|----------------------------------|
| 1   | Tanaman A    | Penyakit X  | Rebus daun Tanaman A selama 10m. |

