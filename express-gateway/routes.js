const express = require('express');
const router = express.Router();

const chatbotController = require('./chatbotController');
const modelController = require('./modelController');
const tanamanController = require('./tanamanController');

// Middleware untuk mengunggah file
const { upload } = require('./modelController'); // Impor middleware upload

// Route untuk chatbot
router.post('/chatbot', chatbotController.handleChatbotRequest);

// Routes untuk prediksi
router.post('/predict', upload.single('file'), modelController.handlePredict); // Tambahkan middleware upload

// Routes untuk tanaman
router.get('/tanaman', tanamanController.getTanaman);
router.get('/tanaman/search', tanamanController.searchTanaman);

module.exports = router;
