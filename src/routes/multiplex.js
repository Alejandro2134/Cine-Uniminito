const express = require('express');
const router =  express.Router();
const connection = require('../database');

const { isLoggedIn } = require('../lib/auth');

router.get('/', async (req, res) => {

    const multiplexList = await connection.query('SELECT nombreMultiplex, idMultiplex FROM multiplex');
    res.render('multiplex/multiplexList', { multiplexList });

})

router.get('/:idMultiplex', (req, res) => {
    const { idMultiplex } = req.params; 
    res.render('multiplex/multiplexHome', { idMultiplex });
})

router.get('/:idMultiplex/peliculas', async (req, res) => {

    const { idMultiplex } = req.params;
    const peliculas = await connection.query('SELECT portada, nombrePelicula, idPelicula, Multiplex_idMultiplex FROM pelicula WHERE Multiplex_idMultiplex = ?', [idMultiplex]);
    res.render('multiplex/peliculas', { peliculas });

})

router.get('/:idMultiplex/peliculas/:idPelicula', async (req, res) => {

    const { idPelicula } = req.params;
    const url = req.originalUrl;

    const query = await connection.query('SELECT * FROM pelicula WHERE idPelicula = ?', [idPelicula]);
    const query2 = await connection.query('SELECT * FROM funcion WHERE Pelicula_idPelicula = ?', [idPelicula]);

    Promise.all([
        query[0],
        query2,
        url
    ])
    .then(([pelicula, funciones, url]) => {
        res.render('multiplex/pelicula', {
            pelicula,
            funciones,
            url
        });
    });  
})

router.get('/:idMultiplex/peliculas/:idPelicula/reserva/:idFuncion', isLoggedIn, async (req, res) => {

    const asientoSeleccionado = req.query.asiento;

    if(asientoSeleccionado !== undefined) {

        connection.beginTransaction(function (err) {
            if (err) { throw err; };
            connection.query('UPDATE asiento SET disponibilidad = "1" WHERE idAsiento = ?', asientoSeleccionado, function (err) {
                if(err) {
                    return connection.rollback(function () {
                        throw err;
                    })
                }

                const { idFuncion } = req.params;
                const fechaFuncion = await connection.query('SELECT fechaFuncion FROM funcion WHERE idFuncion = ?', idFuncion);

                const newReservation = {
                    Cliente_idCliente: req.user.idCliente,
                    fechaReserva: Date.now(),
                    fechaFuncion: fechaFuncion,
                    Funcion_idFuncion: idFuncion
                }

                connection.query('INSERT INTO reserva SET ?', [newReservation], function (err) {
                    if(err) {
                        return connection.rollback(function () {
                            throw err;
                        })
                    }

                    const { idFuncion } = req.params;

                    const newTicket = {
                        fechaCompra: Date.now(),
                        Cliente_idCliente: req.user.idCliente,
                        Funcion_idFuncion: idFuncion
                    }

                    connection.query('INSERT INTO ticket SET ?', [newTicket], function(err) {
                        if(err) {
                            return connection.rollback(function () {
                                throw err;
                            })
                        }

                        connection.commit(function(err) {
                            if(err) {
                                return connection.rollback(function () {
                                    throw err;
                                })
                            }
                        })
                    })
                })
            })
        });
    }

    const asientos = await connection.query('SELECT idAsiento, disponibilidad FROM asiento WHERE Sala_idSala = "1"')
    res.render('multiplex/reserva', { asientos });

});

router.post('/:idMultiplex/peliculas/:idPelicula/reserva/:idFuncion', async (req, res) => {

    const { idFuncion } = req.params; //Se obtiene el idFuncion de la url
    res.redirect('/:idMultiplex/peliculas/:idPelicula/reserva/idFuncion');
})

module.exports = router;