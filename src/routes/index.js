const express = require('express');
const router = express.Router(); 

const pool = require('../database');

router.get('/', (req, res) => { 
    res.render('home');
})

router.post('/', async (req, res) => {

    const { password, email, fecha_nacimiento, nombre, apellido, telefono} = req.body;

    const newUser = {
        nombre: nombre,
        apellido: apellido,
        fechaNacimiento: fecha_nacimiento,
        telefono: telefono,
        correo: email,
        contraseña: password
    }

    await pool.query('INSERT INTO Cliente SET ?', [newUser]);
    res.redirect('/peliculas');
})

router.get('/peliculas', async (req, res) => {

    const peliculas = await pool.query('SELECT * FROM Pelicula');
    res.render('peliculas', { peliculas });
     
})

module.exports = router;




