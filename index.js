const express = require('express');
const app = express();
const mysql = require('mysql2');
const questions = require('./questions/question')

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

// Kategori 2: Pertanyaan pemisah
app.get('/api/pertanyaan/kategori/2', (req, res) => {
    const sql = `
        SELECT DISTINCT p.penyakit AS nama_penyakit, p.nama_tanaman AS nama_tanaman
        FROM pertanyaan p;
    `;
    db.query(sql, (err, results) => {
        if (err) {
            console.error('Error executing query:', err);
            return res.status(500).json({
                message: 'Error retrieving data',
                error: err
            });
        }

        const penyakit = [...new Set(results.map(row => row.nama_penyakit))];
        const tanaman = [...new Set(results.map(row => row.nama_tanaman.split(',')).flat())];

        res.json({
            message: "Silakan pilih kategori selanjutnya berdasarkan daftar berikut:",
            kategori_3a: "Saya ingin menanyakan terkait tanaman tertentu.",
            kategori_3b: "Saya ingin menanyakan terkait penyakit tertentu.",
            list_penyakit: penyakit,
            list_tanaman: tanaman
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
        SELECT teks_pertanyaan
        FROM pertanyaan
        WHERE nama_tanaman LIKE ?;
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
            message: `Berikut adalah pertanyaan terkait tanaman '${nama_tanaman}':`,
            pertanyaan: results.map(row => row.teks_pertanyaan),
            next_kategori: "Kategori 4a untuk detail lebih lanjut."
        });
    });
});

// Kategori 3b: Pertanyaan berdasarkan penyakit tertentu dan kategori  
app.get('/api/pertanyaan/kategori/3b', (req, res) => {  
    const { nama_penyakit, kategori } = req.query;  

    // Validasi input  
    if (!nama_penyakit || !kategori) {  
        return res.status(400).json({ message: "Parameter 'nama_penyakit' dan 'kategori' diperlukan." });  
    }  

    const sql = `  
        SELECT DISTINCT teks_pertanyaan, nama_tanaman  
        FROM pertanyaan  
        WHERE penyakit LIKE ? AND kategori = ?;  
    `;  
    
    // Menjalankan query dengan parameter  
    db.query(sql, [`%${nama_penyakit}%`, kategori], (err, results) => {  
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
            return res.status(404).json({ message: `Pertanyaan untuk penyakit '${nama_penyakit}' dan kategori '${kategori}' tidak ditemukan.` });  
        }  

        // Mengembalikan hasil yang ditemukan  
        res.json({  
            message: `Berikut adalah pertanyaan yang berkaitan dengan penyakit '${nama_penyakit}' dan kategori '${kategori}':`,  
            pertanyaan: results.map(row => ({  
                teks: row.teks_pertanyaan,  
                tanaman: row.nama_tanaman  
            })),  
            next_kategori: "Kategori 4b untuk mengetahui resep."  
        });  
    });  
});

// Kategori 4a: Detail dari tanaman yang dipilih
app.get('/api/pertanyaan/kategori/4a', (req, res) => {
    const { nama_tanaman } = req.query;

    if (!nama_tanaman) {
        return res.status(400).json({ message: "Parameter 'nama_tanaman' diperlukan." });
    }

    const sql = `
        SELECT *
        FROM pertanyaan
        WHERE nama_tanaman LIKE ?;
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
            return res.status(404).json({ message: `Detail untuk tanaman '${nama_tanaman}' tidak ditemukan.` });
        }

        res.json({
            message: `Berikut adalah detail untuk tanaman '${nama_tanaman}':`,
            detail: results
        });
    });
});

// Endpoint untuk kategori 4b: Ambil pertanyaan dan resep berdasarkan nama_tanaman, penyakit, dan kategori  
app.get('/api/pertanyaan/kategori/4b', (req, res) => {  
    const namaPenyakit = req.query.nama_penyakit;  
    const namaTanaman = req.query.nama_tanaman;  
    const kategori = req.query.kategori;  

    // Validasi input  
    if (!namaPenyakit || !namaTanaman || !kategori) {  
        return res.status(400).json({  
            message: "Parameter 'nama_penyakit', 'nama_tanaman', dan 'kategori' harus diberikan."  
        });  
    }  

    // Query untuk mengambil pertanyaan  
    const sqlPertanyaan = `  
        SELECT   
            teks_pertanyaan  
        FROM   
            pertanyaan  
        WHERE   
            nama_tanaman LIKE ? AND penyakit LIKE ? AND kategori = ?;  
    `;  

    db.query(sqlPertanyaan, [`%${namaTanaman}%`, `%${namaPenyakit}%`, kategori], (err, resultsPertanyaan) => {  
        if (err) {  
            console.error('Error executing question query:', err);  
            return res.status(500).json({  
                message: 'Error retrieving questions data',  
                error: err  
            });  
        }  

        // Membuat response pertanyaan  
        const pertanyaanData = resultsPertanyaan.map(row => row.teks_pertanyaan);  

        // Query untuk mengambil resep  
        const sqlResep = `  
            SELECT   
                resep   
            FROM   
                info_tambahan   
            WHERE   
                nama_tanaman LIKE ? AND penyakit LIKE ?;  
        `;  

        db.query(sqlResep, [`%${namaTanaman}%`, `%${namaPenyakit}%`], (err, resultsResep) => {  
            if (err) {  
                console.error('Error executing recipe query:', err);  
                return res.status(500).json({  
                    message: 'Error retrieving recipe data',  
                    error: err  
                });  
            }  

            if (resultsResep.length === 0) {  
                return res.status(404).json({  
                    message: `Tidak ditemukan resep untuk penyakit '${namaPenyakit}' dengan tanaman '${namaTanaman}'.`  
                });  
            }  

            // Respon jika data ditemukan  
            res.status(200).json({  
                message: `Berikut adalah pertanyaan dan resep untuk penyakit '${namaPenyakit}' dengan tanaman '${namaTanaman}':`,  
                pertanyaan: pertanyaanData,  
                resep: resultsResep[0].resep // Mengembalikan resep pertama  
            });  
        });  
    });  
});

const PORT = 3000;
app.listen(PORT, () => {
    console.log(`Server is running on http://localhost:${PORT}`);
});
