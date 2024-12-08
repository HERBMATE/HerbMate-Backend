const express = require('express');  
const axios = require('axios');  
const multer = require('multer'); // Middleware untuk mengunggah file  
const FormData = require('form-data');  
const fs = require('fs'); // Impor fs di sini  
const mysql = require('mysql2/promise'); // Library untuk koneksi ke MySQL
const { GoogleGenerativeAI } = require("@google/generative-ai");
const { LanguageServiceClient } = require('@google-cloud/language');
const { TranslationServiceClient } = require('@google-cloud/translate');

const apiKey = 'masukkan api_key';  // Ganti dengan API Key dari proyek 'capstone-project-c242-ps193'


const app = express();  
const upload = multer({ dest: 'uploads/' }); // Tentukan direktori untuk menyimpan file  

// Konfigurasi koneksi MySQL
const dbConfig = {
    host: 'localhost', // Ganti sesuai dengan host database Anda
    user: 'root',      // Ganti dengan username database Anda
    password: '',      // Ganti dengan password database Anda
    database: 'db_herbmate', // Ganti dengan nama database Anda
};

// Konfigurasi Google Generative AI
const genAI = new GoogleGenerativeAI("masukkan api_key");
const model = genAI.getGenerativeModel({ model: "gemini-1.5-flash" });

// Fungsi untuk menerjemahkan teks menggunakan API Key
async function translateText(text, targetLang = 'en') {
    const url = `https://translation.googleapis.com/language/translate/v2?key=${apiKey}`;
    
    const response = await axios.post(url, {
        q: text,
        target: targetLang,
    });

    return response.data.data.translations[0].translatedText;
}

// Fungsi untuk mengambil herbal keywords dari database dan menerjemahkannya ke bahasa Inggris
async function getHerbalKeywordsFromDB() {
    const connection = await mysql.createConnection(dbConfig);

    try {
        // Query untuk mengambil kata kunci dari tabel tanaman dan info_tambahan
        const [rows] = await connection.execute(
            `SELECT DISTINCT t.nama, i.penyakit 
            FROM tanaman t
            LEFT JOIN info_tambahan i ON t.nama = i.nama_tanaman`
        );

        // Gabungkan kata kunci dari kedua kolom (nama tanaman dan penyakit)
        const herbalKeywords = new Set();

        for (const row of rows) {
            herbalKeywords.add(row.nama.toLowerCase());  // Nama tanaman
            if (row.penyakit) {
                herbalKeywords.add(row.penyakit.toLowerCase());  // Penyakit
            }
        }

        // Terjemahkan kata kunci herbal ke bahasa Inggris
        const translatedKeywords = await Promise.all(
            Array.from(herbalKeywords).map(keyword => translateText(keyword, 'en'))
        );

        await connection.end();

        // Kembalikan kata kunci yang sudah diterjemahkan
        return translatedKeywords;
    } catch (error) {
        console.error('Error retrieving herbal keywords from DB:', error);
        await connection.end();
        throw new Error('Failed to retrieve herbal keywords from database');
    }
}

// Fungsi untuk analisis entitas dengan NLP
async function isHerbalPromptNLP(prompt, lang = 'id') {
    // Menerjemahkan prompt ke bahasa Inggris
    const translatedPrompt = await translateText(prompt, 'en');  

    // Ambil herbal keywords dari database dan terjemahkan ke bahasa Inggris
    const herbalKeywords = await getHerbalKeywordsFromDB();  

    const url = `https://language.googleapis.com/v1/documents:analyzeEntities?key=${apiKey}`;

    const document = {
        document: {
            content: translatedPrompt,  // Menggunakan teks yang sudah diterjemahkan
            type: 'PLAIN_TEXT',
            language: 'en',  // Bahasa Inggris untuk analisis entitas
        },
    };

    try {
        const response = await axios.post(url, document);
        const entities = response.data.entities.map(entity => entity.name.toLowerCase());  // Entitas dalam bahasa Inggris

        // Periksa apakah entitas mengandung kata kunci herbal dari database
        return entities.some(entity => herbalKeywords.some(keyword => entity.includes(keyword)));
    } catch (error) {
        console.error('Error analyzing entities:', error.response?.data || error.message);
        throw new Error('Failed to analyze entities');
    }
}


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

// Endpoint untuk mendapatkan semua data tanaman (nama dan path gambar)
app.get('/tanaman', async (req, res) => {
    const { query, order = 'ASC' } = req.query; // Ambil query parameters

    try {
        const connection = await mysql.createConnection(dbConfig);

        const [rows] = await connection.execute(
            `SELECT DISTINCT t.nama, t.gambar, t.id 
            FROM tanaman t
            LEFT JOIN info_tambahan i ON t.nama = i.nama_tanaman
            WHERE i.penyakit LIKE ?
            ORDER BY t.nama ${order.toUpperCase() === 'DESC' ? 'DESC' : 'ASC'}`,
            [`%${query || ''}%`] // Filter berdasarkan penyakit, jika query kosong akan mengembalikan semua data
        );

        await connection.end();

        res.json({ tanamanResponse: rows });
    } catch (error) {
        console.error(error);
        res.status(500).json({ error: error.message });
    }
});


app.get('/tanaman/search', async (req, res) => {
    const { query, filter, order = 'ASC' } = req.query; // Ambil query parameters

    try {
        const connection = await mysql.createConnection(dbConfig);

        // Query SQL untuk mencari berdasarkan nama tanaman atau penyakit
        const [rows] = await connection.execute(
            `SELECT DISTINCT t.nama, t.gambar 
            FROM tanaman t
            LEFT JOIN info_tambahan i ON t.nama = i.nama_tanaman
            WHERE t.nama LIKE ? AND i.penyakit LIKE ?
            ORDER BY t.nama ${order.toUpperCase() === 'DESC' ? 'DESC' : 'ASC'}`,
            [`%${query || ''}%`, `%${filter || ''}%`] // Jika query kosong, akan mengembalikan semua data
        );

        await connection.end();

        res.json(rows);
    } catch (error) {
        console.error(error);
        res.status(500).json({ error: error.message });
    }
});


// Endpoint chatbot menggunakan Google Generative AI
app.post('/chatbot', express.json(), async (req, res) => {
    const { prompt } = req.body;

    if (!prompt) {
        return res.status(400).json({ error: 'Prompt is required' });
    }

    try {
        const isValid = await isHerbalPromptNLP(prompt, 'id');  // Gunakan Bahasa Indonesia untuk input
        console.log(isValid);
        if (!isValid) {
            return res.status(400).json({ error: 'Prompt must be related to herbal plants or medicine.' });
        }

        const result = await model.generateContent(prompt);
        const responseText = result.response.text();

        res.json({ response: responseText });
    } catch (error) {
        console.error(error);
        res.status(500).json({ error: error.message });
    }
});

app.listen(3000, () => console.log(`Server running on http://localhost:3000`));
