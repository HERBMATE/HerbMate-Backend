const pool = require('../config/database.js');

const getAllTanaman = (idUser) => {
    const SQLQuery = `
    SELECT 
        t.*, 
        b.idBookmark
    FROM 
        tanaman t
    LEFT JOIN 
        bookmark b 
        ON t.id = b.idTanaman AND b.idUser = ?`
        
    return pool.execute(SQLQuery, [idUser]);
}

const getTanamanDetails = (nama_tanaman) => {
    const SQLQuery = `
    SELECT 
        t.*, 
        i.* 
    FROM 
        tanaman t
    JOIN 
        info_tambahan i
    ON 
        t.nama = i.nama_tanaman
    WHERE 
        t.nama = ?`;

    return pool.execute(SQLQuery, [nama_tanaman]);
}

const getResep = (penyakit) => {
    const SQLQuery = `SELECT * FROM info_tambahan WHERE penyakit = '${penyakit}'`

    return pool.execute(SQLQuery);
}

const searchTanaman = (tanaman) => {
    const SQLQuery = 
        `SELECT *
        FROM tanaman
        WHERE nama LIKE ?
        ORDER BY nama ASC`

    return pool.execute(SQLQuery, [`%${tanaman || ''}%`]);
}
const rekomenTanaman = (penyakit, tanaman) => {
    const SQLQuery = 
        `SELECT DISTINCT 
            t.*, 
            i.penyakit 
        FROM 
            tanaman t
        JOIN 
            info_tambahan i
        ON 
            t.nama = i.nama_tanaman
        WHERE 
            i.penyakit = ? AND t.nama != ?`

    return pool.execute(SQLQuery, [penyakit, tanaman]);
}

module.exports = { 
    getAllTanaman, 
    getTanamanDetails, 
    getResep,
    searchTanaman,
    rekomenTanaman
}