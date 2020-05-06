const express = require('express');
const router =  express.Router();
const connection = require('../database');

const { isLoggedIn } = require('../lib/auth');

router.get('/:idEmpleado', (req, res) => {

    const { idEmpleado } = req.params; 
    res.render('empleado/empleadoHome', { idEmpleado });

})
module.exports = router;