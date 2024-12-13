const pool = require('../config/database.js');
const bcrypt = require('bcrypt');

const getAllUsers = () => {
    const SQLQuery = 'SELECT * FROM users'
    
    return pool.execute(SQLQuery);
}

const login = async (email) => {
    const SQLQuery = 'SELECT * FROM users WHERE email = ?';
    const [rows] = await pool.execute(SQLQuery, [email]);
    return rows;
};

const createUser = async(body) => {
    const hashedPW = await bcrypt.hash(body.password, 10);
    const SQLQuery = `INSERT INTO users (name, email, password) VALUES (?, ?, ?)`;
    const params = [body.name, body.email, hashedPW];
    const [rows] = await pool.execute(SQLQuery, params);
    return rows;
}

const updateUser = async(body, email) => {
    const { name, password } = body;
    if(!password){
        const SQLQuery = `UPDATE users SET name= ? WHERE email= ?`;
        const [update] = await pool.execute(SQLQuery, [name, email]);

        if(update.affectedRows > 0){
            const selectQuery = `SELECT name, email FROM users WHERE email = ?`;
            const [rows] = await pool.execute(selectQuery, [email]);
            return rows[0];
        }

        throw new Error("User not found or no changes made");
    }else if(!name){
        const hashedPW = await bcrypt.hash(password, 10);
        const SQLQuery = `UPDATE users SET password= ? WHERE email= ?`;
        const [update] = await pool.execute(SQLQuery, [hashedPW, email]);

        if(update.affectedRows > 0){
            const selectQuery = `SELECT name, email FROM users WHERE email = ?`;
            const [rows] = await pool.execute(selectQuery, [email]);
            return rows[0];
        }

        throw new Error("User not found or no changes made");
    }else{
        const hashedPW = await bcrypt.hash(password, 10);
        const SQLQuery = 'UPDATE users SET name= ?, password= ? WHERE email= ?'; 
        const [update] = await pool.execute(SQLQuery, [name, hashedPW, email]);
        
        if(update.affectedRows > 0){
            const selectQuery = `SELECT name, email FROM users WHERE email = ?`;
            const [rows] = await pool.execute(selectQuery, [email]);
            return rows[0];
        }

        throw new Error("User not found or no changes made");
    }
}

const resetPassword = async(password, email) => {
    
    const SQLQuery = `UPDATE users SET password= '${password}' WHERE email= ?`;
    const [row] = await pool.execute(SQLQuery, [email]);

    return row;
}

const bookmark = async(idUser, id) => {
    const SQLQuery = `INSERT INTO bookmark (idUser, idTanaman) VALUES (?, ?)`;
    const [row] = await pool.execute(SQLQuery, [idUser, id]);
    return row;
}

const findBookmark = async(idUser) => {
    const SQLQuery = `
        SELECT
            b.idBookmark,
            b.idUser,
            t.*
        FROM
            bookmark b
        JOIN 
            tanaman t ON t.id = b.idTanaman
        WHERE
            b.idUser = ?`;

    return await pool.execute(SQLQuery, [idUser]);
}

const delBookmark = async(idBookmark) => {
    const SQLQuery = 'DELETE FROM bookmark WHERE idBookmark =?';

    return await pool.execute(SQLQuery, [idBookmark]);
}

module.exports = {
    getAllUsers,
    createUser,
    updateUser,
    login,
    resetPassword,
    bookmark,
    findBookmark,
    delBookmark,
    loginGoogle
}