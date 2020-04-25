const express = require('express');
const router = express.Router(); 

const passport = require('passport');

const pool = require('../database');

const { isNotLoggedIn, isLoggedIn } = require('../lib/auth');

router.get('/', isNotLoggedIn, (req, res) => { 
    res.render('home');
})

router.post('/', isNotLoggedIn, (req, res, next) => {
    passport.authenticate('local.auth', {
        successRedirect: '/peliculas',
        failureRedirect: '/',
        failureFlash: true
    })(req, res, next);
})

router.get('/peliculas', isLoggedIn, async (req, res) => {

    const peliculas = await pool.query('SELECT * FROM pelicula');
    res.render('peliculas', { peliculas });
     
})

module.exports = router;