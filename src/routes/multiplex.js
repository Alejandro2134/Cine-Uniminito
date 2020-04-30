const express = require('express');
const router =  express.Router();
const connection = require('../database');

const { isLoggedIn } = require('../lib/auth');

router.get('/', async (req, res) => {

    const multiplexList = await connection.query('SELECT * FROM multiplex');
    res.render('multiplex/multiplexList', { multiplexList });

})

router.get('/:idMultiplex', (req, res) => {
    const { idMultiplex } = req.params; 
    res.render('multiplex/multiplexHome', { idMultiplex });
})

router.get('/:idMultiplex/peliculas', async (req, res) => {

    const { idMultiplex } = req.params;
    const peliculas = await connection.query('SELECT * FROM pelicula WHERE Multiplex_idMultiplex = ?', [idMultiplex]);
    res.render('multiplex/peliculas', { peliculas });

})

router.get('/:idMultiplex/peliculas/:idPelicula', (req, res) => {
    const { idPelicula } = req.params;
    res.render('multiplex/pelicula', {idPelicula});
})

router.get('/:idMultiplex/peliculas/:idPelicula/reserva/idFuncion', isLoggedIn, (req, res) => {

});

router.post('/:idMultiplex/peliculas/:idPelicula/reserva/idFuncion', async (req, res) => {

    const { idFuncion } = req.params; //Se obtiene el idFuncion de la url

    //Se obtiene la sala que corresponde a la función
    const idSala = await connection.query('SELECT Sala_idSala FROM funcion WHERE idFuncion = ?', [idFuncion]);

    const { idAsiento, estadoAsiento, idCliente } = req.body;

    if(estadoAsiento != 0) {
        if(idCliente == req.user.idCliente) {
            await connection.query('UPDATE asiento SET disponibilidad = ? WHERE idAsiento = ?', [0, idAsiento]);
        }
    } else {
        if(idCliente == req.user.idCliente) {
            await connection.query('UPDATE asiento SET disponibilidad = ? WHERE idAsiento = ?', [1, idAsiento]);
        }
    }

    res.redirect('/:idMultiplex/peliculas/:idPelicula/reserva/idFuncion');
})

module.exports = router;