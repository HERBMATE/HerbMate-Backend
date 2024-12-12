const tanamanMod = require('../models/tanamanMod');

const getAllTanaman = async(req, res) => {
    const { idUser } = req.params;
    try {
        const [data] = await tanamanMod.getAllTanaman(idUser);
        const getALLData = data.map(item => ({
            ...item,
            status: item.idBookmark !== null
        }));
        
        res.json({
            error: false,
            message: 'GET All Tanaman Successfully',
            data: getALLData
        });
    } catch (error) {
        res.status(500).json({
            error: true,
            message: 'Database Error',
            serverMessage: error
        })
    }
}

const getTanamanDetails = async(req, res) => {
    const { nama_tanaman } = req.params;

    if(!nama_tanaman){
        return res.status(400).json({
            error: true,
            message: 'Invalid Data',
            data: null
        })
    }

    try {
        const [data] = await tanamanMod.getTanamanDetails(nama_tanaman);
        if (data && data.length > 0) {
            res.json({
                error: false,
                message: 'GET Tanaman Details Successfully',
                data: data
            });
        } else {
            res.status(404).json({
                error: true,
                message: 'Tanaman not found'
            });
        } 
    } catch (error) {
        res.status(500).json({
            error: true,
            message: 'Database Error',
            serverMessage: error
        })
    }
}

const getResep = async(req, res) => {
    const { penyakit } = req.params;

    if(!penyakit){
        return res.status(400).json({
            error: true,
            message: 'Invalid Data',
            data: null
        });
    }

    try {
        const [data] = await tanamanMod.getResep(penyakit);
        res.json({
            error: false,
            message: 'GET Resep Successfully',
            data: data
        }); 
    } catch (error) {
        res.status(500).json({
            error: true,
            message: 'Database Error',
            serverMessage: error
        })
    }
}

const searchTanaman = async (req, res) => {
    const { tanaman } = req.params;

    if(!tanaman) {
        return res.status(400).json({
            error: true,
            message: 'Invalid Data',
            data: null
        })
    }

    try {
        const [data] = await tanamanMod.searchTanaman(tanaman);
        if (data && data.length > 0) {
            res.json({
                error: false,
                message: 'Search Tanaman Successfully',
                data: data
            });
        } else {
            res.status(404).json({
                error: true,
                message: 'Tanaman not found'
            });
        }  
    } catch (error) {
        res.status(500).json({
            error: true,
            message: 'Database Error',
            serverMessage: error
        })
    }
}

const getRekomendasi = async(req, res) => {
    const { penyakit, tanaman } = req.params;

    if(!penyakit || !tanaman) {
        return res.status(400).json({
            error: true,
            message: 'Invalid Data',
            data: null
        })
    }

    try {
        const [data] = await tanamanMod.rekomenTanaman(penyakit, tanaman);
        if (data && data.length > 0) {
            res.json({
                error: false,
                message: 'Search Tanaman Successfully',
                data: data
            });
        } else {
            res.status(404).json({
                error: true,
                message: 'Tanaman not found'
            });
        }  
    } catch (error) {
        
    }
}

module.exports = {
    getAllTanaman,
    getTanamanDetails,
    getResep,
    searchTanaman,
    getRekomendasi
}