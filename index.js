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



// Contoh endpoint: Fetch semua data dari tabel 'tanaman'
app.get('/tanaman', (req, res) => {
    const sql = 'SELECT * FROM tanaman';
    db.query(sql, (err, results) => {
      if (err) {
        console.error(err);
        res.status(500).send('Terjadi kesalahan pada server.');
      } else {
        res.json(results);
      }
    });
  });

  app.get('/tanaman/:nama', (req, res) => {
    // Ambil parameter nama dari URL
    const namaTanaman = req.params.nama;

    // SQL query untuk fetch data berdasarkan nama tanaman
    const sql = `
        SELECT 
            t.nama AS nama_tanaman,
            t.nama_latin,
            t.asal,
            t.kandungan,
            t.gambar,
            i.resep,
            i.penyakit,
            i.efek_samping,
            i.manfaat,
            i.sumber
        FROM 
            tanaman t
        JOIN 
            info_tambahan i
        ON 
            t.nama = i.nama_tanaman
        WHERE 
            t.nama = ?;
    `;

    // Eksekusi query dengan parameter
    db.query(sql, [namaTanaman], (err, result) => {
        if (err) {
            console.error('Error executing query:', err);
            return res.status(500).json({
                message: 'Error retrieving data',
                error: err
            });
        }

        if (result.length === 0) {
            return res.status(404).json({
                message: `No data found for tanaman with name '${namaTanaman}'`
            });
        }

        // Jika data ditemukan, kirimkan hasilnya
        res.status(200).json(result);
    });
});

//ENDPOINT get data by penyakit
app.get('/penyakit/:penyakit', (req, res) => {
    // Ambil parameter nama penyakit dari URL
    const namaPenyakit = req.params.penyakit;

    // SQL query untuk fetch data berdasarkan nama penyakit
    const sql = `
        SELECT 
            t.nama AS nama_tanaman,
            t.nama_latin,
            t.asal,
            t.kandungan,
            t.gambar,
            i.resep,
            i.penyakit,
            i.efek_samping,
            i.manfaat,
            i.sumber
        FROM 
            tanaman t
        JOIN 
            info_tambahan i
        ON 
            t.nama = i.nama_tanaman
        WHERE 
            i.penyakit = ?;
    `;

    // Eksekusi query dengan parameter
    db.query(sql, [namaPenyakit], (err, result) => {
        if (err) {
            console.error('Error executing query:', err);
            return res.status(500).json({
                message: 'Error retrieving data',
                error: err
            });
        }

        if (result.length === 0) {
            return res.status(404).json({
                message: `No data found for penyakit with name '${namaPenyakit}'`
            });
        }

        // Jika data ditemukan, kirimkan hasilnya
        res.status(200).json(result);
    });
});




// Tidak dipakai karena ganti format jangan dihapus dulu

  //ENDPOINT GET untuk mendapatkan semua detail jawaban
app.get('/api/questions/', (req, res) => {
    const parentId = req.query.parent_id || null;
    const filteredQuestions = questions.filter(q => q.parent_id == parentId);
    res.json(filteredQuestions); // Mengembalikan seluruh detail pertanyaan dan jawaban
});

//ENDPOINT GET by ID untuk mendapatkan detail jawaban
app.get('/api/answer/:id', (req, res) => {
    const id = parseInt(req.params.id, 10);
    const question = questions.find(q => q.id === id);
    if (question) {
        res.json({ answer: question.answer }); // Mengembalikan seluruh detail jawaban
    } else {
        res.status(404).json({ error: "Question not found" });
    }
});

// Endpoint GET by ID untuk mendapatkan detail pertanyaan
app.get('/api/questions/:id', (req, res) => {
    const id = parseInt(req.params.id, 10);
    const question = questions.find(q => q.id === id);
    if (question) {
        res.json(question); // Mengembalikan seluruh detail pertanyaan
    } else {
        res.status(404).json({ error: "Question not found" });
    }
});

const PORT = 3000;
app.listen(PORT, () => {
    console.log(`Server is running on http://localhost:${PORT}`);
});
