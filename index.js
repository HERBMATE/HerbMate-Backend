const express = require('express');
const app = express();
const mysql = require('mysql2');

app.use(express.json()); // Untuk memproses JSON dari body request

// Konfigurasi koneksi database
const db = mysql.createConnection({
  host: 'localhost', // Host MySQL (misal: 'localhost' atau '127.0.0.1')
  user: 'root',      // Nama pengguna database
  password: '', // Password database
  database: 'db_herbmate' // Nama database yang digunakan
});

//menghubungkan ke database
db.connect((err) => {
    if (err) {
        console.error('Koneksi ke database gagal:', err.message);
        return;
    }
    console.log('Terhubung ke database MySQL.');
})

// Endpoint dasar untuk memastikan API berjalan
app.get('/', (req, res) => {
    res.send('API Express terhubung ke MySQL!');
  });



//titik baru ---------------------------------------------------------

// PERKATEGORI -------------------------------------------------
// Kategori 1: Pertanyaan pembuka
app.get('/api/pertanyaan/kategori/1', (req, res) => {
    res.json({
        message: "Selamat datang! Silakan pilih kategori pertanyaan berikut: kategori 2 untuk memulai."
    });
});

// Kategori 2: Pertanyaan pembuka
app.get('/api/pertanyaan/kategori/2', (req, res) => {
    const sql = `
        SELECT DISTINCT
            t.id AS id_tanaman,
            t.nama AS nama_tanaman,
            p.id AS id_penyakit,
            p.penyakit AS nama_penyakit
        FROM tanaman t
        JOIN pertanyaan p ON t.nama = p.nama_tanaman
        WHERE t.id IS NOT NULL 
          AND t.nama IS NOT NULL
          AND p.id IS NOT NULL
          AND p.penyakit IS NOT NULL
        ORDER BY t.id ASC, p.id ASC;
    `;

    db.query(sql, (err, results) => {
        if (err) {
            console.error('Error executing query:', err);
            return res.status(500).json({
                message: 'Error retrieving data',
                error: err
            });
        }

        // Filter data untuk menghilangkan duplikat
        const tanamanSet = new Set();
        const penyakitSet = new Set();

        const tanaman = [];
        const penyakit = [];

        results.forEach(row => {
            // Tambahkan data ke daftar tanaman jika belum ada di Set
            if (!tanamanSet.has(row.id_tanaman)) {
                tanamanSet.add(row.id_tanaman);
                tanaman.push({
                    id: row.id_tanaman,
                    nama: row.nama_tanaman
                });
            }

            // Tambahkan data ke daftar penyakit jika nama belum ada di Set
            if (!penyakitSet.has(row.nama_penyakit)) {
                penyakitSet.add(row.nama_penyakit);
                penyakit.push({
                    id: row.id_penyakit,
                    nama: row.nama_penyakit
                });
            }
        });

        res.json({
            message: "Silakan pilih kategori selanjutnya berdasarkan daftar berikut:",
            kategori_3a: tanaman,
            kategori_3b: penyakit
        });
    });
});


// Kategori 3a: Pertanyaan berdasarkan tanaman tertentu
app.get('/api/pertanyaan/kategori/3a', (req, res) => {
    const { nama_tanaman } = req.query;

    if (!nama_tanaman) {
        return res.status(400).json({ message: "Parameter 'nama_tanaman' diperlukan." });
    }

    const sql = `
        SELECT 
            p.id AS id_pertanyaan,
            p.teks_pertanyaan,
            CASE
                WHEN p.teks_pertanyaan LIKE '%asal%' THEN t.asal
                WHEN p.teks_pertanyaan LIKE '%latin%' THEN t.nama_latin
                WHEN p.teks_pertanyaan LIKE '%kandungan%' THEN t.kandungan
                ELSE 'Tidak ada data yang sesuai'
            END AS jawaban
        FROM pertanyaan p
        JOIN tanaman t ON p.nama_tanaman = t.nama
        WHERE p.nama_tanaman LIKE ? AND p.kategori = '3a';
    `;

    db.query(sql, [`%${nama_tanaman}%`], (err, results) => {
        if (err) {
            console.error('Error executing query:', err);
            return res.status(500).json({
                message: 'Error retrieving data',
                error: err
            });
        }

        if (results.length === 0) {
            return res.status(404).json({ message: `Pertanyaan untuk tanaman '${nama_tanaman}' tidak ditemukan.` });
        }

        res.json({
            message: `Berikut adalah data terkait tanaman '${nama_tanaman}':`,
            tanaman: results.map(row => ({
                id: row.id_pertanyaan,
                pertanyaan: row.teks_pertanyaan,
                jawaban: row.jawaban
            })),
            next_kategori: "Kategori 4a untuk detail lebih lanjut."
        });
    });
});


