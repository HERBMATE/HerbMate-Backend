const usersMod = require('../models/usersMod.js');
const bcrypt = require('bcrypt');
const jwt = require('jsonwebtoken');
var nodemailer = require('nodemailer');

const getAllUsers = async(req, res) => {
    try {
        const [data] = await usersMod.getAllUsers();
        res.json({
            error: false,
            message: 'GET all users successfully',
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

const login = async(req, res) => {
    const { email, password } = req.body;
    if (!email) {
        return res.status(400).json({
            error: true,
            message: 'Email tidak ditemukan',
            data: null
        });
    }
    if (!password) {
        return res.status(400).json({
            error: true,
            message: 'Mohon isi password',
            data: null
        });
    }

    try {
        const [data] = await usersMod.login(email);

        if (!data) {
            return res.status(404).json({
                error: true,
                message: 'Email tidak terdaftar',
                data: null
            });
        }

        const isPWValid = await bcrypt.compare(password, data.password);
        if (isPWValid) {
            const { password, ...dataLogin } = data;
            const payload = {dataLogin}
            const secret = process.env.JWT_SECRET;
            const exp = 60 * 60 * 10;
            const token = jwt.sign(payload, secret, {expiresIn: exp});
            return res.json({
                error: false,
                message: 'Login berhasil',
                data: dataLogin,
                token: token
            });
        } else {
            return res.status(403).json({
                error: true,
                message: 'Password salah',
                data: null
            });
        }
    } catch (error) {
        return res.status(500).json({
            error: true,
            message: 'Terjadi kesalahan pada server',
            serverMessage: error.message
        });
    }
    
}

const createUser = async(req, res) => {
    const {body} = req;

    if(!body.name || !body.email || !body.password){
        return res.status(400).json({
            error: true,
            message: 'Invalid Data',
            data: null
        })
    }
    const [cekEmail] = await usersMod.login(body.email);
    if(cekEmail != undefined){
        return res.status(400).json({
            error: true,
            message: 'Email already in use',
            data: null
        })
    }

    try {
        await usersMod.createUser(body);
        const [data] = await usersMod.login(body.email);
        const { password, ...dataRegis } = data;
        return res.status(201).json({
            error: false,
            message: 'Register user successfully',
            data: dataRegis
        })
    } catch (error) {
        return res.status(500).json({
            error: true,
            message: 'Database Error',
            serverMessage: error
        })
    }
}

const updateUser = async(req, res) => {
    const { email } = req.params;
    const {body} = req;
    
    if(body == undefined) {
        return res.status(400).json({
            error: true,
            message: 'Invalid Data',
            data: null
        });
    }

    if(!body.password){
        if(!body.name){
            return res.status(400).json({
                error: true,
                message: 'Invalid Data',
                data: null
            });
        }
        try {
            const data = await usersMod.updateUser(body, email);
            const { password, ...dataUpdate } = data;
            const payload = { dataUpdate }
            const secret = process.env.JWT_SECRET;
            const exp = 60 * 60 * 10;
            const token = jwt.sign(payload, secret, {expiresIn: exp});
            return res.json({
                error: false,
                message: 'Update user successfully',
                data: dataUpdate,
                token: token
            })
        } catch (error) {
            return res.status(500).json({
                error: true,
                message: 'Database Error',
                serverMessage: error
            })
        }
    }else{
        if(!body.verify){
            return res.status(400).json({
                error: true,
                message: 'Cannot get old password',
                data: null
            });
        }
        const [data] = await usersMod.login(email);
        const isPWValid = await bcrypt.compare(body.verify, data.password);
        if(isPWValid == false) {
            return res.status(403).json({
                error: true,
                message: 'Password salah',
                data: null
            });
        }
    }

    try {
        const data = await usersMod.updateUser(body, email);
        const { password, ...dataUpdate } = data;
        const payload = { dataUpdate }
        const secret = process.env.JWT_SECRET;
        const exp = 60 * 60 * 10;
        const token = jwt.sign(payload, secret, {expiresIn: exp});
        return res.json({
            error: false,
            message: 'Update user successfully',
            data: dataUpdate,
            token: token
        })
    } catch (error) {
        return res.status(500).json({
            error: true,
            message: 'Database Error',
            serverMessage: error
        })
    }
}

const forgotPassword = async(req, res) => {
    const { email } = req.body;
    try {
        const [cekEmail] = await usersMod.login(email);
        if(cekEmail == undefined){
            return res.status(400).json({
                error: true,
                message: 'User Not Registered',
                data: null
            })
        }
        const { password, ...userData } = cekEmail;
        const payload = {userData}
        const secret = process.env.JWT_SECRET;
        const exp = 60 * 1;
        const token = jwt.sign(payload, secret, {expiresIn: exp});
        const link = `https://herbmate-backend-7784081244.asia-southeast2.run.app/users/reset-password/${cekEmail.idUser}/${token}/${email}`;
        var transporter = nodemailer.createTransport({
            service: 'gmail',
            auth: {
              user: 'herbmatemobile@gmail.com',
              pass: 'bmej wwwg nhhb ooyg'
            }
        });
        
        var mailOptions = {
            from: 'youremail@gmail.com',
            to: email,
            subject: 'change password',
            text: link
        };
        
        transporter.sendMail(mailOptions, function(error, info){
            if (error) {
                console.log(error);
            } else {
                console.log('Email sent: ' + info.response);
            }
        });
        console.log(link);
        res.send('Password Reset Link has been sent to your email...')
    } catch (error) {
        return res.status(400).json({
            error: true,
            message: 'Invalid Data',
            data: null
        })
    }
}

const resetPassword = async(req, res) => {
    const { idUser, token, email } = req.params;

    const [cekEmail] = await usersMod.login(email);
    if(idUser != cekEmail.idUser){
        return res.status(400).json({
            error: true,
            message: 'Invalid Data',
            data: null
        });
    }

    const secret = process.env.JWT_SECRET;
    try {
        const payload = jwt.verify(token, secret);
        res.render('resetPassword', {email: email})
    } catch (error) {
        error: true,
        console.log(error.message);
        return res.send(error.message);
    }
}

const reset_password = async(req, res) => {
    const { idUser, token, email } = req.params;
    const { password:pw, password2:pw2 } = req.body;

    if(pw.length < 8){
        return res.status(400).json({
            error: true,
            message: 'Invalid Data',
            data: null
        })
    }
    
    const [cekEmail] = await usersMod.login(email);
    if(idUser != cekEmail.idUser){
        return res.status(400).json({
            error: true,
            message: 'Invalid Data',
            data: null
        })
    }

    if (!pw || !pw2) {
        return res.status(400).json({
            error: true,
            message: 'Password or Confirm Password missing',
            data: null
        });
    }

    if (pw !== pw) {
        return res.status(400).json({
            error: true,
            message: 'Passwords do not match',
            data: null
        });
    }

    try {
        const hashedPW = await bcrypt.hash(pw, 10);
        await usersMod.resetPassword(hashedPW, email);
        const { password, ...dataReset } = cekEmail;
        return res.json({
            error: false,
            message: 'Update user successfully',
            data: dataReset,
            token: token
        })
    } catch (error) {
        console.log(error.message);
        return res.status(500).json({
            error: true,
            message: 'Database Error',
            serverMessage: error
        });
    }
}

const addBookmark = async(req, res) => {
    const { idUser, id } = req.params;

    if(!idUser || !id) {
        return res.status(400).json({
            error: true,
            message: 'Invalid Data',
            data: null
        });
    }

    try {
        await usersMod.bookmark(idUser, id);
        
        res.json({
            error: false,
            message: 'add Bookmark Successfully',
            data: null
        });
    } catch (error) {
        res.status(500).json({
            error: true,
            message: 'Database Error',
            serverMessage: error
        })
    }
}

const getBookmark = async(req, res) => {
    const { idUser } = req.params;

    if (!idUser) {
        return res.status(400).json({
            error: true,
            message: 'Invalid Data',
            data: null
        });
    }

    try {
        const [ data ] = await usersMod.findBookmark(idUser);
        if (data && data.length > 0) {
            res.json({
                error: false,
                message: 'GET Bookmark Successfully',
                data: data
            });
        } else {
            res.status(404).json({
                error: true,
                message: 'Add Bookmark'
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

const delBookmark = async(req, res) => {
    const { idBookmark } = req.params;

    if(!idBookmark) {
        return res.status(400).json({
            error: true,
            message: 'Invalid Data',
            data: null
        });
    }

    try {
        await usersMod.delBookmark(idBookmark);
        
        res.json({
            error: false,
            message: 'Delete Bookmark Successfully',
            data: null
        });
    } catch (error) {
        res.status(500).json({
            error: true,
            message: 'Database Error',
            serverMessage: error
        })
    }
}

const getGoogleAcc = async (req, res) => {
    const { name, email } = req.body;
    
    if( !name || !email ) {
        return res.status(400).json({
            error: true,
            message: 'Invalid Data',
            data: null
        })
    }

    try {
        const [cekEmail] = await usersMod.login(email);

        if(cekEmail == undefined){
            await usersMod.loginGoogle(name, email);
            const user = await usersMod.login(email);

            const payload = {
                id: user?.idUser,
                name: user?.name,
                email: user?.email
            };
            const secret = process.env.JWT_SECRET;
            const exp = 60 * 60 * 10;
            const token = jwt.sign(payload, secret, { expiresIn: exp });
    
            return res.json({
                error: false,
                message: 'Login berhasil',
                data: {
                    id: user.idUser,
                    name: user.name,
                    email: user.email,
                    token: token,
                },
            });
        }

        const payload = {
            id: cekEmail?.idUser,
            name: cekEmail?.name,
            email: cekEmail?.email
        };
        const secret = process.env.JWT_SECRET;
        const exp = 60 * 60 * 10;
        const token = jwt.sign(payload, secret, { expiresIn: exp });

        return res.json({
            error: false,
            message: 'Login berhasil',
            data: {
                id: cekEmail.idUser,
                name: cekEmail.name,
                email: cekEmail.email,
                token: token,
            },
        });
    } catch (error) {
        res.status(500).json({
            error: true,
            message: 'Database Error',
            serverMessage: error
        })
    }
}

module.exports = {
    getAllUsers,
    createUser,
    updateUser,
    login,
    forgotPassword,
    resetPassword,
    reset_password,
    addBookmark,
    getBookmark,
    delBookmark,
    getGoogleAcc
}