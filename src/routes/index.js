const express = require('express');

const { accessValidations } = require('../middleware/verifyToken.js');
const userController = require('../controller/users.js');
const tanamanController = require('../controller/tanaman.js');
const chatbotController = require('../controller/chatbot.js');
const modelController = require('../controller/model.js');
const { upload } = require('../controller/model.js');

const router = express.Router();

// User Routes
router.post('/users/register', userController.createUser);
router.get('/users/getAllUsers', accessValidations, userController.getAllUsers);
router.patch('/users/update/:email', accessValidations, userController.updateUser);
router.post('/users/login', userController.login);
router.post('/users/forgotPass', userController.forgotPassword);
router.get('/users/reset-password/:idUser/:token/:email', userController.resetPassword);
router.post('/users/reset-password/:idUser/:token/:email', userController.reset_password);
router.post('/users/addBookmark/:idUser/:id', accessValidations,userController.addBookmark);
router.get('/users/getBookmark/:idUser', accessValidations,userController.getBookmark);
router.delete('/users/delBookmark/:idBookmark', accessValidations,userController.delBookmark);
router.post('/users/getGoogleAcc', userController.getGoogleAcc);

// Tanaman Routes
router.get('/tanaman/getAllTanaman', accessValidations,tanamanController.getAllTanaman);
router.get('/tanaman/getDetails/:nama_tanaman', accessValidations,tanamanController.getTanamanDetails);
router.get('/tanaman/getResep/:penyakit', accessValidations,tanamanController.getResep);
router.get('/tanaman/search/:tanaman', accessValidations, tanamanController.searchTanaman);
router.get('/tanaman/getRekomendasi/:penyakit', accessValidations, tanamanController.getRekomendasi);

// Chatbot Routes
router.post('/chatbot', accessValidations, chatbotController.handleChatbotRequest);

// Model Routes
router.post('/predict', accessValidations, upload.single('file'), modelController.handlePredict);


module.exports = router;