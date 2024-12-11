const axios = require('axios');
const multer = require('multer');
const FormData = require('form-data');
const fs = require('fs');
const mysql = require('mysql2/promise');
const dbConfig = {
    host: process.env.DB_HOST,
    user: process.env.DB_USERNAME,
    password: process.env.DB_PASSWORD,
    database: process.env.DB_NAME,
};

// Middleware untuk mengunggah file
const upload = multer({ dest: 'uploads/' });

// Handler untuk prediksi
const handlePredict = async (req, res) => {
    try {
        const form = new FormData();
        const file = req.file;

        if (!file) {
            return res.status(400).json({
                error: true,
                status: 'bad request',
                statusCode: 400,
                message: 'No file uploaded',
            });
        }

        form.append('file', fs.createReadStream(file.path));

        const response = await axios.post('http://127.0.0.1:5000/predict', form, {
            headers: {
                ...form.getHeaders(),
            },
        });

        console.log('Response from Flask API:', response.data);

        const { predicted_class: predictedClass } = response.data;

        if (predictedClass === undefined || predictedClass === null) {
            return res.status(400).json({
                error: true,
                status: 'bad request',
                statusCode: 400,
                message: 'Invalid prediction result',
            });
        }

        const connection = await mysql.createConnection(dbConfig);

        const [rows] = await connection.execute(
            'SELECT * FROM tanaman WHERE id = ?',
            [predictedClass]
        );

        await connection.end();

        if (rows.length === 0) {
            return res.status(404).json({
                error: true,
                status: 'not found',
                statusCode: 404,
                message: 'Data not found',
            });
        }

        res.status(200).json({
            error: false,
            status: 'ok',
            statusCode: 200,
            data: rows[0],
        });
    } catch (error) {
        console.error(error);
        res.status(500).json({
            error: true,
            status: 'internal server error',
            statusCode: 500,
            message: error.message,
        });
    }
};

module.exports = {
    handlePredict,
    upload,
};
