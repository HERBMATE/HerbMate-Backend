const express = require('express');
const app = express();
const questions = require('./questions/question')

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