// Kategori 3b: Pertanyaan berdasarkan penyakit tertentu dan kategori  
app.get('/api/pertanyaan/kategori/3b', (req, res) => {
    const { nama_penyakit } = req.query;

    // Validasi input
    if (!nama_penyakit) {
        return res.status(400).json({ message: "Parameter 'nama_penyakit' diperlukan." });
    }

    const sql = `
        SELECT DISTINCT teks_pertanyaan, nama_tanaman
        FROM pertanyaan
        WHERE penyakit LIKE ? AND kategori = '3b';
    `;

    // Menjalankan query dengan parameter
    db.query(sql, [`%${nama_penyakit}%`], (err, results) => {
        // Menangani kesalahan pada saat query
        if (err) {
            console.error('Error executing query:', err);
            return res.status(500).json({
                message: 'Error retrieving data',
                error: err
            });
        }

        // Mengecek jika hasil query kosong
        if (results.length === 0) {
            return res.status(404).json({ message: `Pertanyaan untuk penyakit '${nama_penyakit}' tidak ditemukan.` });
        }

        // Mengolah hasil query untuk memecah tanaman berdasarkan koma
        const pertanyaan = results.map(row => {
            const tanamanList = row.nama_tanaman
                .split(',')
                .map((nama, index) => ({ id: index + 1, nama: nama.trim() }));

            return {
                teks: row.teks_pertanyaan,
                tanaman: tanamanList
            };
        });

        // Mengembalikan hasil yang ditemukan
        res.json({
            message: `Berikut adalah pertanyaan yang berkaitan dengan penyakit '${nama_penyakit}':`,
            pertanyaan,
            next_kategori: "Kategori 4b untuk mengetahui resep."
        });
    });
});


// Endpoint untuk kategori 4b: Ambil pertanyaan dan resep berdasarkan nama_tanaman dan nama_penyakit, dengan kategori tetap 3b  
app.get('/api/pertanyaan/kategori/4b', (req, res) => {  
    const namaPenyakit = req.query.nama_penyakit;  
    const namaTanaman = req.query.nama_tanaman;  

    // Validasi input  
    if (!namaPenyakit || !namaTanaman) {  
        return res.status(400).json({  
            message: "Parameter 'nama_penyakit' dan 'nama_tanaman' harus diberikan."  
        });  
    }  

    // Query gabungan untuk mendapatkan pertanyaan dan resep  
    const sqlQuery = `  
        SELECT   
            p.teks_pertanyaan AS pertanyaan,   
            i.resep AS teks_resep  
        FROM   
            pertanyaan p  
        LEFT JOIN   
            info_tambahan i  
        ON   
            p.nama_tanaman = i.nama_tanaman AND p.penyakit = i.penyakit  
        WHERE   
            p.nama_tanaman LIKE ? AND p.penyakit LIKE ? AND p.kategori = '4b';  
    `;  

    db.query(sqlQuery, [`%${namaTanaman}%`, `%${namaPenyakit}%`], (err, results) => {  
        if (err) {  
            console.error('Error executing query:', err);  
            return res.status(500).json({  
                message: 'Error retrieving data',  
                error: err  
            });  
        }  

        // Jika tidak ada hasil  
        if (results.length === 0) {  
            return res.status(404).json({  
                message: `Tidak ditemukan data untuk penyakit '${namaPenyakit}' dengan tanaman '${namaTanaman}'.`  
            });  
        }  

        // Format respons  
        const pertanyaan4b = results.map(row => ({  
            pertanyaan: row.pertanyaan,  
            resep: row.teks_resep  
        }));  

        // Mengirimkan respons  
        res.status(200).json({  
            message: `Berikut adalah daftar pertanyaan dan resep untuk penyakit '${namaPenyakit}' dengan tanaman '${namaTanaman}':`,  
            pertanyaan4b  
        });  
    });  
});


const PORT = 3000;
app.listen(PORT, () => {
    console.log(`Server is running on http://localhost:${PORT}`);
});
