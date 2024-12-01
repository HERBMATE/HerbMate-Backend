const express = require('express');  
const axios = require('axios');  
const multer = require('multer'); // Middleware untuk mengunggah file  
const FormData = require('form-data');  
const fs = require('fs'); // Impor fs di sini  

const app = express();  
const upload = multer({ dest: 'uploads/' }); // Tentukan direktori untuk menyimpan file  

// Rute untuk memproses prediksi  
app.post('/predict', upload.single('file'), async (req, res) => {  
    try {  
        // Membuat objek FormData  
        const form = new FormData();  
        
        // Mengambil file dari request  
        const file = req.file; // Mengakses file dari req.file  

        if (!file) {  
            return res.status(400).json({ error: 'No file uploaded' });  
        }  

        // Menambahkan file ke FormData  
        form.append('file', fs.createReadStream(file.path));   

        // Mengirim permintaan POST ke API Flask  
        const response = await axios.post('http://127.0.0.1:5000/predict', form, {  
            headers: {  
                ...form.getHeaders() // Menambahkan headers dari FormData  
            }  
        });  
        
        res.json(response.data); // Kirim hasil prediksi ke klien  
    } catch (error) {  
        console.error(error); // Memperlihatkan kesalahan di console  
        res.status(500).json({ error: error.message });  
    }  
});  

app.listen(3000, () => console.log(`Server running on http://localhost:3000`));