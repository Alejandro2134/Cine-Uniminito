const express = require('express');
const router = express.Router(); 

const pool = require('../database');

router.get('/', (req, res) => { 
    res.render('home');
})

router.post('/', async (req, res) => {

    let num = 0;

    const data = JSON.parse(JSON.stringify(req.body));

    console.log(data);

    for(let key in data) {
        if(data.hasOwnProperty(key)) {
            num += 1;
        }
    }

    if(num > 2) {
        const { password, email, fecha_nacimiento, nombre, apellido, telefono} = req.body;

        const newUser = {
            nombre: nombre,
            apellido: apellido,
            fechaNacimiento: fecha_nacimiento,
            telefono: telefono,
            email: email,
            contraseña: password
        }

        await pool.query('INSERT INTO cliente SET ?', [newUser]);
        res.redirect('/peliculas');
    } else {
        res.redirect('/peliculas');
    } 
})

router.get('/peliculas', async (req, res) => {

    const peliculas = await pool.query('SELECT * FROM pelicula');
    res.render('peliculas', { peliculas });
     
})

module.exports = router;




