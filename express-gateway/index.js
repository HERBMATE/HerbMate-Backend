const express = require('express');
const routes = require('./routes');

const app = express();

// Middleware untuk parsing JSON
app.use(express.json());

// Gunakan rute dari routes.js
app.use('/', routes);

// Jalankan server
const PORT = process.env.PORT || 3000;
app.listen(PORT, () => {
    console.log(`Server is running on http://localhost:${PORT}`);
});
