require('dotenv').config()
const port = process.env.PORT || 5000;
const express = require('express');

const routes = require('./routes/index.js');

const app = express();

app.use(express.json());

app.set('view engine', 'ejs');
app.set('views', './src/views');
app.use(express.urlencoded({ extended: false }));
app.use('/', routes);

app.listen(port, () => {
    console.log(`server berhasil berjalan di port ${port}`)
});