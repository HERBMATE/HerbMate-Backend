const { GoogleGenerativeAI } = require("@google/generative-ai");
const axios = require('axios');
const mysql = require('mysql2/promise');

// Konfigurasi koneksi MySQL langsung di file ini
const dbConfig = {
    host: 'localhost',
    user: 'root',
    password: '',
    database: 'db_herbmate',
};

const apiKey = 'AIzaSyCIEyCcaidguGM5gTlgpmZhw_Qekner7Z0'; // Ganti dengan API Key Anda
const genAI = new GoogleGenerativeAI("AIzaSyBnCxh84z3NQXH1z21kJvE7MtXZuUoX0-o");
const model = genAI.getGenerativeModel({ model: "gemini-1.5-flash" });

// Fungsi untuk menerjemahkan teks
async function translateText(text, targetLang = 'en') {
    const url = `https://translation.googleapis.com/language/translate/v2?key=${apiKey}`;
    const response = await axios.post(url, { q: text, target: targetLang });
    return response.data.data.translations[0].translatedText;
}

// Fungsi untuk mengambil herbal keywords dari database
async function getHerbalKeywordsFromDB() {
    const localKeywords = [
            // Herbal Plants
        "ginger", "turmeric", "aloe vera", "ginseng", "eucalyptus", "neem", "lemongrass", 
        "basil", "mint", "cinnamon", "clove", "saffron", "chamomile", "peppermint", 
        "hibiscus", "lavender", "rosemary", "thyme", "fennel", "ashwagandha",

        // Health Benefits
        "immune booster", "antioxidant", "anti-inflammatory", "pain relief", 
        "stress relief", "skin care", "digestion aid", "detoxification", "weight loss", 
        "blood circulation", "anti-bacterial", "anti-viral", "anti-fungal", 
        "cholesterol control", "diabetes management", "hormonal balance", "mental clarity", 
        "energy enhancement", "heart health", "respiratory support",

        // Diseases and Conditions
        "cold and flu", "fever", "hypertension", "diabetes", "arthritis", "asthma", 
        "acne", "insomnia", "allergies", "migraine", "obesity", "cholesterol", 
        "indigestion", "ulcers", "constipation", "hair loss", "skin rashes", 
        "inflammation", "depression", "anxiety",

        // General Health Terms
        "herbal remedy", "holistic medicine", "traditional medicine", "alternative medicine", 
        "natural cure", "essential oils", "herbal infusion", "detox drinks", "herbal tea", 
        "superfoods","health", "plant", "herbal", "herb", "indonesia", "indonesian"
        ];

    const connection = await mysql.createConnection(dbConfig);

    try {
        const [rows] = await connection.execute(
            `SELECT DISTINCT t.nama, i.penyakit FROM tanaman t
            LEFT JOIN info_tambahan i ON t.nama = i.nama_tanaman`
        );

        const herbalKeywords = new Set(localKeywords.map(keyword => keyword.toLowerCase()));
        
        for (const row of rows) {
            herbalKeywords.add(row.nama.toLowerCase());
            if (row.penyakit) herbalKeywords.add(row.penyakit.toLowerCase());
        }

        const translatedKeywords = await Promise.all(
            Array.from(herbalKeywords).map(keyword => translateText(keyword, 'en'))
        );

        await connection.end();
        return translatedKeywords;
    } catch (error) {
        console.error('Error retrieving herbal keywords:', error);
        await connection.end();
        throw new Error('Failed to retrieve herbal keywords');
    }
}

// Fungsi untuk analisis entitas menggunakan NLP
async function isHerbalPromptNLP(prompt, lang = 'id') {
    const translatedPrompt = await translateText(prompt, 'en');
    const herbalKeywords = await getHerbalKeywordsFromDB();

    const url = `https://language.googleapis.com/v1/documents:analyzeEntities?key=${apiKey}`;
    const document = {
        document: {
            content: translatedPrompt,
            type: 'PLAIN_TEXT',
            language: 'en',
        },
    };

    try {
        const response = await axios.post(url, document);
        const entities = response.data.entities.map(entity => entity.name.toLowerCase());
        return entities.some(entity => herbalKeywords.some(keyword => entity.includes(keyword)));
    } catch (error) {
        console.error('Error analyzing entities:', error);
        throw new Error('Failed to analyze entities');
    }
}

// Handler untuk endpoint chatbot
async function handleChatbotRequest(req, res) {
    const { prompt } = req.body;

    if (!prompt) {
        return res.status(400).json({
            error: true,
            status: 'bad request',
            statusCode: 400,
            message: 'Prompt is required',
        });
    }

    try {
        const isValid = await isHerbalPromptNLP(prompt, 'id');

        if (!isValid) {
            return res.status(400).json({
                error: true,
                status: 'bad request',
                statusCode: 400,
                message: 'Prompt must be related to herbal plants or medicine.',
            });
        }

        const result = await model.generateContent(prompt);
        const responseText = result.response.text();

        res.status(200).json({
            error: false,
            status: 'ok',
            statusCode: 200,
            response: responseText,
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
}

module.exports = { handleChatbotRequest };
