const mysql = require('mysql2/promise');

// Konfigurasi koneksi MySQL
const dbConfig = {
    host: 'localhost',
    user: 'root',
    password: '',
    database: 'db_herbmate',
};

// Handler untuk mendapatkan semua data tanaman
const getTanaman = async (req, res) => {
    const { query, order = 'ASC' } = req.query;

    try {
        const connection = await mysql.createConnection(dbConfig);

        const [rows] = await connection.execute(
            `SELECT DISTINCT t.nama, t.gambar, t.id 
            FROM tanaman t
            LEFT JOIN info_tambahan i ON t.nama = i.nama_tanaman
            WHERE i.penyakit LIKE ?
            ORDER BY t.nama ${order.toUpperCase() === 'DESC' ? 'DESC' : 'ASC'}`,
            [`%${query || ''}%`]
        );

        await connection.end();

        res.status(200).json({
            error: false,
            status: 'ok',
            statusCode: 200,
            data: rows,
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

// Handler untuk pencarian tanaman berdasarkan nama atau penyakit
const searchTanaman = async (req, res) => {
    const { query, filter, order = 'ASC' } = req.query;

    try {
        const connection = await mysql.createConnection(dbConfig);

        const [rows] = await connection.execute(
            `SELECT DISTINCT t.nama, t.gambar 
            FROM tanaman t
            LEFT JOIN info_tambahan i ON t.nama = i.nama_tanaman
            WHERE t.nama LIKE ? AND i.penyakit LIKE ?
            ORDER BY t.nama ${order.toUpperCase() === 'DESC' ? 'DESC' : 'ASC'}`,
            [`%${query || ''}%`, `%${filter || ''}%`]
        );

        await connection.end();

        res.status(200).json({
            error: false,
            status: 'ok',
            statusCode: 200,
            data: rows,
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
    getTanaman,
    searchTanaman,
};