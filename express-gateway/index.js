const express = require('express');  
const axios = require('axios');  
const multer = require('multer'); // Middleware untuk mengunggah file  
const FormData = require('form-data');  
const fs = require('fs'); // Impor fs di sini  
const mysql = require('mysql2/promise'); // Library untuk koneksi ke MySQL

const app = express();  
const upload = multer({ dest: 'uploads/' }); // Tentukan direktori untuk menyimpan file  

// Konfigurasi koneksi MySQL
const dbConfig = {
    host: 'localhost', // Ganti sesuai dengan host database Anda
    user: 'root',      // Ganti dengan username database Anda
    password: '',      // Ganti dengan password database Anda
    database: 'db_herbmate', // Ganti dengan nama database Anda
};

// Rute untuk memproses prediksi  
app.post('/predict', upload.single('file'), async (req, res) => {
    try {
        const form = new FormData();
        const file = req.file;

        if (!file) {
            return res.status(400).json({ error: 'No file uploaded' });
        }

        form.append('file', fs.createReadStream(file.path));

        const response = await axios.post('http://127.0.0.1:5000/predict', form, {
            headers: {
                ...form.getHeaders(),
            },
        });

        // Log response for debugging
        console.log('Response from Flask API:', response.data);

        const { predicted_class: predictedClass } = response.data;


        // Validate predictedClass
        if (predictedClass === undefined || predictedClass === null) {
            return res.status(400).json({ error: 'Invalid prediction result' });
        }

        const connection = await mysql.createConnection(dbConfig);

        const [rows] = await connection.execute(
            'SELECT * FROM tanaman WHERE id = ?',
            [predictedClass]
        );

        await connection.end();

        if (rows.length === 0) {
            return res.status(404).json({ error: 'Data not found' });
        }

        res.json(rows[0]);
    } catch (error) {
        console.error(error);
        res.status(500).json({ error: error.message });
    }
});
  

app.listen(3000, () => console.log(`Server running on http://localhost:3000`));
