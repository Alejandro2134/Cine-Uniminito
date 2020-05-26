const express = require('express');
const router =  express.Router();
const connection = require('../database');

const { isLoggedIn } = require('../lib/auth');

router.get('/tickets', isLoggedIn, async (req, res) => {

    const tickets = await connection.query('SELECT * FROM ticket WHERE Cliente_idCliente = ? AND estadoPago = "0"', req.user.idCliente);
    res.render('perfil/tickets', { tickets });

})

router.post('/tickets', isLoggedIn, async (req, res) => {

    const { idCliente, idTicket } = req.body;
    await connection.query('UPDATE ticket SET estadoPago = "1" WHERE Cliente_idCliente = ? AND idTicket = ?', [idCliente, idTicket]);
    res.redirect('/perfil/tickets');
    
})

module.exports = router;